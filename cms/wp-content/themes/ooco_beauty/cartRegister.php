<?php
/*
	Template Name: OOCO Shop Register
*/
?>
<style type="text/css">
.userForms
{
	height:450px;
}
</style>
<div id="registerPage">
  <div class="clsProductTle"><?php echo __("My Cart")?> </div>
  <div class="clsBenefitsDesc">
    <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
  </div>
  <div class="userForms">
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
        <input type="password" name="re_password" id="re_password"  class="clsInput"/>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> Address line 1 </div>
      <div class="clsFloatLeft columns eight left">
        <input type="text" name="address_1" id="address_1"  class="clsInput"/>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> Address line 2 </div>
      <div class="clsFloatLeft columns eight left">
        <input type="text" name="address_2" id="address_2"  class="clsInput"/>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> Emirate </div>
      <div class="clsFloatLeft columns eight left">
        <select class="clsInputSelect" id="emirate" name="emirate">
            <option value=""><?php echo __("Select Emirate")?></option>
          	<?php echo get_drop_down_box('emirate','status=1','id','name');?>
      </select>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> Area </div>
      <div class="clsFloatLeft columns eight left">
        <select class="clsInputSelect" id="location" name="location">
            <option value=""><?php echo __("Select Area")?></option>
      </select>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField">
      <div class="columns four left label"> PO Box </div>
      <div class="clsFloatLeft columns eight left">
        <input type="text" name="po_box" id="po_box"  class="clsInput"/>
        <?php wp_nonce_field('user_reg_validate','user_reg');?>
      </div>
      <div class="clear"></div>
    </div>
    <div class="formField frmSubmit">
      <p class="regQuestion">
      	Do you want to save your details or later ?
      </p>	
      <input type="submit" name="regfrmSubmit" id="regfrmSubmit" value="<?php echo __("Yes")?>" class="boxShadow"/>&nbsp;&nbsp;
      <input type="submit" name="regfrmSubmit" id="regfrmSubmitNo" value="<?php echo __("No")?>" class="boxShadow"/>
    </div>
  </form>
  </div>
</div>
<script type="text/javascript">
jQuery(document).ready(function($){
	var v = jQuery("#registerFrm").validate({
			/*rules :{name:{required:true},email:{required:true,email:true},mobile:{required:true},emirate:{required:true},location:{required:true},password:{required:true},re_password:{required:true},po_box:{required:true},address_1:{required:true}},*/
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
			   jQuery.ajax({url:admin_url,type:"POST",data:$("#registerFrm").serialize()+"&action=my_front_end_action&save_user=yes",
			   			success:function(responce){
								responce=jQuery.parseJSON(responce);
								if(responce.error)
								   {
										jQuery.each(responce.error,function(index,val){	
											//alert(index);
											if(index=="email" || index=="mobile" || index=="name" || index=="password")
											{
												jQuery("#ajax #shopOrder .userForms").mCustomScrollbar("scrollTo","top");	
											}
											jQuery("#"+index).parent().append("<p class='error'>"+val+"</p>");
											
											jQuery("#"+index).focus();											
										})
								   }
								   if(responce.success)
								   {
									   jQuery("#registerFrm").find('input:text, input:password, input:file, select, textarea').val('');
									   jQuery("#emirate").trigger("change");
									   jQuery("#location").trigger("change");									  
									   
									   if(responce.success.redirect=='product_page')
									   {
									   		//$(".closeShop").trigger("click");
											
											$("#productList").trigger("click");
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
