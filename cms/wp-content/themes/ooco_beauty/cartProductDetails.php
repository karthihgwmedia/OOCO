<div id="productDetailsPage">
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
		  <div class="columns twelve productCon">
            <div class="columns four product">
            	<div class="productTte"><?php echo $ooco_product_detail_no_bottles_text?></div>
            	<div class="productDesc"><?php echo substr($ooco_product->post_content,0,30)?></div>
            </div>
            <div class="columns four productQty">
            	<div class="productQtyLbl">Quantity</div>
            	<div class="productQtyInput">
            		<input type="text" name="orderqty[]" value="1"/>
            	</div>
            </div>
            <div class="columns four addToCart"> 
            	<a href="#" class="addCartLink">Add to cart</a> <a href="#" class="preOrderLink">Pre Order</a> 
            </div>
            <div class="clear"></div>
		 </div>
<?php
	}
}
?>  
<div class="clear"></div>
</div>