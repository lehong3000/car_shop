{if (($nbComments == 0 && $too_early == false && ($logged || $allow_guests)) || ($nbComments != 0))}
<div id="product_comments_block_extra" class="no-print" itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
	{if isset($nbComments)}
	<div class="comments_note" itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
		<div class="star_content clearfix"  >
		{section name="i" start=0 loop=5 step=1}
			{if $averageTotal le $smarty.section.i.index}
				<div class="star"></div>
			{else}
				<div class="star star_on"></div>
			{/if}
		{/section}
                {*<meta itemprop="worstRating" content = "0" />
                <meta itemprop="ratingValue" content = "{if isset($ratings.avg)}{$ratings.avg|round:1|escape:'html':'UTF-8'}{else}{$averageTotal|round:1|escape:'html':'UTF-8'}{/if}" />
                <meta itemprop="bestRating" content = "5" />*}
		</div>
	</div>
	{/if}

	<div class="comments_advices">
		{if $nbComments != 0}
                    <a href="#tab_productcomment"><i class="fa fa-comment"></i>{l s='Read reviews' mod='productcomments'} ({$nbComments})</a>
		{/if}
		{if ($too_early == false AND ($logged OR $allow_guests))}
                    <a class="open-comment-form" href="#new_comment_form"><i class="fa fa-edit"></i>{l s='Write a review' mod='productcomments'}</a>
		{/if}
	</div>
</div>
{/if}
<!--  /Module ProductComments -->
<script >
$(document).ready(function(){
  // Add smooth scrolling to all links
  $("#product_comments_block_extra .comments_advices a").on('click', function(event) {
      $('#product #main .tabs').find('.nav-link').removeClass('active').attr("aria-expanded","false");
      $('#product #main .tab-content').find('.tab-pane').removeClass('active in').attr("aria-expanded","false");
      $('#product #main .tabs').find('#tab_productcomment .nav-link').addClass('active').attr("aria-expanded","true");
      $('#product #main .tab-content').find('#productcomment').addClass('active in').attr("aria-expanded","true");
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800);
    } // End if
  });
});
</script>