<?php
/*
	Template Name: OOCO Shop View Cart
*/
	global $wpdb;
	
	$user_id=0;
			
	$current_user = wp_get_current_user();
	
	$user_id=$current_user->ID;
	
	$user_name=$current_user->display_name;
	
	if ( $user_id == 0) {
		$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
		echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
		exit;
	}
	$wp_temp_cart_id=0;
	
	if(isset($_SESSION["wp_temp_cart_id"]))
		$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];
		
	$sql="SELECT * from ".$wpdb->prefix."temp_cart WHERE (refUserId = ".$user_id." AND refBookingId=".$wp_temp_cart_id." ) AND status=1 ORDER BY product_id DESC";
	
	//echo $sql;
		
	$wp_temp_carts=$wpdb->get_results( $sql );
	
	$productDetails = array();
	
	if(isset($_GET["countinueOneToOneShop"]) || $_SESSION["countinueOneToOneShop"]=="yes")
	{?>
		<script type="text/javascript">
			jQuery(function($){ 	
				$("#ordersummary").trigger('click');
			})
		</script>
<?php	

		exit;
	}	
?>

<style type="text/css">
.userForms p.error
{
	left: 3px !important;    
    top: 52px!important;    
	background:#E3E8E8!important;    
}
.userForms
{
	height:100px;
}
.orderInfo
{
	 border-bottom: 1px solid #7D7D7D;
     padding: 10px 0;
}
.orderInfo p.error
{
	color:#FF0000;
}
.oderLabel {
    color: #2C2D2F;
    font-weight: bold;
    margin: 0 0 6px;
}
frmSubmit {
    margin: 7px 0;
}
</style>

<div class="viewCartCon">
  <div class="clsProductTle"><?php echo __("My Cart")?> </div>
  <div class="clsBenefitsDesc">
    <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
  </div>
  <div class="errorCon">
  </div>
  <div class="orderInfo">
  	Dear <?php echo $user_name?>, you have <?php echo count($wp_temp_carts)?> itmes in your cart.
  </div>
  <form id="saveAddressFrm" name="saveAddressFrm" method="post" action="#">
    <div class="userForms" style="height:320px; margin:10px 0 0 0;">
      <?php
	if(!empty($wp_temp_carts))
	{
		$i=1;
		
		foreach($wp_temp_carts as $wp_temp_cart)
		{
	?>
      <div class="columns twelve productCon" id="addCartProduct<?php echo $wp_temp_cart->id ?>">
        <div class="columns three product">
          <div class="oderLabel"><?php echo __("Order ").$i?></div>
          <div class="productTte">
            <?php 
					$productDetails = getProductById($wp_temp_cart->product_id);
					//var_dump($productDetails);
					if(!empty($productDetails))
						echo $productDetails['post_title']." ".__("pack");
              ?>
          </div>
          <div class="removeFromCart"> 
          <a href="#" class="removeCartLink" id="removeCartLink<?php echo $wp_temp_cart->id?>" data-title="removeCartLink<?php echo $wp_temp_cart->id ?>" title="<?php echo __("Remove")?>">
          	<?php echo __("delete order");?>
          </a> 
          </div>
        </div>
        <div class="columns four productQty">
          <div class="productReceiverName">
          	<div class="oderLabel"><?php echo __("For")?></div>
            <label for="receiverName<?php echo $wp_temp_cart->id?>">Recipent Name</label>
            <input type="text" name="receiverName<?php echo $wp_temp_cart->id?>" value="<?php echo $wp_temp_cart->receiverName?>" id="receiverName<?php echo $wp_temp_cart->id?>">
            <input type="hidden" name="cartIds[]" value="<?php echo $wp_temp_cart->id?>" />
          </div>
        </div>
        <div class="columns five selectAddress">
        <div class="oderLabel"><?php echo __("To")?></div>
          <select name="receiverAddress<?php echo $wp_temp_cart->id?>" id="receiverAddress<?php echo $wp_temp_cart->id?>">
            <option value="0"><?php echo __("Select Address")?></option>
            <?php 
                   echo getUserAddressDropdown($user_id,$wp_temp_cart->address_id);
            ?>
          </select>
          <p class="addAddress">
          	<a href="<?php echo site_url("add-address");?>"><?php echo __("add address");?></a>
          </p>
          <div class="clear"></div>
        </div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
      <?php
	  	$i++;
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
<div class="clear"></div>	
  <div class="MyaccountOptions frmSubmit">
    <input type="submit" name="OrderHistory" id="OrderHistory" value="<?php echo __("Order History")?>" class="boxShadow"/>
    &nbsp;&nbsp;&nbsp;
    <input type="submit" name="editMyAccount" id="editMyAccount" value="<?php echo __("Myaccount")?>" class="boxShadow"/>
  </div>
  <div class="clear"></div>
  <div class="MyaccountOptions frmSubmit">
    <input type="submit" name="countinueShopping" id="countinueShopping" value="<?php echo __("Continue shopping")?>" class="boxShadow"/>
  </div>
</div>
</div>
<script type="text/javascript">
jQuery(function($){ 
	jQuery(".productReceiverName label").inFieldLabels({fadeOpacity:0});
	
	jQuery("#SaveAddressSubmit").click(function(e){
		
		e.preventDefault();
		
		var countAddress=jQuery(".productCon").size();
		
		var NoError=0;
		
		if(countAddress)
		{
			var currentId='';
			
			var textValue='';			
			
			var addValue='';
			
			jQuery(".error").hide();
			
			jQuery.each(jQuery(".productCon"),function(index,value){
				
				currentId="#"+jQuery(value).attr("id");
				
				currentInt=currentId.replace("#addCartProduct","");
				
				textValue=jQuery(currentId+" input[type='text']").val().trim();
				
				addValue=jQuery(currentId+" select").val();
				
				if(textValue=="" ||  addValue==0)
				{
					if(textValue=="")
						jQuery(currentId+" input[type='text']").parent().append("<p class='error' id='textValueErr"+currentInt+"'><?php echo __("Please enter name")?></p>");
					if(addValue==0)
						jQuery(currentId+" select").parent().append("<p class='error' id='selectValueErr"+currentInt+"'><?php echo __("Please select the address")?></p>");
				}
				else
					NoError++;
				
				//if()			
			})
		}	
		/*alert(NoError);
		alert(countAddress);
		alert(NoError==countAddress);*/
		if(NoError==countAddress)
		{
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
			return true;
		}
		else
		{
			var unaddresscount=parseInt(countAddress)-parseInt(NoError);
			jQuery(".orderInfo").html("<p class='error'>you have "+unaddresscount+ " unaddressed itmes in your cart.</p>");
		}
			return false;
		//alert(countAddress);
				
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
