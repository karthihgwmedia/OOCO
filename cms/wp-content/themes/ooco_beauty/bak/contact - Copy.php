<?php
/*
	Template Name: OOCO Contact Us
*/
$socialMedias=array("facebook","twitter","pinterest","instagram");

?>
<aside id="contact" class="asideAnimation">
  <div class="asideContent">
    <div class="pagination clearfix"> <a href="#contact_page_1" class="first selected">Page 1</a> <a href="#contact_page_2">Page 2</a></div>
    <div class="contactPage">
      <div id="contact_page_1" class="slidePage openTab addOpacity">
        <h3 class="asideTitle"><?php echo _("OUR SOCIAL MEDIA")?></span></h3>
        <?php
			$socialUrl='';
			$socialTitle='';
			$socialDesc='';
			
			foreach($socialMedias as $socialMedia)
			{
				$socialUrl=inkthemes_get_option('social_media_'.$socialMedia.'_url') !="" ? inkthemes_get_option('social_media_'.$socialMedia.'_url') : "#";
				
				$socialTitle=inkthemes_get_option('social_media_'.$socialMedia.'_title')!="" ? inkthemes_get_option('social_media_'.$socialMedia.'_title') : "";
				
				$socialDesc=inkthemes_get_option('social_media_'.$socialMedia.'_description')!="" ? inkthemes_get_option('social_media_'.$socialMedia.'_description') : "";;				
				if($socialUrl!="#")
				{
		?>	
        		<div class="clsContactSocial">
                  <div class="clsConactScIcn clsFloatLeft"> <a href="<?php echo $socialUrl?>" class="<?php echo $socialMedia?>"></a> </div>
                  <div class="clsConactScDescLink clsFloatLeft"> <a href="<?php echo $socialUrl?>" class="clsConactScLink">
                    <?php echo $socialTitle ?>
                    </a>
                    <?php 
                        if ($socialDesc != '') 
                            echo '<p class="clsConactScDesc">'.$socialDesc.'</p>';
                    ?>
                  </div>
          		  <div class="clear"></div>
        		</div>
		<?php
				}
        	}
		?>
        
        <?php /*?><div class="clsContactSocial">
          <div class="clsConactScIcn clsFloatLeft"> <a href="<?php if (inkthemes_get_option('social_media_facebook_url') != '') echo inkthemes_get_option('social_media_twitter_url'); else echo "#";  ?>" class="twitter"></a> </div>
          <div class="clsConactScDescLink clsFloatLeft"> <a href="<?php if (inkthemes_get_option('social_media_twitter_url') != '') echo inkthemes_get_option('social_media_twitter_url'); else echo "#";  ?>" class="clsConactScLink">
            <?php if (inkthemes_get_option('social_media_twitter_title') != '') echo inkthemes_get_option('social_media_twitter_title'); else echo "twitter.com/OcooBeauty";  ?>
            </a>
            <?php 
				if (inkthemes_get_option('social_media_twitter_description') != '') 
				    echo '<p class="clsConactScDesc">'.inkthemes_get_option('social_media_twitter_description').'</p>';
            ?>
          </div>
          <div class="clear"></div>
        </div>
        <div class="clsContactSocial">
          <div class="clsConactScIcn clsFloatLeft"> <a href="<?php if (inkthemes_get_option('social_media_pinterest_url') != '') echo inkthemes_get_option('social_media_pinterest_url'); else echo "#";  ?>" class="pinterest"></a> </div>
          <div class="clsConactScDescLink clsFloatLeft"> <a href="<?php if (inkthemes_get_option('social_media_pinterest_url') != '') echo inkthemes_get_option('social_media_pinterest_url'); else echo "#";  ?>" class="clsConactScLink">
            <?php if (inkthemes_get_option('social_media_pinterest_title') != '') echo inkthemes_get_option('social_media_pinterest_title'); else echo "pinterest.com/OcooBeauty";  ?>
            </a>
            <?php 
			if (inkthemes_get_option('social_media_pinterest_description') != '') 
			    echo '<p class="clsConactScDesc">'.inkthemes_get_option('social_media_pinterest_description').'</p>';
          ?>
          </div>
          <div class="clear"></div>
        </div>
        <div class="clsContactSocial">
          <div class="clsConactScIcn clsFloatLeft"> <a href="<?php if (inkthemes_get_option('social_media_instagram_url') != '') echo inkthemes_get_option('social_media_instagram_url'); else echo "#"; ?>" class="instagram"></a> </div>
          <div class="clsConactScDescLink clsFloatLeft"> <a href="<?php if (inkthemes_get_option('social_media_instagram_url') != '') echo inkthemes_get_option('social_media_instagram_url'); else echo "#"; ?>" class="clsConactScLink">
            <?php if (inkthemes_get_option('social_media_instagram_title') != '') echo inkthemes_get_option('social_media_instagram_title'); else echo "pinterest.com/OcooBeauty"; ?>
            </a>
            <?php 
				if (inkthemes_get_option('social_media_instagram_description') != '') 
			    	echo '<p class="clsConactScDesc">'.inkthemes_get_option('social_media_instagram_description').'</p>';
            ?>
          </div>
          <div class="clear"></div>
        </div><?php */?>
      </div>
      <div id="contact_page_2" class="clsAboutCon slidePage">
        <h3 class="asideTitle">Contact US</span></h3>
        <div class="contactFrmCon">
          <div class="contactFrmTle"> Let us know what you think </div>
          <div class="contactFrmDesc">
            <p><strong>For product info, testimonials and more.</strong></p>
            <p>Please fill out the form below, we will contact you as soon as one of our team members is available.</p>
          </div>
          <?php echo do_shortcode('[contact-form-7 id="7" title="Contact form"]')?> </div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</aside>
