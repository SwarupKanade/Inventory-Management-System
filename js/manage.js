$(document).ready(function(){
	var DOMAIN = "http://localhost/Bill/inventory-management-system-master";

	//Mange Category
	manageCategory(1);
	function manageCategory(pn){
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			data : {manageCategory:1,pageno:pn},
			success : function(data){
				$("#get_category").html(data);		
			}
		})
	}

	$("body").delegate(".page-link","click",function(){
		var pn = $(this).attr("pn");
		manageCategory(pn);
	})

	$("body").delegate(".del_cat","click",function(){
		var did = $(this).attr("did");
		if (confirm("Are you sure ? You want to delete..!")) {
			$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data : {deleteCategory:1,id:did},
				success : function(data){
					if (data == "DEPENDENT_CATEGORY") {
						alert("Sorry ! this Category is dependent on other sub categories");
					}else if(data == "CATEGORY_DELETED"){
						alert("Category Deleted Successfully..!");
						manageCategory(1);
					}else if(data == "DELETED"){
						alert("Category Deleted Successfully");
					}else{
						alert(data);
					}
						
				}
			})
		}else{

		}
	})

	//Fetch category
	fetch_category();
	function fetch_category(){
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			data : {getCategory:1},
			success : function(data){
				var root = "<option value='0'>Root</option>";
				var choose = "<option value=''>Choose Category</option>";
				$("#parent_cat").html(root+data);
				$("#select_cat").html(choose+data);
			}
		})
	}


	//Update Category
	$("body").delegate(".edit_cat","click",function(){
		var eid = $(this).attr("eid");
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			dataType : "json",
			data : {updateCategory:1,id:eid},
			success : function(data){
				console.log(data);
				$("#cid").val(data["cid"]);
				$("#update_category").val(data["category_name"]);
				$("#parent_cat").val(data["parent_cat"]);
			}
		})
	})

	$("#update_category_form").on("submit",function(){
		if ($("#update_category").val() == "") {
			$("#update_category").addClass("border-danger");
			$("#cat_error").html("<span class='text-danger'>Please Enter Category Name</span>");
		}else{
			$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data  : $("#update_category_form").serialize(),
				success : function(data){
					if (data == "UPDATED") {
						alert("Category Updated Successfully..!");
						window.location.href = "";
					}else{
						alert(data);
					}
				}
			})
		}
	})

	//---------------------Products-----------------
	manageProduct(1);
	function manageProduct(pn){
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			data : {manageProduct:1,pageno:pn},
			success : function(data){
				$("#get_product").html(data);		
			}
		})
	}

	$("body").delegate(".page-link","click",function(){
		var pn = $(this).attr("pn");
		manageProduct(pn);
	})

	$("body").delegate(".del_product","click",function(){
		var did = $(this).attr("did");
		if (confirm("Are you sure ? You want to delete..!")) {
			$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data : {deleteProduct:1,id:did},
				success : function(data){
					if (data == "DELETED") {
						alert("Product is Deleted");
						manageProduct(1);
					}else{
						alert(data);
					}
						
				}
			})
		}
	})

	//Update product
	$("body").delegate(".edit_product","click",function(){
		var eid = $(this).attr("eid");
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			dataType : "json",
			data : {updateProduct:1,id:eid},
			success : function(data){
				console.log(data);
				$("#pid").val(data["pid"]);
				$("#update_product").val(data["product_name"]);
				$("#select_cat").val(data["cid"]);
				$("#product_price").val(data["product_price"]);
				$("#product_dp").val(data["product_dp"]);
				$("#product_id").val(data["product_id"]);

			}
		})
	})

	$("#product_price").keyup(function(){
		var price = $(this).val();	
		if (isNaN(price)) {
			alert("Please Enter a Valid Price");
			$(this).val("0");
		}
	})

	$("#product_dp").keyup(function(){
		var dp = $(this).val();	
		if (isNaN(dp)) {
			alert("Please Enter a Valid Discount");
			$(this).val("0");
		}
	})

	//Update product
	$("#update_product_form").on("submit",function(){
		$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data : $("#update_product_form").serialize(),
				success : function(data){
					if (data == "UPDATED") {
						alert("Product Updated Successfully..!");
						window.location.href = "";
					}else{
						alert(data);
					}
				}
			})
	})


	//---------------------Invoice-----------------
	manageInvoice(1);
	function manageInvoice(pn){
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			data : {manageInvoice:1,pageno:pn},
			success : function(data){
				$("#get_invoice").html(data);		
			}
		})
	}

	$("body").delegate(".page-link","click",function(){
		var pn = $(this).attr("pn");
		manageInvoice(pn);
	})
	
})