<?php
/*
	Template Name: OOCO Add Address Page
*/
	$user_id=0;
			
	$current_user = wp_get_current_user();
	
	$user_id=$current_user->ID;
	
	if ( $user_id == 0) {
		$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
		echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
		exit;
	}
?>
<style type="text/css">
.options
{
	text-align:left;
	padding:8px 0 0 0;
}
</style>
<div id="addAddressPage">
  <div class="clsProductTle"><?php echo __("Manage Address")?> </div>
  <div class="clsBenefitsDesc">
    <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
  </div>
  <div class="userForms">
    <form id="addAddressFrm" name="addAddressFrm" action="#" method="post">
      <div class="errorCon"></div>
      <div class="formField">
        <div class="columns four left label"> <?php echo __("Address");?> </div>
        <div class="clsFloatLeft columns eight left">
          <select name="manageAddress" id="manageAddress" class="clsInputSelect">
            <option value="0"><?php echo __("New")?></option>
            <?php 
                echo getUserAddressDropdown($user_id);
            ?>
          </select>
        </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"> <?php echo __("Mobile Number");?> </div>
        <div class="clsFloatLeft columns eight left">
          <input type="text" name="mobile" id="mobile" class="clsInput"/>
        </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"> <?php echo __("Address line 1")?> </div>
        <div class="clsFloatLeft columns eight left">
          <input type="text" name="address_1" id="address_1"  class="clsInput"/>
        </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"> <?php echo __("Address line 2")?> </div>
        <div class="clsFloatLeft columns eight left">
          <input type="text" name="address_2" id="address_2"  class="clsInput"/>
        </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"><?php echo __("Emirate")?> </div>
        <div class="clsFloatLeft columns eight left">
          <select class="clsInputSelect" id="emirate" name="emirate">
            <option value=""><?php echo __("Select Emirate")?></option>
            <?php echo get_drop_down_box('emirate','status=1','id','name');?>
          </select>
        </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"> <?php echo __("Area")?> </div>
        <div class="clsFloatLeft columns eight left">
          <select class="clsInputSelect" id="location" name="location">
            <option value=""><?php echo __("Select Area")?></option>
          </select>
        </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"> <?php echo __("PO Box")?> </div>
        <div class="clsFloatLeft columns eight left">
          <input type="text" name="po_box" id="po_box"  class="clsInput"/>
          <?php wp_nonce_field('user_reg_validate','user_reg');?>
        </div>
        <div class="clear"></div>
      </div>
	  <?php
      /*if(isset($_GET["address_id"]))
      {
      ?>
        <div class="formField">
            <div class="columns four left label"> <?php echo __("Make it Default")?> </div>
            <div class="clsFloatLeft columns eight left">
             	<p class="options"><input type="radio" value="1" name="address_default_opt" /><?php echo __("Yes")?> &nbsp; <input type="radio" value="0" name="address_default_opt"/><?php echo __("No")?></p>
            </div>
            <div class="clear"></div>
      </div>
      <?php
      }*/
      ?>
      <div class="formField frmSubmit">
        <input type="submit" name="addAddressFrmSubmit" id="addAddressFrmSubmit" value="<?php echo __("Add")?>" class="boxShadow"/>
        &nbsp;&nbsp;
        <input type="button" name="addAddressFrmCancel" id="addAddressFrmCancel" value="<?php echo __("Cancel")?>" class="boxShadow"/>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
jQuery(document).ready(function($){
	var v = jQuery("#addAddressFrm").validate({
			rules :{mobile:{required:true},emirate:{required:true},location:{required:true},po_box:{required:true},address_1:{required:true}},
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
			   jQuery("#addAddressFrm .errorCon").html('');
			   
			    jQuery("#addAddressFrm .errorCon").removeClass("error");
					 
				 jQuery("#addAddressFrm .errorCon").removeClass("success");
				  
			   jQuery.ajax({url:admin_url,type:"POST",data:$("#addAddressFrm").serialize()+"&action=my_front_end_action&updateAddress_user=yes",
			   			success:function(responce){
								responce=jQuery.parseJSON(responce);
								  if(responce.errors)
								   {
										jQuery("#addAddressFrm .errorCon").addClass("error");
					
				 	 					jQuery("#addAddressFrm .errorCon").html(responce.errors.message);
								   }
								  if(responce.error)
								   {
										jQuery.each(responce.error,function(index,val){	
											//alert(index);
											jQuery("#"+index).parent().append("<p class='error'>"+val+"</p>");											
										})
								   }
								   if(responce.success)
								   {
									   jQuery("#addAddressFrm").find('input:text, input:password, input:file, select, textarea').val('');
									   
									   jQuery("#emirate").trigger("change");
									   	
									   jQuery("#location").trigger("change");									  
									   
									   if(responce.success.message)
									   {
									   		<?php
											if(isset($_GET["address_id"]))
											{
												echo '$("#myaccountLink").trigger("click");$("#addAddressFrmCancel").trigger("click"); return false;';
											}
											else
											{
											?>
												jQuery("#addAddressFrm .errorCon").addClass("success");
												
												jQuery("#addAddressFrm .errorCon").html(responce.success.message);
											<?php
											}
											?>
									   }
									   
									   if(responce.success.newOptions)
									   {
									   		/*$("#shopOrder .selectAddress select").html("<option value='0'>Select Address</option>");
											$("#shopOrder .selectAddress select").append(responce.success.newOptions);*/
											$("#viewCartLink").trigger("click");
									   		$("#manageAddress").html("<option value='0'>New</option>");
									   		$("#manageAddress").append(responce.success.newOptions);
											
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
	<?php
	if(isset($_GET["address_id"]))
	{
		echo '$("#manageAddress").val("'.$_GET["address_id"].'");$("#manageAddress").trigger("change")';
	}
	?>
})
</script>
