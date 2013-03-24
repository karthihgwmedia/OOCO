<?php
/*
	Template Name: OOCO Testimonials And Press Release
*/
?>
<aside id="feature" class="asideAnimation">
  <div class="asideContent">
    <div class="pagination clearfix"> <a href="#feature_page_1" class="first selected">Page 1</a> <a href="#feature_page_2">Page 2</a></div>
    <div class="featurePage">
      <div id="feature_page_1" class="slidePage openTab addOpacity">
        <h3 class="asideTitle"><?php echo __("OCÓO")?> <span><?php echo __("TESTIMONIALS")?></span></h3>
        <div class="slimContentContainer">
          <?php
			$ooco_testimonials_args = array(
				'orderby'         => 'title',
				'order'           => 'ASC',
				'post_type'       => 'ooco_testimonials',
				'post_status'     => 'publish',
				'numberposts'    => -1, 
	        );
	
			$ooco_testimonials = get_posts( $ooco_testimonials_args );	
			
			if(!empty($ooco_testimonials[0]))
			{
				foreach($ooco_testimonials as  $ooco_testimonial)
				{
					$ooco_testimonial_author = get_post_meta( $ooco_testimonial->ID, 'ooco_testimonial_author', true );
					
					$ooco_testimonial_author_age = get_post_meta( $ooco_testimonial->ID, 'ooco_testimonial_author_age', true );
		?>
          <div class="clsTestimonials">
            <h4><?php echo $ooco_testimonial->post_title?></h4>
            <div class="clsTestDesc">"<?php echo $ooco_testimonial->post_content?>"</div>
            <div class="clsTestDescBy"><?php echo $ooco_testimonial_author?> - <?php echo $ooco_testimonial_author_age?></div>
          </div>
          <?php
				}
			}
		?>
        </div>
      </div>
      <div id="feature_page_2" class="clsAboutCon slidePage">
        <h3 class="asideTitle"><?php echo __("THE OCÓO")?> <span><?php echo __("PRESS CORNER")?></span></h3>
        <div class="slimContentContainer">
          <?php
		  	$ooco_news_args = array(
				'orderby'         => 'title',
				'order'           => 'ASC',
				'post_type'       => 'ooco_news',
				'post_status'     => 'publish',
				'numberposts'    => -1, 
	        );
	
			$ooconews = get_posts( $ooco_news_args );
			if(!empty($ooconews[0]))
			{
				foreach($ooconews as  $ooco_press)
				{
		  ?>
              <div class="pressCorner">
                <div class="clsPressTle"><?php echo $ooco_press->post_title?></div>
                <div class="clsPressDesc"> <?php echo wpautop($ooco_press->post_content)?> </div>
              </div>
          <?php
		  		}
			}
		  ?>
        </div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</aside>