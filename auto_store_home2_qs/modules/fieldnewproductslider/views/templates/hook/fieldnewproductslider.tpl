<!-- MODULE News Products Products -->
<div id="field_newproductslider_block" class="block horizontal_mode clearfix">
	{if isset($fieldnewpsl.FIELD_NEWPSL_TITLE) && $fieldnewpsl.FIELD_NEWPSL_TITLE != ""}
            <h4 class="title_block title_font">
                <a class="title_text" href="{$link->getPageLink('new-products')|escape:'html'}" title="{$fieldnewpsl.FIELD_NEWPSL_TITLE}">
                    {$fieldnewpsl.FIELD_NEWPSL_TITLE}
                </a>
            </h4>
        {/if}
          
	{if isset($new_products) AND $new_products}
		<div id="new_products" class="carousel-grid owl-carousel">
        {assign var="i" value="0"}
        {if isset($fieldnewpsl.FIELD_NEWPSL_COLUMNITEM) && $fieldnewpsl.FIELD_NEWPSL_COLUMNITEM}{assign var="y" value=$fieldnewpsl.FIELD_NEWPSL_COLUMNITEM}{else}{assign var="y" value=1}{/if}<!--Number Row-->
      {foreach from=$new_products item='product'}
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
                            <span class="new_product">{l s='New' mod='fieldnewproductslider'}</span>
                            {/if}
                            {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price }
                            <span class="sale_product">{l s='Sale' mod='fieldnewproductslider'}</span>
                            {/if}  
                     </div>
                 {*    {if isset($FIELD_enableCountdownTimer) && $FIELD_enableCountdownTimer && isset($product.specific_prices.to) && $product.specific_prices.to != '0000-00-00 00:00:00'}
					    <span class="item-countdown">
						<span class="bg_tranp"></span>
						<span class="item-countdown-time" data-time="{$product.specific_prices.to}"></span>
					    </span>
					{/if} *}
                    <div class="button-action">
                          <a href="javascript:void(0)" class="quick-view" data-link-action="quickview" title="{l s='Quick view' mod='fieldnewproductslider'}"> 
                            <i class="fa fa-eye"></i>
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
                              <button class="add-to-cart" data-button-action="add-to-cart" type="submit" {if !$product.quantity}disabled{/if}>
                              {if $product.quantity}
                                {l s='Add to cart' mod='fieldnewproductslider'}
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
	{else}
		<p>{l s='No products at this time.' mod='fieldnewproductslider'}</p>
	{/if}
</div>  








<script >
{if ($fieldnewpsl.FIELD_NEWPSL_MAXITEM)}
	var fieldnewpsl_maxitem = {$fieldnewpsl.FIELD_NEWPSL_MAXITEM};
	{else}
	var fieldnewpsl_maxitem=3;
{/if}	
{if ($fieldnewpsl.FIELD_NEWPSL_MEDIUMITEM)}
	var fieldnewpsl_mediumitem={$fieldnewpsl.FIELD_NEWPSL_MEDIUMITEM};
	{else}
	var fieldnewpsl_mediumitem=2;
{/if}
{if ($fieldnewpsl.FIELD_NEWPSL_MINITEM)}
	var fieldnewpsl_minitem={$fieldnewpsl.FIELD_NEWPSL_MINITEM}
	{else}
	var fieldnewpsl_minitem=1;
{/if}
{if ($fieldnewpsl.FIELD_NEWPSL_AUTOSCROLL)}
	var fieldnewpsl_autoscroll={$fieldnewpsl.FIELD_NEWPSL_AUTOSCROLLDELAY}
	{else}
	var fieldnewpsl_autoscroll=false;
{/if}
{if ($fieldnewpsl.FIELD_NEWPSL_PAUSEONHOVER)}
	var fieldnewpsl_pauseonhover=true;
	{else}
	var fieldnewpsl_pauseonhover=false;
{/if}
{if ($fieldnewpsl.FIELD_NEWPSL_PAGINATION)}
	var fieldnewpsl_pagination=true;
	{else}
	var fieldnewpsl_pagination=false;
{/if}
{if ($fieldnewpsl.FIELD_NEWPSL_NAVIGATION)}
	var fieldnewpsl_navigation=true;
	{else}
	var fieldnewpsl_navigation=false;
{/if}


$(window).load(function() {
    $('#new_products').owlCarousel({
        itemsCustom: [ [0, 1], [320, 1], [480, fieldnewpsl_minitem],[600, fieldnewpsl_mediumitem], [768, fieldnewpsl_mediumitem], [992, fieldnewpsl_maxitem], [1200, fieldnewpsl_maxitem] ],
        responsiveRefreshRate: 50,
        slideSpeed: 200,
        paginationSpeed: 500,
        rewindSpeed: 600,
        autoPlay: fieldnewpsl_autoscroll,
        stopOnHover: fieldnewpsl_pauseonhover,
        rewindNav: true,
        pagination: fieldnewpsl_pagination,
        navigation: fieldnewpsl_navigation,
        navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
    });
});
</script>
<!-- /MODULE News Products -->