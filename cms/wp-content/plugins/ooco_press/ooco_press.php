<?php
/*
 * Plugin Name: OOCO Press corner.
 * Plugin URI: http://www.hgwmedia.com
 * Description: This plugin is managing the Press corner OOCO. 
 * Author: hgwmedia
 * Author URI: http://www.hgwmedia.com
 */
 
// Register a custom post type - ooco_news 

function ooco_news_install(){
	$labels = array(
		'name' => _x( 'News', 'post type general name' ),
		'singular_name' => _x( 'News', 'post type singular name' ),
		'add_new' => _x( 'Add New', 'OOCO_news' ),
		'add_new_item' => __( 'Add New News' ),
		'edit_item' => __( 'Edit News' ),
		'new_item' => __( 'New News'),
		'all_items' => __( 'All News' ),
		'view_item' => __( 'View News' ),
		'search_items' => __( 'Search News' ),
		'not_found' =>  __( 'No news found' ),
		'not_found_in_trash' => __( 'No ooco_news found in Trash' ), 
		'parent_item_colon' => '',
		'menu_name' => 'News'
	
	);
	$args = array(
		'labels' => $labels,
		'public' => true,
		'publicly_queryable' => true,
		'show_ui' => true, 
		'show_in_menu' => true, 
		'query_var' => true,
		'rewrite' => array( 'slug' => 'ooco_news','with_front' => FALSE),
		'capability_type' => 'post',
		'has_archive' => true, 
		'hierarchical' => false,
		'menu_position' => null,
		'supports' => array( 'title', 'editor' )
	); 
	register_post_type( 'ooco_news', $args );
}
add_action( 'init', 'ooco_news_install' );

// Add what we did meta box
function ooco_news_whatwedid_metabox(){
	
	add_meta_box( 'ooco_news_whatwedid_metabox', __( 'Author Details' ), 'ooco_news_author_input', 'ooco_news' ); 		
	
}
// Save the custom meta data
function ooco_news_save_meta( $post_id ){

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
    
}
function ooco_news_modify_form(){
	/*if($_GET['post_type']=='ooco_news')
	{
		echo  '<script type="text/javascript">
					 jQuery(".add_media").hide();
				</script>';
	}*/
}
add_action('admin_footer','ooco_news_modify_form');
?>