<script >
var productcomments_controller_url = '{$productcomments_controller_url}';
var confirm_report_message = '{l s='Are you sure that you want to report this comment?' mod='productcomments' js=1}';
var secure_key = '{$secure_key}';
var productcomments_url_rewrite = '{$productcomments_url_rewriting_activated}';
var productcomment_added = '{l s='Your comment has been added!' mod='productcomments' js=1}';
var productcomment_added_moderation = '{l s='Your comment has been submitted and will be available once approved by a moderator.' mod='productcomments' js=1}';
var productcomment_title = '{l s='New comment' mod='productcomments' js=1}';
var productcomment_ok = '{l s='OK' mod='productcomments' js=1}';
var moderation_active = {$moderation_active};
</script>

<div class="row">
	<div id="product_comments_block_tab" class="col-sm-5 col-xs-12 clearfix">
	{if $comments}
            {if (!$too_early AND ($logged OR $allow_guests))}
                <span class="show_number_comment">{l s='There is %d Review(s)'|sprintf:$averages mod='productcomments'}<span style="margin-left: 5px;">{l s='( %s ratings )'|sprintf:$averageTotal mod='productcomments'}</span></span>
        {/if}
            <div class="comment_hide">
		{foreach from=$comments item=comment}
			{if $comment.content}
                            
                
			<div class="comment clearfix">
                            <div class="info-icons">
                                <i class="fa fa-user fa-6" aria-hidden="true"></i>
                            </div>
				<div class="comment_details">
                                    <div class="comment_author_infos">
						<div class="show_comment_name">{$comment.customer_name|escape:'html':'UTF-8'}</div>
						<em>{dateFormat date=$comment.date_add|escape:'html':'UTF-8' full=0}</em>
					</div>
                                        <div class="star_content clearfix">
					{section name="i" start=0 loop=5 step=1}
						{if $comment.grade le $smarty.section.i.index}
							<div class="star"></div>
						{else}
							<div class="star star_on"></div>
						{/if}
					{/section}
					</div>
					
                                        <h3 class="title_comment">{$comment.title}</h3>
					<p>{$comment.content|escape:'html':'UTF-8'|nl2br}</p>
                                        {if $allow_guests == true && !$logged}
					<ul>
						{if $comment.total_advice > 0}
							<li>{l s='%1$d out of %2$d people found this review useful.' sprintf=[$comment.total_useful,$comment.total_advice] mod='productcomments'}</li>
						{/if}
						{if $logged}
							{if !$comment.customer_advice}
							<li>{l s='Was this comment useful to you?' mod='productcomments'}<button class="usefulness_btn" data-is-usefull="1" data-id-product-comment="{$comment.id_product_comment}">{l s='yes' mod='productcomments'}</button><button class="usefulness_btn" data-is-usefull="0" data-id-product-comment="{$comment.id_product_comment}">{l s='no' mod='productcomments'}</button></li>
							{/if}
							{if !$comment.customer_report}
							<li><span  class="report_btn" data-id-product-comment="{$comment.id_product_comment}">{l s='Report abuse' mod='productcomments'}</span></li>
							{/if}
						{/if}
					</ul>
                                        {/if}
				</div>
                                     </div>
            
                
			{/if}
		{/foreach}
                </div>
	{else}
		{if (!$too_early AND ($logged OR $allow_guests))}
		<p class="align_center">{l s='No customer reviews for the moment.' mod='productcomments'}</p>
		{/if}
	{/if}	
	</div>


{if isset($product) && $product}


	<div id="new_comment_form" class="col-sm-7 col-xs-12 ">
		<form id="id_new_comment_form" action="#">
			<h2 class="title">{l s='Write your review' mod='productcomments'}</h2>
			{if isset($product) && $product}
			<div class="product clearfix">
				<img src="{$productcomment_cover_image}" height="{$size_small_default.height}" width="{$size_small_default.width}" alt="{$product->name|escape:html:'UTF-8'}" />
				<div class="product_desc">
					<h3 class="product_name">{$product->name}</h3>
					{$product->description_short nofilter}
				</div>
			</div>
			{/if} 
			<div class="new_comment_form_content">
                            
				<div id="new_comment_form_error" class="error modal fade" style="display:none;padding:15px 25px" role="dialog">
					  <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                  <div class="modal-body">
                                                        <ul></ul>
                                                  </div>
                                                    </div>
                                              </div>
				</div>
                            <div id="new_comment_form_success" class="success modal fade" style="display:none;padding:15px 25px" role="dialog">
					  <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                  <div class="modal-body">
                                                      <ul>
                                                          <li>{l s='Thanks for your comment' mod='productcomments'}</li>
                                                          <button type="submit" class="btn" value="true" onclick="location.reload();" data-dismiss="modal" aria-label="Close"><span>{l s='Oke' mod='productcomments'}</span></button>
                                                      </ul>
                                                  </div>
                                                    </div>
                                              </div>
				</div>
				{if $criterions|@count > 0}
					<ul id="criterions_list">
					{foreach from=$criterions item='criterion'}
						<li>
							<label>{l s='Your rating:' mod='productcomments'}</label>
							<div class="star_content">
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="1" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="2" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="3" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="4" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="5" checked="checked" />
							</div>
							<div class="clearfix"></div>
						</li>
					{/foreach}
					</ul>
				{/if}
                                <div class="form_comment_title">
				<label for="comment_title">{l s='Title for your review' mod='productcomments'}<sup class="required">*</sup></label>
				<input id="comment_title" name="title" type="text" value=""/>
                                </div>
                                <div class="form_comment_content">
				<label for="content">{l s='Your review' mod='productcomments'}<sup class="required">*</sup></label>
				<textarea id="content" name="content"></textarea>
                                </div>
				{if $allow_guests == true && !$logged}
                                <div class="form_comment_name">
				<label>{l s='Your name' mod='productcomments'}<sup class="required">*</sup></label>
				<input id="commentCustomerName" name="customer_name" type="text" value=""/>
                                </div>
				{/if}

				<div id="new_comment_form_footer">
					<input id="id_product_comment_send" name="id_product" type="hidden" value='{$id_product_comment_form}' />
					<p class="fl required"><sup>*</sup> {l s='Required fields' mod='productcomments'}</p>
					<p class="fr">
						<button id="submitNewMessage" name="submitMessage" type="submit">{l s='Send' mod='productcomments'}</button>&nbsp;
						{l s='or' mod='productcomments'}&nbsp;<a href="#" onclick="$.fancybox.close();">{l s='Cancel' mod='productcomments'}</a>
					</p>
					<div class="clearfix"></div>
				</div>
			</div>
		</form><!-- /end new_comment_form_content -->
	</div>


{/if}
</div>