<?php
/*
	Template Name: OOCO Shop Login
*/
?>
<div id="loginPage" class="userForms">
<form id="loginFrm" name="loginFrm" action="#" method="post">
  <div class="FrmDesc formField">
    <div class="columns three left clsTitle"><?php echo __("Log-in")?></div>
    <div class="columns eight left clsFrmDesc">
		<?php 
			if(isset($_GET["message"]) && $_GET["message"]=="confirm")
				echo __("Please confirm your details");
            else    
				echo __("If you are a new customer please register").'<a href="'.site_url('shop-register').'" class="shopForms">'. __("HERE").'</a>.';
		?>
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
    <div class="columns four left label"> Password </div>
    <div class="clsFloatLeft columns eight left">
      <input type="password" name="password" id="password"  class="clsInput"/>
        <?php wp_nonce_field('user_login_validate','user_log');?>
    </div>
    <div class="clear"></div>
  </div>
  <div class="formField frmSubmit">
    <input type="submit" name="LoginfrmSubmit" id="LoginfrmSubmit" value="submit" class="boxShadow"/>
  </div>
</form>
</div>
<script type="text/javascript">
jQuery(document).ready(function($){
	jQuery("#LoginfrmSubmit").click(function(e){
		e.preventDefault();
		jQuery("#loginFrm").submit();
	})
	var v = jQuery("#loginFrm").validate({
			rules :{email:{required:true,email:true},password:{required:true}},
			onfocusout: false,
    		onkeyup: false,
		    onclick: false,
			errorElement:"p",
			errorPlacement:function(error, element) {
				//alert( element.parent().html());
    			error.appendTo(element.parent());
		   }
		   ,submitHandler :function()
		   {
			 	/*  jQuery("#regfrmSubmit").hide();
			   jQuery(".loading_img").show();*/
			   jQuery.ajax({url:admin_url,type:"POST",data:$("#loginFrm").serialize()+"&action=my_front_end_action&login_user=yes",
			   			success:function(responce){
								responce=jQuery.parseJSON(responce);
								if(responce.error)
								   {
										jQuery.each(responce.error,function(index,val){	
											//alert(index);
											jQuery("#"+index).parent().append("<p class='error'>"+val+"</p>");											
										})
								   }
								   if(responce.success)
								   {
									   jQuery("#loginFrm").find('input:text, input:password, input:file, select, textarea').val('');
									   
									   if(responce.success.redirect=='product_page')
									   {
									   		<?php
												if(isset($_GET["message"]) && $_GET["message"]=="confirm")
													echo '$(".closeShop").trigger("click");$(".shopOrderLink").trigger("click");';
												else
													echo '$(".closeShop").trigger("click");$(".shopOrderLink").trigger("click");';
											?>
									   }
									   else if(responce.success.redirect=='login_page')
									   {	
										   	$(".confirmLogin").trigger("click");
									   }
									  // close_zoom_box();
								   }
								/*jQuery("#signUpSubmit").show();
				        		jQuery(".loading_img").hide();*/
							}
			   });
		   }
	});
})

</script>
