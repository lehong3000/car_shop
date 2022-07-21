$(document).ready(function() {
    $(".click-nav2").on('click', function() {
  $(".content-nav2").toggle();
  });
        field_mobile_menu()
    Field_fullwidth();
    VmenuDropDown();
    $(window).resize(Field_fullwidth);
    /* INIT STICKY MENU */var _topSticky = $('#header').innerHeight();
    var _margintopSticky = $('#header_menu').height();
    var sticky_all = 0;
    var sticky_Cart = 0;
    var sticky_Search = 0;
      var _topVmenu = 0;
    if (typeof (FIELD_stickySearch) != 'undefined' && FIELD_stickySearch && typeof (FIELD_stickyCart) != 'undefined' && FIELD_stickyCart) {
	var sticky_all = 1;
    } else {
	if (typeof (FIELD_stickySearch) != 'undefined' && FIELD_stickySearch) {
	    var sticky_Search = 1;
	}
	if (typeof (FIELD_stickyCart) != 'undefined' && FIELD_stickyCart) {
	    var sticky_Cart = 1;
	}
    }
     
 
            
    if (typeof (FIELD_stickyMenu) != 'undefined' && FIELD_stickyMenu) {
	if($(window).width() >= 992){	
	$(window).scroll(function() {
           
//             _topVmenu = $('#left-column').find('.v-megamenu').height() + _topSticky -10;
             _topVmenu = $('.vmegamenu2 .v-megamenu-container').height()+$('#left-column').find('.v-megamenu').height() + _topSticky -10;
		 $('.ui-widget-content').slideUp();
                 
               if ($(this).scrollTop() >= (_topVmenu-100)) {
		$('#header_menu').find('.v-megamenu-title').removeClass('Click');
		$('#header_menu').find('.v-megamenu-title').removeClass('active');
		$('#header_menu').find('.v-megamenu').slideUp();
		$('#header_menu').find('.v-megamenu').addClass('active');
	    } else if ($(this).scrollTop() >= _topSticky) {
		$('#header_menu').find('.v-megamenu-title').addClass('Click');
		$('#header_menu').find('.v-megamenu').removeClass('active');
	    }
            
	    if ($(this).scrollTop() >= _topSticky) {
		$('#header_menu').addClass('fieldmegamenu-sticky');
		$('#header_menu').css({'position': 'fixed', 'z-index': '1030', 'top': '0', 'left': '0', 'right': '0'});
		//$('#header').css({'margin-bottom': _margintopSticky});
		if (sticky_all) {
		    $('#sticky_top').addClass('sticky-fixed-top');
		} else {
		    if (sticky_Search) {
			$('#search_block_top').addClass('sticky-fixed-top');
		    }
		    if (sticky_Cart) {
			$('#cart_block_top').addClass('sticky-fixed-top');
		    }
		}
		if (sticky_all || sticky_Cart || sticky_Search) {
		    var _containerPaddingRight = parseInt($('.header-top .container').css('padding-right'));
		    var _containerPaddingLeft = parseInt($('.header-top .container').css('padding-left'));
		    if (LANG_RTL != 1){
			$('.sticky-fixed-top').css({'right': ($('body').outerWidth() - $('.container').outerWidth()) / 2 + _containerPaddingRight});
		    } else {
			$('.sticky-fixed-top').css({'right': 'auto', 'left': ($('body').outerWidth() - $('.container').outerWidth()) / 2 + _containerPaddingLeft});
		    }
		}
              
	    } else {
		$('.sticky-fixed-top').attr('style','');
		$('#sticky_top').removeClass('sticky-fixed-top');
		$('#search_block_top').removeClass('sticky-fixed-top');
		$('#cart_block_top').removeClass('sticky-fixed-top');
		$('#header_menu').removeClass('fieldmegamenu-sticky');
                $('#header_menu').css({'position': 'relative', 'z-index': '1030'});
                
		$('#left_column').find('.v-megamenu').css({'opacity': '0'});
		$('#header_menu').attr('style','');
		$('#header').css({'margin-bottom': 0});
	    }
	});
    }
}
    /* INIT GO TO TOP BUTTON */initScrollTop();
    ;
});
$(window).load(function() {
    /* ITEM COUNTDOWNS */if (typeof (FIELD_enableCountdownTimer) != 'undefined' && FIELD_enableCountdownTimer) {
	$('.item-countdown-time').each(function() {
	    initCountdown($(this));
	});
    }
    /* Load percent CMS */
    if (LANG_RTL != 1){
	LoadPercCMS();
    } else {
	LoadPercCMS_rtl();
    }
});
function initCountdown(el) {
    el.countdown(el.attr('data-time')).on('update.countdown', function(event) {
	var format = '';
	if (event.offset.totalDays > 1) {
	    format = format + '<span class="section_cout"><span class="Days">%D </span><span class="text">' + countdownDays + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Days">%D </span><span class="text">' + countdownDay + '</span></span>';
	}
	if (event.offset.hours > 1) {
	    format = format + '<span class="section_cout"><span class="Hours">%H </span><span class="text">' + countdownHours + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Hours">%H </span><span class="text">' + countdownHour + '</span></span>';
	}
	if (event.offset.minutes > 1) {
	    format = format + '<span class="section_cout"><span class="Minutes">%M </span><span class="text">' + countdownMinutes + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Minutes">%M </span><span class="text">' + countdownMinute + '</span></span>';
	}
	if (event.offset.seconds > 1) {
	    format = format + '<span class="section_cout"><span class="Seconds">%S </span><span class="text">' + countdownSeconds + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Seconds">%S </span><span class="text">' + countdownSecond + '</span></span>';
	}
	el.html(event.strftime(format)).fadeIn();
    });
}
function initScrollTop() {
	var _topSticky1 = $('#header').innerHeight();
    var el = $('#back-top');
    if ($(this).scrollTop() > _topSticky1) {
	el.fadeIn();
    } else {
	el.fadeOut();
    }
    $(window).on('scroll', function() {
	if ($(this).scrollTop() > _topSticky1) {
	    el.fadeIn();
	} else {
	    el.fadeOut();
	}
    });
    el.on('click', function() {
	$('html, body').animate({scrollTop: 0}, '400');
    });
}


function LoadPercCMS() {
    $('.cms-line').each(function() {
	var t = $(this);
	var dataperc = t.attr('id'), dataperc_int = dataperc.replace("a", ""), barperc = Math.round(dataperc_int);
	t.find('.cms-line-comp').animate({width: barperc + "%"}, dataperc_int * 25);
	t.find('.label').append('<div class="perc"></div>');
	function perc() {
	    var t_length = parseInt($('.cms-line').css('width'));
	    var length = t.find('.cms-line-comp').css('width'), perc_div = (parseInt(length) / t_length * 100), perc = Math.round(parseInt(perc_div)), labelpos = (100 - perc);
	    t.find('.label').css('right', labelpos + '%');
	    t.find('.perc').text(perc + '%');
	}
	perc();
	setInterval(perc, 0);
    });
}
function LoadPercCMS_rtl() {
    $('.cms-line').each(function() {
	var t = $(this);
	var dataperc = t.attr('id'), dataperc_int = dataperc.replace("a", ""), barperc = Math.round(dataperc_int);
	t.find('.cms-line-comp').animate({width: barperc + "%"}, dataperc_int * 25);
	t.find('.label').append('<div class="perc"></div>');
	function perc() {
	    var t_length = parseInt($('.cms-line').css('width'));
	    var length = t.find('.cms-line-comp').css('width'), perc_div = (parseInt(length) / t_length * 100), perc = Math.round(parseInt(perc_div)), labelpos = (100 - perc);
	    t.find('.label').css('left', labelpos + '%');
	    t.find('.perc').text(perc + '%');
	}
	perc();
	setInterval(perc, 0);
    });
}
function Field_fullwidth() {
    $('.fieldFullWidth').each(function() {
	var t = $(this);
        var fullwidth = $('main').width(),
            margin_full = fullwidth/2;
       if (LANG_RTL != 1) {
        t.css({'left': '50%', 'position': 'relative', 'width': fullwidth, 'margin-left': -margin_full});
    } else{
        t.css({'right': '50%', 'position': 'relative', 'width': fullwidth, 'margin-right': -margin_full});
    }
    });
}
function VmenuDropDown() {
    VmenuClick = '#header_menu .v-megamenu-title,.vmega_responsive .v-megamenu-title';
    VmenuSlide = '#header_menu .v-megamenu,.vmega_responsive .v-megamenu';
    activeVmenu = 'active';
    $(VmenuClick).on('click', function(e) {
	e.stopPropagation();
	var subUl = $(this).next(VmenuSlide);
	if (subUl.is(':hidden') && !$(this).hasClass('Click')) {
	    subUl.slideDown();
	    $(this).addClass(activeVmenu);
	} else if (!$(this).hasClass('Click')) {
	    subUl.slideUp();
	    $(this).removeClass(activeVmenu);
	}
    });
    $(VmenuSlide).on('click', function(e) {
	e.stopPropagation();
    });
    $(document).on('click', function(e) {
	e.stopPropagation();
	var elementVmenu = $(VmenuClick).next(VmenuSlide);
	if (!$(VmenuClick).hasClass('Click')) {
	    $(VmenuClick).removeClass('active');
	    $(elementVmenu).slideUp();
	}
    });
    $(".vmega_responsive .v-megamenu-title").removeClass('Click');
    
}

 
  
function field_mobile_menu() { 
	if($(window).width() <= 991){
			$(window).scroll(function(){
			  if( $(this).scrollTop() > 60 ){
			   $("#header_mobile_menu").addClass("header-sticky-hide");
			   $('#header_mobile_menu').css({'position': 'fixed', 'z-index': '1030', 'top': '0', 'left': '0', 'right': '0'});
			   $("#sticky_top").addClass("header-sticky-mobile");
			   $('#sticky_top').css({'position': 'fixed', 'z-index': '9999', 'top': '0'});
			   
			  } else {
			   $("#header_mobile_menu").removeClass("header-sticky-hide");
			   $('#header_mobile_menu').attr('style','');
			   $("#sticky_top").removeClass("header-sticky-mobile");
			   $('#sticky_top').attr('style','');
			   
			  }
			 });
			 
	}
}
/*
$(window).bind('resize', function() {
     location.reload();
});
*/
/*
if ($(window.width() > "769") {
    $(window).resize(function () {
        if ($(window).width() < "769") {
            location.reload();
        }
    });

}
elseif($(window.width() < "769") {

    $(window).resize(function () {
        if ($(window).width() > "769") {
            location.reload();
        }
    });

}
*/

/* 
var ww = $(window).width();
var limit = 769;

function refresh() {
   ww = $(window).width();
   var w =  ww<limit ? (location.reload(true)) :  ( ww>limit ? (location.reload(true)) : ww=limit );
}

var tOut;
$(window).resize(function() {
    var resW = $(window).width();
    clearTimeout(tOut);
    if ( (ww>limit && resW<limit) || (ww<limit && resW>limit) ) {        
        tOut = setTimeout(refresh, 100);
    }
});
*/



var width = $(window).width();
$(window).resize(function() {
    if (width > 769 && $(window).width() < 769) {
        location.reload();
    }
    else if (width < 769 && $(window).width() > 769) {
        location.reload();
    }
});

