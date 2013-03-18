<?php

include_once get_template_directory() . '/functions/inkthemes-functions.php';
$functions_path = get_template_directory() . '/functions/';
/* These files build out the options interface.  Likely won't need to edit these. */
require_once ($functions_path . 'admin-functions.php');  // Custom functions and plugins
require_once ($functions_path . 'admin-interface.php');  // Admin Interfaces (options,framework, seo)
/* These files build out the theme specific options and associated functions. */
require_once ($functions_path . 'theme-options.php');   // Options panel settings and custom settings

function inkthemes_wp_enqueue_scripts() {
    if (!is_admin()) {
        wp_enqueue_script('jquery');
        wp_enqueue_script('jquery_nicescroll', get_template_directory_uri() . "/javascripts/jquery.nicescroll-master/jquery.nicescroll.js", array('jquery'));
        wp_enqueue_script('modernizr_foundation', get_template_directory_uri() . '/javascripts/modernizr.foundation.js', array('jquery'));
		wp_enqueue_script('jquery-ui', get_template_directory_uri() . '/javascripts/jquery-ui.js', array('jquery'));
		wp_enqueue_script('jquery_validate', get_template_directory_uri() . '/javascripts/jquery.validate.js', array('jquery'));		
		wp_enqueue_script('jquerymousewheel', get_template_directory_uri() . '/javascripts/jquery.mousewheel.min.js', array('jquery'));
		wp_enqueue_script('mcustomScrollbar', get_template_directory_uri() . '/javascripts/jquery.mCustomScrollbar.js', array('jquery'));
		wp_enqueue_script('infieldlabel', get_template_directory_uri() . '/javascripts/jquery.infieldlabel.js', array('jquery'));
		
		wp_localize_script('mylib', 'WPULRS', array( 'site_url' => get_option('siteurl') ));
        wp_enqueue_script('common_js', get_template_directory_uri() . "/javascripts/common.js", array('jquery'));
    } elseif (is_admin()) {
        
    }
}

add_action('wp_enqueue_scripts', 'inkthemes_wp_enqueue_scripts');

function inkthemes_get_option($name) {
    $options = get_option('inkthemes_options');
    if (isset($options[$name]))
        return $options[$name];
}

function inkthemes_update_option($name, $value) {
    $options = get_option('inkthemes_options');
    $options[$name] = $value;
    return update_option('inkthemes_options', $options);
}

function inkthemes_delete_option($name) {
    $options = get_option('inkthemes_options');
    unset($options[$name]);
    return update_option('inkthemes_options', $options);
}

//Enqueue comment thread js
function inkthemes_enqueue_comment_reply() {
    if (is_singular() && comments_open() && get_option('thread_comments')) {
        wp_enqueue_script('comment-reply');
    }
}
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
function getUserAddressDropdown($user_id)
{
	global $wpdb;
	
	$sql="SELECT * from ".$wpdb->prefix."useraddress WHERE refUserId = ".$user_id." AND status=1";
	
	$wp_useraddress=$wpdb->get_results( $sql );
	
	$optionsText='';
	
	$optionslabel=array();
	
	$options=array();
	
	$emirateData=array();
		
	if(!empty($wp_useraddress))
	{
		foreach($wp_useraddress as $wp_useradd)
		{
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
			
			$options[]='<option value="'.$wp_useradd->id.'">'.implode(", ",$optionslabel)."</option>";
		}
		
		if(!empty($options))
			return implode("",$options);
		else
			return "";
		
	}
}
function getValueById($tableName,$id)
{
	global $wpdb;
	
	$sql="SELECT * from ".$wpdb->prefix.$tableName." WHERE id  = ".$id." AND status=1";
	
	$wp_datas=array();
	
	$wp_datas=$wpdb->get_results( $sql );
	
	return $wp_datas;
}
function front_ajax_fn()
{
	global $wpdb;
	
	if(isset($_POST["get_location"]) && $_POST["get_location"]=='yes')
	{
		extract($_POST);
		
		$returnData=array();
		
		$locations=get_drop_down_box('location','status=1 AND refCountryId='.$country_id,'id','name','',$type='json');
		
		if(!empty($locations))
		{
			$returnData['format']='json';
			$returnData['location_options']=$locations;
		}
		else
			$returnData['format']=0;
		
		echo json_encode($returnData);
		
	}
	if(isset($_POST["save_user"]) && $_POST["save_user"]=='yes')
	{
		extract($_POST);
		
		if(!wp_verify_nonce($_POST['user_reg'],'user_reg_validate') )
		{
			$errors['error']['email']="Sorry, your nonce did not verify.";
		}
		else
		{
			$user_email = esc_attr($_POST['email']);
	
			require_once(ABSPATH.WPINC.'/registration.php');
					 
			$sanitized_user_login = sanitize_user($user_login);
			
			$user_email = apply_filters('user_registration_email', $user_email);
			
			if(!is_email($user_email)) $errors['error']['email'] = 'invalid e-mail';
			
			elseif(email_exists($user_email)) $errors['error']['email'] = 'This email is already registered';
			
			if(isset($name) && $name!="")
			{
				if(strlen($name)<3)
					$errors['error']['name']='Name must be minimum three letters';			
			}
			else
				$errors['error']['name']='Name required';			
				
			/*if(isset($email) && $email!="")
			{
				if (!filter_var($email, FILTER_VALIDATE_EMAIL)) 
				{
					$error['error']['email']='Email id not valid';
				}			
			}
			else
				$error['error']['email']='Email id required';*/
			
			if(isset($password) && $password=="")
				$errors['error']['password']='Password required';
			
			if(isset($re_password) && $re_password=="")
				$errors['error']['re_password']='Password required';
			
			if($password!=$re_password)
			{
				$errors['error']['password'] = 'Password and confirm password not match.';
			}
					
			if(isset($emirate) && $emirate=="")
				$errors['error']['emirate']='Emirate required';
	
			if(isset($location) && $location=="")
				$errors['error']['location']='Area required';
				
			if(isset($po_box) && $po_box=="")
				$errors['error']['po_box']='P.O. Box required';
	
			if(isset($address_1) && $address_1=="")
				$errors['error']['address_1']='Address 1 required';
				
			if(isset($mobile) && $mobile=="")
				$errors['error']['mobile']='Mobile Number required';
				
			if(empty($errors))
			{
				$user_det = array(
							'user_pass' => $_POST['password'], 
							'user_login' => $_POST['email'],
							'user_email' => $_POST['email'],
							'display_name' => $_POST['name'],	
							'user_nicename' => $_POST['name']
						);
						
				// Create a user
				$user_id = wp_insert_user( $user_det );
				
				/*// Update the user meta details
				if( !empty( $_POST['contact_no'] ) )
					update_user_meta( $user_id, 'ooco_user_contact_no', $_POST['contact_no'] );*/
				
				$userAddressDetails=array(
											  "refUserId"=>$user_id,
											  "mobile"=>$mobile,
											  "emirate"=>$emirate,
											  "location"=>$location,
											  "address_1"=>$address_1,
											  "address_2"=>$address_2,
											  "po_box"=>$po_box,
											  "date"=>date('Y-m-d H:i:s')
										  );
				
				// Add a shipping address
				ooco_add_user_address($user_id,$userAddressDetails);
				
				$creds = array();
				
				$creds['user_login'] = mysql_escape_string($_POST['email']);
				
				$creds['user_password'] = mysql_escape_string($_POST['password']);
				
				$creds['remember'] = false;
				
				$redirect_url=get_permalink(42);
							
				if($user_id)
				{
					if($regfrmSubmit=='Yes')
					{
						$errors['success']['redirect']="login_page";	
						echo json_encode($errors);
						exit;				
					}
					$user = wp_signon( $creds, false );
					
					if ( is_wp_error($user) ){
						$errors['error']['username']=$user->get_error_message();
					}
					else
					{						
						/*if(isset($_POST["in_page"]) && $_POST["in_page"]=="menu")
						{
							$redirect_url=get_permalink(2);
							
							if(strpos($redirect_url,"?")>0)
								$redirect_url.='&open_address=yes';
							else
								$redirect_url.='?open_address=yes';
							
							//echo 'window.location="'.$redirect_url.'"';	
						}*/
					
						$errors['success']['redirect']="product_page";
				
						echo json_encode($errors);
					}
				}			
		}
		else
		{
			echo json_encode($errors);
		}		
			
			exit;
		}
	}
	if(isset($_POST["login_user"]) && $_POST["login_user"]=='yes')
	{
		extract($_POST);
		
		if(!wp_verify_nonce($_POST['user_log'],'user_login_validate') )
		{
			$errors['error']['email']="Sorry, your nonce did not verify.";
		}
		else
		{
			$user_email = esc_attr($_POST['email']);
	
			require_once(ABSPATH.WPINC.'/registration.php');
					 
			$user_email = apply_filters('user_registration_email', $user_email);
			
			if(!is_email($user_email)) $errors['error']['email'] = 'invalid e-mail';
			
			if(isset($password) && $password=="")
				$errors['error']['password']='Password required';
			
			if(empty($errors))
			{
				$creds['user_login'] = mysql_escape_string($user_email);
				
				$creds['user_password'] = mysql_escape_string($password);
				
				$creds['remember'] = false;
				
				$user = wp_signon( $creds, false );		
				
				//var_dump($user);
				
				if (!is_wp_error($user))
				{
					$errors['success']['redirect']="product_page";
					echo json_encode($errors);
				}
				else
				{
					$errors['error']['email']=__("<strong>ERRROR : </strong> Invalid email address or password");
					echo json_encode($errors);
				}
			}
			else
			{
				echo json_encode($errors);
			}
		}
	}
	if(isset($_POST["addCartProduct"]) && $_POST["addCartProduct"]=='yes')
	{
		$returnArray=array();
		
		$user_id=0;
			
		$current_user = wp_get_current_user();
		
		$user_id=$current_user->ID;
		
		extract($_POST);
		
		if ( $user_id == 0) {
			$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
			$returnArray['errors']['message']="Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
			echo json_encode($returnArray);
			exit;
		}
		
		$addCartProductId = (int) $addCartProductId;
		
		$orderqty = (int) $orderqty;
		
		if($orderqty==0 || $orderqty<0)
		{
			$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
			
			$returnArray['errors']['message']="Quantity not less then zero.";
			
			echo json_encode($returnArray);
			exit;
		}
		if($addCartProductId && $orderqty)
		{
			$insertArray=array("refUserId"=>$user_id,"product_id"=>$addCartProductId,"quantity"=>1,"status"=>1,"date_time"=>current_time('mysql'));
			
			$insetedTemp_id=array();
			
			for($i=0; $i<$orderqty;$i++)
			{
				$insetedTemp_id[]=$wpdb->insert( $wpdb->prefix.'temp_cart', $insertArray );
			}
			if(!empty($insetedTemp_id))
			{
				$returnArray['success']['container']='AddCardMessage'.$addCartProductId;
				
				$returnArray['success']['message']="Product has been added successfully. Click <a href='".site_url('view-shop-cart')."' class='shopForms'>here</a> view you cart.";
			}
		}
		
		if(!empty($returnArray))
			echo json_encode($returnArray);
		
		exit;
	}
	
	exit;
}

add_action('wp_ajax_my_front_end_action', 'front_ajax_fn');

add_action('wp_ajax_nopriv_my_front_end_action', 'front_ajax_fn');

function ooco_add_user_address($user_id,$details=array())
{
	global $wpdb;
	
	$return=0;
	
	if(!empty($details))
		$return=$wpdb->insert( $wpdb->prefix.'useraddress', $details, $format );	
		
	return $return;
}
function remove_admin_bar()
{
	if ( ! current_user_can('manage_options') ) {
		remove_action( 'wp_footer', 'wp_admin_bar_render', 1000 );
	}
}
add_action('wp_footer', 'remove_admin_bar');



add_action('wp_enqueue_scripts', 'inkthemes_enqueue_comment_reply');

add_action( 'delete_user', 'user_address_delete');

function user_address_delete($user_id)
{	
	global $wpdb;
	
	$wpdb->query($wpdb->prepare( "DELETE FROM ".$wpdb->prefix."useraddress WHERE refUserId = %d",  $user_id));	
}
function getProductAvailability($product_id,$reqQty=0,$temp_book=1)
{
	$availability=0;	
}
function getProductById($product_id)
{
	$productDetails=get_post( $product_id ,ARRAY_A);
	
	if(!empty($productDetails))
		return $productDetails;
}
function deleteOldCart()
{
	global $wpdb;
	
	$delCartQuery="SELECT * from ".$wpdb->prefix."_temp_cart WHERE status=1";
	
	$bookingdetailwksp=$wpdb->get_results( $delCartQuery );
	
	if(!empty($bookingdetailwksp))
	{
		foreach($bookingdetailwksp as $bookingdetail)
		{
			if($bookingdetail->checkedout)
			{
				if(TIMESTAMPDIFF($bookingdetail->sessionUpdate)>30)
				{
					//var_dump(TIMESTAMPDIFF($bookingdetail->sessionUpdate));
					//$this->updateTableData('bookingdetailwksp',$bookingdetail->id,array('status'=>0));
				}
			}
			else
			{
				if(TIMESTAMPDIFF($bookingdetail->sessionUpdate)>15)
				{
					//var_dump(TIMESTAMPDIFF($bookingdetail->sessionUpdate));
					
					//$this->updateTableData('bookingdetailwksp',0,array('status'=>0),array('refBookingId'=>$bookingheader->id));
					
					//$this->updateTableData('bookingdetailwksp',$bookingdetail->id,array('status'=>0));					
				}
			}
		}
	}
	
}