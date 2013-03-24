<?php
/*
  /**
 * The main front page file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query. 
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package WordPress
 * 
 */
 get_header(); 
?>
<div class="row">
  <a href="<?php echo site_url('pay-success')?>?success_invoice=<?php echo $_GET["pay-success"]?>" class="payPopups" id="payThankYouLink"></a>
  <a href="<?php echo site_url('pay-fail')?>" class="payPopups" id="payFailLink"></a>
  <?php 
	
	if(isset($_GET["pay-success"]))
	{?>
		<script type="text/javascript">
			jQuery(document).ready(function($){
				//jQuery(".shopOrderLink").trigger("click");
				<?php
					if($_GET["pay-success"]!=0)
						echo 'jQuery("#payThankYouLink").trigger("click");';
					else
						echo 'jQuery("#payFailLink").trigger("click");';
				?>
					
				
				/*jQuery("#payThankYouLink").click(function(){	
					alert('call');
				})*/
			})
			
		</script>	
	<?php
	}
	?>
  <div class="columns twelve"> <a href="#"><img src="<?php echo get_template_directory_uri(); ?>/images/main_logo.png" class="main_logo" /></a></div>
  <div class="clear"></div>
  <div class="columns twelve" id="threeCols">
    <div class="four columns" id="clsOcooBenefits">
      <h3><span>OC&Ograve;O</span> BENEFITS</h3>
      <div class="clsBenefits clearfix">
        <div class="clsBenefitsTle"> Anti-Aging </div>
        <div class="clsBenefitsDesc"> Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
        <div class="clsMoreLink clsFloatRight"> <a href="#">More</a> </div>
      </div>
      <div class="clsBenefits clearfix">
        <div class="clsBenefitsTle"> Anti-Aging </div>
        <div class="clsBenefitsDesc"> Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
        <div class="clsMoreLink clsFloatRight"> <a href="#">More</a> </div>
      </div>
    </div>
    <div class="four columns" id="clsOcooOrders">
      <div class="orderbtn"> <a class="shopOrderLink" href="<?php echo site_url('shoporder')?>">Order</a> </div>
      <div class="clsProductCon">
      <?php
	  	$ooco_product_args = array(
				'orderby'         => 'ooco_product_detail_qty',
				'order'           => 'ASC',
				'post_type'       => 'ooco_product',
				'post_status'     => 'publish',
				'numberposts'    => -1, 
	        );
	
			$ooco_products = get_posts( $ooco_product_args );	
			
			if(!empty($ooco_products[0]))
			{
				$no_of_bottles=0;
				
				$product_image=0;
				
				$ooco_product_detail_price = '';
	
				$ooco_product_detail_qty = '';
				
				$ooco_product_detail_no_bottles = '';
	
				$ooco_product_detail_no_bottles_text='';
				
				foreach($ooco_products as  $ooco_product)
				{
				
					$ooco_product_detail_price = get_post_meta( $ooco_product->ID, 'ooco_product_detail_price', true );
		
					$ooco_product_detail_qty = get_post_meta( $ooco_product->ID, 'ooco_product_detail_qty', true );	
					
					$ooco_product_detail_no_bottles = get_post_meta( $ooco_product->ID, 'ooco_product_detail_no_bottles', true );
					
					if($ooco_product_detail_no_bottles>1)
						$ooco_product_detail_no_bottles_text=__('BOTTLES');
					else
						$ooco_product_detail_no_bottles_text=__('BOTTLE');
						
	  ?>
                        <div class="clsProduct">
                          <div class="clsProductTle clsFloatLeft columns eight"> 
                          	<strong><?php echo $ooco_product->post_title?></strong> <?php echo substr($ooco_product->post_content,0,30)?> 
                          </div>
                          <div class="clsFloatRight clsOrderLink"> 
                          	<a class="shopOrderLink" href="<?php echo site_url('shoporder?product_id='.$ooco_product->ID)?>">Order</a> 
                          </div>
                          <div class="clear"></div>
                        </div>
        <?php
				}
			}
		?>        
      </div>
    </div>
    <div class="four columns" id="clsOcooSocialMedia">
      <h3><span>SOCIAL</span> MEDIA</h3>
      <div class="SMTweets clsFacebook first">
        <div class="TwittIcon clsFloatLeft"> <a href="#"></a> </div>
        <div class="TwittText clsFloatLeft"> <a href="#">Maecenas</a> eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
        <div class="clear"></div>
      </div>
      <div class="SMTweets clsTwitter first">
        <div class="TwittIcon clsFloatLeft"> <a href="#"></a> </div>
        <div class="TwittText clsFloatLeft"> <a href="#">Maecenas</a> eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
        <div class="clear"></div>
      </div>
      <div class="SMTweets clsInstaGram first">
        <div class="TwittIcon clsFloatLeft"> <a href="#"></a> </div>
        <div class="TwittText clsFloatLeft"> <a href="#">Maecenas</a> eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
        <div class="clear"></div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<div class="columns three centered" id="socialLinks">
  <div class="social_link"> 
  <a href="<?php if(inkthemes_get_option('social_media_facebook_url') !="" ) echo inkthemes_get_option('social_media_facebook_url'); else echo "#";?>" class="facebook" target="_blank"></a> 
  <a href="<?php if(inkthemes_get_option('social_media_twitter_url') !="") echo inkthemes_get_option('social_media_twitter_url'); else echo "#";?>" class="twitter" target="_blank"></a> 
  <a href="<?php if(inkthemes_get_option('social_media_pinterest_url') !="") echo inkthemes_get_option('social_media_pinterest_url'); else echo "#";?>" class="pIntrest" target="_blank"></a> 
  <a href="<?php if(inkthemes_get_option('social_media_instagram_url') !="") echo inkthemes_get_option('social_media_instagram_url'); else echo "#";?>" class="instagram" target="_blank"></a>
  <div class="clear"></div>
  </div>
</div>


<?php get_footer(); ?>
