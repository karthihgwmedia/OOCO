<?php
function getProductAvailability($product_id,$reqQty=0,$temp_book=1)
{
	global $wpdb;
	
	$availability=0;
	
	$totalavailability=getProductQuantity($product_id);
	
	$availability=$totalavailability;
	
	if($temp_book)
	{
		$wp_temp_cartSql="SELECT SUM(quantity) as Qty from ".$wpdb->prefix."temp_cart WHERE status= 1 AND product_id = ".$product_id;
		//echo $wp_temp_cartSql;	
		$wp_temp_cart=$wpdb->get_results( $wp_temp_cartSql );	
		
		if(!empty($wp_temp_cart))
		{
			$availability=($availability)-($wp_temp_cart[0]->Qty);	
		}
	}
	//var_dump($availability);
	
	$wp_confirm_cartSql="SELECT SUM(quantity) as Qty from ".$wpdb->prefix."confirm_cart WHERE status= 1 AND product_id = ".$product_id;
			
	$wp_confirm_cart=$wpdb->get_results( $wp_confirm_cartSql );
	
	if(!empty($wp_confirm_cart))
	{	
		if(isset($wp_confirm_cart[0]->Qty))
			$availability=($availability)-($wp_confirm_cart[0]->Qty);	
	}
	
	if($reqQty!=0)
		$availability=($availability)-($reqQty);
	
	//var_dump($availability);
		
	/*if($availability<0)
		$availability=0;*/
			
	//echo $availability;
	
	return $availability;
	
}
function getPrductMetaData($product_id,$metakey)
{
	if($product_id!=0 && $metakey!="")
	{
		return get_post_meta( $product_id, $metakey, true );
	}
	return 0;
}
/*getProductAvailability(63,3);
exit;*/
function getProductQuantity($product_id)
{
	return getPrductMetaData($product_id,'ooco_product_detail_qty');
}
function getProductById($product_id)
{
	$productDetails=get_post( $product_id ,ARRAY_A);
	
	if(!empty($productDetails))
		return $productDetails;
}
function getDefaultAddress($user_id=0)
{
	global $wpdb;
	
	$defaultAddress=array();
	
	if($user_id!=0)
	{
		$defaultAddressSql="SELECT * from ".$wpdb->prefix."useraddress WHERE refUserId=".$user_id." AND defaultAddress = 1";
	
		$defaultAddress=$wpdb->get_results( $defaultAddressSql );
	}
	
	return $defaultAddress;
}
function deleteOldCart()
{
	global $wpdb;
	
	$delCartQuery="SELECT * from ".$wpdb->prefix."temp_cart WHERE status=1";
	
	$bookingdetailwksp=$wpdb->get_results( $delCartQuery );
	
	$wp_temp_cart['status']=0;
	
	if(!empty($bookingdetailwksp))
	{
		foreach($bookingdetailwksp as $bookingdetail)
		{
			if($bookingdetail->checkedout)
			{
			
				if(TIMESTAMPDIFF($bookingdetail->date_time)>30)
				{
					$wpdb->update($wpdb->prefix.'temp_cart',$wp_temp_cart,array("refBookingId"=>$bookingdetail->id));
				}
			}
			else
			{
				if(TIMESTAMPDIFF($bookingdetail->date_time)>15)
				{
					$wpdb->update($wpdb->prefix.'temp_cart',$wp_temp_cart,array("refBookingId"=>$bookingdetail->id));
				}
			}
		}
	}
	
}
add_action("init","deleteOldCart");

function TIMESTAMPDIFF($date)
{
	global $wpdb;
	
	$query="SELECT TIMESTAMPDIFF(MINUTE , '".$date."', '".current_time('mysql')."' ) AS minutes";
	
	//echo $query;
	
	$timediff=$wpdb->get_results($query);	
	
	if(!empty($timediff))
		return $timediff[0]->minutes;
	else
		return 0;
	
}
function oocologoutAction()
{
	
	global $wpdb;
	
	$user_id=0;
			
	$current_user = wp_get_current_user();
		
	$user_id=$current_user->ID;
	
	/*var_dump($user_id,$_SESSION["wp_temp_cart_id"]);
	
	exit('call');*/
	
	$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];
	
	$_SESSION["wp_temp_cart_id"]=0;
	
	unset($_SESSION["wp_temp_cart_id"]);
	
	$wp_temp_cart['status']=0;
	
	/*$updatQuery='UPDATE TABLE '.$wpdb->prefix.'temp_cart SET status=0 WHERE refBookingId='.$wp_temp_cart_id." AND refUserId=".$user_id;
	
	echo $updatQuery;
	exit;
	
	$wpdb->query($updatQuery);*/
	
	$wpdb->update($wpdb->prefix.'temp_cart',$wp_temp_cart,array("refBookingId"=>$wp_temp_cart_id,"refUserId"=>$user_id));
	
	
	
}
add_action('wp_logout', 'oocologoutAction');
function get_drop_down_box($table_name,$where='',$valueField='',$displayField='',$sel='',$type='html')
{
	global $wpdb;	
	
	$option_datas=array();
	
	$options='';
	
	$sql="SELECT ".$valueField.", ".$displayField." FROM ".$wpdb->prefix.$table_name;
	
	if($where!="")
		$sql=$sql." WHERE ".$where;
	
	//echo $sql;
		
	$option_datas=$wpdb->get_results( $sql );
	 
	/*var_dump($option_datas);*/
	
	if(!empty($option_datas))
	{
		foreach ($option_datas as $key=>$datas)
		{
			if($type=='html')
			{
				if($sel!="" && $sel==$datas->$valueField)
					$options.='<option value=\''.$datas->$valueField.'\' selected="selected">'.$datas->name.'</option>';
				else
					$options.='<option value=\''.$datas->$valueField.'\'>'.$datas->name.'</option>';
			}
			else
			{
				$options[$datas->$valueField]=$datas->name;
			}	
		}
	}
	
	return $options;
	
}
function printAddress($user_id,$addressId=0)
{
	global $wpdb;
	
	$sql="SELECT * from ".$wpdb->prefix."useraddress WHERE refUserId = ".$user_id." AND status=1 AND id =".$addressId;
	
	$wp_useraddress=$wpdb->get_results( $sql );
	
	if(!empty($wp_useraddress))
	{
		foreach($wp_useraddress as $wp_useradd)
		{
			$optionslabel['mobile'] = '<span class="userMobile">'.$wp_useradd->mobile.'</span>';
			
			$optionslabel['address_1']='<span class="userAddress1">'.$wp_useradd->address_1.'</span>';
			
			$optionslabel['address_2']='<span class="userAddress2">'.$wp_useradd->address_2.'</span>';
			
			$locationData=getValueById('location',$wp_useradd->location);
			
			if(!empty($locationData[0]))
				$optionslabel['location']='<span class="userLocation">'.ucfirst($locationData[0]->name).'</span>';
			
			$emirateData=getValueById('emirate',$wp_useradd->emirate);
			
			if(!empty($emirateData[0]))
				$optionslabel['emirate']='<span class="userEmirate">'.ucfirst($emirateData[0]->name).'</span>';
				
			$optionslabel['country']='<span class="userEmirate">United Arab Emirates</span>';	
		}
	}
	
	if(!empty($optionslabel))
		return implode("",$optionslabel);
	else
		return "";
}
function getUserAddressDropdown($user_id,$addressId=0,$output='html')
{
	global $wpdb;
	
	$sql="SELECT * from ".$wpdb->prefix."useraddress WHERE refUserId = ".$user_id." AND status=1";
	
	if($output!="html" && $addressId!=0)
		$sql="SELECT * from ".$wpdb->prefix."useraddress WHERE refUserId = ".$user_id." AND status=1 AND id =".$addressId;
	
	
	$wp_useraddress=$wpdb->get_results( $sql );
	
	$optionsText='';
	
	$optionslabel=array();
	
	$options=array();
	
	$emirateData=array();
		
	$selAttribute='';
		
	if(!empty($wp_useraddress))
	{
		foreach($wp_useraddress as $wp_useradd)
		{
			$optionslabel=array();
			
			if(strlen($wp_useradd->address_1)>20)
				 $optionslabel[]=substr($wp_useradd->address_1,0,20)."...";
			else
				 $optionslabel[]=$wp_useradd->address_1;
			
			$locationData=getValueById('location',$wp_useradd->location);
			
			if(!empty($locationData[0]))
				$optionslabel[]=ucfirst($locationData[0]->name);
			
			$emirateData=getValueById('emirate',$wp_useradd->emirate);
			
			if(!empty($emirateData[0]))
				$optionslabel[]=ucfirst($emirateData[0]->name);
			
			if($addressId==$wp_useradd->id)
				$selAttribute=" selected=selected";
			else
				$selAttribute='';
			
			if($output=='html')	
				$options[]='<option value="'.$wp_useradd->id.'"'.$selAttribute.'>'.implode(", ",$optionslabel)."</option>";
			else
				$options=$optionslabel;
		}
		
		if(!empty($options))
		{
			if($output=='html')	
				return implode("",$options);
			else
				return $options;
				
		}
		else
			return "";
		
	}
}
?>
