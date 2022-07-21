<!-- MODULE News Products Products -->
<div id="best-sellers_block_right" class="block vertical_mode clearfix">
{if isset($fieldbestsellers.FIELD_BESTSELLERS_TITLE) && $fieldbestsellers.FIELD_BESTSELLERS_TITLE != ""}
    <h4 class="title_block title_font">      
        <a href="{$link->getPageLink('best-sales')|escape:'html'}" title="{l s='View a top sellers products' mod='fieldbestsellers'}">
            {$fieldbestsellers.FIELD_BESTSELLERS_TITLE}
        </a>
    </h4>
 {/if}
         
	{if isset($best_sellers) AND $best_sellers}
		<div id="field_bestsellers" class="carousel-grid owl-carousel">
        {assign var="i" value="0"}
        {if isset($fieldbestsellers.FIELD_BESTSELLERS_ROWITEM) && $fieldbestsellers.FIELD_BESTSELLERS_ROWITEM}{assign var="y" value=$fieldbestsellers.FIELD_BESTSELLERS_ROWITEM}{else}{assign var="y" value=1}{/if}<!--Number Row-->
      {foreach from=$best_sellers item='product'}
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
                                {l s='Add to cart' mod='fieldbestsellers'}
                              {else}
                                {l s='Out of stock' mod='fieldbestsellers'}
                              {/if}  
                              </button>
                        </form>
                              {/if}
                    </div>
                </div>
                
           </div>
           {assign var="i" value="`$i+1`"}
                {if $i mod $y eq 0 || $i eq count($best_sellers)}
                   </div>
                {/if}
        {/foreach}
		</div>
	{else}
		<p>{l s='No products at this time.' mod='fieldbestsellers'}</p>
	{/if}
</div>  

<script >
{if ($fieldbestsellers.FIELD_BESTSELLERS_MAXITEM)}
	var fieldbestsellers_items = {$fieldbestsellers.FIELD_BESTSELLERS_MAXITEM};
	{else}
	var fieldbestsellers_items=3;
{/if}	
{if ($fieldbestsellers.FIELD_BESTSELLERS_MEDIUMITEM)}
	var fieldbestsellers_mediumitems={$fieldbestsellers.FIELD_BESTSELLERS_MEDIUMITEM};
	{else}
	var fieldbestsellers_mediumitems=2;
{/if}
{if ($fieldbestsellers.FIELD_BESTSELLERS_AUTOSCROLL)}
	var fieldbestsellers_autoscroll={$fieldbestsellers.FIELD_BESTSELLERS_AUTOSCROLLDELAY}
	{else}
	var fieldbestsellers_autoscroll=false;
{/if}
{if ($fieldbestsellers.FIELD_BESTSELLERS_PAUSEONHOVER)}
	var fieldbestsellers_pauseonhover=true;
	{else}
	var fieldbestsellers_pauseonhover=false;
{/if}
{if ($fieldbestsellers.FIELD_BESTSELLERS_PAGINATION)}
	var fieldbestsellers_pagination=true;
	{else}
	var fieldbestsellers_pagination=false;
{/if}
{if ($fieldbestsellers.FIELD_BESTSELLERS_NAVIGATION)}
	var fieldbestsellers_navigation=true;
	{else}
	var fieldbestsellers_navigation=false;
{/if}


$(window).load(function() {
    $('#field_bestsellers').owlCarousel({
        itemsCustom: [ [0, 1], [320, 1], [479, 1], [768, fieldbestsellers_mediumitems], [992, fieldbestsellers_items], [1200, fieldbestsellers_items] ],
        responsiveRefreshRate: 50,
        slideSpeed: 200,
        paginationSpeed: 500,
        rewindSpeed: 600,
        autoPlay: fieldbestsellers_autoscroll,
        stopOnHover: fieldbestsellers_pauseonhover,
        rewindNav: true,
        pagination: fieldbestsellers_pagination,
        navigation: fieldbestsellers_navigation,
        navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
    });
});
</script>
<!-- /MODULE News Products -->