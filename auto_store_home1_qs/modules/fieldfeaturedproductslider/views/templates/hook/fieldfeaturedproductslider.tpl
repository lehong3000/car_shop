<!-- MODULE Featured Products Products -->

<div id="featured_products_block" class="block  horizontal_mode clearfix">
	{if isset($fieldfeaturedpsl.FIELD_FEATUREDPSL_TITLE) && $fieldfeaturedpsl.FIELD_FEATUREDPSL_TITLE != ""}
            <h4 class="title_block title_font">
                <span class="title_text">{$fieldfeaturedpsl.FIELD_FEATUREDPSL_TITLE}</span>
            </h4>
        {/if}
          
	{if isset($products) AND $products}
		<div id="featured_products" class="carousel-grid owl-carousel">
        {assign var="i" value="0"}
        {if isset($fieldfeaturedpsl.FIELD_FEATUREDPSL_COLUMNITEM) && $fieldfeaturedpsl.FIELD_FEATUREDPSL_COLUMNITEM}{assign var="y" value=$fieldfeaturedpsl.FIELD_FEATUREDPSL_COLUMNITEM}{else}{assign var="y" value=1}{/if}<!--Number Row-->
      {foreach from=$products item='product'}
           {if $i mod $y eq 0}         
           <div class="item">
           {/if}
            <div class="item-inner">
                 <div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
                 <div class="left-product">
                      <a href="{$product.url}" class="thumbnail product-thumbnail">
                      	<span class="cover_image">
                            <img
                              src = "{$product.cover.bySize.large_default.url}"
                              data-full-size-image-url = "{$product.cover.large.url}" alt=""
                                {if isset($size_large_default.width)}width="{$size_large_default.width}"{/if}
                              {if isset($size_large_default.height)}height="{$size_large_default.height}"{/if} 
                            >
                        </span>
                        {if isset($product.images[1])}
                        <span class="hover_image">
                            <img 
                              src = "{$product.images[1].bySize.large_default.url}"
                              data-full-size-image-url = "{$product.images[1].bySize.large_default.url}" alt=""
                                   {if isset($size_large_default.width)}width="{$size_large_default.width}"{/if}
                              {if isset($size_large_default.height)}height="{$size_large_default.height}"{/if} 
                            > 
                        </span>
                        {/if}               
                      </a> 
                      <div class="conditions-box">
                            {if isset($product.show_condition) && $product.condition.type == "new" && $product.show_condition == 1  && isset($product.new) && $product.new == 1 }
                            <span class="new_product">{l s='New' mod='fieldfeaturedproductslider'}</span>
                            {/if}
                            {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price }
                            <span class="sale_product">{l s='Sale' mod='fieldfeaturedproductslider'}</span>
                            {/if}  
                            </div> 
                                        
                    <div class="button-action">
                          <a href="javascript:void(0)" class="quick-view" data-link-action="quickview" title="{l s='Quick view' mod='fieldfeaturedproductslider'}"> 
                            <i class="fa fa-eye"></i>
                          </a>
                    </div>
                    </div>  
                    <div class="right-product">  
                        {if isset($FIELD_enableCountdownTimer) && $FIELD_enableCountdownTimer && isset($product.specific_prices.to) && $product.specific_prices.to != '0000-00-00 00:00:00'}
                            <div class="countdown_bottom">
                                <span class="item-countdown">
                                    <span class="bg_tranp"></span>
                                    <span class="item-countdown-time" data-time="{$product.specific_prices.to}"></span>
                                </span>
                            </div>
                        {/if}
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
                            {if !$configuration.is_catalog}
                            <form action="{$urls.pages.cart}" method="post">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}">
                                  <button class="add-to-cart" data-button-action="add-to-cart" type="submit" {if !$product.add_to_cart_url }disabled{/if}>
                                  {if $product.quantity || ($product.quantity == 0 && $product.add_to_cart_url)}
                                     {l s='Add to cart' mod='fieldfeaturedproductslider'}
                                  {else}
                                    <i class="fa fa-ban"></i>
                                  {/if}  
                                  </button>
                            </form>
                              {/if}
                        </div>
                        </div>
                    </div>
                </div>
                
           </div>
           {assign var="i" value="`$i+1`"}
                {if $i mod $y eq 0 || $i eq count($products)}
                   </div>
                {/if}
        {/foreach}
		</div>
	{else}
		<p>{l s='No products at this time.' mod='fieldfeaturedproductslider'}</p>
	{/if}
</div>  








<script >
{if ($fieldfeaturedpsl.FIELD_FEATUREDPSL_MAXITEM)}
	var fieldfeaturedpsl_maxitem = {$fieldfeaturedpsl.FIELD_FEATUREDPSL_MAXITEM};
	{else}
	var fieldfeaturedpsl_maxitem=3;
{/if}	
{if ($fieldfeaturedpsl.FIELD_FEATUREDPSL_MEDIUMITEM)}
	var fieldfeaturedpsl_mediumitem={$fieldfeaturedpsl.FIELD_FEATUREDPSL_MEDIUMITEM};
	{else}
	var fieldfeaturedpsl_mediumitem=2;
{/if}
{if ($fieldfeaturedpsl.FIELD_FEATUREDPSL_MINITEM)}
	var fieldfeaturedpsl_minitem={$fieldfeaturedpsl.FIELD_FEATUREDPSL_MINITEM}
	{else}
	var fieldfeaturedpsl_minitem=1;
{/if}
{if ($fieldfeaturedpsl.FIELD_FEATUREDPSL_AUTOSCROLL)}
	var fieldfeaturedpsl_autoscroll={$fieldfeaturedpsl.FIELD_FEATUREDPSL_AUTOSCROLLDELAY}
	{else}
	var fieldfeaturedpsl_autoscroll=false;
{/if}
{if ($fieldfeaturedpsl.FIELD_FEATUREDPSL_PAUSEONHOVER)}
	var fieldfeaturedpsl_pauseonhover=true;
	{else}
	var fieldfeaturedpsl_pauseonhover=false;
{/if}
{if ($fieldfeaturedpsl.FIELD_FEATUREDPSL_PAGINATION)}
	var fieldfeaturedpsl_pagination=true;
	{else}
	var fieldfeaturedpsl_pagination=false;
{/if}
{if ($fieldfeaturedpsl.FIELD_FEATUREDPSL_NAVIGATION)}
	var fieldfeaturedpsl_navigation=true;
	{else}
	var fieldfeaturedpsl_navigation=false;
{/if}



$(window).load(function() {
    $('#featured_products').owlCarousel({
        itemsCustom: [ [0, 1], [320, 1], [480, fieldfeaturedpsl_minitem], [568, fieldfeaturedpsl_mediumitem], [992, fieldfeaturedpsl_maxitem], [1200, fieldfeaturedpsl_maxitem] ],
        responsiveRefreshRate: 50,
        slideSpeed: 200,
        paginationSpeed: 500,
        rewindSpeed: 600,
        autoPlay: fieldfeaturedpsl_autoscroll,
        stopOnHover: fieldfeaturedpsl_pauseonhover,
        rewindNav: true,
        pagination: fieldfeaturedpsl_pagination,
        navigation: fieldfeaturedpsl_navigation,
        navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
    });
});
</script>
<!-- /MODULE Featured Products -->