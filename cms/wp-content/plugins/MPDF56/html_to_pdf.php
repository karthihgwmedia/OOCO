<?php
/*
 * Plugin Name: OOCO Invoice PDF.
 * Plugin URI: http://www.hgwmedia.com
 * Description: This plugin is managing the Products of OOCO. 
 * Author: hgwmedia
 * Author URI: http://www.hgwmedia.com
 */
 
 
include("mpdf.php");

function convert_PDF($html)
{
	$mpdf=new mPDF();	
	$mpdf->WriteHTML($html);
	
	//$file_name='File'.mktime().".pdf";
	
	$mpdf->Output();
	
	header("Content-Disposition: attachment; filename=\"$file_name\"");
	
	exit;
}

?>
