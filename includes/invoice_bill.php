<?php

// (A) LOAD INVOICR
require "invlib/invoicr.php";

if (isset($_GET["invoice_no"])) {

	$invoiceno = $_GET["invoice_no"];
	include_once("../database/db.php");
	$db = new Database();
	$con = $db->connect();

	// (B) SET INVOICE DATA
	// (B1) COMPANY INFORMATION
	/* RECOMMENDED TO JUST PERMANENTLY CODE INTO INVOICR/INVOICR.PHP > LINE 13 */

	$pre_stmt = $con->prepare("SELECT * FROM invoice WHERE invoice_no = ".$invoiceno);
	$pre_stmt->execute() or die($con->error);
	$result = $pre_stmt->get_result();
	$rows = array();
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()){
			// (B2) BILL TO
			$invoicr->set("billto", [
			$row["customer_name"],
			$row["customer_mobno"],
			$row["customer_email"],			
			$row["customer_addr"]
			]);

			// (B3) SHIP TO
			$invoicr->set("shipto", [
			$row["customer_name"],
			$row["customer_mobno"],
			$row["customer_email"],
			$row["customer_addr"]
			]);

			// (B4) INVOICE HEADER
			$invoicr->set("head", [
			["Invoice #", "MC-".$row["invoice_no"]],
			["Customer ID", $row["customer_id"]],
			["Payment Method", $row["payment_type"]],
			["Order Date", $row["order_date"]]
			]);

			$invno = $row["invoice_no"];

			// (B5) TOTALS
			$invoicr->set("totals", [
			["Total Amount", "₹".$row["net_total"]],
			["Paid Amount", "₹".$row["paid"]],
			["Due Amount", "₹".$row["due"]]
			]);
		}	
	}

	// (B6) ITEMS - ADD ONE-BY-ONE
	$pre_stmt = $con->prepare("SELECT * FROM invoice_details WHERE invoice_no = ".$invoiceno);
	$pre_stmt->execute() or die($con->error);
	$result = $pre_stmt->get_result();
	$rows = array();
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()){
			$allrow[] = $row;
		}
		for ($i=0; $i < count($allrow) ; $i++) {
			$items[$i][0] = "#".$allrow[$i]["product_id"]." ".$allrow[$i]["product_name"];
			$items[$i][1] = "";
			$items[$i][2] = $allrow[$i]["qty"];
			$items[$i][3] = "₹".$allrow[$i]["price"];
			$items[$i][4] = "₹".$allrow[$i]["dp"];
			$itemsamt = $allrow[$i]["qty"] * $allrow[$i]["dp"];
			$items[$i][5] = "₹".$itemsamt;
		}
	}

	//$items = [
	//	["#501 Rubber Hose", "5m long rubber hose", 3, "₹5", "₹4", "₹12"],
	//	["Rubber Shoe", "For slipping, not for run", 1, "$20.00", "10.5%", "$20.00"]
	//];
	// foreach ($items as $i) { $invoicr->add("items", $i); }

	// (B7) ITEMS - OR SET ALL AT ONCE
	$invoicr->set("items", $items);

	// (B8) NOTES, IF ANY
	$invoicr->set("notes", [
		"Shop Opens at 11 AM To 8 PM.",
		"Thanks For Your Visit!"
	]);

	// (C) OUTPUT
	// (C1) CHOOSE A TEMPLATE
	// $invoicr->template("apple");
	 $invoicr->template("blueberry");
	// $invoicr->template("lime");
	// $invoicr->template("simple");
	// $invoicr->template("strawberry");

	// (C2) OUTPUT IN HTML
	// DEFAULT : DISPLAY IN BROWSER 
	// 1 : DISPLAY IN BROWSER 
	// 2 : FORCE DOWNLOAD 
	// 3 : SAVE ON SERVER
	// $invoicr->outputHTML();
	// $invoicr->outputHTML(1);
	// $invoicr->outputHTML(2, "invoice.html");
	// $invoicr->outputHTML(3, __DIR__ . DIRECTORY_SEPARATOR . "invoice.html");

	// (C3) OUTPUT IN PDF
	// DEFAULT : DISPLAY IN BROWSER 
	// 1 : DISPLAY IN BROWSER 
	// 2 : FORCE DOWNLOAD 
	// 3 : SAVE ON SERVER
	// $invoicr->outputPDF();
	$invoicr->outputPDF(1);
	// $invoicr->outputPDF(2, "PDF_INVOICE_".$_GET["invoice_no"].".pdf");
	$invoicr->outputPDF(3, __DIR__ . DIRECTORY_SEPARATOR . "INVOICE_PDF/PDF_INVOICE_".$invno.".pdf");

	// (C4) OUTPUT IN DOCS
	// DEFAULT : FORCE DOWNLOAD
	// 1 : FORCE DOWNLOAD 
	// 2 : SAVE ON SERVER
	// $invoicr->outputDOCX();
	// $invoicr->outputDOCX(1, "invoice.docx");
	// $invoicr->outputDOCX(2, __DIR__ . DIRECTORY_SEPARATOR . "invoice.docx");

	// (D) USE RESET() IF YOU WANT TO CREATE ANOTHER ONE AFFTER THIS
	// $invoicr->reset();

}
// echo "Hiii";