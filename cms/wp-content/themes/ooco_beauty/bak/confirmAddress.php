<?php
/*
	Template Name: OOCO Confirm Address
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
	//echo $sql;
		
	$wp_temp_carts=array();
	
?>
<div id="productDetailsPage">
  <div class="AddCardMessage" id="messageBox"> </div>
<?php

$ooco_product_args = array(
	'orderby'         => 'ooco_product_detail_qty',
	'order'           => 'ASC',
	'post_type'       => 'ooco_product',
	'post_status'     => 'publish',
	'numberposts'    => -1, 
);

$ooco_products = get_posts( $ooco_product_args );	

if(!empty($ooco_products[0]))
{
	$no_of_bottles=0;
	
	$product_image=0;
	
	$ooco_product_detail_price = '';

	$ooco_product_detail_qty = '';
	
	$ooco_product_detail_no_bottles = '';

	$ooco_product_detail_no_bottles_text='';
	
	foreach($ooco_products as  $ooco_product)
	{
	
		$ooco_product_detail_price = get_post_meta( $ooco_product->ID, 'ooco_product_detail_price', true );

		$ooco_product_detail_qty = get_post_meta( $ooco_product->ID, 'ooco_product_detail_qty', true );	
		
		$ooco_product_detail_no_bottles = get_post_meta( $ooco_product->ID, 'ooco_product_detail_no_bottles', true );
		
		if($ooco_product_detail_no_bottles>1)
			$ooco_product_detail_no_bottles_text=$ooco_product_detail_no_bottles ." ".__('BOTTLE PACK');
		else
			$ooco_product_detail_no_bottles_text=__('SINGLE BOTTLE');
		?>
  <form method="post" action="#" id="confirmAddressFrm<?php echo $ooco_product->ID ?>" name="confirmAddressFrm<?php echo $ooco_product->ID ?>">
    <div class="columns twelve productCon" id="addCartProduct<?php echo $ooco_product->ID ?>">
      <div class="columns six product">
        <div class="productTte">
          <?php 
            	echo $ooco_product_detail_no_bottles_text;			
          ?>
          <input type="hidden" value="<?php echo $ooco_product->ID ?>" id="addCartProductId<?php echo $ooco_product->ID ?>" name="addCartProductId"/>
        </div>        
      </div>
      <div class="columns six productQty">
        <div class="productQtyLbl">Quantity</div>
        <div class="productQtyInput">
          <input type="text" name="orderqty" value="" id="addCartQty<?php echo $ooco_product->ID ?>" maxlength="2" class="orderQty" readonly="readonly"/>
        </div>
        <div class="AddCardMessage" id="AddCardMessage<?php echo $ooco_product->ID?>"> </div>
      </div>      
      <div class="clear"></div>
      <div class="productBookedByUser">
      <?php
	  	  $sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE (refUserId = ".$user_id." AND status=1 ) AND (checkedout=1 AND product_id=".$ooco_product->ID.")";
		  
		  $wp_temp_carts = $wpdb->get_results( $sql );
		  
		  if(!empty($wp_temp_carts))	
		  {
			  foreach($wp_temp_carts as $wp_temp_cart)
			  {
		  ?>      
				<div class="columns twelve productBookedUser" id="productBookedByUser<?php echo $ooco_product->ID ?>">
                	<div class="columns two">
                    	&nbsp;
                    </div>
					<div class="columns two clsBookedQty">
						<?php
							echo $wp_temp_cart->quantity;
						?>
					</div>
					<div class="columns four clsBookedDeliverName">
						<?php
							echo $wp_temp_cart->receiverName;
						?>
					</div>
					<div class="columns four clsBookedDeliverAddress">
						<?php
							$userAddress=getUserAddressDropdown($wp_temp_cart->refUserId,$wp_temp_cart->address_id,'p');
							if(!empty($userAddress))
							{
								foreach($userAddress as $Address)
								{
									echo "<p>".$Address."</p>";
								}
								
							}
								//echo implode("<br />",$userAddress);
                        	
						?>
					</div>
				</div>
                <div class="clear"></div>
	  <?php
			  }
		  }
	  ?>
      </div>
    </div>
  </form>
  <?php
	}
}
?>
  <div class="clear"></div>
  <div class="proceedToCheckOut frmSubmit">
    <input type="submit" name="proceedToFinalCheckOutSubmit" id="proceedToFinalCheckOutSubmit" value="<?php echo __("Proceed to checkout")?>" class="boxShadow"/>
    <input type="submit" name="EditCartSubmit" id="EditCartSubmit" value="<?php echo __("Edit Cart")?>" class="boxShadow"/>
  </div>
</div>
