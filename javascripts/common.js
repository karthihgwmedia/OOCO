// JavaScript Document
$(document).ready(function(){
		hideItems();
		$(".Icon").live("click",function(e){
			e.preventDefault();
			if($(this).hasClass('menuPlus'))
			{
				$(".backLink").removeClass("menuPlus");
				$(".backLink").addClass("menuMinus");
				$(".menuCon").show();
			}
			else
			{
				$(".backLink").addClass("menuPlus");
				$(".backLink").removeClass("menuMinus");
				$(".menuCon").hide();
			}			
		})
		$(window).resize(function()
		{
			hideItems();
		})
	})
	function hideItems()
	{
		var backText="Back to Rolling Stone";
		
		if($(this).width() < 767)
		{
			$(".intenShipText").hide();
			$(".headerBg").addClass("headerStripAddPadding");
			$(".iwwrsLogo a").removeClass("marginMinus");	
			$(".iwwrsLogo").removeClass("right");
			$(".iwwrsLogo").removeClass("txt_left_align");			
			$(".row").addClass("removerowpadding");	
			$(".rsLogo").removeClass("txt_right_align");
			$(".menuCon").hide();
			$(".menuCon").addClass("blackBg");
			$(".backLink").html('');
			$(".backLink").addClass("Icon");
			$(".backLink").addClass("menuPlus");
			$(".backToRs").addClass("backToRsFixed");
			$(".header").addClass("headerSmall");
			$(".copyText span.divider").hide();
			$(".copyText span").addClass("clsDisplayBlock");
			$("#sponcers").addClass("clsSeamBg");
			$(".inner .header").addClass("headerFull");			
			$(".innerHeaderImg").hide();
			$(".RSBigLogo").show();
			$(".howItWorksImg .deskTop").hide();
			$(".howItWorksImg .MobileTop").show();
			
		} 
		else
		{
			$(".intenShipText").show();
			$(".headerBg").removeClass("headerStripAddPadding");
			$(".iwwrsLogo a").addClass("marginMinus");	
			$(".row").removeClass("removerowpadding");
			$(".iwwrsLogo").addClass("right");
			$(".iwwrsLogo").addClass("txt_left_align");
			$(".rsLogo").addClass("txt_right_align");	
			$(".menuCon").removeClass("blackBg");
			$(".menuCon").show();	
			$(".backLink").removeClass("Icon");
			$(".backLink").html(backText);
			$(".backLink").removeClass("menuPlus")
			$(".backLink").removeClass("menuMinus")
			$(".backToRs").removeClass("backToRsFixed");
			$(".header").removeClass("headerSmall");
			$(".copyText span.divider").show();
			$(".copyText span").removeClass("clsDisplayBlock");
			$("#sponcers").removeClass("clsSeamBg");
			$(".inner .header").removeClass("headerFull");
			$(".innerHeaderImg").show();
			$(".RSBigLogo").hide();
			$(".howItWorksImg .deskTop").show();
			$(".howItWorksImg .MobileTop").hide();
		}
	}