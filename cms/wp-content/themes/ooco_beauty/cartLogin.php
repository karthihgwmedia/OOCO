<?php
/*
	Template Name: OOCO Shop Login
*/
?>
<div id="loginPage" class="userForms">
<form id="loginFrm" name="loginFrm" action="#" method="post">
  <div class="FrmDesc formField">
    <div class="columns three left clsTitle"><?php echo __("Log-in")?></div>
    <div class="columns eight left clsFrmDesc"><?php echo __("If you are a new customer please register")?> <a href="<?php echo site_url('shop-register')?>" class="shopForms"><?php echo __("HERE")?></a>. </div>
    <div class="clear"></div>
  </div>
  <div class="formField">
    <div class="columns four left label"> Email Address </div>
    <div class="clsFloatLeft columns eight left">
      <input type="text" name="email" id="email" class="clsInput"/>
    </div>
    <div class="clear"></div>
  </div>
  <div class="formField">
    <div class="columns four left label"> Password </div>
    <div class="clsFloatLeft columns eight left">
      <input type="password" name="password" id="password"  class="clsInput"/>
    </div>
    <div class="clear"></div>
  </div>
  <div class="formField frmSubmit">
    <input type="submit" name="LoginfrmSubmit" id="LoginfrmSubmit" value="submit" class="boxShadow"/>
  </div>
</form>
</div>