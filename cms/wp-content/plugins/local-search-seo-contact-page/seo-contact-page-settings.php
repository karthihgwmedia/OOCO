<?php  
        if($_POST['seo_hidden'] == 'Y') {  
            //Updates all the options 
	 		$seo_company_name = $_POST['seo_company_name']; update_option('seo_company_name', $seo_company_name); 
			$seo_company_address = $_POST['seo_company_address']; update_option('seo_company_address', $seo_company_address); 
			$seo_company_city = $_POST['seo_company_city']; update_option('seo_company_city', $seo_company_city); 
			$seo_company_state = $_POST['seo_company_state']; update_option('seo_company_state', $seo_company_state); 
			$seo_company_zip = $_POST['seo_company_zip']; update_option('seo_company_zip', $seo_company_zip); 
			$seo_company_phone = $_POST['seo_company_phone']; update_option('seo_company_phone', $seo_company_phone); 
			$seo_company_alt_phone = $_POST['seo_company_alt_phone']; update_option('seo_company_alt_phone', $seo_company_alt_phone); 
			$seo_company_fax = $_POST['seo_company_fax']; update_option('seo_company_fax', $seo_company_fax); 
			$seo_company_email = $_POST['seo_company_email']; update_option('seo_company_email', $seo_company_email); 
			$seo_company_optional_email = $_POST['seo_company_optional_email']; update_option('seo_company_optional_email', $seo_company_optional_email); 
			$seo_company_latitude = $_POST['seo_company_latitude']; update_option('seo_company_latitude', $seo_company_latitude); 
			$seo_company_longitude = $_POST['seo_company_longitude']; update_option('seo_company_longitude', $seo_company_longitude); 
			$seo_company_map_name = $_POST['seo_company_map_name']; update_option('seo_company_map_name', $seo_company_map_name); 
			
			$seo_company_hours_monday = $_POST['seo_company_hours_monday']; update_option('seo_company_hours_monday', $seo_company_hours_monday); 
			$seo_company_hours_tuesday = $_POST['seo_company_hours_tuesday']; update_option('seo_company_hours_tuesday', $seo_company_hours_tuesday); 
			$seo_company_hours_wednesday = $_POST['seo_company_hours_wednesday']; update_option('seo_company_hours_wednesday', $seo_company_hours_wednesday); 
			$seo_company_hours_thursday = $_POST['seo_company_hours_thursday']; update_option('seo_company_hours_thursday', $seo_company_hours_thursday); 
			$seo_company_hours_friday = $_POST['seo_company_hours_friday']; update_option('seo_company_hours_friday', $seo_company_hours_friday); 
			$seo_company_hours_saturday = $_POST['seo_company_hours_saturday']; update_option('seo_company_hours_saturday', $seo_company_hours_saturday); 
			$seo_company_hours_sunday = $_POST['seo_company_hours_sunday']; update_option('seo_company_hours_sunday', $seo_company_hours_sunday); 
			
			$seo_company_payment = $_POST['seo_company_payment']; update_option('seo_company_payment', $seo_company_payment); 
			$seo_company_qr = $_POST['seo_company_qr']; update_option('seo_company_qr', $seo_company_qr); 
			
			$seo_company_facebook = $_POST['seo_company_facebook']; update_option('seo_company_facebook', $seo_company_facebook); 
			$seo_company_twitter = $_POST['seo_company_twitter']; update_option('seo_company_twitter', $seo_company_twitter); 
			$seo_company_youtube = $_POST['seo_company_youtube']; update_option('seo_company_youtube', $seo_company_youtube); 
			$seo_company_linkedin = $_POST['seo_company_linkedin']; update_option('seo_company_linkedin', $seo_company_linkedin); 
			$seo_company_googleplaces = $_POST['seo_company_googleplaces']; update_option('seo_company_googleplaces', $seo_company_googleplaces); 
			$seo_company_googleplus = $_POST['seo_company_googleplus']; update_option('seo_company_googleplus', $seo_company_googleplus); 
			$seo_company_yelp = $_POST['seo_company_yelp']; update_option('seo_company_yelp', $seo_company_yelp); 
			$seo_company_merchantcircle = $_POST['seo_company_merchantcircle']; update_option('seo_company_merchantcircle', $seo_company_merchantcircle); 
			$seo_company_hotfrog = $_POST['seo_company_hotfrog']; update_option('seo_company_hotfrog', $seo_company_hotfrog); 
			$seo_company_foursquare = $_POST['seo_company_foursquare']; update_option('seo_company_foursquare', $seo_company_foursquare); 
			$seo_company_flickr = $_POST['seo_company_flickr']; update_option('seo_company_flickr', $seo_company_flickr); 
			$seo_company_digg = $_POST['seo_company_digg']; update_option('seo_company_digg', $seo_company_digg); 
			$seo_company_tumblr = $_POST['seo_company_tumblr']; update_option('seo_company_tumblr', $seo_company_tumblr); 
			$seo_company_stumbleupon = $_POST['seo_company_stumbleupon']; update_option('seo_company_stumbleupon', $seo_company_stumbleupon); 
			$seo_company_delicious = $_POST['seo_company_delicious']; update_option('seo_company_delicious', $seo_company_delicious); 
			
            ?>  
            
<div class="updated"><p><strong><?php _e('Options saved.' ); ?></strong></p></div>  
    <?php  
        } else {  
            //Normal page display including options if already set 
			$seo_company_name = get_option('seo_company_name'); 
			$seo_company_address = get_option('seo_company_address'); 
			$seo_company_city = get_option('seo_company_city'); 
			$seo_company_state = get_option('seo_company_state'); 
			$seo_company_zip = get_option('seo_company_zip'); 
			$seo_company_phone = get_option('seo_company_phone'); 
			$seo_company_alt_phone = get_option('seo_company_alt_phone'); 
			$seo_company_fax = get_option('seo_company_fax'); 
			
			$seo_company_email = get_option('seo_company_email');
			$seo_company_optional_email = get_option('seo_company_optional_email');
			 
			$seo_company_latitude = get_option('seo_company_latitude'); 
			$seo_company_longitude = get_option('seo_company_longitude'); 
			$seo_company_map_name = get_option('seo_company_map_name'); 
			
			$seo_company_hours_monday = get_option('seo_company_hours_monday'); 
			$seo_company_hours_tuesday = get_option('seo_company_hours_tuesday'); 
			$seo_company_hours_wednesday = get_option('seo_company_hours_wednesday'); 
			$seo_company_hours_thursday = get_option('seo_company_hours_thursday'); 
			$seo_company_hours_friday = get_option('seo_company_hours_friday'); 
			$seo_company_hours_saturday = get_option('seo_company_hours_saturday'); 
			$seo_company_hours_sunday = get_option('seo_company_hours_sunday');
			
			$seo_company_payment = get_option('seo_company_payment');
			$seo_company_qr = get_option('seo_company_qr');
			
			$seo_company_facebook = get_option('seo_company_facebook');
			$seo_company_twitter = get_option('seo_company_twitter');
			$seo_company_youtube = get_option('seo_company_youtube');
			$seo_company_linkedin = get_option('seo_company_linkedin');
			
			$seo_company_googleplaces = get_option('seo_company_googleplaces');
			$seo_company_googleplus = get_option('seo_company_googleplus');
			$seo_company_yelp = get_option('seo_company_yelp');
			$seo_company_merchantcircle = get_option('seo_company_merchantcircle');
			$seo_company_hotfrog = get_option('seo_company_hotfrog');
			$seo_company_flickr = get_option('seo_company_flickr');
			$seo_company_digg = get_option('seo_company_digg');
			$seo_company_foursquare = get_option('seo_company_foursquare');
			$seo_company_tumblr = get_option('seo_company_tumblr');
			$seo_company_stumbleupon = get_option('seo_company_stumbleupon');
			$seo_company_delicious = get_option('seo_company_delicious');
        }  
    ?>  
    

<div class="wrap">  
        <?php    echo "<h2>" . __( 'Local Search SEO Contact Page by ExpertBusinessSearch.com', 'oscimp_trdom' ) . "</h2>"; ?>  
      
        <form name="seo_form" method="post" action="<?php echo str_replace( '%7E', '~', $_SERVER['REQUEST_URI']); ?>">  
            <input type="hidden" name="seo_hidden" value="Y">   
            <?php    echo "<table><tr><td><h4>" . __( 'Contact information: ', 'oscimp_trdom' ) . "</h4><table>"; ?>  
            <?php _e("<tr><td>Name: </td><td>" ); ?><input type="text" name="seo_company_name" value="<?php echo $seo_company_name; ?>" size="30"><?php _e(" ex: Expert Business Search, LLC" ); ?></td></tr>
            <?php _e("<tr><td>Street: </td><td>" ); ?><input type="text" name="seo_company_address" value="<?php echo $seo_company_address; ?>" size="30"><?php _e(" ex: 7867 24 Mile Road" ); ?></td></tr> 
            <?php _e("<tr><td>City: </td><td>" ); ?><input type="text" name="seo_company_city" value="<?php echo $seo_company_city; ?>" size="30"><?php _e(" ex: Shelby Twp" ); ?></td></tr>
            <?php _e("<tr><td>State: </td><td>" ); ?><input type="text" name="seo_company_state" value="<?php echo $seo_company_state; ?>" size="30"><?php _e(" ex: MI" ); ?></td></tr>
            <?php _e("<tr><td>Zip: </td><td>" ); ?><input type="text" name="seo_company_zip" value="<?php echo $seo_company_zip; ?>" size="30"><?php _e(" ex: 48316" ); ?></td></tr>
            <?php _e("<tr><td>Phone: </td><td>" ); ?><input type="text" name="seo_company_phone" value="<?php echo $seo_company_phone; ?>" size="30"><?php _e(" ex: P: (586) 232-4268" ); ?></td></tr>
            <?php _e("<tr><td>Mobile: </td><td>" ); ?><input type="text" name="seo_company_alt_phone" value="<?php echo $seo_company_alt_phone; ?>" size="30"><?php _e(" ex: TOLL FREE (800) 555-5555" ); ?></td></tr>
            <?php _e("<tr><td>Fax: </td><td>" ); ?><input type="text" name="seo_company_fax" value="<?php echo $seo_company_fax; ?>" size="30"><?php _e(" ex: F: (800) 555-5555" ); ?></td></tr>
             <?php _e("<tr><td>Email: </td><td>" ); ?><input type="text" name="seo_company_email" value="<?php echo $seo_company_email; ?>" size="30"><?php _e(" ex: Support@ExpertSupportNow.com" ); ?></td></tr>
             <?php _e("<tr><td>Optional Email: </td><td>" ); ?><input type="text" name="seo_company_optional_email" value="<?php echo $seo_company_optional_email; ?>" size="30"><?php _e(" ex: Support@ExpertSupportNow.com" ); ?></td></tr>
             <?php _e("<tr><td>Latitude: </td><td>" ); ?><input type="text" name="seo_company_latitude" value="<?php echo $seo_company_latitude; ?>" size="30"><?php _e(" ex: 42.684045" ); ?></td></tr>
             <?php _e("<tr><td>Longitude: </td><td>" ); ?><input type="text" name="seo_company_longitude" value="<?php echo $seo_company_longitude; ?>" size="30"><?php _e(" ex: -83.035554" ); ?></td></tr>
             <?php _e("<tr><td colspan='2'><a href='http://www.geo-tag.de/generator/en.html' target='_blank'>Click here to find your latitude and longitude.</a>" ); ?></td></tr></table></td><td width="20"></td><td valign="top">
            
       		<?php    echo "<h4>" . __( 'Hours of operation:', 'oscimp_trdom' ) . "</h4><table>"; ?>  
            <tr><td><?php _e("Monday: </td><td>" ); ?><input type="text" name="seo_company_hours_monday" value="<?php echo $seo_company_hours_monday; ?>" size="20"><?php _e(" ex: 9am-5pm" ); ?></td></tr>
            <tr><td><?php _e("Tuesday: </td><td>" ); ?><input type="text" name="seo_company_hours_tuesday" value="<?php echo $seo_company_hours_tuesday; ?>" size="20"><?php _e(" ex: 9am-5pm" ); ?></td></tr>
            <tr><td><?php _e("Wednesday: </td><td>" ); ?><input type="text" name="seo_company_hours_wednesday" value="<?php echo $seo_company_hours_wednesday; ?>" size="20"><?php _e(" ex: 9am-5pm" ); ?></td></tr>
            <tr><td><?php _e("Thursday: </td><td>" ); ?><input type="text" name="seo_company_hours_thursday" value="<?php echo $seo_company_hours_thursday; ?>" size="20"><?php _e(" ex: 9am-5pm" ); ?></td></tr>
            <tr><td><?php _e("Friday: </td><td>" ); ?><input type="text" name="seo_company_hours_friday" value="<?php echo $seo_company_hours_friday; ?>" size="20"><?php _e(" ex: 9am-5pm" ); ?></td></tr>
            <tr><td><?php _e("Saturday: </td><td>" ); ?><input type="text" name="seo_company_hours_saturday" value="<?php echo $seo_company_hours_saturday; ?>" size="20"><?php _e(" ex: 9am-5pm" ); ?></td></tr>
            <tr><td><?php _e("Sunday: </td><td>" ); ?><input type="text" name="seo_company_hours_sunday" value="<?php echo $seo_company_hours_sunday; ?>" size="20"><?php _e(" ex: 9am-5pm" ); ?></td></tr></table></td></tr></table>
            
            <table><tr><td valign="top"><?php    echo "<h4>" . __( 'Forms of payment:', 'oscimp_trdom' ) . "</h4>"; ?>  
            <p><?php _e("Types: " ); ?><input type="text" name="seo_company_payment" value="<?php echo $seo_company_payment; ?>" size="50"><?php _e(" <br>ex: Cash, Check, Visa, Paypal" ); ?></p>
			<?php    echo "<h4>" . __( 'Google map options:', 'oscimp_trdom' ) . "</h4>"; ?>  
            <p><?php _e("Business name on the map: " ); ?><input type="text" name="seo_company_map_name" size="30" value="<?php echo $seo_company_map_name; ?>"><?php _e(" <br>Fill in your Google Place or company name here. If your map is not working, leave this blank to remove the business name from the search." ); ?></p></td>
            <td width="50"></td>
            <td><?php    echo "<h4>" . __( 'Custom QR Code: ', 'oscimp_trdom' ) . "</h4>"; ?>  
            <p><?php _e("By default, your QR code will display driving directions from Google maps. Use this option to cusomize your QR code or leave it blank to use defaults."); ?>
            <p><?php _e("Link: " ); ?><input type="text" name="seo_company_qr" value="<?php echo $seo_company_qr; ?>" size="40"><?php _e(" <br>URL: <strong>http://www.ExpertBusinessSearch.com</strong><br>Email: <strong>mailto:Support@ExpertBusinessSearch.com</strong><br>Phone: <strong>tel:+15862324268</strong><br>Geo-code (longitude, latitude): <strong>geo:42.684045,-83.035554,100</strong>" ); ?></p></td></tr></table>
            <?php    echo "<h4>" . __( 'Social Media Buttons:', 'oscimp_trdom' ) . "</h4>"; ?>
              
            <?php _e("Use links to your social media pages. If you don't have one, just leave it blank. Hover over the icon if you aren't sure what it stands for.<br>" ); ?>
            <table>
            <tr><td><?php _e("<img alt='Facebook' title='Facebook' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Facebook.png' height='20'>"); ?></td><td><input type="text" name="seo_company_facebook" size="50" value="<?php echo $seo_company_facebook; ?>"></td><td width="50" align="right"><?php _e("<img alt='Twitter' title='Twitter' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Twitter.png' height='20'>"); ?></td><td><input type="text" name="seo_company_twitter" size="50" value="<?php echo $seo_company_twitter; ?>"></td></tr>
            <tr><td><?php _e("<img alt='Youtube' title='Youtube' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Youtube.png' height='20'>"); ?></td><td><input type="text" name="seo_company_youtube" size="50" value="<?php echo $seo_company_youtube; ?>"></td><td width="50" align="right"><?php _e("<img alt='LinkedIn' title='LinkedIn' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Linked In.png' height='20'>"); ?></td><td><input type="text" name="seo_company_linkedin" size="50" value="<?php echo $seo_company_linkedin; ?>"></td></tr>
            <tr><td><?php _e("<img alt='Google Places' title='Google Places' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Google Places Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_googleplaces" size="50" value="<?php echo $seo_company_googleplaces; ?>"></td><td width="50" align="right"><?php _e("<img alt='Google+' title='Google+' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Google Plus Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_googleplus" size="50" value="<?php echo $seo_company_googleplus; ?>"></td></tr>
            <tr><td><?php _e("<img alt='Yelp' title='Yelp' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Yelp Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_yelp" size="50" value="<?php echo $seo_company_yelp; ?>"></td><td width="50" align="right"><?php _e("<img alt='Merchant Circle' title='Merchant Circle' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Merchant Circle Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_merchantcircle" size="50" value="<?php echo $seo_company_merchantcircle; ?>"></td></tr>
            <tr><td><?php _e("<img alt='Hot Frog' title='Hot Frog' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Hot Frog Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_hotfrog" size="50" value="<?php echo $seo_company_hotfrog; ?>"></td><td width="50" align="right"><?php _e("<img alt='Foursquare' title='Foursquare' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Foursquare Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_foursquare" size="50" value="<?php echo $seo_company_foursquare; ?>"></td></tr>
            <tr><td><?php _e("<img alt='Flickr' title='Flickr' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Flickr Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_flickr" size="50" value="<?php echo $seo_company_flickr; ?>"></td><td width="50" align="right"><?php _e("<img alt='Digg' title='Digg' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Digg Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_digg" size="50" value="<?php echo $seo_company_digg; ?>"></td></tr>
            <tr><td><?php _e("<img alt='Tumblr' title='Tumblr' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Tumblr Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_tumblr" size="50" value="<?php echo $seo_company_tumblr; ?>"></td><td width="50" align="right"><?php _e("<img alt='Stumbleupon' title='Stumbleupon' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Stumble Upon Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_stumbleupon" size="50" value="<?php echo $seo_company_stumbleupon; ?>"></td></tr>
            <tr><td><?php _e("<img alt='Del.icio.us' title='Del.icio.us' src='" . get_option('siteurl') . "/wp-content/plugins/local-search-seo-contact-page/images/SEO Contact Page Expert Business Now Del.icio.us Logo.png' height='20'>"); ?></td><td><input type="text" name="seo_company_delicious" size="50" value="<?php echo $seo_company_delicious; ?>"></td></tr>
            </table>
            <p class="submit">  
            <input type="submit" name="Submit" value="<?php _e('Update Options', 'oscimp_trdom' ) ?>" />  
            </p>  
        </form>  
        <p><?php    echo "<h4>" . __( 'Shortcodes: ', 'oscimp_trdom' ) . "</h4>"; ?></p>
            <p>Copy and paste the following shortcodes to use on your page.</p>
            <p><strong>[seo_contact_page_full]</strong><br>If you want to use the entire contact form including contact information, hours of operation, payment options, QR code, and Google map. The layout is already organized for you.</p> 
            <p>You can also create your own layout using HTML and then use the shortcodes individually. </p>
            <p><strong>[seo_contact_page_contact_only]</strong><br />
            To display the contact information only.</p>
            <p><strong>[seo_contact_page_hours_only]</strong><br />
            To display the hours of operation only.</p>
            <p><strong>[seo_contact_page_payment_forms_only]</strong><br />
            To display the payment methods only.</p>
            <p><strong>[seo_contact_page_social_media_only]</strong><br />
            To display the social media buttons only.</p>
            <p><strong>[seo_contact_page_qr_code_only]</strong><br />
            To display the QR code only.</p>
            <p><strong>[seo_contact_page_map_only]</strong><br />
            To display the Google map only.</p>
            <a href="http://www.expertbusinesssearch.com/wordpress/free-seo-wordpress-plugins-expert-business-search/local-search-seo-contact-page-plugin-for-wordpress/" target="_blank"><h3>Need Help? Click here!</h3></a>
    </div>  