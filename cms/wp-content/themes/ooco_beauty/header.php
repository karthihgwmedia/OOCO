<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Starkers
 * @since Starkers 3.0
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html <?php language_attributes(); ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<title>
<?php
	/*
	 * Print the <title> tag based on what is being viewed.
	 */
	global $page, $paged;

	wp_title('|', true, 'right');

	// Add the blog name.
	bloginfo('name');

	// Add the blog description for the home/front page.
	$site_description = get_bloginfo('description', 'display');
	if ($site_description && ( is_home() || is_front_page() ))
		echo " | $site_description";

	// Add a page number if necessary:
	if ($paged >= 2 || $page >= 2)
		echo ' | ' . sprintf(__('Page %s', 'themia'), max($paged, $page));
?>
</title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/stylesheets/foundation.css">
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/stylesheets/app.css">
<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo('stylesheet_url'); ?>" />
<link href="<?php echo get_template_directory_uri(); ?>/slide_animation.css" media="all" rel="stylesheet" type="text/css"/>
<?php wp_head(); ?>
<?php /*?><script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script><?php */?>
</head>
<body <?php body_class(); ?>>
<div id="container">
<header id="header">
  <div class="row">
    <div class="three columns logo left"> <a href="<?php echo home_url(); ?>"> <img src="<?php if (inkthemes_get_option('inkthemes_logo') != '') { ?><?php echo inkthemes_get_option('inkthemes_logo'); ?><?php } else { ?><?php echo get_template_directory_uri(); ?>/images/OCOOlogo_header.png<?php } ?>" alt="<?php bloginfo('name'); ?>" /></a> </div>
    <div class="nine columns right" id="menuDiv">
      <div class="carousel">
        <nav id="menu">
          <ul class="nav-bar">
            <li><a class="home" href="#"><span>Home</span></a></li>
            <li><a href="<?php echo site_url('about')?>" class="clSlideIn" title="about"><span><?php echo __("ABOUT OCÓO")?></span></a></li>
            <li><a href="<?php echo site_url('feature')?>" class="clSlideIn" title="feature"><span><?php echo __("FEATURES")?></span></a></li>
            <li><a href="<?php echo site_url('the-ocoo-newsletter')?>" class="clSlideIn" title="newsletter"><span><?php echo __("NEWSLETTER")?></span></a></li>
            <li><a href="<?php echo site_url('blog')?>" class="clSlideIn" title="blog"><span><?php echo __("BLOG")?></span></a></li>
            <li><a href="<?php echo site_url('contact-us')?>" class="clSlideIn" title="contact"><span><?php echo __("CONTACT")?></span></a></li>
            <li><a href="<?php echo site_url('shoporder')?>" class="shopOrderLink" title="shoporder"><span><?php echo __("SHOP")?></span></a></li>
          </ul>
          <?php	
			// inkthemes_nav();
		  ?>
        </nav>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</header>
<p class="txt_center_align"><img src="<?php echo get_template_directory_uri(); ?>/images/Ocoo_websiteBackground.jpg" class="bgImge" /></p>
<div id="wrapper">
