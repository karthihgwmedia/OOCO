<?php

define ('HMAC_SHA256', 'sha256');

$ooco_ni_secret_key=get_option('ooco_ni_secret_key');

define ('SECRET_KEY', $ooco_ni_secret_key);

function sign ($params) {
  return signData(buildDataToSign($params), SECRET_KEY);
}

function signData($data, $secretKey) {
    return base64_encode(hash_hmac('sha256', $data, $secretKey, true));
}

function buildDataToSign($params) {
        $signedFieldNames = explode(",",$params["signed_field_names"]);
        foreach ($signedFieldNames as &$field) {
           $dataToSign[] = $field . "=" . $params[$field];
        }
        return commaSeparate($dataToSign);
}

function commaSeparate ($dataToSign) {
    return implode(",",$dataToSign);
}
function send_parchase_info($user_id,$wp_temp_cart_id)
{
	admin_parchase_info($user_id,$wp_temp_cart_id);
	
	global $wpdb;
	
	$user_info = get_userdata($user_id);
	
	$firstname=$user_info->display_name;
	
	$usermail=$user_info->user_email;

	$sql="SELECT * from ".$wpdb->prefix."cart_header WHERE user_id = ".$user_id." AND status=1 AND id=".$wp_temp_cart_id;
	
	//echo $sql;
	
	$bookingheader=$wpdb->get_results( $sql );

	$productDetails = array();

	$deliverCharge=35;

	$deliveryChargeText='';

	$finalTotal=array();
	
	$bookingdetails=array();
	
	if(!empty($bookingheader))
	{
		$sql="SELECT * from ".$wpdb->prefix."confirm_cart WHERE refUserId = ".$user_id." AND status=1 AND refBookingId=".$bookingheader[0]->id;
		
		//echo $sql;
		
		$bookingdetails=$wpdb->get_results( $sql );
		
	}
	
	if(isset($bookingheader) && !empty($bookingheader))
	{
		$message='<table cellpadding="0" cellspacing="0" border="0" width="800" align="center" style="font-family:Arial, Helvetica, sans-serif">
				  <tr>
					<td><div style="height:20px; background:#501a21; margin-bottom:10px;">&nbsp;</div></td>
				  </tr>
				  <tr>
					<td><a href="'.site_url().'"><img src="'.get_template_directory_uri().'/images/OCOOlogo_header.png" /></a></td>
				  </tr>
				  <tr>
					<td><p>&nbsp;</p></td>
				  </tr>
				  <tr>
					<td><p><span style="color:#E61320">Hi '.$firstname.',</span></p>
					  <p>Thank you for your purchase on OOCO Beauty</p>
					  <p>Please find your order details below.</p> 
					  <p>Booking Date : '.date('d M Y',strtotime($bookingheader[0]->trans_paid_date)).'</p>
					  <p><strong>Booking Refrence</strong> : '.$bookingheader[0]->refrence_id.'</p>
					</td>
				  </tr>
				  <tr>
					<td><p>&nbsp;</p></td>
				  </tr>
				  <tr>
				<td>';
		if(isset($bookingdetails) && !empty($bookingdetails))
		{
			$message.='<table cellpadding="0" cellspacing="0" width="100%"  border="1" frame="box" style="boder-color:#000">
						<tr>
						  <td style="padding:5px"><strong>Address</strong></td>	
						  <td style="padding:5px"><strong>Product Detais</strong></td>
						  <td style="padding:5px"><strong>Quantity</strong></td>
						  <td style="padding:5px"><strong>Price</strong></td>						  
						</tr>';
			foreach($bookingdetails as $bookingdetail)
			{
				printAddress($bookingdetail->refUserId,$bookingdetail->address_id);
				
				$productDetails = getProductById($bookingdetail->product_id);
				
				$ooco_product_detail_price=getPrductMetaData($bookingdetail->product_id,'ooco_product_detail_price');
										
				$ooco_product_detail_no_bottles=getPrductMetaData($bookingdetail->product_id,'ooco_product_detail_no_bottles');
				
				$message.='<tr>
							<td style="padding:5px"><p>'.ucwords($bookingdetail->receiverName).'</p>'.printAddress($bookingdetail->refUserId,$bookingdetail->address_id,'text','p').'</td>
							<td style="padding:5px"><strong>'.$productDetails['post_title']." ".__("pack").'</strong></td>
							<td style="padding:5px">'.$bookingdetail->quantity.'</td>
							<td style="padding:5px">'.($bookingdetail->quantity) * ($ooco_product_detail_price).'</td>							
						  </tr>';
			}
		}
		if(!empty($bookingheader))
		{
			$message.='<tr class="tablefooter">
				  <td colspan="3" style="padding:5px">
				  	<div style="text-align:right"> <strong>Delivery charge (AED)</strong> &nbsp; &nbsp; &nbsp;</div>
				  	<div style="text-align:right"> <strong>TOTAL (AED)</strong> &nbsp; &nbsp; &nbsp;</div>
				  </td>
			  	  <td class="cartTotalAmt" style="padding:5px">
				  		<div style="text-align:left"><strong>'.$bookingheader[0]->delivery_charge .'</strong>	</div>
				  		<div style="text-align:left"><strong>'.$bookingheader[0]->total_price .'</strong></div>
				  </td>
			</tr>
			';
		}
				
		$message.='</table></td></tr><tr><td><p>&nbsp;</p><p>Your orders (s) will be delivered to your nominated delivery address.</p><p>Thank you.</p><p>OOCO beauty</p></td></tr></table>';
	}
	
	$headers = 'From: OOCO Beauty <info@oocobeauty.com>' . "\r\n";
	
	add_filter('wp_mail_content_type',create_function('', 'return "text/html";'));
	
	wp_mail( $usermail, 'OOCO Beauty | Order confirmation', $message, $headers); 
	
	//var_dump($usermail);
	//echo $message;
	
}
function admin_parchase_info($user_id,$wp_temp_cart_id)
{
	global $wpdb;
	
	$user_info = get_userdata($user_id);
	
	$firstname=$user_info->display_name;
	
	$usermail=$user_info->user_email;

	$mobile_no = get_user_meta($user_id,'ooco_user_contact_no');
	$mobile_no=$mobile_no[0];
	
	//var_dump($mobile_no);
	
	$sql="SELECT * from ".$wpdb->prefix."cart_header WHERE user_id = ".$user_id." AND status=1 AND id=".$wp_temp_cart_id;
	
	//echo $sql;
	
	$bookingheader=$wpdb->get_results( $sql );

	$productDetails = array();

	$deliverCharge=35;

	$deliveryChargeText='';

	$finalTotal=array();
	
	$bookingdetails=array();
	
	if(!empty($bookingheader))
	{
		$sql="SELECT * from ".$wpdb->prefix."confirm_cart WHERE refUserId = ".$user_id." AND status=1 AND refBookingId=".$bookingheader[0]->id;
		
		//echo $sql;
		
		$bookingdetails=$wpdb->get_results( $sql );
		
	}
	
	if(isset($bookingheader) && !empty($bookingheader))
	{
		$message='<table cellpadding="0" cellspacing="0" border="0" width="800" align="center" style="font-family:Arial, Helvetica, sans-serif">
				  <tr>
					<td><div style="height:20px; background:#501a21; margin-bottom:10px;">&nbsp;</div></td>
				  </tr>
				  <tr>
					<td><a href="'.site_url().'"><img src="'.get_template_directory_uri().'/images/OCOOlogo_header.png" /></a></td>
				  </tr>
				  <tr>
					<td><p>&nbsp;</p></td>
				  </tr>
				  <tr>
					<td>
					  <p><span style="color:#E61320">Hi admin,</span></p>
					  <p>'.$firstname.' ordered a following products on OOCO Beauty!</p>
					  <p>Email : <a href="mail_to:'.$usermail.'">'.$usermail.'</a></p>
					  <p>Mobile No : '.$mobile_no.'</p>
					  <p>Booking Date : '.date('d M Y',strtotime($bookingheader[0]->trans_paid_date)).'</p>
					  <p><strong>Booking Refrence</strong> : '.$bookingheader[0]->refrence_id.'</p>
					</td>
				  </tr>
				  <tr>
					<td><p>&nbsp;</p></td>
				  </tr>
				  <tr>
				<td>';
		if(isset($bookingdetails) && !empty($bookingdetails))
		{
			$message.='<table cellpadding="0" cellspacing="0" width="100%"  border="1" frame="box" style="boder-color:#000">
						<tr>
						  <td style="padding:5px"><strong>Address</strong></td>	
						  <td style="padding:5px"><strong>Product Detais</strong></td>
						  <td style="padding:5px"><strong>Quantity</strong></td>
						  <td style="padding:5px"><strong>Price</strong></td>						  
						</tr>';
			foreach($bookingdetails as $bookingdetail)
			{
				printAddress($bookingdetail->refUserId,$bookingdetail->address_id);
				
				$productDetails = getProductById($bookingdetail->product_id);
				
				$ooco_product_detail_price=getPrductMetaData($bookingdetail->product_id,'ooco_product_detail_price');
										
				$ooco_product_detail_no_bottles=getPrductMetaData($bookingdetail->product_id,'ooco_product_detail_no_bottles');
				
				$message.='<tr>
							<td style="padding:5px"><p>'.ucwords($bookingdetail->receiverName).'</p>'.printAddress($bookingdetail->refUserId,$bookingdetail->address_id,'text','p').'</td>
							<td style="padding:5px"><strong>'.$productDetails['post_title']." ".__("pack").'</strong></td>
							<td style="padding:5px">'.$bookingdetail->quantity.'</td>
							<td style="padding:5px">'.($bookingdetail->quantity) * ($ooco_product_detail_price).'</td>							
						  </tr>';
			}
		}
		if(!empty($bookingheader))
		{
			$message.='<tr class="tablefooter">
				  <td colspan="3" style="padding:5px">
				  	<div style="text-align:right"> <strong>Delivery charge (AED)</strong> &nbsp; &nbsp; &nbsp;</div>
				  	<div style="text-align:right"> <strong>TOTAL (AED)</strong> &nbsp; &nbsp; &nbsp;</div>
				  </td>
			  	  <td class="cartTotalAmt" style="padding:5px">
				  		<div style="text-align:left"><strong>'.$bookingheader[0]->delivery_charge .'</strong>	</div>
				  		<div style="text-align:left"><strong>'.$bookingheader[0]->total_price .'</strong></div>
				  </td>
			</tr>
			';
		}
				
		$message.='</table></td></tr><tr><td><p>&nbsp;</p><p>Thank you.</p><p>OOCO beauty</p></td></tr></table>';
	}
	
	//echo $message;
	
	$headers = 'From: OOCO Beauty <info@oocobeauty.com>' . "\r\n";
	
	$usermail=get_bloginfo( 'admin_email');
	
	add_filter('wp_mail_content_type',create_function('', 'return "text/html";'));
	 
	wp_mail( $usermail, 'OOCO Beauty | Order details', $message, $headers); 
}

function getDeliveryCharge($user_id,$wp_temp_cart_id)
{
	global $wpdb;
	
	$productDetails = array();

	$deliverCharge=35;

	$finalTotal=array();

	$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE refUserId = ".$user_id." AND status=1 AND refBookingId=".$wp_temp_cart_id." GROUP BY address_id";
	
	$wp_temp_cartsAdds=$wpdb->get_results( $sql );
	if(!empty($wp_temp_cartsAdds))
		{			
			foreach($wp_temp_cartsAdds as $wp_temp_cartsAdd)
			{
				$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE ( refUserId = ".$user_id." AND status=1 ) AND ( address_id=".$wp_temp_cartsAdd->address_id." AND refBookingId=".$wp_temp_cartsAdd->refBookingId." ) GROUP BY product_id";
					
				$wp_temp_carts=$wpdb->get_results( $sql );
				
				$wp_temp_quantitys=array();
				
				if($wp_temp_carts)
				{ 
					$deliverCharge=35;
					
					$orderSubTotal =0;
					
					$orderSummerySubTotal=array();
					
					//var_dump($wp_temp_carts);
					
					foreach($wp_temp_carts as $wp_temp_cart)
					{
						$quantitysql="SELECT SUM(quantity) AS quantity from ".$wpdb->prefix."temp_cart WHERE ( refUserId = ".$user_id." AND status=1 ) AND ( address_id=".$wp_temp_cartsAdd->address_id." AND refBookingId=".$wp_temp_cartsAdd->refBookingId." ) AND product_id=".$wp_temp_cart->product_id;
						
						$wp_temp_quantitys=$wpdb->get_results( $quantitysql );
						
						if(!empty($wp_temp_quantitys))
						{
							 foreach( $wp_temp_quantitys as $wp_temp_quantity)
							 {
								$productDetails = getProductById($wp_temp_quantity->product_id);
												
								$ooco_product_detail_price=getPrductMetaData($wp_temp_cart->product_id,'ooco_product_detail_price');
								
								$ooco_product_detail_no_bottles=getPrductMetaData($wp_temp_cart->product_id,'ooco_product_detail_no_bottles');
								
								$orderSubTotal = ($wp_temp_quantity->quantity) * $ooco_product_detail_price;
								
								if($ooco_product_detail_no_bottles==30)
									$deliverCharge=0;	
							 }
						}
						$orderSummerySubTotal[$wp_temp_cartsAdd->address_id][] = $orderSubTotal;
						
					}
					
					$subTotal=$deliverCharge;
								
					$finalTotal[$wp_temp_cartsAdd->address_id]=$subTotal;
				}
			}
		}
		$totalAmount=0;
		
		if(!empty($finalTotal))
			$totalAmount=array_sum($finalTotal);
		else
			$totalAmount=0;
			
		return $totalAmount;
}
function getTotalPrice($user_id,$wp_temp_cart_id)
{
	global $wpdb;
	
	$productDetails = array();

	$deliverCharge=35;

	$finalTotal=array();

	$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE refUserId = ".$user_id." AND status=1 AND refBookingId=".$wp_temp_cart_id." GROUP BY address_id";
	
	$wp_temp_cartsAdds=$wpdb->get_results( $sql );
	if(!empty($wp_temp_cartsAdds))
		{			
			foreach($wp_temp_cartsAdds as $wp_temp_cartsAdd)
			{
				$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE ( refUserId = ".$user_id." AND status=1 ) AND ( address_id=".$wp_temp_cartsAdd->address_id." AND refBookingId=".$wp_temp_cartsAdd->refBookingId." ) GROUP BY product_id";
					
				$wp_temp_carts=$wpdb->get_results( $sql );
				
				$wp_temp_quantitys=array();
				
				if($wp_temp_carts)
				{ 
					$deliverCharge=35;
					
					$orderSubTotal =0;
					
					$orderSummerySubTotal=array();
					
					//var_dump($wp_temp_carts);
					
					foreach($wp_temp_carts as $wp_temp_cart)
					{
						$quantitysql="SELECT SUM(quantity) AS quantity from ".$wpdb->prefix."temp_cart WHERE ( refUserId = ".$user_id." AND status=1 ) AND ( address_id=".$wp_temp_cartsAdd->address_id." AND refBookingId=".$wp_temp_cartsAdd->refBookingId." ) AND product_id=".$wp_temp_cart->product_id;
						
						$wp_temp_quantitys=$wpdb->get_results( $quantitysql );
						
						if(!empty($wp_temp_quantitys))
						{
							 foreach( $wp_temp_quantitys as $wp_temp_quantity)
							 {
								$productDetails = getProductById($wp_temp_quantity->product_id);
												
								$ooco_product_detail_price=getPrductMetaData($wp_temp_cart->product_id,'ooco_product_detail_price');
								
								$ooco_product_detail_no_bottles=getPrductMetaData($wp_temp_cart->product_id,'ooco_product_detail_no_bottles');
								
								$orderSubTotal = ($wp_temp_quantity->quantity) * $ooco_product_detail_price;
								
								if($ooco_product_detail_no_bottles==30)
									$deliverCharge=0;	
							 }
						}
						$orderSummerySubTotal[$wp_temp_cartsAdd->address_id][] = $orderSubTotal;
						
					}
					
					$subTotal=array_sum($orderSummerySubTotal[$wp_temp_cartsAdd->address_id]);
								
					$finalTotal[$wp_temp_cartsAdd->address_id]=$subTotal;
				}
			}
		}
		$totalAmount=0;
		
		if(!empty($finalTotal))
			$totalAmount=array_sum($finalTotal);
		else
			$totalAmount=0;
			
		return $totalAmount;
}
?>