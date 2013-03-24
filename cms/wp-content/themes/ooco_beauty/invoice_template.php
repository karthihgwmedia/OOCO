<?php
	/*
		Template Name: OOCO Invoice summery
	*/
	global $wpdb;
	
	$user_id=0;
		
	$current_user = wp_get_current_user();

	$user_id=$current_user->ID;
	
	$user_name=$current_user->display_name;
	
	$user_email=$current_user->user_email;

	/*if ( $user_id == 0) {
		$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
		
		echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
		exit;
	}*/
	
	$invoice_id=$_GET["invoice_id"];
	
	//if(current_user_can('administrator'))
	
	$cart_headersql="SELECT * from ".$wpdb->prefix."cart_header WHERE status=1  AND id= ".$invoice_id;	
	
	$current_user = get_userdata( $userid );
	
	/*else
		$cart_headersql="SELECT * from ".$wpdb->prefix."cart_header WHERE ( user_id = ".$user_id." AND status=1) AND id= ".$invoice_id;*/
	
	$rows=$wpdb->get_results( $cart_headersql);
	
	if(empty($rows))
	{
		echo "No invoices for this id";
		
		exit;
	}
	
	$current_user = get_userdata( $rows[0]->user_id);
	
	$user_name=$current_user->display_name;
	
	$user_email=$current_user->user_email;
	
	$user_id=$current_user->ID;
	
	$userAddress=getDefaultAddress($user_id);
	
	$userAddressPrint=array();
	
	if(!empty($userAddress))
	{
		$userAddressPrint=printAddress($user_id,$userAddress[0]->id,'array',$html_tag='span');
		
		//var_dump($userAddressPrint);
	}
	
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META http-equiv="X-UA-Compatible" content="IE=8">
<TITLE>OOCO Beauty Invoice</TITLE>
<STYLE type="text/css">
body {
	margin-top: 0px;
	margin-left: 0px;
}
#page_1 {
	position:relative;
	overflow: hidden;
	margin: 19px 0px 41px 35px;
	padding: 0px;
	border: none;
	width: 781px;
}
#page_1 #id_1 {
	border:none;
	margin: 166px 0px 0px 0px;
	padding: 0px;
	border:none;
	width: 781px;
	overflow: hidden;
}
#page_1 #id_2 {
	border:none;
	margin: 38px 0px 0px 1px;
	padding: 0px;
	border:none;
	width: 780px;
	overflow: hidden;
}
#page_1 #dimg1 {
	position:absolute;
	top:0px;
	left:0px;
	z-index:-1;
	width:744px;
	height:981px;
	text-align:center;
}
#page_1 #dimg1 #img1 {
	/*width:744px;
	height:981px;*/
	 width: 115px;
}
.dclr {
	clear:both;
	float:none;
	height:1px;
	margin:0px;
	padding:0px;
	overflow:hidden;
}
.ft0 {
	font: bold 24px 'Impact';
	line-height: 29px;
}
.ft1 {
	/*font: 1px 'Arial';
	line-height: 1px;*/
	text-align:center !important;
}
.ft2 {
	font: bold 12px 'Arial';
	line-height: 15px;
}
.ft3 {
	font: 12px 'Arial';
	line-height: 15px;
}
.ft4 {
	font: 11px 'Arial';
	line-height: 14px;
}
.ft5 {
	font: 1px 'Arial';
	line-height: 14px;
}
.ft6 {
	font: 1px 'Arial';
	line-height: 10px;
}
.ft7 {
	font: 1px 'Arial';
	line-height: 9px;
}
.ft8 {
	font: bold 10px 'Arial';
	line-height: 12px;
}
.ft9 {
	font: 1px 'Arial';
	line-height: 8px;
}
.ft10 {
	font: 1px 'Arial';
	line-height: 7px;
}
.ft11 {
	font: bold 12px 'Arial';
	line-height: 6px;
}
.ft12 {
	font: 12px 'Times';
	line-height: 15px;
}
.ft13 {
	font: 12px 'Arial';
	line-height: 14px;
}
.ft14 {
	font: bold 11px 'Impact';
	line-height: 15px;
}
.ft15 {
	font: bold 9px 'Arial';
	line-height: 11px;
}
.ft16 {
	font: bold 10px 'Tahoma';
	line-height: 12px;
}
.p0 {
	text-align: left;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p1 {
	text-align: left;
	padding-left: 7px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p2 {
	text-align: right;
	padding-right: 102px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p3 {
	text-align: left;
	padding-left: 92px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p4 {
	text-align: right;
	padding-right: 12px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p5 {
	text-align: left;
	padding-left: 8px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p6 {
	text-align: center;
	padding-left: 32px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p7 {
	text-align: left;
	padding-left: 13px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p8 {
	text-align: left;
	padding-left: 79px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p9 {
	text-align: center;
	padding-left: 30px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p10 {
	text-align: left;
	padding-left: 69px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p11 {
	text-align: right;
	padding-right: 15px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p12 {
	text-align: left;
	padding-left: 4px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p13 {
	text-align: right;
	padding-right: 5px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p14 {
	text-align: right;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p15 {
	text-align: left;
	padding-left: 83px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p16 {
	text-align: left;
	padding-left: 61px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p17 {
	text-align: right;
	padding-right: 7px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p18 {
	text-align: left;
	padding-left: 55px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p19 {
	text-align: right;
	padding-right: 6px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p20 {
	text-align: left;
	padding-left: 80px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p21 {
	text-align: left;
	padding-left: 5px;
	margin-top: 0px;
	margin-bottom: 0px;
	white-space: nowrap;
}
.p22 {
	text-align: left;
	padding-left: 648px;
	margin-top: 20px;
	margin-bottom: 0px;
}
.p23 {
	text-align: left;
	margin-top: 0px;
	margin-bottom: 0px;
}
.td0 {
	padding: 0px;
	margin: 0px;
	width: 96px;
	vertical-align: bottom;
}
.td1 {
	padding: 0px;
	margin: 0px;
	width: 84px;
	vertical-align: bottom;
}
.td2 {
	padding: 0px;
	margin: 0px;
	width: 140px;
	vertical-align: bottom;
}
.td3 {
	padding: 0px;
	margin: 0px;
	width: 129px;
	vertical-align: bottom;	
}
.td4 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 47px;
	vertical-align: bottom;
}
.td5 {
	border-top: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 73px;
	vertical-align: bottom;
}
.td6 {
	border-right: #000000 1px solid;
	border-top: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 22px;
	vertical-align: bottom;
}
.td7 {
	border-top: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 7px;
	vertical-align: bottom;
}
.td8 {
	border-top: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 126px;
	vertical-align: bottom;
}
.td9 {
	border-right: #000000 1px solid;
	border-top: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 2px;
	vertical-align: bottom;
}
.td10 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 73px;
	vertical-align: bottom;
}
.td11 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 22px;
	vertical-align: bottom;
}
.td12 {
	padding: 0px;
	margin: 0px;
	width: 7px;
	vertical-align: bottom;
}
.td13 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 126px;
	vertical-align: bottom;
}
.td14 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 2px;
	vertical-align: bottom;
}
.td15 {
	padding: 0px;
	margin: 0px;
	width: 40px;
	vertical-align: bottom;
}
.td16 {
	padding: 0px;
	margin: 0px;
	width: 56px;
	vertical-align: bottom;
}
.td17 {
	border-right: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 22px;
	vertical-align: bottom;
}
.td18 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 7px;
	vertical-align: bottom;
}
.td19 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 40px;
	vertical-align: bottom;
}
.td20 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 56px;
	vertical-align: bottom;
}
.td21 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 84px;
	vertical-align: bottom;
}
.td22 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 140px;
	vertical-align: bottom;
}
.td23 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 129px;
	vertical-align: bottom;
	
}
.td24 {
	padding: 0px;
	margin: 0px;
	width: 224px;
	vertical-align: bottom;
}
.td25 {
	padding: 0px;
	margin: 0px;
	width: 73px;
	vertical-align: bottom;
}
.td26 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 128px;
	vertical-align: bottom;
}
.td27 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 28px;
	vertical-align: bottom;
}
.td28 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 45px;
	vertical-align: bottom;
}
.td29 {
	padding: 0px;
	margin: 0px;
	width: 126px;
	vertical-align: bottom;
}
.td30 {
	padding: 0px;
	margin: 0px;
	width: 28px;
	vertical-align: bottom;
}
.td31 {
	padding: 0px;
	margin: 0px;
	width: 45px;
	vertical-align: bottom;
}
.td32 {
	border-right: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 2px;
	vertical-align: bottom;
}
.td33 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 48px;
	vertical-align: bottom;
}
.td34 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 23px;
	vertical-align: bottom;	
}
.td35 {
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 3px;
	vertical-align: bottom;
	border-right: 1px solid #000000;
}
.td36 {
	border-left: #000000 1px solid;
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 38px;
	vertical-align: bottom;
}
.td37 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 83px;
	vertical-align: bottom;
}
.td38 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 75px;
	vertical-align: bottom;
}
.td39 {
	padding: 0px;
	margin: 0px;
	width: 23px;
	vertical-align: bottom;
}
.td40 {
	border-right: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 75px;
	vertical-align: bottom;
}
.td41 {
	border-left: #000000 1px solid;
	border-right: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 38px;
	vertical-align: bottom;
}
.td42 {
	border-right: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 83px;
	vertical-align: bottom;
}
.td43 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 139px;
	vertical-align: bottom;
}
.td44 {
	padding: 0px;
	margin: 0px;
	width: 30px;
	vertical-align: bottom;	
}
.td45 {
	padding: 0px;
	margin: 0px;
	width: 3px;
	vertical-align: bottom;
	border-right: 1px solid #000000;
}
.td46 {
	padding: 0px;
	margin: 0px;
	width: 48px;
	vertical-align: bottom;
}
.td47 {
	border-right: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 27px;
	vertical-align: bottom;
}
.td48 {
	border-right: #000000 1px solid;
	border-bottom: #000000 1px solid;
	padding: 0px;
	margin: 0px;
	width: 27px;
	vertical-align: bottom;
}
.td49 {
	padding: 0px;
	margin: 0px;
	width: 424px;
	vertical-align: bottom;
}
.td50 {
/*	border-bottom: #000000 1px solid;*/
	padding: 0px;
	margin: 0px;
	width: 208px;
	vertical-align: bottom;
}
.td51 {
	/*border-bottom: #000000 1px solid;*/
	padding: 0px;
	margin: 0px;
	width: 94px;
	vertical-align: bottom;
}
.td52 {
	padding: 0px;
	margin: 0px;
	width: 85px;
	vertical-align: bottom;
}
.td53 {
	padding: 0px;
	margin: 0px;
	width: 339px;
	vertical-align: bottom;
}
.td54 {
	padding: 0px;
	margin: 0px;
	width: 208px;
	vertical-align: bottom;
}
.td55 {
	padding: 0px;
	margin: 0px;
	width: 94px;
	vertical-align: bottom;
}
.td56 {
	padding: 0px;
	margin: 0px;
	width: 97px;
	vertical-align: bottom;
}
.tr0 {
	height: 48px;
}
.tr1 {
	height: 34px;
}
.tr2 {
	height: 32px;
}
.tr3 {
	height: 33px;
}
.tr4 {
	height: 39px;
}
.tr5 {
	height: 14px;
}
.tr6 {
	height: 23px;
}
.tr7 {
	height: 10px;
}
.tr8 {
	height: 9px;
}
.tr9 {
	height: 15px;
}
.tr10 {
	height: 24px;
}
.tr11 {
	height: 8px;
}
.tr12 {
	height: 16px;
}
.tr13 {
	height: 31px;
}
.tr14 {
	height: 7px;
}
.tr15 {
	height: 17px;
}
.tr16 {
	height: 17px;
}
.tr17 {
	height: 22px;
}
.tr18 {
	height: 21px;
}
.tr19 {
	height: 25px;
}
.tr20 {
	height: 54px;
}
.t0 {
	width: 729px;
	font: 12px 'Arial';
}
.t1 {
	width: 729px;
	margin-top: 2px;
	font: 12px 'Arial';
}
.telNO
{
	font-size:12px;
}
</STYLE>
</HEAD>
<BODY>
<DIV id="page_1">
  	<p style="text-align:center"><IMG src="<?php echo get_template_directory_uri(); ?>/images/invoice_logo.png" id="img1"></p>
    <TABLE cellpadding=0 cellspacing=0 class="t0">
      <TR>
        <TD colspan=2 rowspan=2 class="tr0 td0"><P class="p0 ft0">INVOICE</P></TD>
        <TD class="tr1 td1"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr1 td2"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr1 td3"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr1 td4"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 class="tr2 td5"><P class="p1 ft2">INV. NO</P></TD>
        <TD class="tr2 td6"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr2 td7"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr2 td8"><P class="p2 ft3"><?php echo "OOCO_".$rows[0]->id?></P></TD>
        <TD class="tr3 td9"><P class="p0 ft1">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD rowspan=3 class="tr4 td1"><P class="p0 ft4"><?php echo ucwords($user_name)?></P></TD>
        <TD class="tr5 td2"><P class="p0 ft5">&nbsp;</P></TD>
        <TD class="tr5 td3"><P class="p0 ft5">&nbsp;</P></TD>
        <TD class="tr5 td4"><P class="p0 ft5">&nbsp;</P></TD>
        <TD colspan=2 rowspan=2 class="tr6 td10"><P class="p1 ft2">DATE</P></TD>
        <TD class="tr5 td11"><P class="p0 ft5">&nbsp;</P></TD>
        <TD class="tr5 td12"><P class="p0 ft5">&nbsp;</P></TD>
        <TD rowspan=2 class="tr6 td13"><P class="p0 ft3"><NOBR><?php echo date("d-m-Y",strtotime($rows[0]->trans_paid_date))?></NOBR></P></TD>
        <TD class="tr5 td14"><P class="p0 ft5">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr7 td15"><P class="p0 ft6">&nbsp;</P></TD>
        <TD class="tr7 td16"><P class="p0 ft6">&nbsp;</P></TD>
        <TD class="tr7 td2"><P class="p0 ft6">&nbsp;</P></TD>
        <TD class="tr7 td3"><P class="p0 ft6">&nbsp;</P></TD>
        <TD class="tr7 td4"><P class="p0 ft6">&nbsp;</P></TD>
        <TD class="tr8 td17"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td18"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr7 td14"><P class="p0 ft6">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr9 td15"><P class="p0 ft8">TO</P></TD>
        <TD class="tr9 td16"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td2"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td3"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td4"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 rowspan=2 class="tr6 td10"><P class="p1 ft8">REF</P></TD>
        <TD class="tr9 td11"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td12"><P class="p0 ft1">&nbsp;</P></TD>
        <TD rowspan=2 class="tr6 td13"><P class="p0 ft3"><?php echo __("Online Store")?></P></TD>
        <TD rowspan=2 class="tr10 td14"><P class="p0 ft1">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr11 td19"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td20"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td21"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td22"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td23"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr8 td4"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr11 td17"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td18"><P class="p0 ft9">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD colspan=2 class="tr6 td0"><P class="p0 ft8">ADDRESS</P></TD>
        <TD colspan=2 class="tr6 td24"><P class="p0 ft3">&nbsp;</P></TD>
        <TD class="tr6 td3"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr6 td4"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 class="tr6 td25"><P class="p1 ft8">CURRENCY</P></TD>
        <TD class="tr6 td11"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr6 td12"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 class="tr6 td26"><P class="p0 ft3">AED</P></TD>
      </TR>
      <TR>
        <TD class="tr8 td15"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td16"><P class="p0 ft7">&nbsp;</P></TD>
        <TD rowspan=2 class="tr10 td1">
        	<P class="p0 ft3"><?php echo $userAddressPrint['address_1']?></P>
            <P class="p0 ft3"><?php echo $userAddressPrint['address_2']?></P>
            <P class="p0 ft3"><?php echo $userAddressPrint['location']?></P>
            <P class="p0 ft3"><?php echo $userAddressPrint['emirate']?></P>
            <P class="p0 ft3"><?php echo $userAddressPrint['country']?></P>
            <P class="p0 ft3"><?php echo $userAddressPrint['po_box']?></P>
            
        </TD>
        <TD class="tr8 td2"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td3"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td4"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr11 td27"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td28"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td17"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td18"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td13"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr8 td14"><P class="p0 ft7">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr9 td15"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td16"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td2"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td3"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td4"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 rowspan=2 class="tr6 td25"><P class="p1 ft8">TERMS</P></TD>
        <TD class="tr9 td11"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td12"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 rowspan=2 class="tr6 td26"><P class="p0 ft3">CASH</P></TD>
      </TR>
      <TR>
        <TD class="tr11 td15"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td16"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td1"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td2"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td3"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td4"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td11"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td12"><P class="p0 ft9">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr8 td15"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td16"><P class="p0 ft7">&nbsp;</P></TD>
        <TD rowspan=2 class="tr12 td1"><P class="p0 ft3">&nbsp;</P></TD>
        <TD class="tr8 td2"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td3"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td4"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr11 td27"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td28"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td17"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td18"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td13"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr8 td14"><P class="p0 ft7">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD rowspan=3 class="tr13 td19"><P class="p0 ft8">TEL</P></TD>
        <TD class="tr14 td16"><P class="p0 ft10">&nbsp;</P></TD>
        <TD rowspan=3 class="tr13 td22"><P class="p3 ft8">FAX</P></TD>
        <TD class="tr14 td3"><P class="p0 ft10">&nbsp;</P></TD>
        <TD class="tr14 td4"><P class="p0 ft10">&nbsp;</P></TD>
        <TD colspan=2 rowspan=2 class="tr6 td25"><P class="p1 ft8">AREA</P></TD>
        <TD class="tr14 td11"><P class="p0 ft10">&nbsp;</P></TD>
        <TD class="tr14 td12"><P class="p0 ft10">&nbsp;</P></TD>
        <TD rowspan=2 class="tr6 td29"><P class="p0 ft3">1001</P></TD>
        <TD class="tr14 td14"><P class="p0 ft10">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr12 td16"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td1"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td3"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td4"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td11"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td12"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td14"><P class="p0 ft1">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr11 td20"><P class="p0 ft9 telNO"><?php echo $userAddressPrint['mobile']?></P></TD>
        <TD class="tr11 td21"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td23"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr8 td4"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td30"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td31"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td11"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td12"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td29"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td14"><P class="p0 ft7">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr11 td15"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td16"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td1"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td2"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td3"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td4"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr14 td27"><P class="p0 ft10">&nbsp;</P></TD>
        <TD class="tr14 td28"><P class="p0 ft10">&nbsp;</P></TD>
        <TD class="tr14 td17"><P class="p0 ft10">&nbsp;</P></TD>
        <TD class="tr14 td18"><P class="p0 ft10">&nbsp;</P></TD>
        <TD class="tr14 td13"><P class="p0 ft10">&nbsp;</P></TD>
        <TD class="tr14 td32"><P class="p0 ft10">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr9 td19"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td20"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td21"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td22"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td23"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td33"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td27"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td28"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td34"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td18"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td13"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr9 td35"><P class="p0 ft1">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD rowspan=2 class="tr2 td36"><P class="p4 ft2">NO</P></TD>
        <TD class="tr10 td16"><P class="p5 ft2">ITEM</P></TD>
        <TD class="tr10 td37"><P class="p0 ft1">&nbsp;</P></TD>
        <TD rowspan=2 class="tr2 td2"><P class="p5 ft2">DESCRIPTION</P></TD>
        <TD class="tr10 td3"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 class="tr10 td38"><P class="p6 ft2">UNIT</P></TD>
        <TD class="tr10 td31"><P class="p7 ft11">QUANTITY</P></TD>
        <TD class="tr10 td39"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr10 td12"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 class="tr10 td3" style=" border-right:1px solid #000000"><P class="p8 ft2">TOTAL</P></TD>
      </TR>
      <TR>
        <TD rowspan=2 class="tr15 td20"><P class="p5 ft2">CODE</P></TD>
        <TD class="tr11 td37"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td3"><P class="p0 ft9">&nbsp;</P></TD>
        <TD colspan=2 rowspan=2 class="tr15 td40"><P class="p9 ft2">PRICE</P></TD>
        <TD class="tr11 td31"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td39"><P class="p0 ft9">&nbsp;</P></TD>
        <TD class="tr11 td12"><P class="p0 ft9">&nbsp;</P></TD>
        <TD colspan=2 rowspan=2 class="tr15 td23" style=" border-right:1px solid #000000"><P class="p10 ft2">AMOUNT</P></TD>
      </TR>
      <TR>
        <TD class="tr8 td41"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td42"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td22"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td23"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td28"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td34"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td18"><P class="p0 ft7">&nbsp;</P></TD>
      </TR>
      <?php
	 	// var_dump();
	  
	  	$invoice_detailsql="SELECT *,count(product_id) as product_qty from ".$wpdb->prefix."confirm_cart WHERE ( refUserId = ".$user_id." AND refBookingId =".$rows[0]->id.") GROUP BY product_id";
	
		//echo $invoice_detailsql;	
		
		$invoice_details=$wpdb->get_results( $invoice_detailsql );
		
		//var_dump($invoice_details);
		
		if(!empty($invoice_details))
		{
			$i=1;
			
			foreach($invoice_details as $invoice_detail)
			{
				$productDetails = getProductById($invoice_detail->product_id);
										
				$ooco_product_detail_price=getPrductMetaData($invoice_detail->product_id,'ooco_product_detail_price');
	  ?>
              <TR>
                <TD class="tr6 td36"><P class="p11 ft12"><?php echo $i?></P></TD>
                <TD colspan=2 class="tr6 td43"><P class="p5 ft3">OCOOBeautyDrink</P></TD>
                <TD class="tr6 td2"><P class="p12 ft3"><?php echo $productDetails['post_title']." pack"?> </P></TD>
                <TD class="tr6 td3"><P class="p0 ft3"></P></TD>
                <TD colspan=2 class="tr6 td38"><P class="p13 ft3"><?php echo number_format($ooco_product_detail_price,2)?></P></TD>
                <TD class="tr6 td31"><P class="p0 ft1"><?php echo number_format($invoice_detail->product_qty,2)?></P></TD>
                <TD colspan=2 class="tr6 td44"><P class="p14 ft3"></P></TD>
                <TD class="tr6 td29"><P class="p15 ft3"><?php echo number_format($invoice_detail->product_qty*$ooco_product_detail_price,2)?></P></TD>
                <TD class="tr6 td45"><P class="p0 ft1">&nbsp;</P></TD>
              </TR>
      <?php
	  		$i++;
	  		}
	  	}
	  ?>
      <TR>
        <TD class="tr12 td36"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td16"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td37"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td2"><P class="p12 ft3">&nbsp;</P></TD>
        <TD class="tr12 td3"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td46"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td47"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td31"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td39"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td12"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td29"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr12 td45"><P class="p0 ft1">&nbsp;</P></TD>
      </TR>
      <TR>
        <TD class="tr16 td41"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td20"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td42"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td22"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td23"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td33"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td48"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td28"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td34"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td18"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td13"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr16 td35"><P class="p0 ft1">&nbsp;</P></TD>
      </TR>
    </TABLE>
    <TABLE cellpadding=0 cellspacing=0 class="t1">
      <TR>
        <TD colspan=2 class="tr17 td49"><P class="p0 ft3">PLEASETHE PAYMENTMAKE IN FAVOUR OF</P></TD>
        <TD class="tr18 td50"><P class="p16 ft2">GROSSAMOUNT</P></TD>
        <TD class="tr18 td51"><P class="p17 ft3"><?php echo number_format($rows[0]->products_price,2)?></P></TD>        
      </TR>
      <TR>
        <TD class="tr5 td52"><P class="p0 ft13">OBS GROUP L.L.C</P></TD>
        <TD class="tr5 td53"><P class="p0 ft13"></P></TD>
        <TD rowspan=2 class="tr17 td50"><P class="p18 ft2">Delivery Charges</P></TD>
        <TD rowspan=2 class="tr17 td51"><P class="p19 ft3"><?php echo  number_format($rows[0]->delivery_charge,2)?></P></TD>
      </TR>
      <TR>
        <TD class="tr8 td52"><P class="p0 ft7">&nbsp;</P></TD>
        <TD class="tr8 td53"><P class="p0 ft7">&nbsp;</P></TD>

      </TR>
      <TR>
        <TD class="tr19 td52"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr19 td53"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr10 td50"><P class="p20 ft2">NETAMOUNT</P></TD>
        <TD class="tr10 td51"><P class="p17 ft3"><?php echo  number_format($rows[0]->total_price,2)?></P></TD>

      </TR>
      <TR>
        <TD class="tr20 td52"><P class="p5 ft4">RECEIVED BY & DATE :</P></TD>
        <TD class="tr20 td54"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr20 td55"><P class="p0 ft1">&nbsp;</P></TD>

      </TR>
      <TR>
        <TD class="tr18 td52"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr18 td53"><P class="p0 ft1">&nbsp;</P></TD>
        <TD class="tr18 td54"><P class="p0 ft1">&nbsp;</P></TD>
        <TD colspan=2 class="tr18 td56"><P class="p21 ft14">OBS GROUP L.L.C</P></TD>
      </TR>
    </TABLE>
   <?php /*?> <P class="p22 ft15">Page 1 of 1</P><?php */?>
  <DIV id="id_2">
    <P class="p23 ft16">P.O. Box: 88001, <NOBR>Dubai-UAE,</NOBR> Tel: <NOBR>04-4404040,</NOBR> Fax: <NOBR>04-4404001,</NOBR> Email: ocoo@obsgroup.com, web: www.occobeauty.com</P>
  </DIV>
  </DIV>
</body>
</HTML>
