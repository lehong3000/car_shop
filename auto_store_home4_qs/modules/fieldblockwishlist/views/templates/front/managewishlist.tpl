{if $products}
    {if !$refresh}
        <div class="wishlistLinkTop">
            <a id="hideWishlist" class="button_account fa fa pull-right" href="#" onclick="WishlistVisibility('wishlistLinkTop', 'Wishlist');
                    return false;" rel="nofollow" title="{l s='Close this wishlist' mod='fieldblockwishlist'}">
                <i class="fa fa-remove"></i>
            </a>
            <ul class="clearfix display_list">
                <li>
                    <a  id="hideBoughtProducts" class="button_account" href="#" onclick="WishlistVisibility('wlp_bought', 'BoughtProducts');
                            return false;" title="{l s='Hide products' mod='fieldblockwishlist'}">
                        {l s='Hide products' mod='fieldblockwishlist'}
                    </a>
                    <a id="showBoughtProducts" class="button_account" href="#" onclick="WishlistVisibility('wlp_bought', 'BoughtProducts');
                            return false;" title="{l s='Show products' mod='fieldblockwishlist'}">
                        {l s='Show products' mod='fieldblockwishlist'}
                    </a>
                </li>
                {if count($productsBoughts)}
                    <li>
                        <a id="hideBoughtProductsInfos" class="button_account" href="#" onclick="WishlistVisibility('wlp_bought_infos', 'BoughtProductsInfos');
                                return false;" title="{l s='Hide products' mod='fieldblockwishlist'}">
                            {l s="Hide bought products' info" mod='fieldblockwishlist'}
                        </a>
                        <a id="showBoughtProductsInfos" class="button_account" href="#" onclick="WishlistVisibility('wlp_bought_infos', 'BoughtProductsInfos');
                                return false;" title="{l s='Show products' mod='fieldblockwishlist'}">
                            {l s="Show bought products' info" mod='fieldblockwishlist'}
                        </a>
                    </li>
                {/if}
            </ul>
            <div class="wishlisturl form-group">
                <label>{l s='Permalink' mod='fieldblockwishlist'}:</label>
                <div class="coppy_link_wl">
                    <input id="copywishlisturl" type="text" class="form-control" value="{$link->getModuleLink('fieldblockwishlist', 'view', ['token' => $token_wish])|escape:'html':'UTF-8'}" readonly="readonly"/>
                    <button class="btn btn-default button button-small" onclick="copyToClipboard();">{l s='Copy link' mod='fieldblockwishlist'}</button>
                </div>
            </div>

            <div id="SendWishlist">
                <a class="btn btn-default button button-small" data-toggle="modal" data-target="#SendWishlist_showform" href="#" title="{l s='Send this wishlist' mod='fieldblockwishlist'}">
                    <i class="fa fa-paper-plane"></i><span>{l s='Send this wishlist' mod='fieldblockwishlist'}</span>
                </a>
            </div>

        {/if}
        <div class="wlp_bought">
            {assign var='nbItemsPerLine' value=4}
            {assign var='nbItemsPerLineTablet' value=3}
            {assign var='nbLi' value=$products|@count}
            {math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
            {math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
            <ul class="row wlp_bought_list">
                {foreach from=$products item=product name=i}
                    {math equation="(total%perLine)" total=$smarty.foreach.i.total perLine=$nbItemsPerLine assign=totModulo}
                    {math equation="(total%perLineT)" total=$smarty.foreach.i.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
                {if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
            {if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
            <li id="wlp_{$product.id_product}_{$product.id_product_attribute}"
                class="col-xs-12 col-sm-4 col-md-3 {if $smarty.foreach.i.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.i.iteration%$nbItemsPerLine == 1} first-in-line{/if} {if $smarty.foreach.i.iteration > ($smarty.foreach.i.total - $totModulo)}last-line{/if} {if $smarty.foreach.i.iteration%$nbItemsPerLineTablet == 0}last-item-of-tablet-line{elseif $smarty.foreach.i.iteration%$nbItemsPerLineTablet == 1}first-item-of-tablet-line{/if} {if $smarty.foreach.i.iteration > ($smarty.foreach.i.total - $totModuloTablet)}last-tablet-line{/if}">
                <div class="wlp_bought_item_container">
                    <div class="">
                        <div class="product_image">
                            <a href="{$link->getProductlink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">
                                <img class="replace-2x img-responsive"  src="{$link->getImageLink($product.link_rewrite, $product.cover, 'home_default')|escape:'html':'UTF-8'}" alt="{$product.name|escape:'html':'UTF-8'}"/>
                            </a>
                        </div>
                    </div>
                    <div class="">
                        <div class="product_infos">
                            <a class="lnkdel" href="javascript:;" onclick="WishlistProductManage('wlp_bought', 'delete', '{$id_wishlist}', '{$product.id_product}', '{$product.id_product_attribute}', $('#quantity_{$product.id_product}_{$product.id_product_attribute}').val(), $('#priority_{$product.id_product}_{$product.id_product_attribute}').val());" title="{l s='Delete' mod='fieldblockwishlist'}">
                                <i class="fa fa-remove"></i>
                            </a>

                            <p id="s_title" class="product-name">
                                <a href="{$link->getProductlink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{$product.name}">
                                    {$product.name|truncate:30:'...'|escape:'html':'UTF-8'}
                                </a>
                                {if isset($product.attributes_small)}
                                    <small>
                                        <a href="{$link->getProductlink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{l s='Product detail' mod='fieldblockwishlist'}">
                                            {$product.attributes_small|escape:'html':'UTF-8'}
                                        </a>
                                    </small>
                                {/if}
                            </p>
                            <div class="wishlist_product_detail">
                                <div class="form-group">
                                    <label for="quantity_{$product.id_product}_{$product.id_product_attribute}">
                                        {l s='Quantity' mod='fieldblockwishlist'}:
                                    </label>
                                    <input type="text" class="form-control grey" id="quantity_{$product.id_product}_{$product.id_product_attribute}" value="{$product.quantity|intval}" size="3"/>
                                </div>

                                <div class="form-group">
                                    <label for="priority_{$product.id_product}_{$product.id_product_attribute}">
                                        {l s='Priority' mod='fieldblockwishlist'}:
                                    </label>
                                    <select id="priority_{$product.id_product}_{$product.id_product_attribute}" class="form-control grey">
                                        <option value="0"{if $product.priority eq 0} selected="selected"{/if}>
                                            {l s='High' mod='fieldblockwishlist'}
                                        </option>
                                        <option value="1"{if $product.priority eq 1} selected="selected"{/if}>
                                            {l s='Medium' mod='fieldblockwishlist'}
                                        </option>
                                        <option value="2"{if $product.priority eq 2} selected="selected"{/if}>
                                            {l s='Low' mod='fieldblockwishlist'}
                                        </option>
                                    </select>
                                </div>

                                {if $wishlists|count > 1}
                                    <div class="form-group dropdown js-dropdown">
                                        {foreach name=wl from=$wishlists item=wishlist}
                                            {if $smarty.foreach.wl.first}
                                                <a class="btn btn-default button button-small wishlist_change_button" tabindex="0" data-toggle="dropdown" aria-expanded="false" data-trigger="focus" title="{l s='Move to a wishlist' mod='fieldblockwishlist'}" data-placement="bottom">
                                                    <span>{l s='Move' mod='fieldblockwishlist'}</span>
                                                </a>
                                                <div class="dropdown-menu">
                                                    <ul>
                                                    {/if}
                                                    {if $id_wishlist != {$wishlist.id_wishlist}}
                                                        <li title="{$wishlist.name|escape:'html':'UTF-8'}" value="{$wishlist.id_wishlist}" onclick="wishlistProductChange({$product.id_product}, {$product.id_product_attribute}, '{$id_wishlist}', '{$wishlist.id_wishlist}');">

                                                            {l s='Move to %s'|sprintf:$wishlist.name mod='fieldblockwishlist'}

                                                        </li>
                                                    {/if}
                                                    {if $smarty.foreach.wl.last}
                                                    </ul>
                                                </div>
                                            {/if}
                                        {/foreach}
                                    </div>
                                {/if}
                            </div>
                            <div class="btn_action">
                                <a class="btn btn-default button button-small"  href="javascript:;" onclick="WishlistProductManage('wlp_bought_{$product.id_product_attribute}', 'update', '{$id_wishlist}', '{$product.id_product}', '{$product.id_product_attribute}', $('#quantity_{$product.id_product}_{$product.id_product_attribute}').val(), $('#priority_{$product.id_product}_{$product.id_product_attribute}').val());" title="{l s='Save' mod='fieldblockwishlist'}">
                                    <span>{l s='Save' mod='fieldblockwishlist'}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        {/foreach}
    </ul>
</div>
{if !$refresh}
    <div id="SendWishlist_showform" class="error modal fade" role="dialog" style="display:none;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
                </div>
                <div class="modal-body">
                    <form method="post" class="wl_send box unvisible" onsubmit="return (false);">
                        <div class="required form-group row">
                            <div class="col-xs-3">
                                <label for="email1">{l s='Email' mod='fieldblockwishlist'}1 <sup style="color: #f00;">*</sup></label>
                            </div>
                            <div class="col-xs-9">
                                <input type="text" name="email1" id="email1" class="form-control"/>
                            </div>
                        </div>
                        {section name=i loop=11 start=2}
                            <div class="form-group row">
                                <div class="col-xs-3">
                                    <label for="email{$smarty.section.i.index}">{l s='Email' mod='fieldblockwishlist'}{$smarty.section.i.index}</label>
                                </div>
                                <div class="col-xs-9">
                                    <input type="text" name="email{$smarty.section.i.index}" id="email{$smarty.section.i.index}" class="form-control"/>
                                </div>
                            </div>
                        {/section}
                        <div class="form-group row" style="margin-bottom: 0;">
                            <div class="required pull-left col-xs-6" style="color: #f00; text-align: left;">
                                <sup>*</sup> {l s='Required field' mod='fieldblockwishlist'}
                            </div>
                            <div class="submit pull-right col-xs-6" style="text-align: right;">
                                <button class="btn btn-default button button-small" type="submit" name="submitWishlist"
                                        onclick="WishlistSend('wl_send', '{$id_wishlist}', 'email');">
                                    <span>{l s='Send' mod='fieldblockwishlist'}</span>
                                </button>
                            </div>
                        </div>
                    </form> 
                </div>
            </div>
        </div>
    </div>

    {if count($productsBoughts)}
        <table class="wlp_bought_infos unvisible table table-bordered table-responsive hidden">
            <thead>
                <tr>
                    <th class="first_item">{l s='Product' mod='fieldblockwishlist'}</th>
                    <th class="item">{l s='Quantity' mod='fieldblockwishlist'}</th>
                    <th class="item">{l s='Offered by' mod='fieldblockwishlist'}</th>
                    <th class="last_item">{l s='Date' mod='fieldblockwishlist'}</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$productsBoughts item=product name=i}
                    {foreach from=$product.bought item=bought name=j}
                        {if $bought.quantity > 0}
                            <tr>
                                <td class="first_item">
                                    <span style="float:left;">
                                        <img
                                            src="{$link->getImageLink($product.link_rewrite, $product.cover, 'small_default')|escape:'html':'UTF-8'}"
                                            alt="{$product.name|escape:'html':'UTF-8'}"/>
                                    </span>
                                    <span style="float:left;">
                                        {$product.name|truncate:40:'...'|escape:'html':'UTF-8'}
                                        {if isset($product.attributes_small)}
                                            <br/>
                                            <i>{$product.attributes_small|escape:'html':'UTF-8'}</i>
                                        {/if}
                                    </span>
                                </td>
                                <td class="item align_center">
                                    {$bought.quantity|intval}
                                </td>
                                <td class="item align_center">
                                    {$bought.firstname} {$bought.lastname}
                                </td>
                                <td class="last_item align_center">
                                    {$bought.date_add|date_format:"%Y-%m-%d"}
                                </td>
                            </tr>
                        {/if}
                    {/foreach}
                {/foreach}
            </tbody>
        </table>
    {/if}
{/if}
{else}
    <p class="alert alert-warning">
        {l s='No products' mod='fieldblockwishlist'}
    </p>
{/if}