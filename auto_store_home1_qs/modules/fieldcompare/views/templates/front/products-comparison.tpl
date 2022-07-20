{extends file='page.tpl'}
{block name='head_seo'}
    <title>{l s='My compare' mod='fieldcompare'}</title>
{/block}
{block name='breadcrumb'}
    {if isset($breadcrumb)}
        <nav class="breadcrumb">
            <ol itemscope itemtype="http://schema.org/BreadcrumbList">
                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <a itemprop="item" href="{$breadcrumb.links[0].url}">
                        <span itemprop="name">{$breadcrumb.links[0].title}</span>
                    </a>
                </li>
                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <a itemprop="item" href="{$link->getModuleLink('field', 'FieldCompareProduct', array(), true)|escape:'html':'UTF-8'}">
                        <span itemprop="name">{l s='My compare' mod='fieldcompare'}</span>
                    </a>
                </li>
            </ol>
        </nav>
    {/if}
{/block}
{block name='page_content'}
    <section id="main">
    {capture name=path}{l s='Product Comparison'}{/capture}
    <h1 class="page-heading">{l s='Product Comparison'}</h1>
    {if $hasProduct}
        <div class="products_block table-responsive">
            <table id="product_comparison" class="table table-bordered">
                <tr>
                    <td class="td_empty compare_extra_information">
                        <span>{l s='Features:'}</span>
                    </td>
                    {foreach from=$products item=product name=for_products}
                        {assign var='replace_id' value=$product.id|cat:'|'}
                        <td class="ajax_block_product comparison_infos product-block product-{$product.id_product}" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
                            <div class="remove">
                                <a class="cmp_remove" href="#" title="{l s='Remove'}" data-id-product="{$product.id_product}">
                                    <i class=" fa fa-trash"></i>
                                </a>
                            </div>
                            <div class="product-image-block">
                                <a href="{$product.url}" class="thumbnail product-thumbnail product_image">
                                    <span class="cover_image img-responsive">
                                        <img
                                            src = "{$product.cover.bySize.home_default.url}"
                                            data-full-size-image-url = "{$product.cover.large.url}" alt=""
                                            {if isset($size_home_default.width)}width="{$size_home_default.width}"{/if}
                                            {if isset($size_home_default.height)}height="{$size_home_default.height}"{/if} 
                                            >
                                    </span>
                                </a>
                                <div class="conditions-box">
                                    {if isset($product.show_condition) && $product.condition.type == "new" && $product.show_condition == 1  && isset($product.new) && $product.new == 1 }
                                        <span class="new_product">{l s='New' mod='fieldfeaturedproductslider'}</span>
                                    {/if}
                                    {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price }
                                        <span class="sale_product">{l s='Sale' mod='fieldfeaturedproductslider'}</span>
                                    {/if}  
                                </div> 
                            </div> <!-- end product-image-block -->
                            <div class="product_name" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></div>
                            <div class="prices-container">
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
                            </div> <!-- end prices-container -->
                            <div class="product_desc">
                                {$product.description_short|strip_tags|truncate:100:'...'}
                            </div>
                            <div class="comparison_product_infos">
                                {*<p class="comparison_availability_statut">
                                {if !(($product->quantity <= 0 && !$product->available_later) OR ($product->quantity != 0 && !$product->available_now) OR !$product->available_for_order)}
                                <span class="availability_label">{l s='Availability:'}</span>
                                <span class="availability_value"{if $product->quantity <= 0} class="warning-inline"{/if}>
                                {if $product->quantity <= 0}
                                {if $product->allow_oosp}
                                {$product->available_later|escape:'html':'UTF-8'}
                                {else}
                                {l s='This product is no longer in stock.'}
                                {/if}
                                {else}
                                {$product->available_now|escape:'html':'UTF-8'}
                                {/if}
                                </span>
                                {/if}
                                </p>*}
                                <div class="clearfix">
                                    <div class="button-container">
                                        {if !$configuration.is_catalog}
                                            {if ($product.allow_oosp || $product.quantity > 0)}
                                                <form action="{$urls.pages.cart}" method="post">
                                                    <input type="hidden" name="token" value="{$static_token}">
                                                    <input type="hidden" name="id_product" value="{$product.id}">
                                                    <button class="add-to-cart" data-button-action="add-to-cart" type="submit">
                                                        {if $product.quantity}
                                                            <i class="fa fa-shopping-cart"></i>
                                                        {else}
                                                            <i class="fa fa-ban"></i>
                                                        {/if}  
                                                    </button>
                                                </form>
                                            {else}
                                                <form action="{$urls.pages.cart}" method="post">
                                                    <input type="hidden" name="token" value="{$static_token}">
                                                    <input type="hidden" name="id_product" value="{$product.id}">
                                                    <button class="add-to-cart" data-button-action="add-to-cart" type="submit" disabled>
                                                        <i class="fa fa-ban"></i>
                                                    </button>
                                                </form>
                                            {/if}
                                        {/if}
                                        <a class="button lnk_view btn btn-default" href="{$product.url}" title="{l s='View'}">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                    </div>
                                </div>
                            </div> <!-- end comparison_product_infos -->
                        </td>
                    {/foreach}
                </tr>
                {if $ordered_features}
                    {foreach from=$ordered_features item=feature}
                        <tr>
                            {cycle values='comparison_feature_odd,comparison_feature_even' assign='classname'}
                            <td class="{$classname} feature-name" >
                                <strong>{$feature.name|escape:'html':'UTF-8'}</strong>
                            </td>
                            {foreach from=$products item=product name=for_products}
                                {assign var='product_id' value=$product.id}
                                {assign var='feature_id' value=$feature.id_feature}
                                {if isset($product_features[$product_id])}
                                    {assign var='tab' value=$product_features[$product_id]}
                                    <td class="{$classname} comparison_infos product-{$product.id}">{if (isset($tab[$feature_id]))}{$tab[$feature_id]|escape:'html':'UTF-8'}{/if}</td>
                                {else}
                                    <td class="{$classname} comparison_infos product-{$product.id}"></td>
                                {/if}
                            {/foreach}
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td></td>
                        <td colspan="{$products|@count}" class="text-center">{l s='No features to compare'}</td>
                    </tr>
                {/if}
                {hook h='ExtraProductComparison' list_ids_product=$list_product}
            </table>
        </div> <!-- end products_block -->
    {else}
        <p class="alert alert-warning">{l s='There are no products selected for comparison.'}</p>
    {/if}
    <ul class="footer_link">
        <li>
            <a class="button lnk_view btn btn-default" href="{$urls.base_url}">
                <span><i class="fa fa-chevron-left left"></i>{l s='Continue Shopping'}</span>
            </a>
        </li>
    </ul>
</section>
{/block}
