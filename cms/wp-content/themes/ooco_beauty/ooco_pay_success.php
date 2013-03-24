<?php
/*
	Template Name: OOCO payment sucess
*/
global $wpdb;
	
$user_id=0;
		
$current_user = wp_get_current_user();

$user_id=$current_user->ID;

$username=$current_user->display_name;
	
?>
<div class="shopAnimation" id="shopOrder">
<div class="clsProductTle"><?php echo __("Thank you")?></div>
<div id="payThankPage">
  <div class="columns twelve payThankCon">
  <?php
  	if ( $user_id == 0) {
		$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
		echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
		exit;
	}
  ?>  	
    <div class="userForms" style="height:430px; margin:10px 0 0;">
    	<?php 
			echo __("HI ").$username.",";
			echo "<p>Thank you for your order in OOCO.Please <a href='".site_url('invoice-download')."?invoice_id=".$_GET["success_invoice"]."' target='_blank' style='color:#D71E25'>click here</a> download you last order Invoice.</p>";
		?>        
    </div>
  </div>
  <div class="atBottom">
    <div class="clsCloseCon">
      <div cass="columns twelve"> 
      <a href="<?php echo site_url('confirm-address')?>" class="shopForms" id="confirmAddress"></a>
        <a href="<?php echo site_url('order-summary')?>" class="shopForms" id="ordersummary"></a>
        <a href="<?php echo site_url('order-history')?>" class="shopForms" id="orderHistoryLink"></a>
        <a href="<?php echo site_url('my-account')?>" class="shopForms" id="myaccountLink"></a>
        <a href="<?php echo site_url('edit-my-account')?>" class="shopForms" id="editmyaccountLink"></a>
        <a href="<?php echo site_url('ooco-products')?>" class="shopForms" id="productList"></a>
        <a href="<?php echo site_url('ooco-products')?>?countinueOneToOneShop=yes" class="shopForms" id="countinueOneToOneShop"></a>
        <a href="<?php echo site_url('shop-login')?>?message=confirm" class="confirmLogin" title="confirmLogin"></a>
      	<a href="#" class="closeShop"><?php echo __("Close")?></a>
      </div>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">
jQuery(document).ready(function($){
	jQuery("#editMyAccount").click(function(e){
		e.preventDefault();
		$("#editmyaccountLink").trigger("click");
	})
	$("#OrderHistory").live("click",function(e){
		e.preventDefault();		 
		jQuery("#orderHistoryLink").trigger("click");
	})
})
</script>