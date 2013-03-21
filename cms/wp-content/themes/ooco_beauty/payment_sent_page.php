<?php
/*
	Template Name: OOCO payment sent page
*/
get_header();

$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];

global $wpdb;

$user_id=0;
		
$current_user = wp_get_current_user();

$user_id=$current_user->ID;

if ( $user_id == 0) {
	$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
	
	echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
	exit;
}
$productDetails = array();

$deliverCharge=35;

$deliveryChargeText='';

$finalTotal=array();

$ooco_ni_secret_key=get_option('ooco_ni_secret_key');

$ooco_ni_access_key=get_option('ooco_ni_access_key');

$ooco_ni_profile_id=get_option('ooco_ni_profile_id');

$ooco_ni_setting_mode=get_option('ooco_ni_setting_mode');

define ('HMAC_SHA256', 'sha256');

define ('SECRET_KEY', $ooco_ni_secret_key);

$reference_number=$wp_temp_cart_id;

$amout=0;

$currency_code="AED";

$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE refUserId = ".$user_id." AND status=1 AND refBookingId=".$wp_temp_cart_id." GROUP BY address_id";
	
$wp_temp_cartsAdds=$wpdb->get_results( $sql );

?>
<div class="columns twelve"> <a href="#"><img src="<?php echo get_template_directory_uri(); ?>/images/main_logo.png" class="main_logo" /></a></div>
  <div class="clear"></div>
  <div class="columns twelve" id="threeCols">
<div class="row">
  <div class="columns twelve">
    <h1><?php echo __("Please wait")?></h1>
    <?php
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
					
					$subTotal=$deliverCharge+array_sum($orderSummerySubTotal[$wp_temp_cartsAdd->address_id]);
								
					$finalTotal[$wp_temp_cartsAdd->address_id]=$subTotal;
				}
			}
		}
		if(!empty($finalTotal))
			$amout=array_sum($finalTotal);
		else
			$amout=0;
		
		$params=array();
		
		foreach($_REQUEST as $name => $value) {
        	$params[$name] = $value;
    	}
		
		$params["access_key"]=$ooco_ni_access_key;
		
		$params["profile_id"]=$ooco_ni_profile_id;
		
		$params["transaction_uuid"]=$user_id;
		
		$params["signed_field_names"]="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency";
		
		$params["unsigned_field_names"]='';
		
		$params["signed_date_time"]=gmdate("Y-m-d\TH:i:s\Z");;
		
		$params["locale"]='en';
		
		$params["transaction_type"]='authorization';
		
		$params["reference_number"]=$reference_number;
		
		$params["amount"]=$amout."0.0";
		
		$params["currency"]=$currency_code;
		
	?>
    
    <form method="post" name="paymentform" id="paymentform" action="https://testsecureacceptance.cybersource.com/pay">
      <?php
	  	foreach($params as $name => $value) {
            echo "<input type=\"hidden\" id=\"" . $name . "\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
        }
        echo "<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" . sign($params) . "\"/>\n";
	  ?>
      <input type="submit" id="submit" value="Confirm"/>
    </form>
  </div>
</div>
<script type="text/javascript">
	jQuery(document).ready(function(){
		//jQuery("#paymentform").submit();
	})
</script>
<?php get_footer(); ?>
