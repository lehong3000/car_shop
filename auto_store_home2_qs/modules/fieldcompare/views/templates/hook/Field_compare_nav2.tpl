{if $comparator_max_item}
	<form method="post" action="{$link->getModuleLink('fieldcompare', 'FieldCompareProduct')|escape:'html':'UTF-8'}" class="compare-form pull-right">
		<button type="submit" class="btn btn-default button button-medium bt_compare" disabled="disabled">
			<span>{l s='Compare'} (<strong class="total-compare-val">{count($compared_products)}</strong>)<i class="icon-chevron-right right"></i></span>
		</button>
		<input type="hidden" name="compare_product_count" class="compare_product_count" value="{count($compared_products)}" />
		<input type="hidden" name="compare_product_list" class="compare_product_list" value="" />
	</form>
{/if}