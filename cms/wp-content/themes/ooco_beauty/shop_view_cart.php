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
?>

<div class="viewCartCon">
  <div class="errorCon"></div>
    <form id="saveAddressFrm" name="saveAddressFrm" method="post" action="#">
    <div class="userForms">
      <?php
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
          <div class="removeFromCart"> <a href="#" class="removeCartLink" id="removeCartLink<?php echo $wp_temp_cart->id?>" data-title="removeCartLink<?php echo $wp_temp_cart->id ?>" title="<?php echo __("Remove")?>"></a> </div>
        </div>
        <div class="columns four productQty">
          <div class="productReceiverName">
            <label for="receiverName<?php echo $wp_temp_cart->id?>">Recipent Name</label>
            <input type="text" name="receiverName<?php echo $wp_temp_cart->id?>" value="<?php echo $wp_temp_cart->receiverName?>" id="receiverName<?php echo $wp_temp_cart->id?>">
            <input type="hidden" name="cartIds[]" value="<?php echo $wp_temp_cart->id?>" />
          </div>
        </div>
        <div class="columns four selectAddress">
          <select name="receiverAddress<?php echo $wp_temp_cart->id?>" id="receiverAddress<?php echo $wp_temp_cart->id?>">
            <option value="0"><?php echo __("Select Address")?></option>
            <?php 
                                echo getUserAddressDropdown($user_id,$wp_temp_cart->address_id);
                            ?>
          </select>
          <p class="addAddress"><a href="<?php echo site_url("add-address");?>"><?php echo __("Add")?></a></p>
        </div>
        <div class="clear"></div>
      </div>
      <?php
		}
?>
	</div>	
      <div class="proceedToCheckOut frmSubmit">
        <input type="submit" name="SaveAddressSubmit" id="SaveAddressSubmit" value="<?php echo __("Confirm")?>" class="boxShadow"/>
      </div>
    </form>
    <?php
    }
	else
	{
		echo "<p>".__("Your cart is empty")."</p>";
	}
?> 
</div>
<script type="text/javascript">
jQuery(function(){ 
	jQuery(".productReceiverName label").inFieldLabels({fadeOpacity:0});
	
	jQuery("#SaveAddressSubmit").click(function(e){
		e.preventDefault();
		jQuery.ajax({url:admin_url,type:"POST",data:jQuery("#saveAddressFrm").serialize()+"&action=my_front_end_action&saveAddressCart=yes",success:function(responce){
				responce=jQuery.parseJSON(responce);			
				if(responce.errors)
				{
					jQuery(".errorCon").addClass("error");
				
					jQuery(".errorCon").html(responce.errors.message);
				}
				if(responce.success)
				{
					jQuery("#confirmAddress").trigger("click");
				}
				
			}
		})		
	})
	jQuery(".removeCartLink").click(function(e){
		e.preventDefault();
		
		jQuery(".errorCon").html('');	   
		
		jQuery(".errorCon").removeClass("error");			 
		
		jQuery(".errorCon").removeClass("success");
		
		var curDelLink=jQuery(this).attr("data-title");
		var curDelLinkId=curDelLink.replace("removeCartLink","");
		var confirmDelete=confirm("Are you Sure delete this item from your cart?");		
		if(confirmDelete)
		{
			jQuery.ajax({url:admin_url,type:"POST",data:"curDelLinkId="+curDelLinkId+"&action=my_front_end_action&deleteFromCart=yes",success:function(responce){
					responce=jQuery.parseJSON(responce);					
					 	if(responce.errors)
					   {
							jQuery(".errorCon").addClass("error");
		
							jQuery(".errorCon").html(responce.errors.message);
					   }
					   if(responce.error)
					   {
							jQuery(".errorCon").addClass("error");
		
							jQuery(".errorCon").html(responce.error.message);
					   }
					   if(responce.success)
					   {
					   		jQuery(".errorCon").addClass("success");
		
							jQuery(".errorCon").html(responce.success.message);
							
					   		jQuery("#addCartProduct"+responce.success.Containerid).fadeOut('slow',function(){
								jQuery(this).remove();
							})
					   }
								   
				}
			})
			
			//alert("ok");
		}
	})
	jQuery(".addAddress a").click(function(e){
		e.preventDefault();	
		jQuery("#ajax .userMangeAddress").remove();
		jQuery("#ajax").append("<div class='userMangeAddress'></div>");
		
		jQuery("#ajax .userMangeAddress").load(jQuery(this).attr("href"),function(response, status, xhr){
			if (status == "error") {
														
			}
			else
			{
				//formScorllApplied=false;	
				//setTimeout('showShopFrm()',1000);
			}
		})
	})
});
</script>
