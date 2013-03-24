<?php
/*
	Template Name: OOCO Order History
*/
$user_id=0;
	
$current_user = wp_get_current_user();

$user_id=$current_user->ID;

if ( $user_id == 0) {
	$returnArray['errors']['container']='AddCardMessage'.$addCartProductId;
	
	echo "Your session has been expired. Please login <a href='".site_url('shop-login')."' class='shopForms'>here</a>";
	exit;
}
wp_head();
?>
<link rel="stylesheet" type="text/css" href="<?php echo get_template_directory_uri(); ?>/javascripts/Flexigrid-master/css/flexigrid.pack.css" />
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/javascripts/Flexigrid-master/js/flexigrid.pack.js"></script>
<div class="viewCartCon">
  <div class="clsProductTle"><?php echo __("My Cart")?> </div>
  <div class="clsBenefitsDesc">
    <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
  </div>
  <div class="errorCon"></div>
  <p>&nbsp;</p>
  <table class="orderHistoryGrid" width="50%" align="center"></table>
</div>
<p>&nbsp;</p>
<script type="text/javascript">
jQuery(document).ready(function($){
	$(".orderHistoryGrid").flexigrid({
		 url : '<?php echo admin_url( 'admin-ajax.php?action=my_order_history' ) ?>',
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
							width : 130,
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
		width : 520,
		height : 200
	})
})

</script>
