{**
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
<!doctype html>
<html lang="{$language.iso_code}">

    <head>
        {block name='head'}
            {include file='_partials/head.tpl'}
        {/block}
        {if isset($FIELD_customCSS) && $FIELD_customCSS}
            <!-- Start Custom CSS -->
            <style>{$FIELD_customCSS nofilter}</style>
            <!-- End Custom CSS -->
        {/if}
        <script >
            var LANG_RTL ={$language.is_rtl};
            var langIso = '{$language.language_code}';
            var baseUri = '{$urls.base_url}';
            {if (isset($FIELD_enableCountdownTimer) && $FIELD_enableCountdownTimer)}
            var FIELD_enableCountdownTimer = true;
            {/if}
            {if (isset($FIELD_stickyMenu) && $FIELD_stickyMenu)}
            var FIELD_stickyMenu = true;
            {/if}
            {if (isset($FIELD_stickySearch) && $FIELD_stickySearch)}
            var FIELD_stickySearch = true;
            {/if}
            {if (isset($FIELD_stickyCart) && $FIELD_stickyCart)}
            var FIELD_stickyCart = true;
            {/if}
            {if (isset($FIELD_mainLayout) && $FIELD_mainLayout)}
            var FIELD_mainLayout = '{$FIELD_mainLayout}';
            {/if}
            var countdownDay = '{l s="Day"}';
            var countdownDays = '{l s="Days"}';
            var countdownHour = '{l s="Hour"}';
            var countdownHours = '{l s="Hours"}';
            var countdownMinute = '{l s="Min"}';
            var countdownMinutes = '{l s="Mins"}';
            var countdownSecond = '{l s="Sec"}';
            var countdownSeconds = '{l s="Secs"}';
        </script>
    </head>
    <body id="{$page.page_name}" class="{$page.body_classes|classnames} {if isset($FIELD_mainLayout)}{$FIELD_mainLayout}{/if}">
        {if isset($FIELD_showPanelTool) && $FIELD_showPanelTool}
            {include file="modules/fieldthemecustomizer/views/templates/front/colortool.tpl"}
        {/if}
        {hook h='displayAfterBodyOpeningTag'}

        <main>
            {block name='product_activation'}
                {include file='catalog/_partials/product-activation.tpl'}
            {/block}
            <header id="header">
                <nav class="header-nav">
                    <div class="container">
                        {hook h='displayNav2'}
                    </div>
                </nav> 
                <div class="header-top">
                    <div class="container">
                        <div class="row">
                            <div class="logo_header">
                                <a href="{$urls.base_url}">
                                    <img class="img-responsive logo" src="{$shop.logo}" alt="{$shop.name}">
                                </a>
                            </div>
                            <div id="sticky_top">
                                {hook h='displayTop'}
                            </div>
                        </div>
                    </div>
                    <div class="header-bottom">
                        <!-- MEGAMENU -->
                        <div id="header_menu" class="visible-lg visible-md">
                            <div class="container">
                                <div class="row">
                                     {hook h='vmegamenu'}
                                    {hook h='displayHeaderMenu'}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div id="header_mobile_menu" class="navbar-inactive visible-sm visible-xs">
                <div class="fieldmm-nav col-sm-12 col-xs-12">
                    <div class="container">
                        <div id="menu-mobile">
                            <span id="fieldmm-button"><i class="fa fa-reorder"></i></span>
                                {hook h='displayHeaderMenu' fieldmegamenumobile=true}
                        </div>
                        <div id="sticky_mobile">
       <nav class="header-nav-mobile">
           <div class="nav2">
        <div class="click-nav2">
         <i class="fa fa-bars"></i>
        </div>
        <div class="content-nav2">
         <div class="content-nav2-items">
          {hook h='displayNav2'}
         </div>
        </div>
       </div>
       </nav>
      </div>
                    </div>
                </div>
            </div>
          <div class="container">
            <div class="vmega_responsive">
                {hook h='displayNav1'}
            </div>
          </div>
            <!-- SLIDER SHOW -->

            <!--END SLIDER SHOW -->
            {if $page.page_name=='index'}
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 vmegamenu2"> {hook h='displayNav'}</div>
                        <div class="col-sm-12 col-xs-12 col-md-6">
                           <div id="field_slideshow">{hook h='fieldSlideShow'}</div>
                        </div>
                         <div class="col-sm-12 col-xs-12 col-md-3">
                               {hook h="blockPosition1"}
                        </div>
                    </div>
                </div>
            {/if}
            <!--END SLIDER SHOW -->
            {block name='notifications'}
                {include file='_partials/notifications.tpl'}
            {/block}
            <section id="wrapper" class="active_grid">
                <h2 style="display:none !important">.</h2>

                <div class="container">
                    {block name='banner_categories'}

                    {/block}
                    {*     {block name='breadcrumb'}
                    {include file='_partials/breadcrumb.tpl'}
                    {/block}*}
                    {if (isset($layout) && $layout!='layouts/layout-full-width.tpl') || (isset($layout_category) && $layout_category!='layouts/layout-full-width.tpl')  || (isset($layout_details) && $layout_details!='layouts/layout-full-width.tpl') }
                        <div class="row">
                        {/if}
                        {block name="left_column"}
                            <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
                                {if $page.page_name=='index'}
                                    {hook h="displayLeftColumn"}
                                {else}
                                    {hook h="displayLeftColumn"}
                                {/if}
                            </div>
                        {/block}


                        {block name="content_wrapper"}
                            <div id="content-wrapper" class="left-column right-column col-sm-4 col-md-6">
                                {block name="content"}
                                    <p>Hello world! This is HTML5 Boilerplate.</p>
                                {/block}
                            </div>
                        {/block}

                        {block name="right_column"}
                            <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
                                {hook h="displayRightColumn"}
                            </div>
                        {/block}
                        {if (isset($layout) && $layout!='layouts/layout-full-width.tpl') || (isset($layout_category) && $layout_category!='layouts/layout-full-width.tpl')  || (isset($layout_details) && $layout_details!='layouts/layout-full-width.tpl') }
                        </div>
                    {/if}


                    {block name='mapsforcontact'}
                    {/block}
                </div>

            </section>
            {if $page.page_name =='index'}
                <div class="container">
                  
                    {hook h="tabcateslider"} 
                    {hook h="blockPosition4"}
                     <div class="row">
                         <div class="col-xs-12 col-sm-4">
                            {hook h="featuredproductslider"} 
                         </div>
                         <div class="col-xs-12 col-sm-4">
                             {hook h="onecateproductslider"} 
                         </div>
                         <div class="col-xs-12 col-sm-4">
                              {hook h="bestsellers"} 
                         </div>
                     </div>
                </div>
                <div class="back_blog">
                    <div class="container">
                        {if $page.page_name=='index' && isset($HOOK_SMARTBLOGHOMEPOST) && !empty($HOOK_SMARTBLOGHOMEPOST)} 
                            {$HOOK_SMARTBLOGHOMEPOST nofilter}
                        {/if}
                    </div>
                </div>
             {/if}
            <footer id="footer">
                {if isset($HOOK_FIELDBRANDSLIDER) && !empty($HOOK_FIELDBRANDSLIDER)}
                    <div class ="Brands-block-slider">
                    <div class="container">
                        {$HOOK_FIELDBRANDSLIDER nofilter}
                    </div>
                    </div>
                {/if}
                <div class="block_footer_main">
                    <div class ="footer-center">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-9 col-md-offset-3">
                                    <div class="row">
                                        {hook h='blockFooter1'}
                                    </div>
                                </div>
                            </div>
                            <div class="fotter-top-right">
                                <div class="row">
                                   {hook h='blockFooter2'}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <div class="container">
                               {hook h='blockFooter3'}
                        </div>
                    </div>
                </div>

                <div id="back-top"><a href="javascript:void(0)" class="mypresta_scrollup hidden-phone"><i class="fa fa-chevron-up"></i></a></div>
                        {if isset($FIELD_customJS) && $FIELD_customJS}
                    <!-- Start Custom JS -->
                    <script >{$FIELD_customJS nofilter}</script>
                    <!-- End Custom JS -->
                {/if}
            </footer>

        </main>
        {block name='javascript_bottom'}
            {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
        {/block}
        {hook h='displayBeforeBodyClosingTag'}
    </body>

</html>

