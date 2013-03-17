<?php
/*
 * Plugin Name: OOCO Testimonials
 * Plugin URI: http://www.hgwmedia.com
 * Description: This plugin is managing the Testimonials of Of OOCO. 
 * Author: hgwmedia
 * Author URI: http://www.hgwmedia.com
 */
 
// Register a custom post type - ooco_testimonials 

function ooco_testimonial_install(){
	$labels = array(
		'name' => _x( 'Testimonials', 'post type general name' ),
		'singular_name' => _x( 'Testimonial', 'post type singular name' ),
		'add_new' => _x( 'Add New', 'OOCO_testimonial' ),
		'add_new_item' => __( 'Add New Testimonial' ),
		'edit_item' => __( 'Edit Testimonial' ),
		'new_item' => __( 'New Testimonial'),
		'all_items' => __( 'All Testimonials' ),
		'view_item' => __( 'View Testimonial' ),
		'search_items' => __( 'Search Testimonials' ),
		'not_found' =>  __( 'No testimonials found' ),
		'not_found_in_trash' => __( 'No ooco_testimonials found in Trash' ), 
		'parent_item_colon' => '',
		'menu_name' => 'Testimonials'
	
	);
	$args = array(
		'labels' => $labels,
		'public' => true,
		'publicly_queryable' => true,
		'show_ui' => true, 
		'show_in_menu' => true, 
		'query_var' => true,
		'rewrite' => array( 'slug' => 'ooco_testimonials','with_front' => FALSE),
		'capability_type' => 'post',
		'has_archive' => true, 
		'hierarchical' => false,
		'menu_position' => null,
		'supports' => array( 'title', 'editor' )
	); 
	register_post_type( 'ooco_testimonials', $args );
}
add_action( 'init', 'ooco_testimonial_install' );

// Add what we did meta box
function ooco_testimonial_whatwedid_metabox(){
	
	add_meta_box( 'ooco_testimonial_whatwedid_metabox', __( 'Author Details' ), 'ooco_testimonial_author_input', 'ooco_testimonials' ); 		
	
}
add_action( 'admin_init', 'ooco_testimonial_whatwedid_metabox' );

// What we did textarea
function ooco_testimonial_author_input(){
	global $post;
	
	$ooco_testimonial_author = get_post_meta( $post->ID, 'ooco_testimonial_author', true );
	
	$ooco_testimonial_author_age = get_post_meta( $post->ID, 'ooco_testimonial_author_age', true );	
	
	echo '<strong>Author Name :</strong> <input type="text" name="ooco_testimonial_author" id="ooco_testimonial_author" value="'.$ooco_testimonial_author.'" style="width:100%">';
	
	echo '<strong>Author Age :</strong><input type="text" name="ooco_testimonial_author_age" id="ooco_testimonial_author_age" value="'.$ooco_testimonial_author_age.'" style="width:100%">';
}

// Save the custom meta data
function ooco_testimonial_save_meta( $post_id ){

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

  $ooco_testimonial_author = $_POST['ooco_testimonial_author'];
  
  update_post_meta( $post_id, 'ooco_testimonial_author', $ooco_testimonial_author );
  
  $ooco_testimonial_author_age = $_POST['ooco_testimonial_author_age'];
  
  update_post_meta( $post_id, 'ooco_testimonial_author_age', $ooco_testimonial_author_age );
    
}

function left_ooco_testimonial_list($sel_post_id='')
{
	$args = array(
    	'orderby'         => 'post_date',
	    'order'           => 'DESC',
    	'post_type'       => 'ooco_testimonials',
	    'post_status'     => 'publish' 
	);
	
	$posts_array = get_posts( $args );	
	
	$titles='';
	
	$class_select='';
	
	if(!empty($posts_array[0]))
	{
		foreach($posts_array as $post_array)
		{
			if($sel_post_id!='' && $sel_post_id==$post_array->ID)
				$class_select='class="selected"';
			else
				$class_select='';
				
			$titles.='<li><a href="'.get_permalink( $post_array->ID ).'" '.$class_select.'>'.strtoupper($post_array->post_title).'</a></li>';
		}
	}
	return $titles;
}
function clearBrowserCache() {
	header("Pragma: no-cache");
    header("Cache: no-cache");
    header("Cache-Control: no-cache, must-revalidate");
    header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
}
add_action( 'save_post', 'ooco_testimonial_save_meta' );
function ooco_testimonial_modify_form(){
	if($_GET['post_type']=='ooco_testimonials')
	{
		echo  '<script type="text/javascript">
					 jQuery(".add_media").hide();
				</script>';
	}
}
add_action('admin_footer','ooco_testimonial_modify_form');
?>