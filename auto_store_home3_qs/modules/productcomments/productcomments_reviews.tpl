
{if isset($nbComments)}
	<div class="comments_note" itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
	<div class="star_content clearfix">
	{section name="i" start=0 loop=5 step=1}
		{if $averageTotal le $smarty.section.i.index}
			<div class="star"></div>
		{else}
			<div class="star star_on"></div>
		{/if}
	{/section}
	</div>
</div>
{/if}