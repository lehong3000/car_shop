<div class="buttons_bottom_block no-print">
{if isset(!$wishlists) && count($wishlists) < 1}
    <a class="wishlist_button_nopop" href="#" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;" rel="nofollow"  title="{l s='Add to my wishlist' mod='fieldblockwishlist'}">
		<i class="fa fa-heart"></i>
	</a>
{else}
	{foreach name=wl from=$wishlists item=wishlist}
		{if $smarty.foreach.wl.first}
			<a class="wishlist_button" tabindex="0" data-toggle="popover" data-trigger="focus" title="{l s='Wishlist' mod='fieldblockwishlist'}" data-placement="bottom"><i class="fa fa-heart"></i></a>
				<div hidden id="popover-content">
					<table class="table" border="1">
						<tbody>
		{/if}
							<tr title="{$wishlist.name|escape:'html':'UTF-8'}" value="{$wishlist.id_wishlist}" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1, '{$wishlist.id_wishlist}');">
								<td>
									{l s='Add to %s' sprintf=[$wishlist.name] mod='fieldblockwishlist'}
								</td>
							</tr>
		{if $smarty.foreach.wl.last}
					</tbody>
				</table>
			</div>
		{/if}
	{foreachelse}
		<a href="#" class="wishlist_button_nopop" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;" rel="nofollow"  title="{l s='Add to my wishlist' mod='fieldblockwishlist'}">
			<i class="fa fa-heart"></i>
		</a>
	{/foreach}
{/if}
</div>
