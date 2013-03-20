<?php
session_start();
include_once get_template_directory() . '/functions/inkthemes-functions.php';
include_once get_template_directory() . '/functions/ooco_cart_function.php';

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
	
	$user_id=0;
			
	$current_user = wp_get_current_user();
		
	$user_id=$current_user->ID;
		
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
											  "defaultAddress"=>1,
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
	if(isset($_POST["saveAddressCart"]) && $_POST["saveAddressCart"]=='yes')
	{
		extract($_POST);
		
		$updateCartData=array();
		
		$addressUpdate=0;
		
		$returnArray=array();
		
		$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];
		
		if(isset($cartIds))
		{
			foreach($cartIds as $cartId)
			{
				$updateCartData["address_id"]=$_POST["receiverAddress".$cartId];
				
				$updateCartData["receiverName"]=$_POST["receiverName".$cartId];
				
				$updateCartData["date_time"]=current_time('mysql');
				
				$updateCartData["checkedout"]=1;
				
				if(updateData('temp_cart',$updateCartData,array("id"=>$cartId,"status"=>1)))
				{	
					$updateHeaderCartData['checkedout']=1;
					
					$updateHeaderCartData['sessionUpdate']=$updateCartData["date_time"];
					
					$updateHeaderCartData['CreatedDate']=$updateCartData["date_time"];
					
					updateData('temp_cart_header',$updateHeaderCartData,array("id"=>$wp_temp_cart_id,"status"=>1));
					
					$addressUpdate++;
				}
				
			}
		}
		
		$returnArray['success']['addressUpdate']=$addressUpdate;
		
		$returnArray['success']['redirect']='confirm_address';
		
		echo json_encode($returnArray);
		
	}
	if(isset($_POST["deleteFromCart"]) && $_POST["deleteFromCart"]=='yes')
	{
		extract($_POST);
		
		$returnArray=array();
		
		if ( $user_id == 0) {
			$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
			$returnArray['errors']['message']="Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
			echo json_encode($returnArray);
			exit;
		}
		
		$wp_temp_cartWhere=array("refUserId"=>$user_id,"id"=>$curDelLinkId);
		
		if($wpdb->update( $wpdb->prefix.'temp_cart', array("status"=>0),$wp_temp_cartWhere ))
		{
			$returnArray['success']["message"] = __("Item has been deleted from your cart");
			
			$returnArray['success']["Containerid"] = $curDelLinkId;
			
			echo json_encode($returnArray);
			exit;
		}
		else
		{
			$returnArray['error']["message"] = __("Something went wrong please refresh your page");
			echo json_encode($returnArray);
			exit;
		}
			
		$wp_temp_cart_id=$wpdb->insert_id;
	}
	if(isset($_POST["addBulkCartProduct"]) && $_POST["addBulkCartProduct"]=='yes')
	{
		extract($_POST);
		//var_dump();
		
		$addCartProductId=0;
		
		$orderqty=0;
		
		if ( $user_id == 0) {
			$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
			$returnArray['errors']['message']="Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
			echo json_encode($returnArray);
			exit;
		}
		
		$qtyEmty=0;
		
		$qtyError=array();
		
		$wp_temp_cart_headerData=array();
		
		foreach($addCartProductId as $ProductId)
		{
			$addCartProductId = (int) $ProductId;
		
			$orderqty = (int) $_POST["orderqty".$ProductId];
		
			if($orderqty!=0)
			{
				$availableItem=getProductAvailability($ProductId,$orderqty);
				
				if($availableItem<0)
				{
					$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
					
					$returnArray['errors']['message'] =__("We have limited quantity in our stock");
					
					$qtyError[]=$returnArray;
					
					/*echo json_encode($returnArray);
					
					exit;*/
				}
				else
				{
					$wp_temp_cart_headerData['paymentStatus']=0;
					
					$wp_temp_cart_headerData['user_id']=$user_id;
					
					$wp_temp_cart_headerData['CreatedDate']=current_time('mysql');
					
					$wp_temp_cart_headerData['sessionUpdate']=current_time('mysql');
								
					$wp_temp_cart_id=0;
				}							
			}
			else
			{
				$qtyEmty++;
			}
		}
	}
	
	if(isset($_POST["addCartProduct"]) && $_POST["addCartProduct"]=='yes')
	{
		$returnArray=array();
		
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
		
		$availableItem=getProductAvailability($addCartProductId,$orderqty);
		
		/*var_dump($availableItem);
		exit;*/
		if($availableItem<0)
		{
			$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
			
			$returnArray['errors']['message']=__("We have limited quantity in our stock");
			
			echo json_encode($returnArray);
			
			exit;
		}
		//exit;
		if($addCartProductId && $orderqty)
		{
			//$wp_temp_cart_headerData['orderInfo']='Ticket Booking';
			$wp_temp_cart_headerData['paymentStatus']=0;
			$wp_temp_cart_headerData['user_id']=$user_id;
			$wp_temp_cart_headerData['CreatedDate']=current_time('mysql');
			$wp_temp_cart_headerData['sessionUpdate']=current_time('mysql');
			
			$wp_temp_cart_id=0;
			
			/*var_dump($_SESSION["wp_temp_cart_id"]);
			exit;*/
			
			if(!isset($_SESSION["wp_temp_cart_id"]))
			{	
				$wp_temp_cart_id=$wpdb->insert( $wpdb->prefix.'temp_cart_header', $wp_temp_cart_headerData );
				
				$wp_temp_cart_id=$wpdb->insert_id;
					
				$_SESSION["wp_temp_cart_id"]=$wp_temp_cart_id;
			}
			else
			{	
				$wp_temp_cart_id=$_SESSION["wp_temp_cart_id"];
				
				$wpdb->update($wpdb->prefix.'temp_cart_header',$wp_temp_cart_headerData,array("id"=>$wp_temp_cart_id));
			}
			
			if($wp_temp_cart_id)
			{
				$defaultAddress=getDefaultAddress($user_id);
				
				/*var_dump($defaultAddress);
				exit;*/
				$address_id=0;
				
				if(!empty($defaultAddress))
				{
					$address_id=$defaultAddress[0]->id;
				}
				
				$insertArray=array(
								   "refUserId"=>$user_id,
								   "refBookingId"=>$wp_temp_cart_id,
								   "product_id"=>$addCartProductId,
								   "quantity"=>1,
								   "status"=>1,
								   "date_time"=>current_time('mysql'),
								   "refBookingId"=>$wp_temp_cart_id,
								   "address_id"=>$address_id
								 );
				
				$insetedTemp_id=array();
				
				
				
				for($i=0; $i<$orderqty;$i++)
				{
					if($wpdb->insert( $wpdb->prefix.'temp_cart', $insertArray ))
					{
						$insetedTemp_id[]=$wpdb->insert_id;
					}
					
					
						
				}				
				
				if(!empty($insetedTemp_id))
				{
					$returnArray['success']['container']='AddCardMessage'.$addCartProductId;
					
					$returnArray['success']['message']="Product has been added successfully. Click <a href='".site_url('view-shop-cart')."' class='shopForms'>here</a> view you cart.";
				}
			}
		}
		
		if(!empty($returnArray))
			echo json_encode($returnArray);
		
		exit;
	}
	if(isset($_POST["get_address"]) && $_POST["get_address"]=="yes")
	{
	
		if ( $user_id == 0) {
			$returnArray['errors']['message']="Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
			echo json_encode($returnArray);
			exit;
		}
		extract($_POST);
		
		$address_id= (int) $address_id;
		
		$userdataAddress=array();
		
		if($address_id)
		{
			$sql="SELECT * from ".$wpdb->prefix."useraddress WHERE refUserId = ".$user_id." AND id=".$address_id;
	
			$wp_useraddress=$wpdb->get_results( $sql );
			
				
			if(!empty($wp_useraddress))
			{
				$returnArray['success']['message']=1;
				
				$userdataAddress["mobile"]=$wp_useraddress[0]->mobile;
				$userdataAddress["address_1"]=$wp_useraddress[0]->address_1;
				$userdataAddress["address_2"]=$wp_useraddress[0]->address_2;
				$userdataAddress["emirate"]=$wp_useraddress[0]->emirate;
				$userdataAddress["location"]=$wp_useraddress[0]->location;
				$userdataAddress["po_box"]=$wp_useraddress[0]->po_box ;				
				$returnArray['success']['values']=$userdataAddress;
				
				echo json_encode($returnArray);
				
				exit;
			}
		}	
	}
	if(isset($_POST["updateAddress_user"]) && $_POST["updateAddress_user"]=="yes")
	{
		$errors=array();
		
		extract($_POST);
		
		if ( $user_id == 0) {
			$errors['errors']['message']="Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
			echo json_encode($errors);
			exit;
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
			
			/*var_dump($manageAddress);
			exit;*/
			// Add a shipping address
			
			if($manageAddress==0)
			{
				ooco_add_user_address($user_id,$userAddressDetails);
				
				$errors['success']['message']=__('Address has been added Successfuly.');
				
				$errors['success']['newOptions']=getUserAddressDropdown($user_id);
			}
			else
			{				
				ooco_update_user_address($userAddressDetails,array("id"=>$manageAddress,"refUserId"=>$user_id));
				
				$errors['success']['message']=__('Address has been Updated Successfuly.');
				
				$errors['success']['newOptions']=getUserAddressDropdown($user_id);
			}
			echo json_encode($errors);
		}
		else
			echo json_encode($errors);	
	}
	exit;
}

add_action('wp_ajax_my_front_end_action', 'front_ajax_fn');

add_action('wp_ajax_nopriv_my_front_end_action', 'front_ajax_fn');

function updateData($tableName,$updateData,$where)
{
	global $wpdb;
	
	//mysql
	$return=0;
	
	//var_dump($updateData);
	
	if(!empty($updateData))
	{	
		if($wpdb->update( $wpdb->prefix.$tableName, $updateData, $where))		
		$return=1;
	}	
	return $return;	
}
function ooco_add_user_address($user_id,$details=array())
{
	global $wpdb;
	
	$return=0;
	
	if(!empty($details))
		$return=$wpdb->insert( $wpdb->prefix.'useraddress', $details, $format );	
		
	return $return;
}
function ooco_update_user_address($details=array(),$where=array())
{
	global $wpdb;
	
	$return=0;
	
	if(!empty($details) && !empty($where))
		$return=$wpdb->update( $wpdb->prefix.'useraddress', $details, $where);	
		
	return $return;
}
function remove_admin_bar()
{
	if ( ! current_user_can('manage_options') ) {
		remove_action( 'wp_footer', 'wp_admin_bar_render', 1000 );
	}
}
add_action('get_header', 'my_filter_head');

function my_filter_head() {
	remove_action('wp_head', '_admin_bar_bump_cb');
}

add_action('wp_footer', 'remove_admin_bar');

add_action('wp_enqueue_scripts', 'inkthemes_enqueue_comment_reply');

add_action( 'delete_user', 'user_address_delete');

function user_address_delete($user_id)
{	
	global $wpdb;
	
	$wpdb->query($wpdb->prepare( "DELETE FROM ".$wpdb->prefix."useraddress WHERE refUserId = %d",  $user_id));	
}

