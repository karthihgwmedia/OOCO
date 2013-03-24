<?php
/*
	Template Name: OOCO Order Summery
*/
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
	
$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE refUserId = ".$user_id." AND status=1 AND refBookingId=".$wp_temp_cart_id." GROUP BY address_id";

//echo $sql;
	
$wp_temp_cartsAdds=$wpdb->get_results( $sql );

$productDetails = array();

$deliverCharge=35;

$deliveryChargeText='';

$finalTotal=array();
	
?>
<style type="text/css">
	.orderDeliveryCharge
	{
		margin-top: 20px;
	}	
	.clsSubTotal
	{
		margin-top: 10px;
	}
	.orderFinalTotal
	{
		border-bottom: 1px solid;
		border-top: 1px solid;
		font-size: 18px;
		padding: 10px 0;
		text-align: right;
	}
</style>
<div id="OrderSummery">
  <div class="AddCardMessage" id="messageBox"> </div>
  <div class="columns twelve OrderSummeryHeader">
    <div class="columns four SummeryAddressHeader"> <?php echo __("Address")?> </div>
    <div class="columns four SummeryAddressProduct"> <?php echo __("Product")?> </div>
    <div class="columns four SummeryAddressQty"> <?php echo __("Quantity")?> </div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <div class="userForms" style="height:400px;">
    <?php
	if(!empty($wp_temp_cartsAdds))
	{
		$recipientName=array();
		
		foreach($wp_temp_cartsAdds as $wp_temp_cartsAdd)
		{
			$wp_temp_carts=array();
			
			$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE ( refUserId = ".$user_id." AND status=1 ) AND ( address_id=".$wp_temp_cartsAdd->address_id." AND refBookingId=".$wp_temp_cartsAdd->refBookingId." ) ";
			//echo $sql;
			$wp_temp_carts=$wpdb->get_results( $sql );
	?>
    		<div class="columns twelve OrderSummeryCon" id="OrderSummeryCon<?php echo $wp_temp_cart->id ?>">
              <div class="columns four OrderSummeryAddress">
				  <?php
				  	//echo "loop : 1";
					
                     if(!empty($wp_temp_carts))
                     {	
					 	$recipientNames=array();
										 	
					 	 foreach( $wp_temp_carts as $wp_temp_cart)
                         {
						 	//var_dump($recipientNames);
							$recipientNames[] = ucwords($wp_temp_cart->receiverName);
                         }
                     }
					$recipientNames = array_unique($recipientNames);
					 
					 if(!empty($recipientNames))
					 {
					 	foreach($recipientNames as $recipientName)
						{
					 		echo '<div class="recipientName">'.$recipientName.',</div>';												
						}
					 }
                  ?>
                  <div class="recipientAddress">
                      <?php 
                             echo printAddress($wp_temp_cartsAdd->refUserId,$wp_temp_cartsAdd->address_id);
                       ?>
                  </div>
              </div>
              <div class="columns four OrderSummeryProduct">
				<?php
					$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE ( refUserId = ".$user_id." AND status=1 ) AND ( address_id=".$wp_temp_cartsAdd->address_id." AND refBookingId=".$wp_temp_cartsAdd->refBookingId." ) GROUP BY product_id";
			
					$wp_temp_carts=$wpdb->get_results( $sql );
					
					$wp_temp_quantitys=array();
					
                    if($wp_temp_carts)
                    { 
						foreach($wp_temp_carts as $wp_temp_cart)
						{
							$productDetails = getProductById($wp_temp_cart->product_id);
							
							if(!empty($productDetails))
								echo '<div class="OrderSummeryProductDetails">'.$productDetails['post_title']." ".__("pack")."</div>";
						}
                    }
                ?>
              </div>
              <div class="columns four OrderSummeryQty"> 
              	<?php
					  if($wp_temp_carts)
						{ 
							$deliverCharge=35;
							
							$globalDeliveryCharge=35;
							
							$orderSubTotal =0;
							
							$orderSummerySubTotal=array();
							
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
										
										$ooco_product_delivery_limit=getPrductMetaData($wp_temp_cart->product_id,'ooco_product_delivery_limit');
										
										$orderSubTotal = ($wp_temp_quantity->quantity) * $ooco_product_detail_price;
										
										if($ooco_product_delivery_limit==0)
											$deliverCharge=0;
										else
										{
											if($wp_temp_quantity->quantity > $ooco_product_delivery_limit)
												$deliverCharge=ceil($wp_temp_quantity->quantity/$ooco_product_delivery_limit)*$globalDeliveryCharge;
											else
												$deliverCharge=$globalDeliveryCharge;
											
										}
										//$productDetails	
										
										echo '<div class="OrderQuantity"><span>'.ucwords($wp_temp_quantity->quantity).'</span>
												  <span class="OrderQuantity">x</span>
												  <span class="productPrice">'.$ooco_product_detail_price.'</span>
												  <span class="OrderTotalPrice">  = '. $orderSubTotal.'</span>
											 </div>';											
									 }									
								}
								 $orderSummerySubTotal[$wp_temp_cartsAdd->address_id][] = $orderSubTotal;
								//$orderSummerySubTotal[$wp_temp_cartsAdd->address_id] = $orderSubTotal;
							}
						}
						if($deliverCharge)	
						{ 
							$deliveryChargeText=$deliverCharge;
						}
						else
							$deliveryChargeText=$deliverCharge.' * free shipping';
                    
                  ?>
                  <div class="SubTotal">
                  	<?php 
						$subTotal=$deliverCharge+array_sum($orderSummerySubTotal[$wp_temp_cartsAdd->address_id]);
						
						$finalTotal[$wp_temp_cartsAdd->address_id]=$subTotal;
						
						echo '<div class="orderDeliveryCharge"> 
								<p><strong>DeliverCharge </strong> : '. $deliveryChargeText.'</p>	
								<p class="clsSubTotal"> <strong>SUB Total  : '.$subTotal.' ( AED ) </strong></p>							
							 </div>';
						//$deliveryChargeText;
					?>                  	
                  </div>
            </div>
              <div class="clear"></div>
            </div>
    <?php
		}
	  ?>
    </div>
    <div class="orderFinalTotal">
    	<strong>Total ( AED ) : </strong> <?php echo array_sum($finalTotal)?>
    </div>
    <div class="proceedToCheckOut frmSubmit">
      <?php
	  	$ooco_ni_secret_key=get_option('ooco_ni_secret_key');

		$ooco_ni_access_key=get_option('ooco_ni_access_key');

		$ooco_ni_profile_id=get_option('ooco_ni_profile_id');

		
	  ?>
      <form action="<?php echo site_url('payment-sent-page')?>" method="post">
      	   <input type="hidden" name="access_key" value="<?php echo $ooco_ni_access_key?>">
            <input type="hidden" name="profile_id" value="<?php echo $ooco_ni_profile_id?>">
            <input type="hidden" name="transaction_uuid" value="<?php echo uniqid() ?>">
            <input type="hidden" name="signed_field_names"
                   value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency">
            <input type="hidden" name="unsigned_field_names">
            <input type="hidden" name="signed_date_time" value="<?php echo gmdate("Y-m-d\TH:i:s\Z"); ?>">
            <input type="hidden" name="locale" value="en">
            <input type="hidden" name="transaction_type" size="25" value="authorization">
            <input type="hidden" name="reference_number" size="25" value="<?php echo $wp_temp_cart_id?>">            
            <input type="hidden" name="amount" size="25" value="<?php echo array_sum($finalTotal);?>">
            <input type="hidden" name="currency" size="25" value="AED">
	      <input type="submit" name="proceedToPayment" id="proceedToPayment" value="<?php echo __("Proceed To Payment")?>" class="boxShadow"/>
      </form>
      <input type="submit" name="EditCartSummery" id="EditCartSummery" value="<?php echo __("Edit Cart")?>" class="boxShadow"/>
    </div>
    <?php
  	}
  ?>  
</div>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#EditCartSummery").click(function(){
		jQuery("#confirmAddress").trigger("click");
	})
	jQuery("#proceedToPayment").click(function(){
		window.location='<?php echo site_url('payment-sent-page')?>';
	})
})
	
</script>