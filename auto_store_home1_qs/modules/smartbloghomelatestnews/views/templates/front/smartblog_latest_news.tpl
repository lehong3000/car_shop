<div class="smart-blog-home-post block horizontal_mode">
    <h2 class="title_block title_font">
        <a class="title_text" href="{smartblog::GetSmartBlogLink('smartblog')}">{l s='NEW POST FROM BLOG' mod='smartbloghomelatestnews'}</a>
    </h2>

    <div class="row">
        <div id="smart-blog-custom" class="sdsblog-box-content grid carousel-grid owl-carousel">
            {if isset($view_data) AND !empty($view_data)}
                {assign var="i" value="0"}
                {assign var="y" value=1} {*the number item of one row*}
                {foreach from=$view_data item=post}
                    {assign var="options" value=null}
                    {$options.id_post = $post.id}
                    {$options.slug = $post.link_rewrite}
                    {if $i mod $y eq 0}
                        <div class="item sds_blog_post">
                        {/if}
                        <div class="news_module_image_holder">
                            <div class="inline-block_relative">
                                <div class="image_holder_wrap">
                                    <a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">
                                        <img alt="{$post.title}" class="img-responsive" src="{$link->getMediaLink($smarty.const._MODULE_DIR_)}smartblog/images/{$post.post_img}-home-default.jpg"
                                             {if isset($size_home_default_post.width)}width="{$size_home_default_post.width}"{/if}
                                             {if isset($size_home_default_post.height)}height="{$size_home_default_post.height}"{/if} 
                                             >
                                    </a>
                                    <div class="date_blog title_font">
                                        <span class="block_date_post">{$post.date_added|date_format:"%e"}</span>
                                        <span class="block_date_post2">{$post.date_added|date_format:"%b"}</span>
                                    </div>    
                                </div>
                                <div class="border_content">
                                    <div class="right_blog_home">
                                        <div class="content">
                                            <h3 class="sds_post_title"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{$post.title}</a></h3>
                                            <p>
                                                {$post.short_description|truncate:140:'...'|escape:'htmlall':'UTF-8'}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {assign var="i" value="`$i+1`"}
                        {if $i mod $y eq 0 || $i eq count($view_data)}
                        </div>
                    {/if}
                {/foreach}
            {/if}
        </div>
    </div>
</div>