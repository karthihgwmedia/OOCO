<?php
/*
 * Plugin Name: OOCO Products.
 * Plugin URI: http://www.hgwmedia.com
 * Description: This plugin is managing the Products of OOCO. 
 * Author: hgwmedia
 * Author URI: http://www.hgwmedia.com
 */
 
// Register a custom post type - ooco_product 

function ooco_product_install(){
	$labels = array(
		'name' => _x( 'Products', 'post type general name' ),
		'singular_name' => _x( 'Products', 'post type singular name' ),
		'add_new' => _x( 'Add New', 'OOCO_product' ),
		'add_new_item' => __( 'Add New Product' ),
		'edit_item' => __( 'Edit Product' ),
		'new_item' => __( 'New Product'),
		'all_items' => __( 'All Products' ),
		'view_item' => __( 'View Product' ),
		'search_items' => __( 'Search Products' ),
		'not_found' =>  __( 'No products found' ),
		'not_found_in_trash' => __( 'No ooco_product found in Trash' ), 
		'parent_item_colon' => '',
		'menu_name' => 'Products'
	
	);
	$args = array(
		'labels' => $labels,
		'public' => true,
		'publicly_queryable' => true,
		'show_ui' => true, 
		'show_in_menu' => true, 
		'query_var' => true,
		'rewrite' => array( 'slug' => 'ooco_product','with_front' => FALSE),
		'capability_type' => 'post',
		'has_archive' => true, 
		'hierarchical' => false,
		'menu_position' => null,
		'supports' => array( 'title', 'editor','thumbnail')
	); 
	register_post_type( 'ooco_product', $args );
}
add_action( 'init', 'ooco_product_install' );

// Add what we did meta box
add_action( 'admin_init', 'ooco_product_attribute_metabox' );
function ooco_product_attribute_metabox(){
	
	add_meta_box( 'ooco_product_attribut_metabox', __( 'Product Details' ), 'ooco_product_details_input', 'ooco_product' ); 		
	
}
function ooco_product_details_input(){

	global $post;
	
	$ooco_product_detail_price = get_post_meta( $post->ID, 'ooco_product_detail_price', true );
	
	$ooco_product_detail_qty = get_post_meta( $post->ID, 'ooco_product_detail_qty', true );	
	
	$ooco_product_detail_no_bottles = get_post_meta( $post->ID, 'ooco_product_detail_no_bottles', true );
	
	echo '<div class="frmFields">
			<div class="clsFloatLeft label"><strong>Quantity : </strong></div>
			<div class="clsFloatLeft clsFrmInput">
				<input type="text" name="ooco_product_detail_qty" id="ooco_product_detail_qty" value="'.$ooco_product_detail_qty.'" />
			</div>
			<div class="clear"></div>
		  </div>';
		  
	echo '<div class="frmFields">
		  	<div class="clsFloatLeft label"><strong>Price of the product : </strong> </div>
		  	<div class="clsFloatLeft clsFrmInput"><input type="text" name="ooco_product_detail_price" id="ooco_product_detail_price" value="'.$ooco_product_detail_price.'" /></div>
			<div class="clear"></div>
		  </div>';
		  
	echo '<div class="frmFields">
			<div class="clsFloatLeft label"><strong>No of Bottles : </strong></div>
			<div class="clsFloatLeft clsFrmInput">
				<input type="text" name="ooco_product_detail_no_bottles" id="ooco_product_detail_no_bottles" value="'.$ooco_product_detail_no_bottles.'" />
			</div>
			<div class="clear"></div>
		  </div>
		  <style type="text/css">
			  	.frmFields
				{
					margin:10px 0;
				}
				.frmFields .label
				{
					width:150px;
					margin:5px 0 0 0;
				}
				.clsFloatLeft
				{
					float:left;
				}
				.clsFrmInput input[type="text"]
				{
					width:250px;
					height:30px;
				}
				.clear
				{
					clear:both;
				}
			  </style>';
}


// Save the custom meta data
function ooco_product_save_meta( $post_id ){

	//exit('call');
	
  /*if(!wp_verify_nonce($_POST['wp_custom_attachment_nonce'], plugin_basename(__FILE__))) {  
      return $post_id;  
    } // end if  */
		 
  if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) 
      return;

  if ( 'page' == $_POST['post_type'] ) {
    if ( !current_user_can( 'edit_page', $post_id ) )
        return;
  }else{
    if ( !current_user_can( 'edit_post', $post_id ) )
        return;
  }
  
  $ooco_product_detail_qty = $_POST['ooco_product_detail_qty'];
  
  update_post_meta( $post_id, 'ooco_product_detail_qty', $ooco_product_detail_qty );
  
  $ooco_product_detail_price = $_POST['ooco_product_detail_price'];
  
  update_post_meta( $post_id, 'ooco_product_detail_price', $ooco_product_detail_price );
  
  $ooco_product_detail_no_bottles = $_POST['ooco_product_detail_no_bottles'];
  
  update_post_meta( $post_id, 'ooco_product_detail_no_bottles', $ooco_product_detail_no_bottles );
    
}
add_action( 'save_post', 'ooco_product_save_meta' );
function ooco_product_modify_form(){
	/*if($_REQUEST['post_type']=='ooco_product')
	{*/
		echo  '<script type="text/javascript">
					jQuery(document).ready(function(){
						if(jQuery("#post_type").val()==\'ooco_product\')
							jQuery(".add_media").hide();
					})
					
			  </script>';
	/*}*/
}
add_action('admin_footer','ooco_product_modify_form');
?>