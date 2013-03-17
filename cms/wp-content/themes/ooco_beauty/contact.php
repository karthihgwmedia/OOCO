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
        <h3 class="asideTitle"><?php echo _("OUR SOCIAL MEDIA")?></h3>
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
                      <div class="clsConactScIcn clsFloatLeft"> <a href="<?php echo $socialUrl?>" class="<?php echo $socialMedia?>" target="_blank"></a> </div>
                      <div class="clsConactScDescLink clsFloatLeft"> <a href="<?php echo $socialUrl?>" class="clsConactScLink" target="_blank">
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
        </div>
      <div id="contact_page_2" class="clsAboutCon slidePage">
        <h3 class="asideTitle"><?php echo _("Contact US")?></span></h3>
        <div class="contactFrmCon">
          <div class="contactFrmTle"> <?php echo _("Let us know what you think")?> </div>
          <div class="contactFrmDesc">
            <p><strong><?php echo _("For product info, testimonials and more.")?></strong></p>           
          </div>
          <?php
		  	echo seo_contact_page_contact_only();
		  ?>
      </div>
    </div>
    <div class="clear"></div>
  </div>
  </div>
</aside>
