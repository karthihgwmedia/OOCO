<?php
/*
Plugin Name: Local Search SEO Contact Page
Plugin URI: http://www.expertbusinesssearch.com/wordpress/free-seo-wordpress-plugins-expert-business-search/local-search-seo-contact-page-plugin-for-wordpress/
Description: The Local Search SEO Contact Page gives you a simple way of not just adding your business address and information but also adds a QR code, hCard/vCard, Google map, geo-tag, social media buttons, and more. Just edit the settings and then place the shortcode on your contact page. 
Author: Expert Business Search, LLC
Version: 1.0.2
Author URI: http://www.expertbusinesssearch.com/
*/
function seo_contact_admin() {
	include('seo-contact-page-settings.php');
}
//Add admin page
function seo_contact_actions() {
	add_options_page( 'SEO Contact Page', 'SEO Contact Page', 1, 'seo-contact-page-settings.php', 'seo_contact_admin' );
}
//Add admin page action
add_action('admin_menu', 'seo_contact_actions');

//Shortcodes for all or specific parts
add_shortcode('seo_contact_page_full', 'seo_contact_page_full');
add_shortcode('seo_contact_page_contact_only', 'seo_contact_page_contact_only');
add_shortcode('seo_contact_page_payment_forms_only', 'seo_contact_page_payment_forms_only');
add_shortcode('seo_contact_page_qr_code_only', 'seo_contact_page_qr_code_only');
add_shortcode('seo_contact_page_map_only', 'seo_contact_page_map_only');
add_shortcode('seo_contact_page_hours_only', 'seo_contact_page_hours_only');
add_shortcode('seo_contact_page_social_media_only', 'seo_contact_page_social_media_only');

//Display every part of the SEO Contact Page
function seo_contact_page_full(){
	//shortening codes for multiple use
	if (get_option('seo_company_map_name') != ""){
		$map_code = "<iframe width='100%' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=" . get_option('seo_company_map_name') . ",+" . get_option('seo_company_address') . ",+" . get_option('seo_company_city') . ",+" . get_option('seo_company_state') . "+" . get_option('seo_company_zip') . "&amp;aq=&amp;ie=UTF8&amp;hq=" . get_option('seo_company_map_name') . "&amp;hnear=" . get_option('seo_company_address') . ",+" . get_option('seo_company_city') . ",+" . get_option('seo_company_state') . "+" . get_option('seo_company_zip') . "&amp;output=embed'></iframe>";
	}
	else{
		$map_code = "<iframe width='100%' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=" . get_option('seo_company_address') . ",+" . get_option('seo_company_city') . ",+" . get_option('seo_company_state') . "+" . get_option('seo_company_zip') . "&amp;aq=&amp;ie=UTF8&amp;hq=" . "&amp;hnear=" . get_option('seo_company_address') . ",+" . get_option('seo_company_city') . ",+" . get_option('seo_company_state') . "+" . get_option('seo_company_zip') . "&amp;output=embed'></iframe>";
	}
	
	$address_code = "<div class='vcard'><span class='fn org'><b>" . get_option('seo_company_name') . "</b></span><br><span class='adr'><span class='street-address'>" . get_option('seo_company_address') . "</span><br><span class='locality'>" . get_option('seo_company_city') . "</span>, <span class='region'>" . get_option('seo_company_state') . "</span> <span class='postal-code'>" . get_option('seo_company_zip') . "</span><br><span class='tel'>" . get_option('seo_company_phone') . "</span><br><span class='geo'><span class='latitude'><span class='value-title' title='" . get_option('seo_company_latitude') . "'></span></span><span class='longitude'><span class='value-title' title='" . get_option('seo_company_longitude') . "'></span></span></span></span></div>" . get_option('seo_company_alt_phone') . "<br>" . get_option('seo_company_fax') . "<br><a href='mailto:" . get_option('seo_company_email') . "'>" . get_option('seo_company_email') . "</a></p>";
	$hours_code = "<p><b>Hours of Operation</b><br>Monday: " . get_option('seo_company_hours_monday') . "<br>Tuesday: " . get_option('seo_company_hours_tuesday') . "<br>Wednesday: " . get_option('seo_company_hours_wednesday') . "<br>Thursday: " . get_option('seo_company_hours_thursday') . "<br>Friday: " . get_option('seo_company_hours_friday') . "<br>Saturday: " . get_option('seo_company_hours_saturday') . "<br>Sunday: " . get_option('seo_company_hours_sunday') . "</p>";
	$payment_code = "<p><b>Accepted Payment Methods</b><br>" . get_option('seo_company_payment') . "</p>";
	
	if (get_option('seo_company_facebook') != "") 
		$social_media_facebook = "<a target='_blank' href='" . get_option('seo_company_facebook') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Facebook.png'></a> ";
	if (get_option('seo_company_twitter') != "") 
		$social_media_twitter = "<a target='_blank' href='" . get_option('seo_company_twitter') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Twitter.png'></a> ";
	if (get_option('seo_company_youtube') != "") 
		$social_media_youtube = "<a target='_blank' href='" . get_option('seo_company_youtube') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Youtube.png'></a> ";
	if (get_option('seo_company_linkedin') != "") 
		$social_media_linkedin = "<a target='_blank' href='" . get_option('seo_company_linkedin') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Linked In.png'></a> ";

	
	
	if (get_option('seo_company_googleplaces') != "") 
		$social_media_googleplaces = "<a target='_blank' href='" . get_option('seo_company_googleplaces') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Google Places Logo.png'></a> ";
	if (get_option('seo_company_googleplus') != "") 
		$social_media_googleplus= "<a target='_blank' href='" . get_option('seo_company_googleplus') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Google Plus Logo.png'></a> ";
	if (get_option('seo_company_yelp') != "") 
		$social_media_yelp = "<a target='_blank' href='" . get_option('seo_company_yelp') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Yelp Logo.png'></a> ";
	if (get_option('seo_company_merchantcircle') != "") 
		$social_media_merchantcircle = "<a target='_blank' href='" . get_option('seo_company_merchantcircle') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Merchant Circle Logo.png'></a> ";
	if (get_option('seo_company_hotfrog') != "") 
		$social_media_hotfrog = "<a target='_blank' href='" . get_option('seo_company_hotfrog') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Hot Frog Logo.png'></a> ";
	if (get_option('seo_company_foursquare') != "") 
		$social_media_foursquare = "<a target='_blank' href='" . get_option('seo_company_foursquare') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Foursquare Logo.png'></a> ";
	if (get_option('seo_company_flickr') != "") 
		$social_media_flickr = "<a target='_blank' href='" . get_option('seo_company_flickr') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Flickr Logo.png'></a> ";
	if (get_option('seo_company_digg') != "") 
		$social_media_digg = "<a target='_blank' href='" . get_option('seo_company_digg') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Digg Logo.png'></a> ";
	if (get_option('seo_company_tumblr') != "") 
		$social_media_tumblr = "<a target='_blank' href='" . get_option('seo_company_tumblr') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Tumblr Logo.png'></a> ";
	if (get_option('seo_company_stumbleupon') != "") 
		$social_media_stumbleupon = "<a target='_blank' href='" . get_option('seo_company_stumbleupon') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Stumble Upon Logo.png'></a> ";
	if (get_option('seo_company_delicious') != "") 
		$social_media_delicious = "<a target='_blank' href='" . get_option('seo_company_delicious') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Del.icio.us Logo.png'></a> ";	
	
	$social_media = "<center>" . $social_media_facebook . $social_media_twitter . $social_media_youtube . $social_media_linkedin . $social_media_googleplaces . $social_media_googleplus . $social_media_yelp . $social_media_merchantcircle . $social_media_hotfrog . $social_media_foursquare . $social_media_flickr . $social_media_digg . $social_media_tumblr . $social_media_stumbleupon . $social_media_delicious . "</center><br>";
	

	if (get_option('seo_company_qr') != ""){
		return "<div style='width: 60%; display: inline-block;'>" . $address_code . $hours_code . $payment_code . "</div><div style='display: inline-block; vertical-align: top;'><div style='width: 170px;'>" . $social_media . "</div><center><iframe width='150' height='150' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://chart.apis.google.com/chart?cht=qr&amp;chs=150x150&amp;chl=" . get_option('seo_company_qr') . "'></iframe></center></div><div>" . $map_code . "</div>";
	}
	elseif(get_option('seo_company_map_name') != ""){
		return "<div style='width: 60%; display: inline-block;'>" . $address_code . $hours_code . $payment_code . "</div><div style='display: inline-block; vertical-align: top;'><div style='width: 170px;'>" . $social_media . "</div><center><iframe width='150' height='150' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://chart.apis.google.com/chart?cht=qr&amp;chs=150x150&amp;chl=http://mapof.it/" . get_option('seo_company_name') . ", " . get_option('seo_company_address') . ", " . get_option('seo_company_city') . ", " . get_option('seo_company_state') . " " . get_option('seo_company_zip') . "'></iframe><p>Scan with your smartphone <br>to get directions.</p></center></div><div>" . $map_code . "</div>";
	}
	else{
		return "<div style='width: 60%; display: inline-block;'>" . $address_code . $hours_code . $payment_code . "</div><div style='display: inline-block; vertical-align: top;'><div style='width: 170px;'>" . $social_media . "</div><center><iframe width='150' height='150' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://chart.apis.google.com/chart?cht=qr&amp;chs=150x150&amp;chl=http://mapof.it/" . get_option('seo_company_address') . ", " . get_option('seo_company_city') . ", " . get_option('seo_company_state') . " " . get_option('seo_company_zip') . "'></iframe><p>Scan with your smartphone <br>to get directions.</p></center></div><div>" . $map_code . "</div>";
	}
}

//Display just the contact information
function seo_contact_page_contact_only(){
	
	$output_return='<div class="clsContactDetails">
						<div class="companyName">'.get_option('seo_company_name').'</div>';
						
						/*<div class="clsContactDetails">	
						<p class="clsAddress">PO Box 88001, Dubai - UAE</p>
					   <p><strong>Tel:</strong> +9714 297 12 12</p>
					   <p><strong>Fax:</strong> +971 4 297 11 22</p>
					   <p><strong>Email:</strong> <a href="mailto:info@obsgroup.com">info@obsgroup.com</a></p>
       					 </div>*/
		
						if(get_option('seo_company_address')!="")
							$output_return.='<p class="clsAddress">'._("PO Box ").get_option('seo_company_zip').", ".get_option('seo_company_address').'</p>';
							
						if(get_option('seo_company_phone')!="")	
							$output_return.='<p>'._("Tel : ").get_option('seo_company_phone').'</p>';
						
						if(get_option('seo_company_fax')!="")	
							$output_return.='<p>'._("Fax : ").get_option('seo_company_fax').'</p>';
								
						if(get_option('seo_company_email')!="")	
							$output_return.='<p>'._("Email : ").'<a href="mailto:'.get_option('seo_company_email').'">'.get_option('seo_company_email').'</a>';
						
	$output_return.='</div>';
			 
	return $output_return;
}

//Display just the hours form
function seo_contact_page_hours_only(){
	return "<p><b>Hours of Operation</b><br>Monday: " . get_option('seo_company_hours_monday') . "<br>Tuesday: " . get_option('seo_company_hours_tuesday') . "<br>Wednesday: " . get_option('seo_company_hours_wednesday') . "<br>Thursday: " . get_option('seo_company_hours_thursday') . "<br>Friday: " . get_option('seo_company_hours_friday') . "<br>Saturday: " . get_option('seo_company_hours_saturday') . "<br>Sunday: " . get_option('seo_company_hours_sunday') . "</p>";
}

//Display just the payment form
function seo_contact_page_payment_forms_only(){
	return "<p><b>Accepted Payment Methods</b><br>" . get_option('seo_company_payment') . "</p>";
}

//Display just the QR code
function seo_contact_page_qr_code_only(){
	
	if (get_option('seo_company_qr') != ""){
		return "<iframe width='150' height='150' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://chart.apis.google.com/chart?cht=qr&amp;chs=150x150&amp;chl=" . get_option('seo_company_qr') . "'></iframe>";
	}
	else{
		if(get_option('seo_company_map_name') != ""){
			return "<iframe width='150' height='150' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://chart.apis.google.com/chart?cht=qr&amp;chs=150x150&amp;chl=http://mapof.it/" . get_option('seo_company_map_name') . ", " . get_option('seo_company_address') . ", " . get_option('seo_company_city') . ", " . get_option('seo_company_state') . " " . get_option('seo_company_zip') . "'></iframe><p>Scan with your smartphone <br>to get directions.</p>";
		}
		else{
			return "<iframe width='150' height='150' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://chart.apis.google.com/chart?cht=qr&amp;chs=150x150&amp;chl=http://mapof.it/" . get_option('seo_company_address') . ", " . get_option('seo_company_city') . ", " . get_option('seo_company_state') . " " . get_option('seo_company_zip') . "'></iframe><p>Scan with your smartphone <br>to get directions.</p>";
		}
	}
}

//Display social media buttons only
function seo_contact_page_social_media_only(){
	if (get_option('seo_company_facebook') != "") 
		$social_media_facebook = "<a target='_blank' href='" . get_option('seo_company_facebook') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Facebook.png'></a> ";	
	if (get_option('seo_company_twitter') != "") 
		$social_media_twitter = "<a target='_blank' href='" . get_option('seo_company_twitter') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Twitter.png'></a> ";
	if (get_option('seo_company_youtube') != "") 
		$social_media_youtube = "<a target='_blank' href='" . get_option('seo_company_youtube') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Youtube.png'></a> ";
	if (get_option('seo_company_linkedin') != "") 
		$social_media_linkedin = "<a target='_blank' href='" . get_option('seo_company_linkedin') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Linked In.png'></a> ";
	
	if (get_option('seo_company_googleplaces') != "") 
		$social_media_googleplaces = "<a target='_blank' href='" . get_option('seo_company_googleplaces') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Google Places Logo.png'></a> ";
	if (get_option('seo_company_googleplus') != "") 
		$social_media_googleplus= "<a target='_blank' href='" . get_option('seo_company_googleplus') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Google Plus Logo.png'></a> ";
	if (get_option('seo_company_yelp') != "") 
		$social_media_yelp = "<a target='_blank' href='" . get_option('seo_company_yelp') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Yelp Logo.png'></a> ";
	if (get_option('seo_company_merchantcircle') != "") 
		$social_media_merchantcircle = "<a target='_blank' href='" . get_option('seo_company_merchantcircle') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Merchant Circle Logo.png'></a> ";
	if (get_option('seo_company_hotfrog') != "") 
		$social_media_hotfrog = "<a target='_blank' href='" . get_option('seo_company_hotfrog') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Hot Frog Logo.png'></a> ";
	if (get_option('seo_company_foursquare') != "") 
		$social_media_foursquare = "<a target='_blank' href='" . get_option('seo_company_foursquare') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Foursquare Logo.png'></a> ";
	if (get_option('seo_company_flickr') != "") 
		$social_media_flickr = "<a target='_blank' href='" . get_option('seo_company_flickr') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Flickr Logo.png'></a> ";
	if (get_option('seo_company_digg') != "") 
		$social_media_digg = "<a target='_blank' href='" . get_option('seo_company_digg') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Digg Logo.png'></a> ";
	if (get_option('seo_company_tumblr') != "") 
		$social_media_tumblr = "<a target='_blank' href='" . get_option('seo_company_tumblr') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Tumblr Logo.png'></a> ";
	if (get_option('seo_company_stumbleupon') != "") 
		$social_media_stumbleupon = "<a target='_blank' href='" . get_option('seo_company_stumbleupon') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Stumble Upon Logo.png'></a> ";
	if (get_option('seo_company_delicious') != "") 
		$social_media_delicious = "<a target='_blank' href='" . get_option('seo_company_delicious') . "'><img src='" . get_option('siteurl') .  "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Del.icio.us Logo.png'></a> ";	
	
	$social_media = "<center>" . $social_media_facebook . $social_media_twitter . $social_media_youtube . $social_media_linkedin . $social_media_googleplaces . $social_media_googleplus . $social_media_yelp . $social_media_merchantcircle . $social_media_hotfrog . $social_media_foursquare . $social_media_flickr . $social_media_digg . $social_media_tumblr . $social_media_stumbleupon . $social_media_delicious . "</center><br>";
	
	return $social_media;
}

//Display just the map
function seo_contact_page_map_only(){
	return "<iframe width='100%' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=" . get_option('seo_company_map_name') . ",+" . get_option('seo_company_address') . ",+" . get_option('seo_company_city') . ",+" . get_option('seo_company_state') . "+" . get_option('seo_company_zip') . "&amp;aq=&amp;ie=UTF8&amp;hq=" . get_option('seo_company_map_name') . "&amp;hnear=" . get_option('seo_company_address') . ",+" . get_option('seo_company_city') . ",+" . get_option('seo_company_state') . "+" . get_option('seo_company_zip') . "&amp;output=embed'></iframe>";
}
?>