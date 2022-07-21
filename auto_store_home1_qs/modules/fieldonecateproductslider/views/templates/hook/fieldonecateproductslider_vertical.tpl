<!-- MODULE Featured Products Products -->
<div id="onecate_products_block" class="block vertical_mode clearfix">
	{if isset($fieldonecatepsl.FIELD_ONECATEPSL_TITLE) && $fieldonecatepsl.FIELD_ONECATEPSL_TITLE != ""}
            <h4 class="title_block title_font">
                <span class="title_text">{$fieldonecatepsl.FIELD_ONECATEPSL_TITLE}</span>
            </h4>
        {/if}
          
	{if isset($products) AND $products}
		<div id="onecate_products" class="carousel-grid owl-carousel">
        {assign var="i" value="0"}
        {if isset($fieldonecatepsl.FIELD_ONECATEPSL_COLUMNITEM) && $fieldonecatepsl.FIELD_ONECATEPSL_COLUMNITEM}{assign var="y" value=$fieldonecatepsl.FIELD_ONECATEPSL_COLUMNITEM}{else}{assign var="y" value=1}{/if}<!--Number Row-->
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
                              src = "{$product.cover.bySize.seller_default.url}"
                              data-full-size-image-url = "{$product.cover.large.url}"
                              alt=""
                              {if isset($size_seller_default.width)}width="{$size_seller_default.width}"{/if}
                              {if isset($size_seller_default.height)}height="{$size_seller_default.height}"{/if}
                            >
                        </span>             
                      </a>  
                    </div>  
                    <div class="right-product">       
                        <div class="product-description">
                            {hook h='DisplayProductListReviews' product=$product}
                            <div class="product_name"><a href="{$product.url}">{$product.name|truncate:27:'...'}</a></div>          
                            {if $product.show_price}
                              <div class="product-price-and-shipping">
                                {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                <span class="price">{$product.price}</span>
                    			{if $product.has_discount}
                                  {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                  <span class="regular-price">{$product.regular_price}</span>
                                {/if}
                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                    
                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                              </div>
                            {/if}
                        </div>
                        {if !$configuration.is_catalog}
                        <form action="{$urls.pages.cart}" method="post">
                            <input type="hidden" name="token" value="{$static_token}">
                            <input type="hidden" name="id_product" value="{$product.id}">
                              <button class="add-to-cart" data-button-action="add-to-cart" type="submit" {if !$product.quantity}disabled{/if}>
                              {if $product.quantity}
                                {l s='Add to cart' mod='fieldonecateproductslider'}
                              {else}
                                {l s='Out of stock' mod='fieldonecateproductslider'}
                              {/if}  
                              </button>
                        </form>
                              {/if}
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
		<p>{l s='No products at this time.' mod='fieldonecateproductslider'}</p>
	{/if}
</div>  








<script >
{if ($fieldonecatepsl.FIELD_ONECATEPSL_MAXITEM)}
	var fieldonecatepsl_maxitem = {$fieldonecatepsl.FIELD_ONECATEPSL_MAXITEM};
	{else}
	var fieldonecatepsl_maxitem=3;
{/if}	
{if ($fieldonecatepsl.FIELD_ONECATEPSL_MEDIUMITEM)}
	var fieldonecatepsl_mediumitem={$fieldonecatepsl.FIELD_ONECATEPSL_MEDIUMITEM};
	{else}
	var fieldonecatepsl_mediumitem=2;
{/if}
{if ($fieldonecatepsl.FIELD_ONECATEPSL_MINITEM)}
	var fieldonecatepsl_minitem={$fieldonecatepsl.FIELD_ONECATEPSL_MINITEM}
	{else}
	var fieldonecatepsl_minitem=1;
{/if}
{if ($fieldonecatepsl.FIELD_ONECATEPSL_AUTOSCROLL)}
	var fieldonecatepsl_autoscroll={$fieldonecatepsl.FIELD_ONECATEPSL_AUTOSCROLLDELAY}
	{else}
	var fieldonecatepsl_autoscroll=false;
{/if}
{if ($fieldonecatepsl.FIELD_ONECATEPSL_PAUSEONHOVER)}
	var fieldonecatepsl_pauseonhover=true;
	{else}
	var fieldonecatepsl_pauseonhover=false;
{/if}
{if ($fieldonecatepsl.FIELD_ONECATEPSL_PAGINATION)}
	var fieldonecatepsl_pagination=true;
	{else}
	var fieldonecatepsl_pagination=false;
{/if}
{if ($fieldonecatepsl.FIELD_ONECATEPSL_NAVIGATION)}
	var fieldonecatepsl_navigation=true;
	{else}
	var fieldonecatepsl_navigation=false;
{/if}





$(window).load(function() {
    $('#onecate_products').owlCarousel({
        itemsCustom: [ [0, 1], [320, 1], [480, fieldonecatepsl_minitem], [768, fieldonecatepsl_mediumitem], [992, fieldonecatepsl_maxitem], [1200, fieldonecatepsl_maxitem] ],
        responsiveRefreshRate: 50,
        slideSpeed: 200,
        paginationSpeed: 500,
        rewindSpeed: 600,
        autoPlay: fieldonecatepsl_autoscroll,
        stopOnHover: fieldonecatepsl_pauseonhover,
        rewindNav: true,
        pagination: fieldonecatepsl_pagination,
        navigation: fieldonecatepsl_navigation,
        navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
    });
});
</script>
<!-- /MODULE Featured Products -->