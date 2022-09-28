<?php

/**
* 
*/
class Manage
{
	
	private $con;

	function __construct()
	{
		include_once("../database/db.php");
		$db = new Database();
		$this->con = $db->connect();
	}

	public function manageRecordWithPagination($table,$pno){
		$a = $this->pagination($this->con,$table,$pno,10);
		if ($table == "categories") {
			$sql = "SELECT p.cid,p.category_name as category, c.category_name as parent, p.status FROM categories p LEFT JOIN categories c ON p.parent_cat=c.cid ORDER BY cid ".$a["limit"];
		}else if($table == "products"){
			$sql = "SELECT p.pid,p.product_id,p.product_name,c.category_name,p.product_price,p.product_dp,p.added_date,p.p_status FROM products p,categories c WHERE p.cid = c.cid ORDER BY pid ".$a["limit"];
		}else if($table == "invoice"){
			$sql = "SELECT i.invoice_no,i.customer_id,i.customer_name,i.customer_mobno,i.customer_email,i.order_date, i.net_total, i.payment_type FROM invoice i ORDER BY invoice_no ".$a["limit"];
		}else{
			$sql = "SELECT * FROM ".$table." ".$a["limit"];
		}
		$result = $this->con->query($sql) or die($this->con->error);
		$rows = array();
		if($result->num_rows > 0){
			while ($row = $result->fetch_assoc()) {
				$rows[] = $row;
			}
		}
		return ["rows"=>$rows,"pagination"=>$a["pagination"]];

	}

	private function pagination($con,$table,$pno,$n){
		$sql = "SELECT COUNT(*) as numrows FROM ".$table."";
		$query = $con->query($sql);
		$row = mysqli_fetch_assoc($query);
		//$totalRecords = 100000;
		$pageno = $pno;
		$numberOfRecordsPerPage = $n;

		$last = ceil($row["numrows"]/$numberOfRecordsPerPage);

		$pagination = "<ul class='pagination'>";

		if ($last != 1) {
			if ($pageno > 1) {
				$previous = "";
				$previous = $pageno - 1;
				$pagination .= "<li class='page-item'><a class='page-link' pn='".$previous."' href='#' style='color:#333;'> Previous </a></li></li>";
			}
			for($i=$pageno - 4;$i< $pageno ;$i++){
				if ($i > 0) {
					$pagination .= "<li class='page-item'><a class='page-link' pn='".$i."' href='#'> ".$i." </a></li>";
				}
				
			}
			$pagination .= "<li class='page-item'><a class='page-link' pn='".$pageno."' href='#' style='color:#333;'> $pageno </a></li>";
			for ($i=$pageno + 1; $i <= $last; $i++) { 
				$pagination .= "<li class='page-item'><a class='page-link' pn='".$i."' href='#'> ".$i." </a></li>";
				if ($i > $pageno + 4) {
					break;
				}
			}
			if ($last > $pageno) {
				$next = $pageno + 1;
				$pagination .= "<li class='page-item'><a class='page-link' pn='".$next."' href='#' style='color:#333;'> Next </a></li></ul>";
			}
		}
	//LIMIT 0,10
		//LIMIT 20,10
		$limit = "LIMIT ".($pageno - 1) * $numberOfRecordsPerPage.",".$numberOfRecordsPerPage;

		return ["pagination"=>$pagination,"limit"=>$limit];
	}

	public function deleteRecord($table,$pk,$id){
		if($table == "categories"){
			$pre_stmt = $this->con->prepare("SELECT ".$id." FROM categories WHERE parent_cat = ?");
			$pre_stmt->bind_param("i",$id);
			$pre_stmt->execute();
			$result = $pre_stmt->get_result() or die($this->con->error);
			if ($result->num_rows > 0) {
				return "DEPENDENT_CATEGORY";
			}else{
				$pre_stmt = $this->con->prepare("DELETE FROM ".$table." WHERE ".$pk." = ?");
				$pre_stmt->bind_param("i",$id);
				$result = $pre_stmt->execute() or die($this->con->error);
				if ($result) {
					return "CATEGORY_DELETED";
				}
			}
		}else{
			$pre_stmt = $this->con->prepare("DELETE FROM ".$table." WHERE ".$pk." = ?");
			$pre_stmt->bind_param("i",$id);
			$result = $pre_stmt->execute() or die($this->con->error);
				if ($result) {
					return "DELETED";
			}
		}
	}


	public function getSingleRecord($table,$pk,$id){
		$pre_stmt = $this->con->prepare("SELECT * FROM ".$table." WHERE ".$pk."= ? LIMIT 1");
		$pre_stmt->bind_param("s",$id);
		$pre_stmt->execute() or die($this->con->error);
		$result = $pre_stmt->get_result();
		if ($result->num_rows == 1) {
			$row = $result->fetch_assoc();
		}
		return $row;
	}

	public function update_record($table,$where,$fields){
		$sql = "";
		$condition = "";
		foreach ($where as $key => $value) {
			// id = '5' AND m_name = 'something'
			$condition .= $key . "='" . $value . "' AND ";
		}
		$condition = substr($condition, 0, -5);
		foreach ($fields as $key => $value) {
			//UPDATE table SET m_name = '' , qty = '' WHERE id = '';
			$sql .= $key . "='".$value."', ";
		}
		$sql = substr($sql, 0,-2);
		$sql = "UPDATE ".$table." SET ".$sql." WHERE ".$condition;
		if(mysqli_query($this->con,$sql)){
			return "UPDATED";
		}
	}


	public function storeCustomerOrderInvoice($orderdate,$cust_id,$cust_name,$cust_mobno,$cust_email,$cust_addr,$ar_pid,$ar_qty,$ar_dp,$ar_price,$ar_pro_name,$net_total,$paid,$due,$payment_type){
		$pre_stmt = $this->con->prepare("INSERT INTO 
			`invoice`(`customer_id`, `customer_name`, `customer_mobno`, `customer_email`, `customer_addr`, `order_date`,
			 `net_total`, `paid`, `due`, `payment_type`) VALUES (?,?,?,?,?,?,?,?,?,?)");
		$pre_stmt->bind_param("ssssssddds",$cust_id,$cust_name,$cust_mobno,$cust_email,$cust_addr,$orderdate,$net_total,$paid,$due,$payment_type);
		$pre_stmt->execute() or die($this->con->error);
		$invoice_no = $pre_stmt->insert_id;
		if ($invoice_no != null) {
			for ($i=0; $i < count($ar_price) ; $i++) {

				//Here we are finding the remaing quantity after giving customer
				$insert_product = $this->con->prepare("INSERT INTO `invoice_details`(`invoice_no`, `product_id`, `product_name`, `dp`, `price`, `qty`)
				 VALUES (?,?,?,?,?,?)");
				$insert_product->bind_param("issddd",$invoice_no,$ar_pid[$i],$ar_pro_name[$i],$ar_dp[$i],$ar_price[$i],$ar_qty[$i]);
				$insert_product->execute() or die($this->con->error);
			}
			return $invoice_no;
		}

	}


}

//$obj = new Manage();
//echo "<pre>";
//print_r($obj->manageRecordWithPagination("categories",1));
//echo $obj->deleteRecord("categories","cid",14);
//print_r($obj->getSingleRecord("categories","cid",1));
//echo $obj->update_record("categories",["cid"=>1],["parent_cat"=>0,"category_name"=>"Electro","status"=>1]);
?>