<!-- MODULE Featured Products Products -->
<div id="onecate_products_block_1" class="block horizontal_mode">
	{if isset($fieldonecatepsl_1.FIELD_ONECATEPSL_1_TITLE) && $fieldonecatepsl_1.FIELD_ONECATEPSL_1_TITLE != ""}
            <h4 class="title_block title_font">
                <span class="title_text">{$fieldonecatepsl_1.FIELD_ONECATEPSL_1_TITLE}</span>
            </h4>
        {/if}      
	{if isset($products) AND $products}
		<div id="onecate_products_1" class="carousel-grid owl-carousel">
        {assign var="i" value="0"}
        {if isset($fieldonecatepsl_1.FIELD_ONECATEPSL_1_COLUMNITEM) && $fieldonecatepsl_1.FIELD_ONECATEPSL_1_COLUMNITEM}{assign var="y" value=$fieldonecatepsl_1.FIELD_ONECATEPSL_1_COLUMNITEM}{else}{assign var="y" value=1}{/if}<!--Number Row-->
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
                            <span class="new_product">{l s='New' mod='fieldonecateproductslider_1'}</span>
                            {/if}
                            {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price }
                            <span class="sale_product">{l s='Sale' mod='fieldonecateproductslider_1'}</span>
                            {/if}  
                     </div>
                     {if isset($FIELD_enableCountdownTimer) && $FIELD_enableCountdownTimer && isset($product.specific_prices.to) && $product.specific_prices.to != '0000-00-00 00:00:00'}
					    <span class="item-countdown">
						<span class="bg_tranp"></span>
						<span class="item-countdown-time" data-time="{$product.specific_prices.to}"></span>
					    </span>
					{/if} 
                        <div class="button-action">
                          <a href="javascript:void(0)" class="quick-view" data-link-action="quickview" title="{l s='Quick view' mod='fieldonecateproductslider_1'}"> 
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
                {if $i mod $y eq 0 || $i eq count($products)}
                   </div>
                {/if}
        {/foreach}
		</div>
	{else}
		<p>{l s='No products at this time.' mod='fieldonecateproductslider_1'}</p>
	{/if}
</div>







<script >
{if ($fieldonecatepsl_1.FIELD_ONECATEPSL_1_MAXITEM)}
	var fieldonecatepsl_1_maxitem = {$fieldonecatepsl_1.FIELD_ONECATEPSL_1_MAXITEM};
	{else}
	var fieldonecatepsl_1_maxitem=3;
{/if}	
{if ($fieldonecatepsl_1.FIELD_ONECATEPSL_1_MEDIUMITEM)}
	var fieldonecatepsl_1_mediumitem={$fieldonecatepsl_1.FIELD_ONECATEPSL_1_MEDIUMITEM};
	{else}
	var fieldonecatepsl_1_mediumitem=2;
{/if}
{if ($fieldonecatepsl_1.FIELD_ONECATEPSL_1_MINITEM)}
	var fieldonecatepsl_1_minitem={$fieldonecatepsl_1.FIELD_ONECATEPSL_1_MINITEM}
	{else}
	var fieldonecatepsl_1_minitem=1;
{/if}
{if ($fieldonecatepsl_1.FIELD_ONECATEPSL_1_AUTOSCROLL)}
	var fieldonecatepsl_1_autoscroll={$fieldonecatepsl_1.FIELD_ONECATEPSL_1_AUTOSCROLLDELAY}
	{else}
	var fieldonecatepsl_1_autoscroll=false;
{/if}
{if ($fieldonecatepsl_1.FIELD_ONECATEPSL_1_PAUSEONHOVER)}
	var fieldonecatepsl_1_pauseonhover=true;
	{else}
	var fieldonecatepsl_1_pauseonhover=false;
{/if}
{if ($fieldonecatepsl_1.FIELD_ONECATEPSL_1_PAGINATION)}
	var fieldonecatepsl_1_pagination=true;
	{else}
	var fieldonecatepsl_1_pagination=false;
{/if}
{if ($fieldonecatepsl_1.FIELD_ONECATEPSL_1_NAVIGATION)}
	var fieldonecatepsl_1_navigation=true;
	{else}
	var fieldonecatepsl_1_navigation=false;
{/if}



$(window).load(function() {
    $('#onecate_products_1').owlCarousel({
        itemsCustom: [ [0, 1], [320, 1], [480, fieldonecatepsl_1_minitem], [768, fieldonecatepsl_1_mediumitem], [992, fieldonecatepsl_1_maxitem], [1200, fieldonecatepsl_1_maxitem] ],
        responsiveRefreshRate: 50,
        slideSpeed: 200,
        paginationSpeed: 500,
        rewindSpeed: 600,
        autoPlay: fieldonecatepsl_1_autoscroll,
        stopOnHover: fieldonecatepsl_1_pauseonhover,
        rewindNav: true,
        pagination: fieldonecatepsl_1_pagination,
        navigation: fieldonecatepsl_1_navigation,
        navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
    });
});
</script>
<!-- /MODULE Featured Products -->