<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" href="stylesheets/foundation.css">
<link rel="stylesheet" href="stylesheets/app.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="javascripts/modernizr.foundation.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//alert();
	var wrapper_he=$("#wrapper").height()+10;	
	$('aside').css("height","108%");
	//$('aside').hide();
	/*$(".aboutLink").live("click",function(){
		$("#about").addClass("animate");
		$("#feature").addClass("animateOut");
		setTimeout('$("#feature").removeClass("animate");',1000);
	})
	$(".featureLink").live("click",function(){
		$("#feature").addClass("animate");
		setTimeout('$("#about").removeClass("animate");',1000);
	})*/
	var previousPage='';
	
	$("#menu a").live("click",function(e){
		e.preventDefault();		
		
		var nav_cur_page=$(this).attr("href");
		
		/*if(previousPage=='')
			previousPage="#about";
		else*/		
		//previousPage=nav_cur_page;
		
		$(nav_cur_page).addClass("animate");
		
		$(nav_cur_page +" .pagination a.first").trigger("click");
		//alert(previousPage);
		
		if(previousPage!="")
		{
			$(previousPage).addClass("animateOut");
			
			$(nav_cur_page).removeClass("animateOut");
			
			setTimeout('$("'+previousPage+'").removeClass("animate");',1000);
		}
		previousPage=nav_cur_page;
	})
	
	var previousClass='';
	
	$(".animate .pagination a").live('click',function(e){
		e.preventDefault();
		
		if(previousClass=="")
			previousClass=$(".animate .pagination a.first").attr("href");		
		//alert(previousClass);
		var cur_page=$(this).attr("href");	
		
		if(previousClass!="")
		{
			$(previousClass).fadeOut(100,function(){
				$(cur_page+".clsAboutCon").fadeIn(1000,function(){
					previousClass=cur_page;
				});	
			});
		}
		
	})	
})
</script>
<link href="style.css" media="all" rel="stylesheet" type="text/css"/>
<link href="slide_animation.css" media="all" rel="stylesheet" type="text/css"/>
<title>OCOO || The Beauty Drink</title>
</head>
<body>
<div id="header">
  <div class="row">
    <div class="three columns logo left"> <a href="#"><img src="images/OCOOlogo_header.png" /></a> </div>
    <div class="nine columns right" id="menuDiv">
      <nav id="menu">
        <ul class="nav-bar">
          <li><a class="home" href="#">Home</a></li>
          <li><a href="#about">ABOUT OCÓO</a></li>
          <li><a href="#feature">FEATURES</a></li>
          <li><a href="#newsletter">NEWSLETTER</a></li>
          <li><a href="#">BLOG</a></li>
          <li><a href="#">CONTACT</a></li>
          <li><a href="#">SHOP</a></li>
        </ul>
      </nav>
    </div>
    <div class="clear"></div>
  </div>
</div>
<div id="wrapper">
  <div class="row">
    <div class="columns twelve"> <a href="#"><img src="images/main_logo.png" /></a></div>
    <div class="clear"></div>
    <aside id="about" class="asideAnimation">
      <div class="pagination clearfix"> <a href="#about_page_1" class="first">Page 1</a> <a href="#about_page_2">Page 2</a> <a href="#about_page_3">Page 3</a> <a href="#about_page_4">Page 4</a> </div>
      <div class="aboutPage">
        <div id="about_page_1" class="clsAboutCon"> <img src="images/OCOO_Slide01_2012_V01.png" /> </div>
        <div id="about_page_2" class="clsAboutCon"> <img src="images/OCOO_Slide01_2012_V02.png" /> </div>
        <div id="about_page_3" class="clsAboutCon"> <img src="images/OCOO_Slide01_2012_V03.png" /> </div>
        <div id="about_page_4" class="clsAboutCon"> <img src="images/OCOO_Slide01_2012_V04.png" /> </div>
      </div>
    </aside>
    <aside id="feature" class="asideAnimation">
      <div class="pagination clearfix"> <a href="#feature_page_1" class="first">Page 1</a> <a href="#feature_page_2">Page 2</a></div>
      <div class="featurePage">
        <div id="feature_page_1" class="clsAboutCon">
          <h3 class="asideTitle">OCÓO <span>TESTIMONIALS</span></h3>
          <div class="slimContentContainer">
              <div class="clsTestimonials">
                <h4>A Bottle a Day</h4>
                <div class="clsTestDesc">"Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum."</div>
                <div class="clsTestDescBy">Salama Al Hoseini - 31</div>
              </div>
              <div class="clsTestimonials">
                <h4>A Bottle a Day</h4>
                <div class="clsTestDesc">"Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum."</div>
                <div class="clsTestDescBy">Salama Al Hoseini - 31</div>
              </div>
              <div class="clsTestimonials">
                <h4>A Bottle a Day</h4>
                <div class="clsTestDesc">"Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum."</div>
                <div class="clsTestDescBy">Salama Al Hoseini - 31</div>
              </div>
              <div class="clsTestimonials">
                <h4>A Bottle a Day</h4>
                <div class="clsTestDesc">"Mauris ut sem nisi. Sed venenatis purus vel enim euismod ultrices. Sed ac egestas lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sed nunc ut nibh suscipit imperdiet. Curabitur faucibus diam sit amet mi eleifend vitae aliquet mauris fermentum."</div>
                <div class="clsTestDescBy">Salama Al Hoseini - 31</div>
              </div>
          </div>
        </div>
        <div id="feature_page_2" class="clsAboutCon"> </div>
      </div>
    </aside>
    <aside id="newsletter" class="asideAnimation">
      <div class="pagination clearfix"> <a href="#feature_page_1">Page 1</a> <a href="#feature_page_2">Page 2</a></div>
      <div class="featurePage">
        <div id="newsletter_page_1" class="clsAboutCon"> </div>
        <div id="newsletter_page_2" class="clsAboutCon"> </div>
      </div>
    </aside>
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
        <div class="orderbtn"> <a href="#"></a> </div>
        <div class="clsProductCon">
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a href="#">Order</a> </div>
            <div class="clear"></div>
          </div>
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a href="#">Order</a> </div>
            <div class="clear"></div>
          </div>
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a href="#">Order</a> </div>
            <div class="clear"></div>
          </div>
          <div class="clsProduct">
            <div class="clsProductTle clsFloatLeft columns eight"> <strong>1 DAY</strong> Single sodales nulla id est laoreet. </div>
            <div class="clsFloatRight clsOrderLink"> <a href="#">Order</a> </div>
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
</div>
</div>
<div id="footer">
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
</body>
</html>
