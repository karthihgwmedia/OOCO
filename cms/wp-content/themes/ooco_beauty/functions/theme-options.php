<?php

add_action('init', 'inkthemes_options');
if (!function_exists('inkthemes_options')) {

    function inkthemes_options() {
        // VARIABLES
        $themename = function_exists( 'wp_get_theme' ) ? wp_get_theme() : get_current_theme();
        $themename = $themename['Name'];
        $shortname = "of";
        // Populate OptionsFramework option in array for use in theme
        global $of_options;
        $of_options = inkthemes_get_option('of_options');

        // Background Defaults

        $background_defaults = array('color' => '', 'image' => '', 'repeat' => 'repeat', 'position' => 'top center', 'attachment' => 'scroll');


        // Pull all the categories into an array
        $options_categories = array();
        $options_categories_obj = get_categories();
        foreach ($options_categories_obj as $category) {
            $options_categories[$category->cat_ID] = $category->cat_name;
        }

        // Pull all the pages into an array
        $options_pages = array();
        $options_pages_obj = get_pages('sort_column=post_parent,menu_order');
        $options_pages[''] = 'Select a page:';
        foreach ($options_pages_obj as $page) {
            $options_pages[$page->ID] = $page->post_title;
        }

        // If using image radio buttons, define a directory path
        $imagepath = get_template_directory_uri() . '/images/';

        $options = array(
            array("name" => "General Settings",
                "type" => "heading"),
            array("name" => "Custom Logo",
                "desc" => "Choose your own logo. Optimal Size: 160px Wide by 30px Height",
                "id" => "inkthemes_logo",
                "type" => "upload"),
            array("name" => "Custom Favicon",
                "desc" => "Specify a 16px x 16px image that will represent your website's favicon.",
                "id" => "inkthemes_favicon",
                "type" => "upload"),
            array("name" => "Tracking Code",
                "desc" => "Paste your Google Analytics (or other) tracking code here.",
                "id" => "inkthemes_analytics",
                "std" => "",
                "type" => "textarea"),
			//****=============================================================================****//
			//****-----------This code is used for creating home page feature content----------****//							
			//****=============================================================================****//	
            array("name" => "Social media Settings",
                "type" => "heading"),
				
			array("name" => "Facebook page URL",
                "desc" => "paste your facebook page Url here",
                "id" => "social_media_facebook_url",
                "std" => "",
                "type" => "text"),
					
            array("name" => "Facebook Label",
                "desc" => "Paste your label for your facebook page here",
                "id" => "social_media_facebook_title",
                "std" => "",
                "type" => "text"),
				
            array("name" => "Facebook page description",
                "desc" => "Paste your facebook page description",
                "id" => "social_media_facebook_description",
                "std" => "",
                "type" => "textarea"),
				
			array("name" => "Twitter page URL",
                "desc" => "paste your twitter page Url here",
                "id" => "social_media_twitter_url",
                "std" => "",
                "type" => "text"),
			
			array("name" => "Twitter Label",
                "desc" => "Paste your label for your Twitter page here",
                "id" => "social_media_twitter_title",
                "std" => "",
                "type" => "text"),					
				
            array("name" => "Twitter page description",
                "desc" => "Paste your twitter page description",
                "id" => "social_media_twitter_description",
                "std" => "",
                "type" => "textarea"),
				
			array("name" => "YouTube page URL",
                "desc" => "paste your YouTube page Url here",
                "id" => "social_media_youtube_url",
                "std" => "",
                "type" => "text"),
			
			array("name" => "YouTube Label",
                "desc" => "Paste your label for your YouTube page here",
                "id" => "social_media_youtube_title",
                "std" => "",
                "type" => "text"),
					
				
            array("name" => "YouTube page description",
                "desc" => "Paste your YouTube page description",
                "id" => "social_media_youtube_description",
                "std" => "",
                "type" => "textarea"),
						
			
			array("name" => "Pinterest page URL",
                "desc" => "paste your Pinterest page Url here",
                "id" => "social_media_pinterest_url",
                "std" => "",
                "type" => "text"),
				
			array("name" => "Pinterest Label",
                "desc" => "Paste your label for your Pinterest page here",
                "id" => "social_media_pinterest_title",
                "std" => "",
                "type" => "text"),					
				
            array("name" => "Pinterest page description",
                "desc" => "Paste your Pinterest page description",
                "id" => "social_media_pinterest_description",
                "std" => "",
                "type" => "textarea"),	
			
			array("name" => "Instagram page URL",
                "desc" => "paste your Instagram page Url here",
                "id" => "social_media_instagram_url",
                "std" => "",
                "type" => "text"),
				
			array("name" => "Instagram Label",
                "desc" => "Paste your label for your Instagram page here",
                "id" => "social_media_instagram_title",
                "std" => "",
                "type" => "text"),	
				
            array("name" => "Instagram page description",
                "desc" => "Paste your Instagram page description",
                "id" => "social_media_instagram_description",
                "std" => "",
                "type" => "textarea"),		
           
           );
        inkthemes_update_option('of_template', $options);
        inkthemes_update_option('of_themename', $themename);
        inkthemes_update_option('of_shortname', $shortname);
    }

}
?>
