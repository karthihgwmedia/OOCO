<?php
/*
	Template Name: OOCO payment receive page
*/
/*var_dump($_POST);
exit;*/
global $wpdb;

$user_id=0;
		
$current_user = wp_get_current_user();

$user_id=$current_user->ID;

if ( $user_id == 0) {
	$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
	echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
	exit;
}

$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];


$temp_cart_headerData=array(
							"trans_get_detail"=>serialize($_REQUEST),
							"trans_paid_date"=>current_time('mysql'),
							);
$rediredt_url=site_url();

$req_transaction_uuid=$_POST['req_transaction_uuid'];

$cart_header_where=array('id'=>$wp_temp_cart_id,"user_id"=>$user_id,'refrence_id'=>$_POST['req_transaction_uuid']);

$wp_cart_header_id=0;

if($_POST['reason_code']==100)
{
	$temp_cart_headerData['paymentStatus']=1;
	
	$temp_cart_headerData['network_id']=$_POST['transaction_id'];
	
	if(!$wpdb->update( $wpdb->prefix.'temp_cart_header', $temp_cart_headerData, $cart_header_where))
		echo "error";//.$wpdb->last_query;
	
	$cart_header_sql="INSERT INTO ".$wpdb->prefix."cart_header ( refrence_id, user_id,products_price,delivery_charge,total_price,trans_post_detail,trans_post_date,trans_get_detail,trans_paid_date,network_id,paymentStatus) SELECT refrence_id, user_id,products_price,delivery_charge,total_price,trans_post_detail,trans_post_date,trans_get_detail,trans_paid_date,network_id,paymentStatus FROM ".$wpdb->prefix."temp_cart_header WHERE id=".$wp_temp_cart_id. " AND user_id = ".$user_id." AND refrence_id = '".$req_transaction_uuid."'";
	
	//echo $cart_header_sql;
	
	$wpdb->query($cart_header_sql);
	
	$wp_cart_header_id=$wpdb->insert_id;
	
	$wpdb->query($wpdb->prepare( "DELETE FROM ".$wpdb->prefix."temp_cart_header WHERE id = %d AND refrence_id= %d ",  $wp_temp_cart_id,$req_transaction_uuid));
	
	$temp_cart_detail_query="SELECT * FROM ".$wpdb->prefix."temp_cart WHERE refBookingId = ".$wp_temp_cart_id." AND refUserId= ".$user_id;
	
	$temp_cart_details=$wpdb->get_results( $temp_cart_detail_query );
	
	$confirmCartData=array();
	
	$confirm_cart_inset_id=array();
	
	if(!empty($temp_cart_details))
	{
		foreach($temp_cart_details as $temp_cart_detail)
		{
			$confirmCartData['refBookingId']=$wp_cart_header_id;
			
			$confirmCartData['refUserId']=$temp_cart_detail->refUserId;
			
			$confirmCartData['product_id']=$temp_cart_detail->product_id;
			
			$confirmCartData['quantity']=$temp_cart_detail->quantity;
			
			$confirmCartData['price']=$temp_cart_detail->price;
			
			$confirmCartData['receiverName']=$temp_cart_detail->receiverName;	
			
			$confirmCartData['address_id']=$temp_cart_detail->address_id;
			
			$confirmCartData['status']=$temp_cart_detail->status;
			
			$confirmCartData['date_time']=current_time('mysql');
			
			$confirm_cart_inset_id[]=$wpdb->insert( $wpdb->prefix.'confirm_cart', $confirmCartData );		
			
			//echo $wpdb->last_query;
			
			$wpdb->query($wpdb->prepare( "DELETE FROM ".$wpdb->prefix."temp_cart WHERE id = %d  ",  $temp_cart_detail->id));
		}
	}
	send_parchase_info($user_id,$wp_cart_header_id);
	
	admin_parchase_info($user_id,$wp_cart_header_id);
	
	unset($_SESSION["wp_temp_cart_id"]);
	
	$rediredt_url=site_url('pay-success');
	
	wp_redirect( $rediredt_url);
}
else
{
	$temp_cart_headerData['paymentStatus']=0;
	
	$temp_cart_headerData['status']=0;
	
	$wpdb->update( $wpdb->prefix.'temp_cart_header', $temp_cart_headerData, $cart_header_where);	
	
	$temp_cart_where=array("refBookingId"=>$wp_temp_cart_id,"refUserId"=>$user_id);
	
	$temp_cart['status']=0;
	
	//$temp_cart['refUserId']=$user_id;
	
	$wpdb->update( $wpdb->prefix.'temp_cart', $temp_cart, $temp_cart_where);	
	
	unset($_SESSION["wp_temp_cart_id"]);
	
	$rediredt_url=site_url('pay-fail');
	
	wp_redirect( $rediredt_url);
}

exit;

if(isset($_POST))
	var_dump($_POST);
?>