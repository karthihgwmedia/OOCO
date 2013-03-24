<?php
/*
	Template Name: OOCO News Letter
*/
?>
<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>
<aside id="newsletter" class="asideAnimation">
  <div class="asideContent">
    <div class="newsletterPage columns twelve">
      <div id="newsletter_page_1" class="slidePage openTab addOpacity">
        <h3 class="asideTitle">THE OCÓO NEWSLETTER</h3>
        <div class="newsletterCon">
          <div class="newsLetterFrmTle"> <?php echo __("JOIN OUR E-LIST")?> </div>
          <div class="newsLetterFrmDesc">
            <p><?php echo __("For latest news and event announcements please subscribe to our newsletter.")?></p>
            <p><?php echo __("Please fill out the form below, we will send you our first newsletter.")?></p>
          </div>  
           <?php the_content(); ?>        
        </div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</aside>
<script type="text/javascript" src="<?php echo plugins_url('contact-form-7/includes/js/jquery.form.min.js')?>"></script>
<script type="text/javascript" src="<?php echo plugins_url('contact-form-7/includes/js/scripts.js')?>"></script>
<link href="<?php echo plugins_url('contact-form-7/includes/css/styles.css')?>" media="all" rel="stylesheet" type="text/css"/>
<?php endwhile;?>