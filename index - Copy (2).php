<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" href="stylesheets/foundation.css">
<link rel="stylesheet" href="stylesheets/app.css">
<link rel="stylesheet" href="stylesheets/jquery.mCustomScrollbar.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="javascripts/jquery-ui.js"></script>
<script src="javascripts/jquery.mousewheel.min.js"></script>
<script src="javascripts/jquery.mCustomScrollbar.js"></script>
<script src="javascripts/modernizr.foundation.js"></script>
<script type="text/javascript">
function windowresize()
{
	windowHeight=$(window).height();
	if(windowHeight<800)
	{
		var documentHeight=$(window).height();	
		$('aside').css("height",documentHeight);
		$("#footer").addClass("footer1200");
	}
	else
	{
		$("#footer").removeClass("footer1200");
	}
	var wHeight = $(window).height();		
	var wWidth = $(window).width();
	var pHeight = $('.bgImge').height();		
	var minWidth = 1280;
	
	if(pHeight>wHeight){
		$('.bgImge').css('display','block');
		$('.bgImge').css('width','100%');
		$('.bgImge').css('height','auto');
		var topPos=Math.round(Math.abs((pHeight-wHeight)/2))
		$('.bgImge').css('top',"-"+topPos+'px');
	}
	else{
		//$(this).find('.theImg').css({backgroundImage:'url('+currentImg+')'});
		//$('.bgImge').css('display','none');
	}
}
function onReadyAnimate()
{
	$("#header").addClass("headerShow");
	$("#footer").addClass("footerShow");
	$(".orderbtn").addClass("orderbtnShow");
	$(".home").addClass("current");
	$("#clsOcooSocialMedia,#clsOcooBenefits").addClass("ShowBenefits");	
	setTimeout('$(".orderbtn").removeClass("orderbtnShow");$(".orderbtn").addClass("orderbtnTrans");',1000);	
	
}
$(document).ready(function(){
	
	var wrapper_he=$("#wrapper").height()+10;	
	var previousPage='';
	var asideOpen=false;
	var shopOrderOpen=false;
	var nav_cur_page='';	
	windowresize();
	setTimeout('onReadyAnimate()',200);
	$("#menu a.clSlideIn").live("click",function(e){		
		
		e.preventDefault();		
		
		nav_cur_page=$(this).attr("href");
		
		if(nav_cur_page==previousPage)
		{
			return false;
		}	
		$("#menu a").removeClass("current");
		
		$(this).addClass("current");
		
		$(nav_cur_page).addClass("animate");
		
		//$(nav_cur_page +" .pagination a.first").trigger("click");
		
		if($(nav_cur_page+".animate .slimContentContainer").length)
		{
			$(nav_cur_page+" .slimContentContainer").mCustomScrollbar("destroy");
		}
		asideOpen=true;	
		if(shopOrderOpen)
		{
			shopOrderOpen=false;
			$(".closeShop").trigger("click");
		}
		if($(nav_cur_page+".animate .slimContentContainer").length)
		{
			$(nav_cur_page+".animate .slimContentContainer").mCustomScrollbar({
				scrollButtons:{
					enable:true
				}
			});
		}
		if(previousPage!="")
		{			
			$(previousPage).addClass("animateOut");
			
			$(nav_cur_page).removeClass("animateOut");
				
			setTimeout('$("'+previousPage+'").removeClass("animate");',1000);
		}
				
		previousPage=nav_cur_page;
	})
	
	$(".shopOrderLink").live("click",function(e){
		e.preventDefault();
		
		if(shopOrderOpen)
			return false;
				
		if(asideOpen)
		{
			asideOpen=false;
			
			$(nav_cur_page).addClass("animateOut");
			
			setTimeout('$("'+nav_cur_page+'").removeClass("animate");',1000);
		}
		$("#menu a").removeClass("current");
		
		$(this).addClass("current");
		
		$("#shopOrder").removeClass("animateOut");
		$("#shopOrder").addClass("animate");		
		shopOrderOpen=true;
	})
	$(".home").live("click",function(e){
		e.preventDefault();
		
		if(asideOpen)
		{
			asideOpen=false;
						
			$(nav_cur_page).addClass("animateOut");
			
			setTimeout('$("'+nav_cur_page+'").removeClass("animate");',1000);
		}
		$("#menu a").removeClass("current");
		
		$(this).addClass("current");
		
		if(shopOrderOpen)
		{
			shopOrderOpen=false;
			$(".closeShop").trigger("click");
		}
	})
	$(".closeShop").live("click",function(e){
		e.preventDefault();	
		$("#shopOrder").addClass("animateOut");
		shopOrderOpen=false;
		$("#menu a").removeClass("current");
		setTimeout('$("#shopOrder").removeClass("animate");',1000);
	})
	
	var previousClass='';
	
	$(".animate .pagination a").live('click',function(e){
		e.preventDefault();		
		
		if(previousClass=="")
			previousClass=$(".animate .pagination a.first").attr("href");		
			
		//alert(previousClass);
		
		var cur_page=$(this).attr("href");	
		
		$(".animate .pagination a").removeClass("selected");
		
		$(this).addClass("selected");
		
		$(".animate .slidePage").removeClass("openTab");
		$(".animate .slidePage").addClass("clsAboutCon");
		$(".animate .slidePage").removeClass("addOpacity");
		
		
		$(cur_page+" .slimContentContainer").mCustomScrollbar("destroy");
		
		$(cur_page+" .slimContentContainer").mCustomScrollbar({  
		  scrollEasing:"easeOutCirc",  
		  mouseWheel:"auto",   
		  autoDraggerLength:true,   
		  advanced:{  
			updateOnBrowserResize:true,   
			updateOnContentResize:true,   
     	 },  
   	   });  
		
		$(cur_page).addClass("openTab");
			
		$(cur_page).removeClass("clsAboutCon");
		
		setTimeout('$("'+cur_page+'").addClass("addOpacity");',300);
		
		
				
		//$(previousClass).hide();
		
		//$(cur_page+".clsAboutCon").fadeOut(3000,function(){
			
		//});
		
	})	
	$(window).resize(function()
	{
		windowresize();
		
	})
})
</script>
<link href="style.css" media="all" rel="stylesheet" type="text/css"/>
<link href="slide_animation.css" media="all" rel="stylesheet" type="text/css"/>
<title>OCOO || The Beauty Drink</title>
</head>
<body>
<div id="container">
<header id="header">
  <div class="row">
    <div class="three columns logo left"> <img src="images/OCOOlogo_header.png" /></div>
    <div class="nine columns right" id="menuDiv">
      <div class="carousel">
      <nav id="menu">
        <ul class="nav-bar">
          <li><a class="home" href="#"><span>Home</span></a></li>
          <li><a href="#about" class="clSlideIn"><span>ABOUT OCÓO</span></a></li>
          <li><a href="#feature" class="clSlideIn"><span>FEATURES</span></a></li>
          <li><a href="#newsletter" class="clSlideIn"><span>NEWSLETTER</span></a></li>
          <li><a href="#blog" class="clSlideIn"><span>BLOG</span></a></li>
          <li><a href="#contact" class="clSlideIn"><span>CONTACT</span></a></li>
          <li><a href="#shopOrder" class="shopOrderLink"><span>SHOP</span></a></li>
        </ul>
      </nav>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</header>

	<img src="images/Ocoo_websiteBackground.jpg" class="bgImge" />

<div id="wrapper">  
  <div class="row">   	
    <div class="columns twelve"> <a href="#"><img src="images/main_logo.png" class="main_logo" /></a></div>
    <div class="clear"></div>    
    <div class="columns twelve" id="threeCols">
      <div class="four columns" id="clsOcooBenefits">
        <h3><span>OCÓO</span> BENEFITS</h3>
        <div class="clsBenefits clearfix">
          <div class="clsBenefitsTle"> Anti-Aging </div>
          <div class="clsBenefitsDesc"> Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
          <div class="clsMoreLink clsFloatRight"> <a href="#">More</a> </div>
        </div>
        <div class="clsBenefits clearfix">
          <div class="clsBenefitsTle"> Anti-Aging </div>
          <div class="clsBenefitsDesc"> Sed condimentum tincidunt condimentum. Maecenas eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
          <div class="clsMoreLink clsFloatRight"> <a href="#">More</a> </div>
        </div>
      </div>
      <div class="four columns" id="clsOcooOrders">
        <div class="orderbtn"> <a class="shopOrderLink" href="#shopOrder">Order</a> </div>
        <div class="clsProductCon">
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a class="shopOrderLink" href="#shopOrder">Order</a> </div>
            <div class="clear"></div>
          </div>
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a class="shopOrderLink" href="#shopOrder">Order</a> </div>
            <div class="clear"></div>
          </div>
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a class="shopOrderLink" href="#shopOrder">Order</a> </div>
            <div class="clear"></div>
          </div>
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a class="shopOrderLink" href="#shopOrder">Order</a> </div>
            <div class="clear"></div>
          </div>
        </div>
      </div>
      <div class="four columns" id="clsOcooSocialMedia">
        <h3><span>SOCIAL</span> MEDIA</h3>
        <div class="SMTweets clsFacebook first">
          <div class="TwittIcon clsFloatLeft"> <a href="#"></a> </div>
          <div class="TwittText clsFloatLeft"> <a href="#">Maecenas</a> eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
          <div class="clear"></div>
        </div>
        <div class="SMTweets clsTwitter first">
          <div class="TwittIcon clsFloatLeft"> <a href="#"></a> </div>
          <div class="TwittText clsFloatLeft"> <a href="#">Maecenas</a> eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
          <div class="clear"></div>
        </div>
        <div class="SMTweets clsInstaGram first">
          <div class="TwittIcon clsFloatLeft"> <a href="#"></a> </div>
          <div class="TwittText clsFloatLeft"> <a href="#">Maecenas</a> eleifend lacinia iaculis. Phasellus cursus fermentum risus eget molestie. </div>
          <div class="clear"></div>
        </div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <div class="columns three centered" id="socialLinks">
    <div class="social_link"> <a href="#" class="facebook"></a> <a href="#" class="twitter"></a> <a href="#" class="pIntrest"></a> <a href="#" class="instagram"></a>
      <div class="clear"></div>
    </div>
  </div>
  <div class="shopAnimation" id="shopOrder">
    <div class="clsProductTle"> OCÓO SHOP </div>
    <div class="clsBenefitsDesc">
      <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque habitant morid est malesuada laoreet.</p>
    </div>
    <div id="productDetailsPage" style="display:none">
      <?php
		include("productDetails.php");
	?>
    </div>
    <div class="clear"></div>
    <div id="loginPage" style="display:none" class="userForms">
      <?php	
    	include("loginPage.php");
	?>
    </div>
    <div id="registerPage" class="userForms">
      <?php	
    		include("registerPage.php");
		?>
    </div>
    <div class="orderLinks">
      <div cass="columns twelve">
        <div class="columns one">&nbsp;</div>
        <div class="columns five"> <a href="#">View Cart</a> </div>
        <div class="columns five"> <a href="#">Gift Vouchers</a> </div>
        <div class="columns one">&nbsp;</div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
    <div class="clsCloseCon">
      <div cass="columns twelve"> <a href="#" class="closeShop">Close</a> </div>
    </div>
  </div>
   <div class="clear"></div>
</div>
<footer id="footer">  
  <div class="row">
    <div class="columns left obsLogo two">&nbsp;</div>
    <div class="columns left obsLogo two"> <a href="#"><img src="images/obsGroup.png" /></a> </div>
    <div class="columns left three disClimer"> Scientifically profound: *Health Claims permitted, see European	Commission Regulation (EU) No 432/2012 of 16 May 2012, published in EUR-Lex Journal, Volume 55 (2012). www.ec.europa.eu </div>
    <div class="footerLinks four left"> <span>&copy; 2013 Copyright OCÓO</span> <span class="divider">|</span> <span>All rights reserved</span> <span class="divider">|</span> <span><a href="#">Contact</a></span> <span class="divider">|</span> <span><a href="#">Site by HGW MEDIA</a></span> </div>
  </div>
  <div class="clear"></div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
<?php
	include("aside.php");
?> 
</footer>

</body>
</html>
