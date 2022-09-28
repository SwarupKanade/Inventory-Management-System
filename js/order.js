$(document).ready(function(){
	var DOMAIN = "http://localhost/Bill/inventory-management-system-master";

	addNewRow();

	$("#add").click(function(){
		addNewRow();
	})

	function addNewRow(){
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			data : {getNewOrderItem:1},
			success : function(data){
				$("#invoice_item").append(data);
				var n = 0;
				$(".number").each(function(){
					$(this).html(++n);
				})
			}
		})
	}

	$("#remove").click(function(){
		$("#invoice_item").children("tr:last").remove();
		calculate(0,0);
	})

	$("#invoice_item").delegate(".pname","change",function(){
		var pname = $(this).val();
		var tr = $(this).parent().parent();
		$(".overlay").show();
		$.ajax({
			url : DOMAIN+"/includes/process.php",
			method : "POST",
			dataType : "json",
			data : {getPriceAndQty:1,id:pname},
			success : function(data){
				tr.find(".qty").val(1);
				tr.find(".pid").val(data["product_id"]);
				tr.find(".price").val(data["product_price"]);
				tr.find(".dp").val(data["product_dp"]);
				tr.find(".amt").html( tr.find(".qty").val() * tr.find(".dp").val() );
				calculate(0);
			}
		})
	})

	$("#invoice_item").delegate(".qty","keyup",function(){
		var qty = $(this);
		var tr = $(this).parent().parent();
		if (isNaN(qty.val())) {
			alert("Please Enter a Valid Quantity");
			qty.val(1);
		}else{
			tr.find(".amt").html(qty.val() * tr.find(".dp").val());
			calculate(0);
		}

	})

	function calculate(paid){
		var net_total = 0;
		var paid_amt = paid;
		var due = 0;
		$(".amt").each(function(){
			net_total = net_total + ($(this).html() * 1);
		})
		due = net_total - paid_amt;
		$("#net_total").val(net_total);
		//$("#paid")
		$("#due").val(due);

	}

	$("#paid").keyup(function(){
		var paid = $(this).val();
		calculate(paid);
	})


	/*Order Accepting*/

	$("#order_form").click(function(){
		var invoice = $("#get_order_data").serialize();
		if ($("#cust_name").val() === "") {
			alert("Please Enter Customer Name");
		}else if($("#cust_email").val() === ""){
			alert("Please Enter Email");
		}else if($("#cust_mobno").val() === ""){
			alert("Please Enter Mobile No");
		}else if($("#paid").val() === ""){
			alert("Please Enter Paid Amount");
		}else{
			$.ajax({
				url : DOMAIN+"/includes/process.php",
				method : "POST",
				data : $("#get_order_data").serialize(),
				success : function(data){
					if (data < 0) {
						alert(data);
					}else{
						$("#get_order_data").trigger("reset");
						var tr = $("#invoice_item").parent().parent();
						tr.find(".amt").html("0");
						if (confirm("Do You Want to Print Invoice ?")) {
							window.location.href = DOMAIN+"/includes/invoice_bill.php?invoice_no="+data;
						}
					}
				}
			});
		}
	});


	$("#cust_mobno").keyup(function(){
		var mobno = $(this).val();
  		var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;		
  		if(!(phoneno.test(mobno)))
        {
      		$(this).addClass("border-danger");
      		$("#m_error").html("<span class='text-danger'>Please Enter Valid Mobile No</span>");
        }else{
        	$(this).removeClass("border-danger");
        	$("#m_error").html("");
        }
	})

	$("#cust_email").keyup(function(){
		var email = $(this).val();
  		var regemail = /^[a-z0-9_-]+(\.[a-z0-9_-]+)*@[a-z0-9_-]+(\.[a-z0-9_-]+)*(\.[a-z]{2,4})$/;		
  		if(!(regemail.test(email)))
        {
      		$(this).addClass("border-danger");
      		$("#e_error").html("<span class='text-danger'>Please Enter Valid Email Address</span>");
        }else{
        	$(this).removeClass("border-danger");
        	$("#e_error").html("");
        }
	})

});