{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- MODULE Field product cates -->
<div id="field_productcates" class="block horizontal_mode">
        <h4 class="title_block title_font">
            <span class="title_text">{l s='related products' mod='fieldproductcates'}</span>
        </h4>
        
	{if $categoryProducts|@count > 0}
        <div id="productCates" class="carousel-grid owl-carousel">
           {assign var="i" value="0"}
			{assign var="y" value="1"}
      {foreach from=$categoryProducts item='product'}
           {if $i mod $y eq 0}         
           <div class="item">
           {/if}
            <div class="item-inner">
                 <div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
                 <div class="left-product">
                      <a href="{$product.url}" class="thumbnail product-thumbnail">
                      	<span class="cover_image">
                            <img
                              src = "{$product.cover.bySize.home_default.url}"
                              data-full-size-image-url = "{$product.cover.large.url}" alt=""
                                   {if isset($size_home_default.width)}width="{$size_home_default.width}"{/if}
                              {if isset($size_home_default.height)}height="{$size_home_default.height}"{/if} 
                            >
                        </span>
                        {if isset($product.images[1])}
                        <span class="hover_image">
                            <img 
                              src = "{$product.images[1].bySize.home_default.url}"
                              data-full-size-image-url = "{$product.images[1].bySize.home_default.url}" alt=""
                                   {if isset($size_home_default.width)}width="{$size_home_default.width}"{/if}
                              {if isset($size_home_default.height)}height="{$size_home_default.height}"{/if} 
                            > 
                        </span>
                        {/if}               
                      </a> 
                       <div class="conditions-box">
                            {if isset($product.show_condition) && $product.condition.type == "new" && $product.show_condition == 1  && isset($product.new) && $product.new == 1 }
                            <span class="new_product"><span>{l s='New' mod='fieldfeaturedproductslider'}</span></span>
                            {/if}
                            {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price }
                            <span class="sale_product"><span>{l s='Sale' mod='fieldfeaturedproductslider'}</span></span>
                            {/if}  


                            </div>
                     {if isset($FIELD_enableCountdownTimer) && $FIELD_enableCountdownTimer && isset($product.specific_prices.to) && $product.specific_prices.to != '0000-00-00 00:00:00'}
					    <span class="item-countdown">
						<span class="bg_tranp"></span>
						<span class="item-countdown-time" data-time="{$product.specific_prices.to}"></span>
					    </span>
					{/if} 
                    <div class="button-action">
                    
                          <a href="javascript:void(0)" class="quick-view" data-link-action="quickview" title="{l s='Quick view' mod='fieldnewproductslider'}"> 
                            <i class="fa fa-search"></i>
                          </a>
                    </div>
                    </div>  
                 <div class="right-product">       
                        <div class="product-description">
                          {hook h='DisplayProductListReviews' product=$product}
                            <div class="product_name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></div> 
                           
                            {if $product.show_price}
                              <div class="product-price-and-shipping">
                              	<span class="price">{$product.price}</span>
                                {if $product.has_discount}
                                  {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                  <span class="regular-price">{$product.regular_price}</span>
                                  {if $product.discount_type === 'percentage'}
                                    <span class="price-percent-reduction">{$product.discount_percentage}</span>
                                  {/if}
                                {/if}
                                {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                
                    
                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                    
                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                              </div>
                            {/if}
                             <div class="bottom_cart">
                                 {hook h='displayProductListFunctionalButtons' product=$product}
                                {if !$configuration.is_catalog}
                            <form action="{$urls.pages.cart}" method="post">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}">
                                  <button title="{l s='Add to cart' mod='fieldfeaturedproductslider'}" class="add-to-cart" data-button-action="add-to-cart" type="submit" {if !$product.quantity}disabled{/if}>
                                  {if $product.quantity}
                                   {l s='Add to cart' mod='fieldfeaturedproductslider'}
                                  {else}
                                    <i class="fa fa-ban"></i>
                                  {/if}  
                                  </button>
                            </form>
                                  {/if}
                                  {hook h='displayCompareButton' product=$product} 
                        </div>
                     
                        </div>
                           
                    </div>
                </div>
           </div>
           {assign var="i" value="`$i+1`"}
                {if $i mod $y eq 0 || $i eq count($new_products)}
                   </div>
                {/if}
                    {/foreach}
		</div>
            <script >
			$(window).load(function() {
                $('#productCates').owlCarousel({
                    itemsCustom: [ [0, 1], [320, 1], [480, 2], [568, {$slideOptions.FIELD_PRODUCTCATES_MEDIUMITEM}], [992, 4], [1200, {$slideOptions.FIELD_PRODUCTCATES_MAXITEM}] ],
                    responsiveRefreshRate: 50,
                    slideSpeed: 200,
                    paginationSpeed: 500,
                    rewindSpeed: 600,
                    autoPlay: {if $slideOptions.FIELD_PRODUCTCATES_AUTOSCROLL}{$slideOptions.FIELD_PRODUCTCATES_AUTOSCROLLDELAY}{else}false{/if},
                    stopOnHover: {if $slideOptions.FIELD_PRODUCTCATES_PAUSEONHOVER}true{else}false{/if},
                    rewindNav: true,
                    pagination: {if $slideOptions.FIELD_PRODUCTCATES_PAGINATION}true{else}false{/if},
                    navigation: {if $slideOptions.FIELD_PRODUCTCATES_NAVIGATION}true{else}false{/if},
       				navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
                });
				});
            </script>
	{/if}
</div>
<!-- /MODULE Field product cates -->