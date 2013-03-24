<?php
/*
	Template Name: OOCO Produts pop up
*/
if(isset($_GET["countinueOneToOneShop"]))
{
	$_SESSION["countinueOneToOneShop"]="yes";
}
else
{
	$_SESSION["countinueOneToOneShop"]="no";
}
?>
<div id="productDetailsPage">
  <div class="clsProductTle"> <?php echo __("OCÓO SHOP")?> </div>
  <div class="clsBenefitsDesc">
    <p><?php echo __("Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque habitant morid est malesuada laoreet.")?></p>
  </div>
  <div class="AddCardMessage" id="messageBox"> </div>
  <div class="productDetailsFrms" style="height:415px;">
	<?php
    $product_filter_id=0;
    
    $ooco_product_args = array(
        'orderby'         => 'ooco_product_detail_qty',
        'order'           => 'DESC',
        'post_type'       => 'ooco_product',
        'post_status'     => 'publish',
        'numberposts'    => -1, 
    );
    if(isset($_SESSION["session_product_id"]))
    {
        $product_filter_id=$_SESSION["session_product_id"];
        
        if($product_filter_id)
        {
            $ooco_product_args["include"]=$product_filter_id;
            
            $ooco_product_args["numberposts"]=1;
        }
    }
    
    //var_dump($ooco_product_args);
    
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
            
            $ooco_product_delivery_limit = get_post_meta( $ooco_product->ID, 'ooco_product_delivery_limit', true );
            
            if($ooco_product_detail_no_bottles>1)
                $ooco_product_detail_no_bottles_text=$ooco_product_detail_no_bottles ." ".__('BOTTLE PACK');
            else
                $ooco_product_detail_no_bottles_text=__('SINGLE BOTTLE');
            ?>
              <form method="post" action="#" id="addCartProductFrm<?php echo $ooco_product->ID ?>" name="addCartProductFrm<?php echo $ooco_product->ID ?>">
                <div class="columns twelve productCon" id="addCartProduct<?php echo $ooco_product->ID ?>">
                  <div class="columns four product">
                    <div class="productTte">
                      <?php 
                         echo $ooco_product_detail_no_bottles_text;
                        //echo current_time('mysql');
                      ?>
                    </div>
                    <div class="productDesc">
                        <?php echo substr($ooco_product->post_content,0,30)?>
                        <input type="hidden" value="<?php echo $ooco_product->ID ?>" id="addCartProductId<?php echo $ooco_product->ID ?>" name="addCartProductId"/>
                    </div>
                  </div>
                  <div class="columns two productPrice">
                    <div class="productPriceLbl" id="productPriceLbl<?php echo $ooco_product->ID?>" data-price="<?php echo $ooco_product_detail_price?>">&nbsp;</div>
                    <div class="productPriceTxt"><?php echo $ooco_product_detail_price?></div>
                  </div>
                  <div class="columns three productQty">
                    <div class="productQtyLbl">Quantity</div>
                    <div class="productQtyInput">
                      <input type="text" name="orderqty" value="" id="addCartQty<?php echo $ooco_product->ID ?>" maxlength="2" class="orderQty" data-limit="<?php echo $ooco_product_delivery_limit?>"/>
                    </div>
                    <div class="AddCardMessage" id="AddCardMessage<?php echo $ooco_product->ID?>"> </div>
                  </div>
                  <div class="columns three addToCart"> 
                    <a href="#" class="addCartLink" id="addCartLink<?php echo $ooco_product->ID?>" data-title="addCartProductFrm<?php echo $ooco_product->ID ?>" style="display:none"><?php __("Add to cart")?></a>
                    <div class="calcLbl" id="calcLbl<?php echo $ooco_product->ID?>">
                    	<?php echo __("Quantity must be number and not equal to zero")?>
                    </div>
                    <div class="calcDeliveryCharge">        	
                    </div>
                    <?php /*?><a href="#" class="preOrderLink">Pre Order</a> <?php */?>
                  </div>
                  <div class="clear"></div>
                </div>
              </form>
          <?php
        }
    }
    ?>
      <div class="clear"></div>
  </div>
  <div class="proceedToCheckOut frmSubmit">
    <input type="submit" name="goBack" id="goBack" value="<?php echo __("Go back")?>" class="boxShadow"/>
    &nbsp;&nbsp;&nbsp;
    
    <input type="submit" name="proceedToCheckOutSubmit" id="proceedToCheckOutSubmit" value="<?php echo __("Proceed to checkout")?>" class="boxShadow"/>
	<img src="<?php echo get_template_directory_uri(); ?>/images/ajax-loader.gif" class="loadingOnClick" />
  </div>
</div>
<script type="text/javascript">

var ProductAdd=0;

var globalDeliveryCharge=35;

var countinueOneToOneShop=false;
<?php
	if(isset($_GET["countinueOneToOneShop"]) || $_SESSION["countinueOneToOneShop"]=="yes")
		echo 'countinueOneToOneShop=true;';
	else
		echo 'countinueOneToOneShop=false;';
?>
jQuery(document).ready(function($){
jQuery(".loadingOnClick").hide();
	jQuery(".orderQty").keyup(function(){
		
		var deliveryChargeTxt='';
				
		var orderQtyId=jQuery(this).attr("id");
		
		orderQtyId=orderQtyId.replace("addCartQty","");
		
		var orderQty=parseInt(jQuery(this).val());	
		
		var orderQtylimit=parseInt(jQuery(this).attr("data-limit"));	
		//alert(orderQty);	
		
		if(isInt(orderQty) && orderQty!=0)
		{
			var productPrice=parseInt(orderQty) * parseInt($("#productPriceLbl"+orderQtyId).attr("data-price"));
			
			if(orderQtylimit!=0)
			{		
				if(orderQty>orderQtylimit)
				{
					deliveryChargeTxt=Math.ceil(parseInt(orderQty)/parseInt(orderQtylimit))*parseInt(globalDeliveryCharge);
					
					deliveryChargeTxt=" <?php echo __("plus")?> "+deliveryChargeTxt+" <?php echo __(" for delivery charge.")?>";
				}
				else
				{
					deliveryChargeTxt=" <?php echo __("plus")?> "+globalDeliveryCharge+deliveryChargeTxt+" <?php echo __(" for delivery charge.")?>";
				}						
			}
			else
			{
				deliveryChargeTxt="<?php echo __("* Delivery charge free")?>";
			}
			
			$("#calcLbl"+orderQtyId).html(productPrice+" "+deliveryChargeTxt);
		}
		else
			$("#calcLbl"+orderQtyId).html("Quantity must be number and not equal to zero");
		
	})
	jQuery("#goBack").click(function(e){
		$("#myaccountLink").trigger('click');
	})
	
	
		
	jQuery("#proceedToCheckOutSubmit").click(function(e){
		hidecheckoutBtn();
		e.preventDefault();		
		
		var countProduct=jQuery("#productDetailsPage form").size();
		
		var orderQty=0;
				
		var submitedToCart=0;
		
		jQuery.each(jQuery("#productDetailsPage form"),function(index,value){
			var curFormId="#"+$(value).attr("id");
			
			orderQty = jQuery(curFormId+" .orderQty").val();
			//alert(orderQty);
			if(orderQty!="")
			{
				//jQuery(curFormId+" .addToCart .addCartLink").trigger('click');
				
				submitedToCart++;
			}			
		})		
		//alert(submitedToCart);		
		if(submitedToCart==0)
		{
			alert("Please select atleast one quantity");
			jQuery("#proceedToCheckOutSubmit").show();
			jQuery(".loadingOnClick").hide();
		}
		else
		{
			jQuery.ajax({url:admin_url,type:"POST",data:"action=my_front_end_action&checkOrder=yes", async: false,				
					success:function(responce){
						responce=jQuery.parseJSON(responce);
						if(responce.error)
						   {
								var confirmDel=confirm(responce.error.message);
								
								if(confirmDel)
								{
									jQuery.ajax({url:admin_url,type:"POST",data:"action=my_front_end_action&old_cart_Del=yes", async: false,				
										success:function(confirmresponce){
												if(confirmresponce.success)
												{
													alert(confirmresponce.success.message);	
												}
											}
										})
										
								}
								else
									return false;
						   }
						   if(responce.success)
						   {
							   return true;
							  // close_zoom_box();
						   }								
					}
	   		});
			
	   		jQuery.each(jQuery("#productDetailsPage form"),function(index,value){
			var curFormId="#"+$(value).attr("id");
			
			orderQty = jQuery(curFormId+" .orderQty").val();
			//alert(orderQty);
				if(orderQty!="")
				{
					jQuery(curFormId+" .addToCart .addCartLink").trigger('click');
				}			
			})
			
			setTimeout(timeOutcallback,1000);
		}
		//jQuery(".addToCart .addCartLink").trigger('click');		
	});
	
	jQuery(".addCartLink").click(function(){
	
		var $this = jQuery(this);
		
		jQuery(".AddCardMessage").slideUp('fast',function(){	
			jQuery(this).hide();
		});
		
		var curdataTitle=$this.attr("data-title");	
		
		var productId=curdataTitle.replace("addCartProductFrm","");
		
		var addCartQty=jQuery("#addCartQty"+productId).val();
		
		if(addCartQty=="")
		{	
			ProductAdd--;
			
			return false;				
		}
		
		
		jQuery("#calcLbl"+productId).html('<img src="<?php echo get_template_directory_uri(); ?>/images/ajax-loader.gif" />');
		
		//alert(curdataTitle);
		
		jQuery.ajax({url:admin_url,type:"POST",data:jQuery("#"+curdataTitle).serialize()+"&action=my_front_end_action&addCartProduct=yes&countinueOneToOneShop="+countinueOneToOneShop, async: false,				
				success:function(responce){
						responce=jQuery.parseJSON(responce);
						if(responce.errors)
						   {
								//69
								var productTitle=jQuery("#addCartProduct"+responce.errors.addCartProductId+" .productTte").html().trim();
								
								if(responce.errors.availability)
								{
									var confimqty=confirm(responce.errors.message+" for "+productTitle+" you want to countinue with this quantity ?");
									
									if(confimqty)
									{
										jQuery("#addCartQty"+productId).val(responce.errors.availability);
										
										jQuery("#"+curdataTitle+" .addToCart .addCartLink").trigger('click');
									}
									else
									{
										jQuery("#calcLbl"+productId).html('This product not added in your cart');
									}
								}
								else
								{
									alert("Sorry! Out of stock for "+productTitle);
									
									jQuery("#calcLbl"+productId).html('This product not added in your cart');
								}
								
						   		
								
								/*jQuery("#"+responce.errors.container).html(responce.errors.message);
								
								jQuery("#"+responce.errors.container).slideDown('fast');*/
						   }
						   if(responce.success)
						   {
							  // jQuery("#"+responce.success.container).html(responce.success.message);
							   
							   //jQuery("#"+responce.success.container).slideDown('fast');
							   
							   jQuery("#calcLbl"+productId).html(responce.success.message);
							   
							   ProductAdd++;
							  // close_zoom_box();
						   }								
					}
	   });
	});
});
function hidecheckoutBtn()
{
	jQuery("#proceedToCheckOutSubmit").hide();
	
	jQuery(".loadingOnClick").show();
	
}
function timeOutcallback()
{
	jQuery("#proceedToCheckOutSubmit").show();
	jQuery(".loadingOnClick").hide();
	//alert(countinueOneToOneShop);
	if(countinueOneToOneShop)
		jQuery("#ordersummary").trigger("click");
	else
		jQuery("#viewCartLink").trigger("click");
}

function addCartLink(){

	var $this = jQuery(this);	
	
	//$this.unbind('click');
		
	/*if(event.handled !== true)
	{*/
	
		jQuery(".AddCardMessage").slideUp('fast',function(){	
			jQuery(this).hide();
		});
		
		var curdataTitle=$this.attr("data-title");
		
		jQuery.ajax({url:admin_url,type:"POST",data:jQuery("#"+curdataTitle).serialize()+"&action=my_front_end_action&addCartProduct=yes", async: true,				
				success:function(responce){
						responce=jQuery.parseJSON(responce);
						if(responce.errors)
						   {
								jQuery("#"+responce.errors.container).html(responce.errors.message);
								
								jQuery("#"+responce.errors.container).slideDown('fast');
						   }
						   /*if(responce.success)
						   {
							   jQuery("#"+responce.success.container).html(responce.success.message);
							   
							   jQuery("#"+responce.success.container).slideDown('fast');
							  // close_zoom_box();
						   }	*/							
					}
	   });
	  /* event.handled = true;
   }*/
    return false;
}
</script>
