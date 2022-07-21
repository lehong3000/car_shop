$(document).ready(function() {
    function add_backgroundcolor(bgcolor) {
	$('<style type="text/css">.products.horizontal_mode #box-product-list .wishlist-product-list .addToWishlist, .products.horizontal_mode #box-product-list .compare-product-list .compare a, .products.horizontal_mode #box-product-list .quick-view-product-list .quick-view,#search_block_top .btn.button-search,.horizontal_mode .add-to-cart,.horizontal_mode .addToWishlist, .horizontal_mode .compare a,#header .header-nav,#search_block_top.sticky-fixed-top .field-search:hover .btn.button-search, #search_block_top.sticky-fixed-top .field-search:active .btn.button-search, #search_block_top.sticky-fixed-top #search_query_top:focus+.btn.button-search, .sticky-fixed-top #search_block_top .field-search:hover .btn.button-search, .sticky-fixed-top #search_block_top .field-search:active .btn.button-search, .sticky-fixed-top #search_block_top #search_query_top:focus+.btn.button-search,#cart_block_top .cart_top_ajax a.view-cart,#header .dropdown-menu,.sale_product,.menu-bottom .menu-bottom-dec a,.product-actions .add-to-cart:hover,.bootstrap-touchspin .group-span-filestyle .btn-touchspin, .group-span-filestyle .bootstrap-touchspin .btn-touchspin, .group-span-filestyle .btn-default,.btn-tertiary,.btn-primary,.btn,.cart-grid .cart-grid-body > a.label,.field-demo-wrap .control.inactive,.cl-row-reset .cl-reset,#header_mobile_menu,.menu-bottom .menu-bottom-dec a:hover,.page-footer .text-xs-center a,.page-footer a.account-link,#blockcart-modal .cart-content .btn,#cart_block_top .cart_top_ajax a.view-cart,#search_block_top.sticky-fixed-top .field-search:hover .btn.button-search, #search_block_top.sticky-fixed-top .field-search:active .btn.button-search, #search_block_top.sticky-fixed-top #search_query_top:focus+.btn.button-search, .sticky-fixed-top #search_block_top .field-search:hover .btn.button-search, .sticky-fixed-top #search_block_top .field-search:active .btn.button-search, .sticky-fixed-top #search_block_top #search_query_top:focus+.btn.button-search ,.button_unique:hover,#header .nav a:hover:after,#header .nav1 > a:hover:after,#header_menu,a.slide-button,#new_comment_form button:hover{ background-color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">#header_menu .fieldmegamenu .root:hover .root-item > a > .title, #header_menu .fieldmegamenu .root:hover .root-item > .title, #header_menu .fieldmegamenu .root.active .root-item > a > .title, #header_menu .fieldmegamenu .root.active .root-item > .title, #header_menu .fieldmegamenu .root .root-item > a.active > .title,#cart_block_top .cart_top_ajax a.remove-from-cart{ color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.products.horizontal_mode #box-product-list .wishlist-product-list .addToWishlist, .products.horizontal_mode #box-product-list .compare-product-list .compare a, .products.horizontal_mode #box-product-list .quick-view-product-list .quick-view,.horizontal_mode .add-to-cart,#header .nav a:hover ,#header .nav1 > a:hover,.block_fot_top a:hover,a.slide-button,#new_comment_form button:hover{ border-color:#' + bgcolor + '}</style>').appendTo('head');
    }
    function add_hovercolor(hcolor) {
	$('<style type="text/css">#product_comparison .add-to-cart:hover, #product_comparison a.lnk_view:hover,.products.horizontal_mode #box-product-list .wishlist-product-list .addToWishlist:hover, .products.horizontal_mode #box-product-list .compare-product-list .compare a:hover, .products.horizontal_mode #box-product-list .quick-view:hover,.products.horizontal_mode #box-product-list .add-to-cart,#search_block_top .btn.button-search:hover, #search_block_top .btn.button-search.active,#featured_products_block .countdown_bottom,.horizontal_mode .addToWishlist:hover, .horizontal_mode .compare a:hover,.v-megamenu-title,.owl-theme .owl-controls .owl-page span,.owl-buttons [class^="carousel-"] span:hover,#back-top a,.outer-slide [data-u="arrowright"]:hover, .outer-slide [data-u="arrowleft"]:hover, .outer-slide [data-u="navigator"] [data-u="prototype"]:hover, .outer-slide:hover [u="navigator"], .outer-slide [data-u="navigator"] .av[data-u="prototype"],.outer-slide [data-u="arrowright"]:hover:after, .outer-slide [data-u="arrowleft"]:hover:after, .outer-slide [data-u="navigator"] [data-u="prototype"]:hover:after, .outer-slide:hover [u="navigator"]:after, .outer-slide [data-u="navigator"] .av[data-u="prototype"]:after,a.slide-button:hover,#header .dropdown-menu li.current,#header .dropdown-menu li:hover,.new_product,.horizontal_mode .quick-view:hover,.horizontal_mode .add-to-cart:hover,.price-percent-reduction,.vertical_mode .add-to-cart:hover,#header_menu,#header_menu .fieldmegamenu .root:hover .root-item > a > .title,#header_menu .fieldmegamenu .root:hover .root-item > .title,#header_menu .fieldmegamenu .root.active .root-item > a > .title,#header_menu .fieldmegamenu .root.active .root-item > .title,#header_menu .fieldmegamenu .root .root-item > a.active > .title,.menu-bottom .menu-bottom-dec a:hover,.sticky-fixed-top #search_block_top .btn.button-search,.modal-header .close:hover,.has-discount .discount, .has-discount p,.product-actions .add-to-cart,.social-sharing li a:hover,.products.horizontal_mode #box-product-list .quick-view:hover,.products.horizontal_mode #box-product-list .add-to-cart:hover,#recent_article_smart_blog_block_left h4 a,#products .item-product-list .right-product .discount-percentage-product,.products-sort-order .select-list:hover,.block-categories > ul > li:first-child a,#search_filters > h4,.btn-secondary.focus, .btn-secondary:focus, .btn-secondary:hover, .btn-tertiary:focus, .btn-tertiary:hover, .focus.btn-tertiary,.btn-primary.focus,.btn-primary:focus,.btn-primary:hover,.btn:hover,.btn-primary:active,.cart-grid .cart-grid-body > a.label:hover,.pagination .current a,.pagination a:not(.disabled):hover,#cms #cms-about-us .page-subheading ,#cms #cms-about-us .cms-line .cms-line-comp,.field-demo-wrap .control.active,.cl-row-reset .cl-reset:hover,#fieldmegamenu-main.fieldmegamenu .root:hover .root-item > a > .title,#fieldmegamenu-main.fieldmegamenu .root:hover .root-item > .title,#fieldmegamenu-main.fieldmegamenu .root.active .root-item > a > .title,#fieldmegamenu-main.fieldmegamenu .root.active .root-item > .title,#fieldmegamenu-main.fieldmegamenu .root .root-item > a.active > .title,.fieldmegamenu > ul > li.demo_other_menu,.menu-bottom .menu-bottom-dec a,#recent_article_smart_blog_block_left .block_content ul li a.read-more:hover,.field-slideshow-container .flex-control-paging li a:hover, .field-slideshow-container .flex-control-paging li a.flex-active, .nivo-controlNav a:hover, .nivo-controlNav a.active,.page-footer .text-xs-center a:hover,.page-footer a.account-link:hover,#blockcart-modal .cart-content .btn:hover,#cart_block_top .cart_top_ajax a.view-cart:hover,#search_block_top .btn.button-search.active,.sdsblog-box-content .sds_blog_post .right_blog_home .r_more:hover,.footer-newsletter .button-newletter,.button_unique,#countdown_ne ul li .int,.has_absolute .square.lef:before,.has_absolute .square.rig:before,.horizontal_mode .add-to-cart:hover,.block_fot_top,.block-newlette button,.footer4 .footer4-bg,.pos5_social .social a:hover:after,.pagination .current a, .pagination a:not(.disabled):hover,#fieldblockcategories .box-item-inner:hover .right-block-cate,.date_blog.title_font,.btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:active:hover, .open>.btn-primary.dropdown-toggle.focus, .open>.btn-primary.dropdown-toggle:focus, .open>.btn-primary.dropdown-toggle:hover,.title_block span:before, .title_block a:before,.v-megamenu > ul > li:hover, .v-megamenu > ul > li.more-vmegamenu:hover,.tab-category-container-slider h3.title_font:before,#fieldsizechart .cross:hover,#new_comment_form button{ background-color:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">#header .v-main-section-links > li > a, #left-column .v-main-section-links > li > a, .vmegamenu2 .v-main-section-links > li > a, .vmega_responsive .v-main-section-links > li > a,.mobile_links .expand-more:hover i,.v-megamenu-title:after,#right-column .owl-buttons [class^="carousel-"] span:hover,a:hover, a:focus,.title_block a:hover,.box-static_content .fa,#header .content_text h3 a:hover,#header a:hover,#header .header-nav .language-selector:hover .expand-more,#header .header-nav .currency-selector:hover .expand-more,#header .header-nav .language-selector .expand-more[aria-expanded=true],#header .header-nav .currency-selector .expand-more[aria-expanded=true],#header_links li a:hover,.dropdown:hover .expand-more,#cart_block_top span.cart-products-count,.ui-menu .ui-menu-item a.ui-state-focus .search-name-ajax, .ui-menu .ui-menu-item a.ui-state-active .search-name-ajax,.price-ajax,.js-qv-mask .owl-buttons [class^="carousel-"] span:hover,.horizontal_mode .quick-view,.horizontal_mode .add-to-cart i,.price,#header .fieldmegamenu .menu-item.depth-1 > .title a:hover,.fieldmegamenu .submenu .title:hover a,#header .fieldmegamenu .submenu .title a:hover,.menu-bottom h3,.custom_link_feature li:hover a,#fieldmegamenu-mobile.fieldmegamenu > ul > li .no-description .title:hover,.fieldmegamenu .demo_custom_link_cms .menu-item.depth-1 > .title:hover a,body #fieldsizechart-show:hover,.click-product-list-grid > div:hover,.active_list .click-product-list-grid > div.click-product-list,.active_grid .click-product-list-grid > div.click-product-grid,.block-categories a:hover,.block-categories .collapse-icons .add:hover, .block-categories .collapse-icons .remove:hover,.block-categories .arrows .arrow-down:hover, .block-categories .arrows .arrow-right:hover,.product-cover .layer:hover .zoom-in,#fieldmegamenu-mobile.fieldmegamenu .root:hover .root-item > a > .title , #fieldmegamenu-mobile.fieldmegamenu .root:hover .root-item > .title , #fieldmegamenu-mobile.fieldmegamenu .root.active .root-item > a > .title , #fieldmegamenu-mobile.fieldmegamenu .root.active .root-item > .title , #fieldmegamenu-mobile.fieldmegamenu .root .root-item > a.active > .title,.fieldmegamenu .menu-item.depth-1 > .title a:hover,.fieldmegamenu .demo_custom_link_cms .menu-item.depth-1 > .title a:hover,.fieldmegamenu .submenu .title a:hover,.menu-bottom h3,.custom_link_feature li a:hover,.custom-col-html a,.custom-col-html h4,#recent_article_smart_blog_block_left .block_content ul li .info,.info-category span,.info-category span a,.order-confirmation-table .text-xs-left,.order-confirmation-table .text-xs-right,#order-items table tr td:last-child,.page-my-account #content .links a:hover,.page-my-account #content .links a:hover i,body#checkout section.checkout-step .add-address a:hover,.page-addresses .address .address-footer a:hover,.cart-summary-line .value,.product-line-grid-right .cart-line-product-actions, .product-line-grid-right .product-price,#blockcart-modal .cart-content p,.product-price,#blockcart-modal .divide-right p.price,.tabs .nav-tabs .nav-link.active, .tabs .nav-tabs .nav-link:hover,.cart_top_ajax:before,#cart_block_top .product-name-ajax a:hover,#cart_block_top .cart_top_ajax a.remove-from-cart:hover,#search_block_top .current:hover,#search_block_top .current[aria-expanded=true],#search_block_top div.dropdown-menu:before,#search_block_top .search_filter div.selector.hover span::before, #search_block_top .search_filter div.selector.focus span::before,.right_blog_home .content h3:hover a,#testimonials_block_right .next.bx-next:hover:before,#testimonials_block_right .prev.bx-prev:hover:before,.footer-bottom p a,.social_footer a:hover, .breadcrumb li:last-child a,#wrapper .breadcrumb li a:hover,.popup_title h2 span,#mobile_links .expand-more:hover,#mobile_links .expand-more:hover i,.box-static_content:hover .fa,.box-static_content:hover a,.has_absolute,.horizontal_mode .product_name a:hover,.block-fot ul li a:hover,#smart-blog-custom .news_module_image_holder:hover .right_blog_home .content a,.pos5_text .name,.tab-category-container-slider .tab_cates li:hover, .tab-category-container-slider .tab_cates li.active,#category  .pagination a.next:hover i,.pagination a.previous:hover i,#slide div .content_test p.des_namepost,#fieldblockcategories  .name_block,.cart-grid-body a.label:hover,.fotter-top-right .collapse li a:hover,div.star.star_hover:after,div.star.star_on:after,body#checkout a:hover,#header .v-main-section-links > li > a, #left-column .v-main-section-links > li > a, .vmega_responsive .v-main-section-links > li > a,.v-megamenu > ul > li:hover a.menu-item-title:hover,#cart_block_top span:hover.fa{ color:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.products.horizontal_mode #box-product-list .wishlist-product-list .addToWishlist:hover, .products.horizontal_mode #box-product-list .compare-product-list .compare a:hover, .products.horizontal_mode #box-product-list .quick-view:hover,.products.horizontal_mode #box-product-list .add-to-cart,.horizontal_mode .add-to-cart:hover,.outer-slide [data-u="arrowright"]:hover:before, .outer-slide [data-u="arrowleft"]:hover:before, .outer-slide [data-u="navigator"] [data-u="prototype"]:hover:before, .outer-slide:hover [u="navigator"]:before, .outer-slide [data-u="navigator"] .av[data-u="prototype"]:before,a.slide-button:hover,.js-qv-mask .owl-buttons [class^="carousel-"] span:hover,.vertical_mode .add-to-cart:hover,.fieldmegamenu .menu-items:before,#header_menu.fieldmegamenu-sticky,.social-sharing li a:hover,.form-control:focus,.search-widget form input[type="text"]:focus,.cart_top_ajax,.sdsblog-box-content .sds_blog_post .right_blog_home .r_more:hover,#dropdown-01,.has_absolute .square,.pagination .current a, .pagination a:not(.disabled):hover,#fieldblockcategories .box-item-inner:hover .right-block-cate,#new_comment_form button{ border-color:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.v-megamenu > ul > li:hover > a,.tabs .nav-tabs,#product_comparison .cmp_remove::before{ border-bottom-color:#' + hcolor + '}</style>').appendTo('head'); 
    }
    $('.control').click(function() {

	if ($(this).hasClass('inactive')) {
	    $(this).removeClass('inactive');
	    $(this).addClass('active');
	    if (LANG_RTL == '1') {
		$('.field-demo-wrap').animate({right: '0'}, 500);
	    } else {
		$('.field-demo-wrap').animate({left: '0'}, 500);
	    }
	    $('.field-demo-wrap').css({'box-shadow': '0 0 10px #adadad', 'background': '#fff'});
	    $('.field-demo-option').animate({'opacity': '1'}, 500);
	    $('.field-demo-title').animate({'opacity': '1'}, 500);
	} else {
	    $(this).removeClass('active');
	    $(this).addClass('inactive');
	    if (LANG_RTL == '1') {
		$('.field-demo-wrap').animate({right: '-210px'}, 500);
	    } else {
		$('.field-demo-wrap').animate({left: '-210px'}, 500);
	    }
	    $('.field-demo-wrap').css({'box-shadow': 'none', 'background': 'transparent'});
	    $('.field-demo-option').animate({'opacity': '0'}, 500);
	    $('.field-demo-title').animate({'opacity': '0'}, 500);
	}
    });
    $('#backgroundColor, #hoverColor').each(function() {
	var $el = $(this);
	/* set time */var date = new Date();
	date.setTime(date.getTime() + (1440 * 60 * 1000));
	$el.ColorPicker({color: '#555555', onChange: function(hsb, hex, rgb) {
		$el.find('div').css('backgroundColor', '#' + hex);
		switch ($el.attr("id")) {
		    case 'backgroundColor' :
			add_backgroundcolor(hex);
			$.cookie('background_color_cookie', hex, {expires: date});
			break;
		    case 'hoverColor' :
			add_hovercolor(hex);
			$.cookie('hover_color_cookie', hex, {expires: date});
			break;
		    }
	    }});
    });
    /* set time */var date = new Date();
    date.setTime(date.getTime() + (1440 * 60 * 1000));
    if ($.cookie('background_color_cookie') && $.cookie('hover_color_cookie')) {
	add_backgroundcolor($.cookie('background_color_cookie'));
	add_hovercolor($.cookie('hover_color_cookie'));
	var backgr = "#" + $.cookie('background_color_cookie');
	var activegr = "#" + $.cookie('hover_color_cookie');
	$('#backgroundColor div').css({'background-color': backgr});
	$('#hoverColor div').css({'background-color': activegr});
    }
    /*Theme mode layout*/
    if (!$.cookie('mode_css') && FIELD_mainLayout == "boxed"){
	$('input[name=mode_css][value=box]').attr("checked", true);
    } else if (!$.cookie('mode_css') && FIELD_mainLayout == "fullwidth") {
	$('input[name=mode_css][value=wide]').attr("checked", true);
    } else if ($.cookie('mode_css') == "boxed") {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('boxed');
	$.cookie('mode_css', 'boxed');
	$.cookie('mode_css_input', 'box');
	$('input[name=mode_css][value=box]').attr("checked", true);
    } else if ($.cookie('mode_css') == "fullwidth") {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('fullwidth');
	$.cookie('mode_css', 'fullwidth');
	$.cookie('mode_css_input', 'wide');
	$('input[name=mode_css][value=wide]').attr("checked", true);
    }
    $('input[name=mode_css][value=box]').click(function() {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('boxed');
	$.cookie('mode_css', 'boxed');
        fullwidth_click();
    });
    $('input[name=mode_css][value=wide]').click(function() {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('fullwidth');
	$.cookie('mode_css', 'fullwidth');
        fullwidth_click();
    });
    $('.cl-td-layout a').click(function() {
	var id_color = this.id;
	$.cookie('background_color_cookie', id_color.substring(0, 6));
	$.cookie('hover_color_cookie', id_color.substring(7, 13));
	add_backgroundcolor($.cookie('background_color_cookie'));
	add_hovercolor($.cookie('hover_color_cookie'));
	var backgr = "#" + $.cookie('background_color_cookie');
	var activegr = "#" + $.cookie('hover_color_cookie');
	$('#backgroundColor div').css({'background-color': backgr});
	$('#hoverColor div').css({'background-color': activegr});
    });
    /*reset button*/$('.cl-reset').click(function() {
	/* Color */$.cookie('background_color_cookie', '');
	$.cookie('hover_color_cookie', '');
	/* Mode layout */$.cookie('mode_css', '');
	location.reload();
    });
    function fullwidth_click(){
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
});