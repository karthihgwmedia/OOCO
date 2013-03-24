<?php
/*
	Template Name: OOCO Shop Cart
*/
?>
<div class="shopAnimation" id="shopOrder">
  <div class="shopLoad">
	  <?php
        if(is_user_logged_in())
			include("ooco_my_account.php");
            //include("cartProductDetails.php");
        else  
            include("cartLogin.php");
      //<div id="registerPage" class="userForms"></div>
      ?>
  </div>
   <div class="clear"></div>
  <div class="atBottom">
  <div class="orderLinks">
    <div cass="columns twelve">
      <div class="columns three"><a href="<?php echo site_url('view-shop-cart')?>" class="shopForms" id="viewCartLink"><?php echo __("View Cart")?></a></div>
      <div class="columns three clsFloatRight">
      	<?php
        	if(is_user_logged_in())
			{
		?>
      		<a href="<?php echo  wp_logout_url( site_url() )?>"><?php echo __("Logout")?></a>
        <?php
			}
		?>
      </div>
      <div class="clear"></div>
      <div>
        <a href="<?php echo site_url('confirm-address')?>" class="shopForms" id="confirmAddress"></a>
        <a href="<?php echo site_url('order-summary')?>" class="shopForms" id="ordersummary"></a>
        <a href="<?php echo site_url('order-history')?>" class="shopForms" id="orderHistoryLink"></a>
        <a href="<?php echo site_url('my-account')?>" class="shopForms" id="myaccountLink"></a>
        <a href="<?php echo site_url('edit-my-account')?>" class="shopForms" id="editmyaccountLink"></a>
        <a href="<?php echo site_url('ooco-products')?>" class="shopForms" id="productList"></a>
        <a href="<?php echo site_url('ooco-products')?>?countinueOneToOneShop=yes" class="shopForms" id="countinueOneToOneShop"></a>
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
</div>