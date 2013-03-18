<?php
/*
	Template Name: OOCO Shop Cart
*/
?>
<div class="shopAnimation" id="shopOrder">
  <div class="clsProductTle"> <?php echo __("OCÓO SHOP")?> </div>
  <div class="clsBenefitsDesc">
    <p><?php echo __("Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque habitant morid est malesuada laoreet.")?></p>
  </div>
  <div class="shopLoad">
	  <?php
        if(is_user_logged_in())
            include("cartProductDetails.php");
        else  
            include("cartLogin.php");
      //<div id="registerPage" class="userForms"></div>
      ?>
  </div>
   <div class="clear"></div>
  <div class="orderLinks">
    <div cass="columns twelve">
      <div class="columns one">&nbsp;</div>
      <div class="columns ten"> 
      	<a href="<?php echo site_url('view-shop-cart')?>" class="shopForms"><?php echo __("View Cart")?></a>
        <a href="<?php echo site_url('shop-login')?>?message=confirm" class="confirmLogin" title="confirmLogin"></a>
       </div>
      <div class="columns one">&nbsp;</div>
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="clsCloseCon">
    <div cass="columns twelve"> <a href="#" class="closeShop"><?php echo __("Close")?></a> </div>
  </div>
</div>
