$(document).ready(function(){
	var DOMAIN = "http://localhost/Bill/inventory-management-system-master";
	$("#register_form").on("submit",function(){
		var status = false;
		var name = $("#username");
		var email = $("#email");
		var pass1 = $("#password1");
		var pass2 = $("#password2");
		var type = $("#usertype");
		//rizwan@gmail.com
		var e_patt = new RegExp(/^[a-z0-9_-]+(\.[a-z0-9_-]+)*@[a-z0-9_-]+(\.[a-z0-9_-]+)*(\.[a-z]{2,4})$/);
		if(name.val() == "" || name.val().length < 6){
			name.addClass("border-danger");
			$("#u_error").html("<span class='text-danger'>Please Enter Name and Name should be more than 6 char</span>");
			status = false;
		}else{
			name.removeClass("border-danger");
			$("#u_error").html("");
			status = true;
		}
		if(!e_patt.test(email.val())){
			email.addClass("border-danger");
			$("#e_error").html("<span class='text-danger'>Please Enter Valid Email Address</span>");
			status = false;
		}else{
			email.removeClass("border-danger");
			$("#e_error").html("");
			status = true;
		}
		if(pass1.val() == "" || pass1.val().length < 8){
			pass1.addClass("border-danger");
			$("#p1_error").html("<span class='text-danger'>Please Enter more than 9 digit password</span>");
			status = false;
		}else{
			pass1.removeClass("border-danger");
			$("#p1_error").html("");
			status = true;
		}
		if(pass2.val() == "" || pass2.val().length < 8){
			pass2.addClass("border-danger");
			$("#p2_error").html("<span class='text-danger'>Please Enter more than 9 digit password</span>");
			status = false;
		}else{
			pass2.removeClass("border-danger");
			$("#p2_error").html("");
			status = true;
		}
		if ((pass1.val() == pass2.val()) && status == true) {
			$(".overlay").show();
			$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data : $("#register_form").serialize(),
				success : function(data){
					if (data == "EMAIL_ALREADY_EXISTS") {
						$(".overlay").hide();
						alert("It seems like you email is already used");
					}else if(data == "SOME_ERROR"){
						$(".overlay").hide();
						alert("Something Wrong");
					}else{
						$(".overlay").hide();
						window.location.href = encodeURI(DOMAIN+"/index.php?msg=You are registered Now you can Login");
					}
				}
			})
		}else{
			pass2.addClass("border-danger");
			$("#p2_error").html("<span class='text-danger'>Password is not matched</span>");
			status = true;
		}
	})

	//For Login Part
	$("#form_login").on("submit",function(){
		var email = $("#log_email");
		var pass = $("#log_password");
		var status = false;
		if (email.val() == "") {
			email.addClass("border-danger");
			$("#e_error").html("<span class='text-danger'>Please Enter Email Address</span>");
			status = false;
		}else{
			email.removeClass("border-danger");
			$("#e_error").html("");
			status = true;
		}
		if (pass.val() == "") {
			pass.addClass("border-danger");
			$("#p_error").html("<span class='text-danger'>Please Enter Password</span>");
			status = false;
		}else{
			pass.removeClass("border-danger");
			$("#p_error").html("");
			status = true;
		}
		if (status) {
			$(".overlay").show();
			$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data : $("#form_login").serialize(),
				success : function(data){
					if (data == "NOT_REGISTERD") {
						$(".overlay").hide();
						email.addClass("border-danger");
						$("#e_error").html("<span class='text-danger'>It seems like you are not registered</span>");
					}else if(data == "PASSWORD_NOT_MATCHED"){
						$(".overlay").hide();
						pass.addClass("border-danger");
						$("#p_error").html("<span class='text-danger'>Please Enter Correct Password</span>");
						status = false;
					}else{
						$(".overlay").hide();
						console.log(data);
						window.location.href = DOMAIN+"/dashboard.php";
					}
				}
			})
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


	//Add Category
	$("#category_form").on("submit",function(){
		if ($("#category_name").val() == "") {
			$("#category_name").addClass("border-danger");
			$("#cat_error").html("<span class='text-danger'>Please Enter Category Name</span>");
		}else{
			$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data  : $("#category_form").serialize(),
				success : function(data){
					if (data == "CATEGORY_ADDED") {
							$("#category_name").removeClass("border-danger");
							$("#cat_error").html("<span class='text-success'>New Category Added Successfully..!</span>");
							$("#category_name").val("");
							fetch_category();
					}else{
						alert(data);
					}
				}
			})
		}
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


	//add product
	$("#product_form").on("submit",function(){
		$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data : $("#product_form").serialize(),
				success : function(data){
					if (data == "NEW_PRODUCT_ADDED") {
						alert("New Product Added Successfully..!");
						$("#product_name").val("");
						$("#select_cat").val("");
						$("#select_brand").val("");
						$("#product_price").val("");
						$("#product_id").val("");
						$("#product_dp").val("");

					}else{
						console.log(data);
						alert(data);
					}
						
				}
			})
	})



})