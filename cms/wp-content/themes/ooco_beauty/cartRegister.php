<?php
/*
	Template Name: OOCO Shop Register
*/
?>

<div id="registerPage" class="userForms">
  <form id="registerFrm" name="registerFrm" action="#" method="post">
    <div class="FrmDesc formField">
      <div class="columns three left clsTitle">Register</div>
      <div class="columns eight left clsFrmDesc"> If you are a alreay customer please login <a href="<?php echo site_url('shop-login')?>" class="shopForms">HERE</a>. </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> Name </div>
      <div class="clsFloatLeft columns eight left">
        <input type="text" name="name" id="name" class="clsInput"/>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> Mobile Number </div>
      <div class="clsFloatLeft columns eight left">
        <input type="text" name="mobile" id="mobile" class="clsInput"/>
      </div>
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
      <div class="columns four left label"> New Password </div>
      <div class="clsFloatLeft columns eight left">
        <input type="password" name="password" id="password"  class="clsInput"/>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> Repeat Password </div>
      <div class="clsFloatLeft columns eight left">
        <input type="password" name="password" id="password"  class="clsInput"/>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField frmSubmit">
      <input type="submit" name="regfrmSubmit" id="regfrmSubmit" value="submit" class="boxShadow"/>
    </div>
  </form>
</div>
