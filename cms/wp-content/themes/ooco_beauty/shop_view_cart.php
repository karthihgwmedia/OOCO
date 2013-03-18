<?php
/*
	Template Name: OOCO Shop View Cart
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
		
	$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE refUserId = ".$user_id." AND status=1";
	
	//echo $sql;
		
	$wp_temp_carts=$wpdb->get_results( $sql );
	
	$productDetails = array();
	
	if(!empty($wp_temp_carts))
	{
		foreach($wp_temp_carts as $wp_temp_cart)
		{
	?>

        <div class="columns twelve productCon" id="addCartProduct<?php echo $wp_temp_cart->id ?>">
          <div class="columns four product">
            <div class="productTte">
			  <?php 
                    $productDetails = getProductById($wp_temp_cart->product_id);
					//var_dump($productDetails);
					if(!empty($productDetails))
						echo $productDetails['post_title']." ".__("pack");
              ?>              
            </div>            
            <div class="removeFromCart">
            	<a href="#" class="viewCartLink" id="viewCartLink<?php echo $wp_temp_cart->id?>" data-title="viewCartProductFrm<?php echo $wp_temp_cart->id ?>">Remove</a>
            </div>
          </div>
          <div class="columns four productQty">
            <div class="productReceiverName">
            	<label for="receiverName<?php echo $wp_temp_cart->id?>">Recipent Name</label>
            	<input type="text" name="receiverName[]" value="" id="receiverName<?php echo $wp_temp_cart->id?>">
            </div>
          </div>
          <div class="columns four selectAddress"> 
          		<select name="receiverAddress[]" id="receiverAddress<?php echo $wp_temp_cart->id?>">
                	<option value="0"><?php echo __("Select Address")?></option>
                    <?php 
						echo getUserAddressDropdown($user_id);
					?>
                </select>
                <p class="addAddress"><a href="#"><?php echo __("Add")?></a></p>
          </div>
          <div class="clear"></div>
        </div>
<?php
		}
    }
	else
	{
		echo "<p>".__("Your cart is empty")."</p>";
	}
?>
<script type="text/javascript">
jQuery(function(){ 
	jQuery(".productReceiverName label").inFieldLabels({fadeOpacity:0}); 
});
</script>
