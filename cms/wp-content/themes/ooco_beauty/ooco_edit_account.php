<?php
/*
	Template Name: OOCO Edit my account
*/
global $wpdb;
	
$user_id=0;
		
$current_user = wp_get_current_user();

$user_id=$current_user->ID;

if ( $user_id == 0) {
	$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
	
	echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
	exit;
}

$useraddresssql="SELECT * from ".$wpdb->prefix."useraddress WHERE refUserId = ".$user_id." AND status=1";

$wp_useraddress=$wpdb->get_results( $useraddresssql );
	
	//var_dump($current_user->user_nicename);
?>
<style type="text/css">
#editMyAccountPage .userForms {
	margin:10px 0 0;
}
#editMyAccountPage .userForms .dispVal {
	line-height:35px;
}
#editMyAccountPage .userAddressDetails {
	border-bottom:1px dashed #000000;
}
.myAccountDetails {
	margin:0 0 10px 0;
}
.myAccountDetails .clsProductTle, .myAddressDetails .clsProductTle {
	border-bottom: 1px solid #000000;
	padding: 0 0 5px;
}
.myAddressDetails .userAddressDetails {
	margin:0 0 10px 0;
}
.userAddressDetails .label {
	font-size:12px;
	font-weight:bold;
}
#editMyAccountPage .userForms {
	height:300px;
}
.addressOptions {
	position:absolute;
	right:10px;
	z-index:1;
}
.addressOptions a {
	display:inline-block;
	background:#000000;
	color:#FFFFFF;
	margin:5px 3px;
	padding:5px;
	cursor:pointer;
	border-radius:3px;
}
.addressOptions a:hover {
	text-decoration:none;
}
</style>
<div id="editMyAccountPage">
  <div class="errorCon" id="messageBox"> </div>
  <div class="clsProductTle"><?php echo __("Edit your details")?> </div>  
  <div class="userForms" style="margin:15px 0 0 0; height:600px;">
    <div class="myAccountDetails">     
    <form action="#" method="post" id="changeUserDetailFrm" name="changeUserDetailFrm">	        
      <div class="formField">
        <div class="columns four left label"><?php echo __("Name")?> </div>
        <div class="clsFloatLeft columns eight left"> 
        	<input type="text" name="name" value="<?php echo $current_user->user_nicename?>" id="name" class="clsInput"/>			
         </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"><?php echo __("Mobile")?> </div>
        <div class="clsFloatLeft columns eight left dispVal">
          <?php 
				$ooco_user_contact_no = get_user_meta($user_id, 'ooco_user_contact_no', $single);
				
				if($ooco_user_contact_no=="")
				{
					$userDefaultAddress=getDefaultAddress($user_id);
					
					if(!empty($userDefaultAddress))
						update_user_meta( $user_id, 'ooco_user_contact_no', $userDefaultAddress[0]->mobile);
					
					$ooco_user_contact_no =$userDefaultAddress[0]->mobile;						
				}
				else
					$ooco_user_contact_no=$ooco_user_contact_no;
			?>
            <input type="text" name="mobile" value="<?php echo $ooco_user_contact_no?>" id="mobile" class="clsInput" />
        </div>
        <div class="clear"></div>
      </div>
      <div class="formField">
        <div class="columns four left label"><?php echo __("Email")?> </div>
        <div class="clsFloatLeft columns eight left"> 
			<input type="text" name="email" value="<?php echo $current_user->user_email?>" id="email" class="clsInput" readonly />
        </div>
        <div class="clear"></div>
      </div>
      <div class="EditMyaccountOptions frmSubmit">
      	<input type="submit" name="updateUserAccount" id="updateUserAccount" value="<?php echo __("Save")?>" class="boxShadow"/>
      </div>
    </form>
    </div>
    <div class="clsProductTle"><?php echo __("Change password")?> </div>
    <div class="myAccountDetails"> 
     <form action="#" method="post" id="changePwdFrm" name="changePwdFrm">	     
          <div class="formField">
            <div class="columns four left label"><?php echo __("new password")?> </div>
            <div class="clsFloatLeft columns eight left"> 
                <input type="password" name="password" id="password" class="clsInput"/>			
             </div>
            <div class="clear"></div>
          </div>      
          <div class="formField">
            <div class="columns four left label"><?php echo __("confirm password")?> </div>
            <div class="clsFloatLeft columns eight left"> 
                <input type="password" name="confirm_new_password" id="confirm_new_password" class="clsInput" />
            </div>
            <div class="clear"></div>
          </div>
          <div class="EditMyaccountOptions frmSubmit">
            <input type="submit" name="updateUserPassword" id="updateUserPassword" value="<?php echo __("Save")?>" class="boxShadow"/>
          </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
jQuery(document).ready(function($){
	jQuery(".addressOptions .delAdd").click(function(e){
		e.preventDefault();
		var delAddConId=jQuery(this).attr("id");
		var delAddId = delAddConId.replace("delAdd","");
		var delConfirm=confirm("<?php echo __("Are you want sure delete this address?")?>");		
		
		jQuery("#editMyAccountPage .errorCon").html('');
			   
		jQuery("#editMyAccountPage .errorCon").removeClass("error");
					 
		jQuery("#editMyAccountPage .errorCon").removeClass("success");
		
		if(delConfirm)
		{
			jQuery.ajax({type: "POST",url: admin_url,data:'delAddConId='+delAddId+"&action=my_front_end_action&deleteuserAddress=yes",async:false,success: function(data) {
			 	var json_data=jQuery.parseJSON(data);
				
				if(json_data.errors)
				{
					jQuery("#editMyAccountPage .errorCon").addClass("error");
					
					jQuery("#editMyAccountPage .errorCon").html(json_data.errors.message);
				}
				if(json_data.error)
				{
					jQuery("#editMyAccountPage .errorCon").addClass("error");
					
					jQuery("#editMyAccountPage .errorCon").html(json_data.error.message);
					
				}
				if(json_data.success)
				{
					jQuery("#editMyAccountPage .errorCon").addClass("success");
					
					jQuery("#editMyAccountPage .errorCon").html(json_data.success.message);
					
					jQuery("#"+json_data.success.delAddConId).fadeOut(1000,function(){
						jQuery("#"+json_data.success.delAddConId).remove();
					})
				}
				
				/*jQuery("#userAddressDetails"+delAddId).fadeOut(1000,function(){
					jQuery("#userAddressDetails"+delAddId).remove()
				})
				alert("Address has been deleted");*/
			}})			
		}
	})
		
	jQuery("a.editAdd").click(function(e){
		e.preventDefault();	
		jQuery("#ajax .userMangeAddress").remove();
		jQuery("#ajax").append("<div class='userMangeAddress'></div>");
		
		jQuery("#ajax .userMangeAddress").load(jQuery(this).attr("href"),function(response, status, xhr){
			if (status == "error") {
														
			}
			else
			{
				//formScorllApplied=false;	
				//setTimeout('showShopFrm()',1000);
			}
		})
	})
})
</script>
