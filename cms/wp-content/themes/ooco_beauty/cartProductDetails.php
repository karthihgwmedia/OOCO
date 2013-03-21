<?php
/*
	Template Name: OOCO Produts pop up
*/
?>
<div id="productDetailsPage">
 <div class="clsProductTle"> <?php echo __("OCÓO SHOP")?> </div>
  <div class="clsBenefitsDesc">
    <p><?php echo __("Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque habitant morid est malesuada laoreet.")?></p>
  </div>
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
  <form method="post" action="#" id="addCartProductFrm<?php echo $ooco_product->ID ?>" name="addCartProductFrm<?php echo $ooco_product->ID ?>">
    <div class="columns twelve productCon" id="addCartProduct<?php echo $ooco_product->ID ?>">
      <div class="columns six product">
        <div class="productTte">
          <?php 
                            echo $ooco_product_detail_no_bottles_text;
							//echo current_time('mysql');
                        ?>
          <input type="hidden" value="<?php echo $ooco_product->ID ?>" id="addCartProductId<?php echo $ooco_product->ID ?>" name="addCartProductId"/>
        </div>
        <div class="productDesc"><?php echo substr($ooco_product->post_content,0,30)?></div>
      </div>
      <div class="columns six productQty">
        <div class="productQtyLbl">Quantity</div>
        <div class="productQtyInput">
          <input type="text" name="orderqty" value="" id="addCartQty<?php echo $ooco_product->ID ?>" maxlength="2" class="orderQty"/>
        </div>
        <div class="AddCardMessage" id="AddCardMessage<?php echo $ooco_product->ID?>"> </div>
      </div>
      <div class="columns four addToCart" style="display:none"> <a href="#" class="addCartLink" id="addCartLink<?php echo $ooco_product->ID?>" data-title="addCartProductFrm<?php echo $ooco_product->ID ?>">Add to cart</a>
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
  <div class="proceedToCheckOut frmSubmit">
    <input type="submit" name="proceedToCheckOutSubmit" id="proceedToCheckOutSubmit" value="<?php echo __("Proceed to checkout")?>" class="boxShadow"/>
  </div>
</div>
<script type="text/javascript">

var ProductAdd=0;

jQuery(document).ready(function($){
	jQuery("#proceedToCheckOutSubmit").click(function(e){
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
				jQuery(curFormId+" .addToCart .addCartLink").trigger('click');
				
				submitedToCart++;
			}			
		})		
		//alert(submitedToCart);		
		if(submitedToCart==0)
		{
			alert("Please select atleast one quantity");
		}
		else
		{
			$("#viewCartLink").trigger("click");
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
		//alert(curdataTitle);
		
		jQuery.ajax({url:admin_url,type:"POST",data:jQuery("#"+curdataTitle).serialize()+"&action=my_front_end_action&addCartProduct=yes", async: false,				
				success:function(responce){
						responce=jQuery.parseJSON(responce);
						if(responce.errors)
						   {
								jQuery("#"+responce.errors.container).html(responce.errors.message);
								
								jQuery("#"+responce.errors.container).slideDown('fast');
						   }
						   if(responce.success)
						   {
							   jQuery("#"+responce.success.container).html(responce.success.message);
							   
							   jQuery("#"+responce.success.container).slideDown('fast');
							   
							   ProductAdd++;
							  // close_zoom_box();
						   }								
					}
	   });
	});
});
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
