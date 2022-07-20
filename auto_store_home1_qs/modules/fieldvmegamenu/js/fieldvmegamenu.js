$(document).ready(function () {

	$('.v-megamenu .opener').click(function(){
		var el = $(this).next('.dd-section');
		var switcher = $(this);
		var wdth = $( window ).width();			
		if (wdth < 992) {
	        el.animate({
	            "height": "toggle"
	        }, 
	        500,
	        function(){
	        	if (el.is(':visible')) {
	                el.addClass("act");
	                switcher.addClass('opn');
	            } else {
	            	switcher.removeClass('opn');
	                el.removeClass("act");
	            }
	        });
		}
		return false;
	});
	var wdth = $( window ).width();	
	if (wdth > 991) {

		$( ".main-section-sublinks > li" ).hover(
		  function() {
		    $(this).find("ul").stop().slideDown("slow");
		  }, function() {
		    $(this).find("ul").stop().delay(100).slideUp("fast");
		  }
		);				

		$( ".v-megamenuitem" ).hover(
	  	function() {
		    $(this).find('.submenu').css({"display":"block"}).addClass("showmenu");
		  }, function() {
			$(this).find('.submenu').delay(100).slideUp(0).removeClass("showmenu");
		  }
		);
	}

	/* carousels */

	var vm_rp = $(".v-right-section-products").data("pquant");
	if (vm_rp > 1) {
		$(".v-right-section-products").flexisel({
                    pref: "vm-pr",
                    visibleItems: 1,
                    animationSpeed: 500,
                    autoPlay: true,
                    autoPlaySpeed: 3500,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: false,
                    clone : true
      });  
    }  
	$(".more-vmegamenu").click(function() {
    $(".more_here").slideToggle();
	if($(".more-vmegamenu a span i").attr("class")=="icon-plus"){
		$(".more-vmegamenu a span").html('<i class="icon-minus"></i>' + CloseVmenu);
		}else $(".more-vmegamenu a span").html('<i class="icon-plus"></i>' + MoreVmenu);

});
});