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

<div id="OrderSummery">
  <div class="AddCardMessage" id="messageBox"> </div>
  <div class="columns twelve OrderSummeryHeader">
    <div class="columns four SummeryAddressHeader"> <?php echo __("Address")?> </div>
    <div class="columns four SummeryAddressProduct"> <?php echo __("Product")?> </div>
    <div class="columns four SummeryAddressQty"> <?php echo __("Quantity")?> </div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <div class="userForms">
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
										
										$orderSubTotal = ($wp_temp_quantity->quantity) * $ooco_product_detail_price;
										
										if($ooco_product_detail_no_bottles==30)
											$deliverCharge=0;
										
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
							$deliveryChargeText=$deliverCharge;
						else
							$deliveryChargeText=$deliverCharge.' * free shipping';
                    
                  ?>
                  <div class="SubTotal">
                  	<?php 
						$subTotal=$deliverCharge+array_sum($orderSummerySubTotal[$wp_temp_cartsAdd->address_id]);
						
						$finalTotal[$wp_temp_cartsAdd->address_id]=$subTotal;
						
						echo '<div class="orderDeliveryCharge"> 
								<p><strong>DeliverCharge </strong> : '. $deliveryChargeText.'</p>	
								<p> <strong>SUB Total</strong> : '.$subTotal.'</p>							
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
    	<strong>Total : </strong> <?php echo array_sum($finalTotal)?>
    </div>
    <div class="proceedToCheckOut frmSubmit">
      <input type="submit" name="proceedToPayment" id="proceedToPayment" value="<?php echo __("Proceed To Payment")?>" class="boxShadow"/>
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