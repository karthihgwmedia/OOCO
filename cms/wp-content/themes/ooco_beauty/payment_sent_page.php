<?php
/*
	Template Name: OOCO payment sent page
*/
global $wpdb;

$user_id=0;
		
$current_user = wp_get_current_user();

$user_id=$current_user->ID;

if ( $user_id == 0) {
	$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
	echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
	exit;
}

get_header();

$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];

//$reference_number=$wp_temp_cart_id;

$productPrice=getTotalPrice($user_id,$wp_temp_cart_id);

$DeliveryCharge=getDeliveryCharge($user_id,$wp_temp_cart_id);

$totalAmount=$productPrice+$DeliveryCharge;

/*var_dump($productPrice);

var_dump($DeliveryCharge);

exit;*/

$currency_code="AED";

foreach($_REQUEST as $name => $value) {
	if($name=='amount')
		$params['amount']=$totalAmount;
	else
		$params[$name] = $value;
}

$temp_cart_headerData=array(
							"products_price"=>$productPrice,
							"total_price"=>$totalAmount,
							"delivery_charge"=>$DeliveryCharge,
							"trans_post_detail"=>serialize($params),
							"trans_post_date"=>current_time('mysql'),
							"refrence_id"=>$params['transaction_uuid']
							);
							
$cart_header_where=array('id'=>$wp_temp_cart_id,"user_id"=>$user_id);

$wpdb->update( $wpdb->prefix.'temp_cart_header', $temp_cart_headerData, $cart_header_where);	

$ooco_ni_setting_mode=get_option('ooco_ni_setting_mode');

$cybersource_url='https://testsecureacceptance.cybersource.com/pay';

if($ooco_ni_setting_mode==0)
	$cybersource_url='https://secureacceptance.cybersource.com/pay';
else
	$cybersource_url='https://testsecureacceptance.cybersource.com/pay';
?>

<div class="columns twelve" style="text-align:center"> 
	<a href="#"><img src="<?php echo get_template_directory_uri(); ?>/images/main_logo.png" class="main_logo" /></a>
    <h1><?php echo __("Please wait")?></h1>
</div>
<div class="clear"></div>
<div class="columns twelve" id="threeCols">
  <div class="row">
    <div class="columns twelve">      
      <form action="<?php echo $cybersource_url?>" method="post"/>
      <?php
        foreach($params as $name => $value) {
            echo "<input type=\"hidden\" id=\"" . $name . "\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
        }

        echo "<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" . sign($params) . "\"/>\n";
    ?>
      <input type="submit" id="submit" value="Confirm" style="display:none" />
      </form>
      <script type="text/javascript">
		jQuery(document).ready(function(){
			jQuery("#submit").trigger('click');
		})
		</script>
      <div class="clear"></div>
    </div>
  </div>
  <?php
	wp_footer();
?>
  <div id="loading"></div>
  <div id="ajax"></div>
  </body>
  </html>
  <?php
/*get_header();

$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];


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
		
		$params["transaction_uid"]=uniqid();
		
		$params["signed_field_names"]="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency";
		
		$params["unsigned_field_names"]='';
		
		$params["signed_date_time"]=gmdate("Y-m-d\TH:i:s\Z");;
		
		$params["locale"]='en';
		
		$params["transaction_type"]='sale';
		
		$params["reference_number"]=uniqid().$reference_number;
		
		$params["amount"]=$amout;
		
		$params["currency"]=$currency_code;
		
		if($ooco_ni_setting_mode==0)
			$cybersource_url='https://secureacceptance.cybersource.com/pay';
		else
			$cybersource_url='https://testsecureacceptance.cybersource.com/pay';
	?>
        <form method="post" action="<?php echo $cybersource_url?>">
          <?php
	  	foreach($params as $name => $value) {
            echo "<input type=\"hidden\" id=\"" . $name . "\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
        }
        echo "<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" . sign($params) . "\"/>\n";
	  ?>
          <input type="hidden" id="submit" name="submit" value="Submit"/>
          <input type="submit" id="submit" value="Confirm"/>
        </form>
      </div>
    </div>
    <script type="text/javascript">
	jQuery(document).ready(function(){
		//jQuery("#paymentform").submit();
	})
</script>
    <div class="clear"></div>
  </div>
</div>
<?php
	wp_footer();
?>
<div id="loading"></div>
<div id="ajax"></div>
</body>
</html>
*/ 