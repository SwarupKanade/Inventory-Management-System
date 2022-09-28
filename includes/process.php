<?php
include_once("../database/constants.php");
include_once("user.php");
include_once("DBOperation.php");
include_once("manage.php");

//For Registration Processsing
if (isset($_POST["username"]) AND isset($_POST["email"])) {
	$user = new User();
	$result = $user->createUserAccount($_POST["username"],$_POST["email"],$_POST["password1"]);
	echo $result;
	exit();
}

//For Login Processing
if (isset($_POST["log_email"]) AND isset($_POST["log_password"])) {
	$user = new User();
	$result = $user->userLogin($_POST["log_email"],$_POST["log_password"]);
	echo $result;
	exit();
}

//To get Category
if (isset($_POST["getCategory"])) {
	$obj = new DBOperation();
	$rows = $obj->getAllRecord("categories");
	foreach ($rows as $row) {
		echo "<option value='".$row["cid"]."'>".$row["category_name"]."</option>";
	}
	exit();
}


//Add Category
if (isset($_POST["category_name"]) AND isset($_POST["parent_cat"])) {
	$obj = new DBOperation();
	$result = $obj->addCategory($_POST["parent_cat"],$_POST["category_name"]);
	echo $result;
	exit();
}


//Add Product
if (isset($_POST["added_date"]) AND isset($_POST["product_name"])) {
	$obj = new DBOperation();
	$result = $obj->addProduct($_POST["select_cat"],
							$_POST["product_id"],
							$_POST["product_name"],
							$_POST["product_price"],
							$_POST["product_dp"],
							$_POST["added_date"]);
	echo $result;
	exit();
}

//Manage Category
if (isset($_POST["manageCategory"])) {
	$m = new Manage();
	$result = $m->manageRecordWithPagination("categories",$_POST["pageno"]);
	$rows = $result["rows"];
	$pagination = $result["pagination"];
	if (count($rows) > 0) {
		$n = (($_POST["pageno"] - 1) * 10)+1;
		foreach ($rows as $row) {
			?>
				<tr>
			        <td><?php echo $n; ?></td>
			        <td><?php echo $row["category"]; ?></td>
			        <td><?php echo $row["parent"]; ?></td>
			        <!--<td><a href="#" class="btn btn-success btn-sm">Active</a></td>-->
			        <td>
			        	<a href="#" did="<?php echo $row['cid']; ?>" class="btn btn-danger btn-sm del_cat">Delete</a>
			        	<a href="#" eid="<?php echo $row['cid']; ?>" data-toggle="modal" data-target="#form_category" class="btn btn-info btn-sm edit_cat">Edit</a>
			        </td>
			      </tr>
			<?php
			$n++;
		}
		?>
			<tr><td colspan="4"><?php echo $pagination; ?></td></tr>
		<?php
		exit();
	}
}


//Delete Category
if (isset($_POST["deleteCategory"])) {
	$m = new Manage();
	$result = $m->deleteRecord("categories","cid",$_POST["id"]);
	echo $result;
	exit();
}

//Update Category
if (isset($_POST["updateCategory"])) {
	$m = new Manage();
	$result = $m->getSingleRecord("categories","cid",$_POST["id"]);
	echo json_encode($result);
	exit();
}

//Update Record after getting data
if (isset($_POST["update_category"])) {
	$m = new Manage();
	$id = $_POST["cid"];
	$name = $_POST["update_category"];
	$parent = $_POST["parent_cat"];
	$result = $m->update_record("categories",["cid"=>$id],["parent_cat"=>$parent,"category_name"=>$name,"status"=>1]);
	echo $result;
	exit();
}

//----------------Products---------------------

if (isset($_POST["manageProduct"])) {
	$m = new Manage();
	$result = $m->manageRecordWithPagination("products",$_POST["pageno"]);
	$rows = $result["rows"];
	$pagination = $result["pagination"];
	if (count($rows) > 0) {
		$n = (($_POST["pageno"] - 1) * 10)+1;
		foreach ($rows as $row) {
			?>
				<tr>
			        <td><?php echo $n; ?></td>
			        <td><?php echo $row["product_id"]; ?></td>
			        <td><?php echo $row["product_name"]; ?></td>
			        <td><?php echo $row["category_name"]; ?></td>
			        <td><?php echo $row["product_price"]; ?></td>
			        <td><?php echo $row["product_dp"]; ?></td>
			        <td><?php echo $row["added_date"]; ?></td>
			        <!--<td><a href="#" class="btn btn-success btn-sm">Active</a></td>-->
			        <td>
			        	<a href="#" did="<?php echo $row['pid']; ?>" class="btn btn-danger btn-sm del_product">Delete</a>
			        	<a href="#" eid="<?php echo $row['pid']; ?>" data-toggle="modal" data-target="#form_products" class="btn btn-info btn-sm edit_product">Edit</a>
			        </td>
			      </tr>
			<?php
			$n++;
		}
		?>
			<tr><td colspan="8"><?php echo $pagination; ?></td></tr>
		<?php
		exit();
	}
}

//Delete 
if (isset($_POST["deleteProduct"])) {
	$m = new Manage();
	$result = $m->deleteRecord("products","pid",$_POST["id"]);
	echo $result;
	exit();
}

//Update Product
if (isset($_POST["updateProduct"])) {
	$m = new Manage();
	$result = $m->getSingleRecord("products","pid",$_POST["id"]);
	echo json_encode($result);
	exit();
}

//Update Record after getting data
if (isset($_POST["update_product"])) {
	$m = new Manage();
	$id = $_POST["pid"];
	$name = $_POST["update_product"];
	$cat = $_POST["select_cat"];
	$price = $_POST["product_price"];
	$dp = $_POST["product_dp"];
	$productid = $_POST["product_id"];
	$date = $_POST["added_date"];
	$result = $m->update_record("products",["pid"=>$id],["cid"=>$cat,"product_name"=>$name,"product_price"=>$price,"product_dp"=>$dp,"product_id"=>$productid,"added_date"=>$date]);
	echo $result;
	exit();
}


//----------------Invoice---------------------

if (isset($_POST["manageInvoice"])) {
	$m = new Manage();
	$result = $m->manageRecordWithPagination("invoice",$_POST["pageno"]);
	$rows = $result["rows"];
	$pagination = $result["pagination"];
	if (count($rows) > 0) {
		$n = (($_POST["pageno"] - 1) * 10)+1;
		foreach ($rows as $row) {
			?>
				<tr>
			        <td><?php echo $n; ?></td>
			        <td><?php echo $row["invoice_no"]; ?></td>
			        <td><?php echo $row["customer_id"]; ?></td>
			        <td><?php echo $row["customer_name"]; ?></td>
			        <td><?php echo $row["customer_mobno"]; ?></td>
			        <td><?php echo $row["customer_email"]; ?></td>
			        <td><?php echo $row["order_date"]; ?></td>
			        <td><?php echo $row["net_total"]; ?></td>
			        <td><?php echo $row["payment_type"]; ?></td>
			        <td>
			        	<a href="./includes/invoice_bill.php?invoice_no=<?php echo $row["invoice_no"]; ?>" target="_blank" class="btn btn-sm btn-info btn-sm">View</a>
			        </td>
			      </tr>
			<?php
			$n++;
		}
		?>
			<tr><td colspan="10"><?php echo $pagination; ?></td></tr>
		<?php
		exit();
	}
}

//Delete 
if (isset($_POST["deleteProduct"])) {
	$m = new Manage();
	$result = $m->deleteRecord("products","pid",$_POST["id"]);
	echo $result;
}

//Update Product
if (isset($_POST["updateProduct"])) {
	$m = new Manage();
	$result = $m->getSingleRecord("products","pid",$_POST["id"]);
	echo json_encode($result);
	exit();
}

//Update Record after getting data
if (isset($_POST["update_product"])) {
	$m = new Manage();
	$id = $_POST["pid"];
	$name = $_POST["update_product"];
	$cat = $_POST["select_cat"];
	$price = $_POST["product_price"];
	$dp = $_POST["product_dp"];
	$productid = $_POST["product_id"];
	$date = $_POST["added_date"];
	$result = $m->update_record("products",["pid"=>$id],["cid"=>$cat,"product_name"=>$name,"product_price"=>$price,"product_dp"=>$dp,"product_id"=>$productid,"added_date"=>$date]);
	echo $result;
}

//-------------------------Order Processing--------------

if (isset($_POST["getNewOrderItem"])) {
	$obj = new DBOperation();
	$rows = $obj->getAllRecord("products");
	?>
	<tr>
		    <td><b class="number">1</b></td>
		    <td>
		        <input name="pname[]" list="products" class="form-control form-control-sm pname" placeholder="Type to Search..." required>
		        <datalist id="products">
		            <?php 
		            	foreach ($rows as $row) {
		            		?><option value="<?php echo $row['product_name']; ?>"><?php echo $row["product_name"]; ?></option><?php
		            	}
		            ?>
		    </datalist></td>
		    <td style="display:none;"><input name="pid[]" type="text" class="form-control form-control-sm pid"></td>
		    <td><input name="qty[]" type="text" class="form-control form-control-sm qty" required></td>
		    <td><input name="price[]" type="text" class="form-control form-control-sm price" readonly>
		    <td><input name="dp[]" type="text" class="form-control form-control-sm dp" readonly>
		    <td style="text-align:center;">Rs.<span class="amt">0</span></td>
	</tr>
	<?php
	exit();
}


//Get price and qty of one item
if (isset($_POST["getPriceAndQty"])) {
	$m = new Manage();
	$result = $m->getSingleRecord("products","product_name",$_POST["id"]);
	echo json_encode($result);
	exit();
}


if (isset($_POST["order_date"]) AND isset($_POST["cust_name"])) {
	
	$orderdate = $_POST["order_date"];
	$cust_id = $_POST["cust_id"];
	$cust_name = $_POST["cust_name"];
	$cust_mobno = $_POST["cust_mobno"];
	$cust_email = $_POST["cust_email"];
	$cust_addr1 = $_POST["cust_addr1"];
	$cust_addr2 = $_POST["cust_addr2"];
	$cust_addr3 = $_POST["cust_addr3"];
	$cust_addr = $cust_addr3.", ".$cust_addr2.", ".$cust_addr1;

	//Now getting array from order_form
	$ar_pid = $_POST["pid"];
	$ar_qty = $_POST["qty"];
	$ar_price = $_POST["price"];
	$ar_dp = $_POST["dp"];
	$ar_pro_name = $_POST["pname"];
	$net_total = $_POST["net_total"];
	$paid = $_POST["paid"];
	$due = $_POST["due"];
	$payment_type = $_POST["payment_type"];

	$m = new Manage();
	echo $result = $m->storeCustomerOrderInvoice($orderdate,$cust_id,$cust_name,$cust_mobno,$cust_email,$cust_addr,$ar_pid,$ar_qty,$ar_dp,$ar_price,$ar_pro_name,$net_total,$paid,$due,$payment_type);

}

?>