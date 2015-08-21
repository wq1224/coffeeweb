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
	 
});