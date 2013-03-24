<?php
/*
	Template Name: OOCO Invoice download
*/

	$url='';
	
	if(isset($_GET["invoice_id"]))
	{
		$invoice_id=$_GET["invoice_id"];
	
		$url=site_url('invoice-summery').'?invoice_id='.$invoice_id;
	}
	if(isset($_GET["delivery_note_id"]))
	{
		$invoice_id=$_GET["delivery_note_id"];
	
		$url=site_url('delivery-notes').'?delivery_note_id='.$invoice_id;
		
	}
	if($url!="")
	{	
		$html=file_get_contents($url);
	
		convert_PDF($html);
	}
?>
