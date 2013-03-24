<?php
/*
 * Plugin Name: OOCO paymet setting page
 * Plugin URI: http://www.hgwmedia.com
 * Description: This plugin is managing the payment gateway values. 
 * Author: Karthikeyan.K
 * Author URI: http://www.hgwmedia.com
 */ 

function wp_ooco_payment_install() {
 
 	update_option('ooco_ni_secret_key',"b5b6784bf73a4a6da11bf96ef5ab0aeafc9d309f3b3541b2aeb4615a475f779ee0b45d2c684d4927b939b01e24e9ed1005e0");
	update_option('ooco_ni_access_key',"40d39acd4516311d9fe5fc6d1762a2a7");
	update_option('ooco_ni_profile_id',"OBS_Web");
	update_option('ooco_ni_setting_mode',1);
   //add_option("jal_db_version", $jal_db_version);
}

register_activation_hook(__FILE__,'wp_ooco_payment_install');
 
function wp_ooco_payment_menu () {
	add_menu_page('OOCO Orders','Orders OOCO','manage_options','ooco_user_orders', ooco_user_orders);	
	
	//add_menu_page(NULL,'Orders OOCO','manage_options','', ooco_user_delivery_notes);
	
	add_menu_page('OOCO Payment settings','Payment Settings','manage_options','ooco_payment_settings', ooco_payment_settings);	
}
function ooco_user_delivery_notes()
{
	
}
function ooco_user_orders()
{	
?>
<link rel="stylesheet" type="text/css" href="<?php echo get_template_directory_uri(); ?>/javascripts/Flexigrid-master/css/flexigrid.pack.css" />
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/javascripts/Flexigrid-master/js/flexigrid.pack.js"></script>
<?php
if(isset($_GET["invoice_id"]))
{?>
	<style type="text/css">
		.deliveryHistoryGrid
		{
			margin-left:0px;
		}
	</style>
	<div class="wrap">
      <h2><?php echo __("Delivery notes for ");?><?php echo __("OOCO").$_GET["invoice_id"]?></h2>
        <table class="deliveryHistoryGrid" width="50%" align="center"></table>
        <p>&nbsp;</p>
        <p style="text-align:center"><a href="<?php echo admin_url('admin.php?page=ooco_user_orders')?>"><?php echo __("Go back")?></a></p>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function($){
        $(".deliveryHistoryGrid").flexigrid({
             url : '<?php echo admin_url( 'admin-ajax.php?action=user_delivery_notes&invoice_id='.$_GET["invoice_id"]) ?>',
             dataType : 'json',
             colModel : [ 
                            { 
                                display : '<?php echo __("Refrence no")?>',
                                name : 'refrence_id',
                                width : 150,
                                sortable : false,
                                align : 'left'
                            },
                            { 
                                display : '<?php echo __("Receiver Name")?>',
                                name : 'receiver_name',
                                width : 120,
                                sortable : true,
                                align : 'left'
                            },
                            { 
                                display : '<?php echo __("Product Name")?>',
                                name : 'product_name',
                                width : 100,
                                sortable : true,
                                align : 'left'
                            },
							{ 
                                display : '<?php echo __("Address")?>',
                                name : 'delivery_address',
                                width : 150,
                                sortable : true,
                                align : 'left'
                            },
                            /*{ 
                                display : '<?php echo __("Qty")?>',
                                name : 'paymentStatus',
                                width : 120,
                                sortable : false,
                                align : 'left'
                            },*/
                            { 
                                display : '<?php echo __("Options")?>',
                                name : 'view_option',
                                width : 160,
                                sortable : false,
                                align : 'left'
                            },
                        ],
            action:	"my_order_history",		
            sortname : "trans_paid_date",
            sortorder : "asc",
            usepager : true,
            title : '<?php echo __("Order History")?>',
            useRp : true,
            rp : 10,
            showTableToggleBtn : true,
            width : 750,
            height : "500"
        })
        })
    </script>		
<?php
}
else
{
	
?>
	<style type="text/css">
		.orderHistoryGrid
		{
			margin-left:0px;
		}
	</style>
    
    <div class="wrap">
      <h2><?php echo __("Order history");?></h2>
        <table class="orderHistoryGrid" width="50%" align="center"></table>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function($){
        $(".orderHistoryGrid").flexigrid({
             url : '<?php echo admin_url( 'admin-ajax.php?action=all_order_history' ) ?>',
             dataType : 'json',
             colModel : [ 
                            { 
                                display : '<?php echo __("Refrence no")?>',
                                name : 'refrence_id',
                                width : 150,
                                sortable : false,
                                align : 'left'
                            },
                            { 
                                display : '<?php echo __("Ordered Date")?>',
                                name : 'trans_paid_date',
                                width : 120,
                                sortable : true,
                                align : 'left'
                            },
                            { 
                                display : '<?php echo __("Total price")?>',
                                name : 'total_price',
                                width : 100,
                                sortable : true,
                                align : 'left'
                            },
                            /*{ 
                                display : '<?php echo __("Payment Status")?>',
                                name : 'paymentStatus',
                                width : 120,
                                sortable : false,
                                align : 'left'
                            },*/
                            { 
                                display : '<?php echo __("Options")?>',
                                name : 'view_option',
                                width : 200,
                                sortable : false,
                                align : 'left'
                            },
                        ],
            action:	"my_order_history",		
            sortname : "trans_paid_date",
            sortorder : "asc",
            usepager : true,
            title : '<?php echo __("Order History")?>',
            useRp : true,
            rp : 10,
            showTableToggleBtn : true,
            width : 630,
            height : 300
        })
        })
    </script>
<?php
}
}
function ooco_payment_settings()
{
	if($_POST['ni_submit'])
	{
		update_option('ooco_ni_secret_key',$_POST["ni_secret_key"]);
		update_option('ooco_ni_access_key',$_POST["ni_access_key"]);
		update_option('ooco_ni_profile_id',$_POST["ni_profile_id"]);
		update_option('ooco_ni_setting_mode',$_POST["ni_test_mode"]);
	}
	$ooco_ni_secret_key=get_option('ooco_ni_secret_key');
	$ooco_ni_access_key=get_option('ooco_ni_access_key');
	$ooco_ni_profile_id=get_option('ooco_ni_profile_id');
	$ooco_ni_setting_mode=get_option('ooco_ni_setting_mode');
?>

<div class="wrap">
  <h2>Payment gateway settings</h2>
  <form action="#" name="ni_setting_form" id="ni_setting_form" method="post">
    <table class="form-table">
      <tbody>
        <tr valign="top">
          <th scope="row"><label for="ni_secret_key"><?php echo __("Secret KEY")?></label></th>
          <td><input name="ni_secret_key" type="text" id="ni_secret_key" value="<?php echo $ooco_ni_secret_key?>" class="regular-text"></td>
        </tr>
        <tr valign="top">
          <th scope="row"><label for="ni_access_key"><?php echo __("Access KEY")?></label></th>
          <td><input name="ni_access_key" type="text" id="ni_access_key" value="<?php echo $ooco_ni_access_key?>" class="regular-text"></td>
        </tr>
        <tr valign="top">
          <th scope="row"><label for="ni_profile_id"><?php echo __("Profile Id ")?></label></th>
          <td><input name="ni_profile_id" type="text" id="ni_profile_id" value="<?php echo $ooco_ni_profile_id?>" class="regular-text"></td>
        </tr>
        <tr valign="top">
          <th scope="row"><label for="ni_setting_mode"><?php echo __("Test mode")?></label></th>
          <td> Yes &nbsp;
            <input type="radio" value="1" name="ni_test_mode" <?php if($ooco_ni_setting_mode==1) echo 'checked="checked"'?> />
            &nbsp; No &nbsp;
            <input type="radio" value="0" name="ni_test_mode" <?php if($ooco_ni_setting_mode==0) echo 'checked="checked"'?>/>
          </td>
        </tr>
      </tbody>
    </table>
    <p class="submit">
      <input type="submit" name="ni_submit" id="ni_submit" class="button button-primary" value="Save Changes">
    </p>
  </form>
</div>
<?php
}
add_action('admin_menu','wp_ooco_payment_menu');
?>
