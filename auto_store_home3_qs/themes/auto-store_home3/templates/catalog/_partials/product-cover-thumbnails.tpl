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
<div class="images-container">
    {block name='product_cover'}
    <div class="product-cover">
      <img class="js-qv-product-cover img-responsive" src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}"  style="max-width:100%;height:auto" itemprop="image"
      {if isset($size_large_default.width)}width="{$size_large_default.width}"{/if}
      {if isset($size_large_default.height)}height="{$size_large_default.height}"{/if} 
      >
      <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
        <i class="material-icons zoom-in">&#xE8FF;</i>
      </div>
    </div>
  {/block}

  {block name='product_images'}
    {if isset($FIELD_productVerticalThumb) && $FIELD_productVerticalThumb==1}
           <div class="total1 js-qv-mask mask">
             {assign var=_expand_id value=10|mt_rand:100000000}
               <div class="product-images ">
              <div id="carousel1">
              <ul id="carousel" class="ul-product-images">
                 {foreach from=$product.images item=image}
               <li class="vertical-thumb">

                     <img
                       class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                       data-image-medium-src="{$image.bySize.medium_default.url}"
                       data-image-large-src="{$image.bySize.large_default.url}"
                       src="{$image.bySize.small_default.url}"
                       alt="{$image.legend}"
                       title="{$image.legend}"
                       width="100"
                       itemprop="image"
                     />
                   </li>

                 {/foreach}
                </ul>
                 <span class="vertical-up"><i class="fa fa-chevron-up" aria-hidden="true"></i></span>
                 <span class="vertical-down"><i class="fa fa-chevron-down" aria-hidden="true"></i>
                </span>
                    </div>
                    </div>
                  </div>
                    <script >
                    $(document).ready(function(){
                        var wrapper = $('#carousel1');
                           var items = 3;
                                       if( $(window).width() < 420 ){
                                               items = 2;
                                       }
                                       else if( $(window).width() < 768 ){
                                               items = 3;
                                       }
                                       else if( $(window).width() < 992 ){
                                               items = 3;
                                       }
                                       else{
                                               items = items;
                                       }
                                        $('#carousel1').css('height', $('#carousel').children((":first")).outerHeight()*items + 'px');
                           if ($('#left-sidebar').length > 0 || $('#right-sidebar').length > 0) {
                               items = 3;
                           }
                           if ($('#left-sidebar').length > 0 && $('#right-sidebar').length > 0) {
                               items = 4;
                           }
                           var _slider_data = {
                               items: items
                               , direction: 'up'
                               , width: 'auto'
                               , height: '150px'
                               , infinite: true
                               , prev: wrapper.find('.vertical-up').selector
                               , next: wrapper.find('.vertical-down').selector
                               , auto: {
                                   play: true
                                   , timeoutDuration: 5000
                                   , duration: 800
                                   , delay: 3000
                                   , items: 1
                                   , pauseOnHover: true
                               }
                               , scroll: {
                                   items: 1
                               }
                               , swipe: {
                                   onTouch: true
                                   , onMouse: true
                               }
                               , onCreate: function () {
                                   wrapper.addClass('loaded').removeClass('loading');
                               }
                           };
                           wrapper.find('#carousel').carouFredSel(_slider_data);

                           $(window).bind('load', function () {
                               $(window).trigger('resize');
                           });
               });
                </script>
                  {else}

            <div class="js-qv-mask mask">
           {assign var=_expand_id value=10|mt_rand:100000000}
             <div class="product-images product-images-{$_expand_id} js-qv-product-images carousel-grid owl-carousel">
               {foreach from=$product.images item=image}
                 <div class="thumb-container">
                   <img
                     class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                     data-image-medium-src="{$image.bySize.medium_default.url}"
                     data-image-large-src="{$image.bySize.large_default.url}"
                     src="{$image.bySize.home_default.url}"
                     alt="{$image.legend}"
                     title="{$image.legend}"
                     width="100"
                     itemprop="image"
                   >
                 </div>
               {/foreach}
             </div>
           </div>
       <script >
       $(document).ready(function() {
           $('.product-images-{$_expand_id}').owlCarousel({
               itemsCustom: [ [0, 2], [320, 2], [568, {if count($product.images) >=3}3{else}{count($product.images)}{/if}]],
               responsiveRefreshRate: 50,
               slideSpeed: 200,
               paginationSpeed: 500,
               rewindSpeed: 600,
               autoPlay: false,
               stopOnHover: false,
               rewindNav: true,
               pagination: false,
               navigation: true,
               navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
           });
       });
       </script>
{/if}
  {/block}

</div>
{if isset($HOOK_ELEVATEZOOM) && !empty($HOOK_ELEVATEZOOM) && $page.page_name=='product'}
    {$HOOK_ELEVATEZOOM nofilter}
{/if}