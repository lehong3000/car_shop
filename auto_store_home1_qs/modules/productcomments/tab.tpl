
<li class="nav-item" id="tab_productcomment">
                        <a class="nav-link" data-toggle="tab" href="#productcomment">{l s='Reviews' d='Shop.Theme.Catalog'}</a>
                    </li>
                    {*
<div id="new_comment_form">
    <!-- comment -->
                    <div id="comments">
                        <h2 class="woocommerce-Reviews-title">1 review for <span>Skirt brown Leather.</span></h2>
                        <ol class="commentlist">
                            <li class="comment byuser comment-author-admin bypostauthor even thread-even depth-1" id="li-comment-13">
                                <div id="comment-13" class="comment_container">
                                    <img alt='' src='http://2.gravatar.com/avatar/ef0508cca8d0e3c039284286bc22bb3a?s=60&#038;d=mm&#038;r=g' srcset='http://2.gravatar.com/avatar/ef0508cca8d0e3c039284286bc22bb3a?s=120&amp;d=mm&amp;r=g 2x' class='avatar avatar-60 photo' height='60' width='60' />
                                    <div class="comment-text">
                                        <div class="star-rating">
                                            <span style="width:100%">Rated <strong
                                                    class="rating">5</strong> out of 5</span></div>
                                                    <p class="meta">
<strong class="woocommerce-review__author" itemprop="author">Admin</strong> 
<span class="woocommerce-review__dash">&ndash;</span> 
<time class="woocommerce-review__published-date" itemprop="datePublished" datetime="2017-06-02T17:11:42+00:00">June 2, 2017</time></p>
                                                    <div class="description"><p>ok</p></div>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </div>
    <!-- end comment --> 
                    <div class="new_comment_form_content">
                        <div id="review_form">
                            <div id="respond" class="comment-respond">
                                        <span id="reply-title" class="comment-reply-title">{l s='Add a review:' mod='productcomments'}<small></small>
                                            <a rel="nofollow" id="cancel-comment-reply-link" href="#" style="display:none;">{l s='Cancel reply' mod='productcomments'}</a></small></span>
                                            
                                                <!-- form comment -->
                                            <form action="#" method="post" id="commentform-rating" class="comment-rating-form" novalidate>
                                                <p class="comment-notes">
                                                    <span id="email-notes">{l s='Your email address will not be published.' mod='productcomments'}</span>{l s='Required fields are marked' mod='productcomments'}<sup class="required">*</sup></p>
            
            <!-- form rating -->                                    
            <div class="comment-form-rating">
			{if $criterions|@count > 0}
                        <ul id="criterions_list">
                           {foreach from=$criterions item='criterion'}
                           <li>
                              <label for="rating">{l s='Your rating:' mod='productcomments'}</label>
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
	
            </div>
            <!-- end form rating -->    
                                        <p class="comment-form-title">
                                            <label for="comment_title">{l s='Title for your review:' mod='productcomments'}<sup class="required">*</sup></label>
                                            <input id="comment_title" name="title" type="text" value=""/></p>
                                        <p class="comment-form-comment">
                                            <label for="content">{l s='Your review:' mod='productcomments'}<sup class="required">*</sup></label>
                                            <textarea id="content" name="content" cols="45" rows="8" aria-required="true" required></textarea></p>
                                        {if $allow_guests == true && !$logged}
                                        <p class="comment-form-name">
                                            <label>{l s='Name:' mod='productcomments'}<sup class="required">*</sup></label>
                                            <input id="commentCustomerName" name="customer_name" type="text" value=""/>
                                        {/if}
                                        <div id="new_comment_form_footer">
                                            <input id="id_product_comment_send" name="id_product" type="hidden" value='{$id_product_comment_form}' />
                                                <p class="fl required"><sup>*</sup> {l s='Required fields' mod='productcomments'}</p>
                                                <p class="fr">
                                                    <input class="btn btn-primary" type="submit" name="submitMessage" value={l s='Send' mod='productcomments'}></button>
                                                    <span class="text-or">{l s='or' mod='productcomments'}</span>
                                                    <a href="#" onclick="$.fancybox.close();" class="cancel-commnent">{l s='Cancel' mod='productcomments'}</a>
                                                </p>
					<div class="clearfix"></div>
                                        </div>
                                            </form>
        
                                                <!-- end form comment -->
                                                
                            </div>
                        </div>
                    </div>
        
        
     
</div>*}