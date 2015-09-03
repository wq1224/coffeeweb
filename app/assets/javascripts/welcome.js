$(document).ready(function() {
	$(".scroll").click(function(event){
		event.preventDefault();
		if($(this).parent().parent().attr("class") == "header-top-grids" ||$(this).parent().parent().parent().attr("class") == "header-bottom-grids"  )
			$('html,body').animate({scrollTop:($(this.hash).offset().top-$(".top-nav").height())},1000);
		else
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
	});
	var navoffeset=$("nav").offset().top;
	$(window).scroll(function(){
		var scrollpos=$(window).scrollTop(); 
		if(scrollpos >=navoffeset){
			$("nav").addClass("fixed");
		}else{
			$("nav").removeClass("fixed");
		}
	});
	$("nav ul li a").click(function(){
		$(this).parent().addClass("active");
		$(this).parent().siblings().removeClass("active");
	});
	$("span.menu").click(function(){
		$(".top-nav ul").slideToggle("slow" , function(){
		});
	});

	var filterList = {
		init: function () {
			// MixItUp plugin
			// http://mixitup.io
			$('#portfoliolist').mixitup({
				targetSelector: '.portfolio',
				filterSelector: '.filter',
				effects: ['fade'],
				easing: 'snap',
				// call the hover effect
				onMixEnd: filterList.hoverEffect()
			});				
		},
		hoverEffect: function () {
			// Simple parallax effect
			$('#portfoliolist .portfolio').hover(
				function () {
					$(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
					$(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');				
				},
				function () {
					$(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
					$(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');								
				}		
			);				
		}
 	};
	filterList.init();

	$().UItoTop({ easingType: 'easeOutQuart' });
	 
});

	