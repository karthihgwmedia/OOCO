<?php
/*
	Template Name: OOCO payment sucess
*/
get_header();
?>
<div class="columns twelve"> <a href="#"><img src="<?php echo get_template_directory_uri(); ?>/images/main_logo.png" class="main_logo" /></a></div>
<div class="clear"></div>
<div class="columns twelve" id="threeCols">
<div class="row">
<div class="columns twelve">
  <h1><?php echo __("Thank you")?></h1>
  <div class="clear"></div>
</div>
</div>
<?php
	wp_footer();
?>
<div id="loading"></div>
<div id="ajax"></div>
</body>
</html>