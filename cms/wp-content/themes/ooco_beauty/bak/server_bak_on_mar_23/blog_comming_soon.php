<?php
/*
Template Name: Blog Comming soon
*/
?>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery(".comming_over_on").hide();
	jQuery(".commingSoon").hover(function(){
		jQuery(".comming_over_off").hide();
		jQuery(".comming_over_on").show();
	},
	function(){
		jQuery(".comming_over_on").hide();
		jQuery(".comming_over_off").show();
	}
	)
})
</script>
<aside id="blog" class="asideAnimation">
  <div class="asideContent">
    <div class="blogPage columns twelve">
      <div id="blog_1" class="slidePage openTab addOpacity">
        <?php /*?><h3 class="asideTitle">Coming Soon</h3><?php */?>
        <div id="blog_page_1" class="slidePage openTab addOpacity" style="text-align:center"> 
        	<div class="txt_center_align commingSoon">
	        	<img src="<?php echo get_template_directory_uri(); ?>/images/Blog_Slide_comingsoonback_grayscale.png"  align="middle" class="comming_over_off"/> 
                <img src="<?php echo get_template_directory_uri(); ?>/images/Blog_Slide_comingsoonback_color.png"  align="middle" class="comming_over_on"/> 
            </div>
            <div class="clear"></div>
         </div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</aside>