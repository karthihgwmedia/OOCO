<?php
/*
	Template Name: OOCO My account
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
	
	if(isset($_GET["product_id"]))
		$_SESSION["session_product_id"]=$_GET["product_id"];
	else
		$_SESSION["session_product_id"]=0;
	//var_dump($current_user->user_nicename);
?>
<style type="text/css">
#myAccountPage .userForms
{
	margin:0px 0 0;		
}
#myAccountPage .userForms .dispVal
{
	line-height:35px;	
}
#myAccountPage .userAddressDetails
{
	border-bottom:1px  dashed #000000;
}
.myAccountDetails
{
	margin:0 0 10px 0;
}
.myAccountDetails .clsProductTle,.myAddressDetails .clsProductTle
{
	border-bottom: 1px solid #000000;
    padding: 0 0 5px;
}
.myAddressDetails .userAddressDetails
{
	margin:0 0 10px 0;
}
.userAddressDetails .label
{
	font-size:12px;
	font-weight:bold;
}
#myAccountPage .userForms
{
	height:460px;	
}
.addressOptions
{
	position:absolute;
	right:10px;
	z-index:1;
}
.addressOptions a
{
	display:inline-block;
	background:#000000;
	color:#FFFFFF;
	margin:5px 3px;
	padding:5px;
	cursor:pointer;
	border-radius:3px;
	
}
.addressOptions a:hover
{
	text-decoration:none;
}
</style>
<div id="myAccountPage">
  <div class="errorCon" id="messageBox"> </div>
  <div class="userForms">
  	 <div class="myAccountDetails">
     <div class="clsProductTle"><?php echo __("My Details")?> </div>	
      <div class="formField">
          <div class="columns four left label"><?php echo __("Name")?> </div>
          <div class="clsFloatLeft columns eight left dispVal">
            <?php echo $current_user->user_nicename?>
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
					
					echo $userDefaultAddress[0]->mobile;						
				}
				else
					echo $ooco_user_contact_no;
			?>
          </div>
          <div class="clear"></div>
      </div>
      <div class="formField">
          <div class="columns four left label"><?php echo __("Email")?> </div>
          <div class="clsFloatLeft columns eight left dispVal">
            <?php echo $current_user->user_email?>
          </div>
          <div class="clear"></div>
      </div>  
     </div>
     <div class="myAddressDetails">
     	<div class="clsProductTle"><?php echo __("My Address Details")?> </div>	             
     	<?php
			if(!empty($wp_useraddress))
			{
				$addressData=array();
				
				foreach($wp_useraddress as $wp_useraddres)
				{
					$addressData=printAddress($user_id,$wp_useraddres->id,'array');
					//var_dump($addressData['mobile']);
				?>
					<div class="userAddressDetails" id="userAddressDetails<?php echo $wp_useraddres->id?>">
                    	<div class="addressOptions">
                        	<a href="#" class="delAdd" id="delAdd<?php echo $wp_useraddres->id?>">Delete</a>
                            <a href="<?php echo site_url("add-address")."?address_id=".$wp_useraddres->id;?>" class="editAdd" id="editAdd<?php echo $wp_useraddres->id?>">Edit</a>
                        </div>
                    	<div class="formField">
                          <div class="columns four left label"><?php echo __("Address Line 1")?> </div>
                          <div class="clsFloatLeft columns eight left dispVal">
                            <?php echo $addressData['address_1'];?>
                          </div>
                          <div class="clear"></div>
                      </div>
	                    <div class="formField">
                          <div class="columns four left label"><?php echo __("Address Line 2")?> </div>
                          <div class="clsFloatLeft columns eight left dispVal">
                            <?php echo $addressData['address_2'];?>
                          </div>
                          <div class="clear"></div>
                      </div>
                        <div class="formField">
                          <div class="columns four left label"><?php echo __("Area")?> </div>
                          <div class="clsFloatLeft columns eight left dispVal">
                            <?php echo $addressData['location'];?>
                          </div>
                          <div class="clear"></div>
                      </div>
                        <div class="formField">
                          <div class="columns four left label"><?php echo __("Emirate")?> </div>
                          <div class="clsFloatLeft columns eight left dispVal">
                            <?php echo $addressData['emirate']?>
                          </div>
                          <div class="clear"></div>
                      </div>
                      <div class="formField">
                          <div class="columns four left label"><?php echo __("PO Box")?> </div>
                          <div class="clsFloatLeft columns eight left dispVal">
                            <?php echo $addressData['po_box']?>
                          </div>
                          <div class="clear"></div>
                      </div>
                      <div class="formField">
                          <div class="columns four left label"><?php echo __("Country")?> </div>
                          <div class="clsFloatLeft columns eight left dispVal">
                            <?php echo $addressData['country']?>
                          </div>
                          <div class="clear"></div>
                      </div>
                      <div class="formField">
                          <div class="columns four left label"><?php echo __("Mobile")?> </div>
                          <div class="clsFloatLeft columns eight left dispVal">
                            <?php echo $addressData['mobile']?>
                          </div>
                          <div class="clear"></div>
                      </div>                 
                    </div>	
				<?php
                }
			}
        	//printAddress($user_id,$addressId=0)	
		?>
     </div>
  </div>
  <div class="MyaccountOptions frmSubmit">
  	 <input type="submit" name="OrderHistory" id="OrderHistory" value="<?php echo __("Order History")?>" class="boxShadow"/>&nbsp;&nbsp;&nbsp;
     
     <input type="submit" name="editMyAccountDetail" id="editMyAccountDetail" value="<?php echo __("Edit Myaccount")?>" class="boxShadow"/>     
  </div>
   <div class="MyaccountOptions frmSubmit">
    <input type="submit" name="countinueOneToOne" id="countinueOneToOne" value="<?php echo __("One to one")?>" class="boxShadow"/>&nbsp;&nbsp;&nbsp;      
   	<input type="submit" name="countinueOneToMany" id="countinueOneToMany" value="<?php echo __("One to many")?>" class="boxShadow"/>     
   </div>
</div>
<script type="text/javascript">
jQuery(document).ready(function($){
	jQuery("#editMyAccount").click(function(e){
		e.preventDefault();
		$("#editmyaccountLink").trigger("click");
	})
	$("#OrderHistory").click(function(e){
		 e.preventDefault();
		jQuery("#orderHistoryLink").trigger("click");
	})
	jQuery(".addressOptions .delAdd").click(function(e){
		e.preventDefault();
		var delAddConId=jQuery(this).attr("id");
		var delAddId = delAddConId.replace("delAdd","");
		var delConfirm=confirm("<?php echo __("Are you want sure delete this address?")?>");		
		
		jQuery("#myAccountPage .errorCon").html('');
			   
		jQuery("#myAccountPage .errorCon").removeClass("error");
					 
		jQuery("#myAccountPage .errorCon").removeClass("success");
		
		if(delConfirm)
		{
			jQuery.ajax({type: "POST",url: admin_url,data:'delAddConId='+delAddId+"&action=my_front_end_action&deleteuserAddress=yes",async:false,success: function(data) {
			 	var json_data=jQuery.parseJSON(data);
				
				if(json_data.errors)
				{
					jQuery("#myAccountPage .errorCon").addClass("error");
					
					jQuery("#myAccountPage .errorCon").html(json_data.errors.message);
				}
				if(json_data.error)
				{
					jQuery("#myAccountPage .errorCon").addClass("error");
					
					jQuery("#myAccountPage .errorCon").html(json_data.error.message);
					
				}
				if(json_data.success)
				{
					jQuery("#myAccountPage .errorCon").addClass("success");
					
					jQuery("#myAccountPage .errorCon").html(json_data.success.message);
					
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