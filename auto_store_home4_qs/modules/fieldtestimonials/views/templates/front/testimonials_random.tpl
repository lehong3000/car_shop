<div class="block block_testimonials" {if $conf_testimonials.show_background && $background != ""}style="background: url({$link->getMediaLink("`$module_dir`$background")}) center center no-repeat; background-attachment: fixed; background-blend-mode: screen; background-clip: border-box; background-color: rgba(0, 0, 0, 0); background-size:cover; background-origin: padding-box; background-repeat: no-repeat;"{/if}>
    <div class="overlay_testimonials">
      
<div id="testimonials_block_right">

    <div class="title">
        <h2 class="title_block title_font"><span>{l s='What client say' mod='fieldtestimonials'}</span></h2>
    </div>

  {*<script >
    $(document).ready(function(){
      $('#slide').cycle({
        fx:    'fade',
        speed:  1000,
        timeout: 3000000,
        next:  '.next',
        prev:  '.prev',
		pager:'#pagination_cycle'
      });
      $('#media_post').fancybox();
      $('.fancybox-media')
        .attr('rel', 'media-gallery')
        .fancybox({
          openEffect : 'none',
          closeEffect : 'none',
          prevEffect : 'none',
          nextEffect : 'none',
          arrows : false,
          helpers : {
            media : {},
            buttons : {}
          }
        });
        if($(window).width()< 768){
            $('#left_column #wrapper').css({ 'display':'none' });
            $('#right_column #wrapper').css({ 'display':'none' });
        }
    });
  </script>*}
  <div id="wrapper_testimonials" class="block_content">
    {if $testimonials}
      <div id="slide-panel">
        <div id="slide">
          {foreach from=$testimonials key=test item=testimonial}
            {if $testimonial.active == 1}
              <div class="main-block">

                        <div class="content_test_top">
                            <div class="des_testimonial">{$testimonial.content|truncate:125:'...'|escape:'htmlall':'UTF-8' nofilter}{*<a href="{$link->getModuleLink('fieldtestimonials','views',['process'=>'view','id'=>{$testimonial.id_fieldtestimonials}])}" class="read_more">Read More</a>*}</div>
                                </div>

                      {if $conf_testimonials.show_info}
                          <div class="media">
                        <div class="media-content">
                          {if $testimonial.media}
                            {if in_array($testimonial.media_type,$conf_testimonials.arr_img_type)}
                              <span class="fancybox-media">
                          <img class="img-responsive" src="{$conf_testimonials.mediaUrl}{$testimonial.media}" alt="Image Testimonial"/>
                              </span>
                          {/if}
                          {/if}
                            {if in_array($testimonial.media_type,$conf_testimonials.video_types)}
                          <video width="260" height="240" controls>
                              <source src="{$conf_testimonials.mediaUrl}{$testimonial.media}" type="video/mp4" />
                          </video>
                            {/if}
                            {if $testimonial.media_type == 'youtube'}
                              <a class="fancybox-media" href="{$testimonial.media_link}"><img src="{$conf_testimonials.video_youtube}" alt="Youtube Video"/></a>
                            {elseif $testimonial.media_type == 'vimeo'}
                              <a class="fancybox-media" href="{$testimonial.media_link}"><img src="{$conf_testimonials.video_vimeo}" alt="Vimeo Video"/></a>
                            {/if}
                        </div>
                        <div class="content_test">
                          <p class="des_namepost">{$testimonial.name_post|truncate:17:'...'|escape:'htmlall':'UTF-8'}</p>
                          <p class="des_company">{$testimonial.company|truncate:17:'...'|escape:'htmlall':'UTF-8'}</p>
                        </div>
                          </div>
                      {/if}
                                  {if $conf_testimonials.show_button_link}
                                          <a href="{$testimonial.button_link}" class="view_link">{l s='View link' mod='fieldtestimonials'}</a>
                                  {/if}
              </div>
            {/if}
          {/foreach}
        </div>
        
      </div>
    {/if}
    {if $conf_testimonials.show_submit}
    <div class="button_testimonial">
      <div class="view_all"><a href="{$link->getModuleLink('fieldtestimonials','views',['process' => 'view'])}">{l s='View All' mod='fieldtestimonials'}</a></div>
      <div class="submit_link"><a href="{$link->getModuleLink('fieldtestimonials','views',['process' => 'form_submit'])}">{l s='Submit Your Testimonial' mod='fieldtestimonials'}</a></div>
    </div>
    {/if}
        <div id="pagination_cycle"></div>
                    </div>
</div>
         
    </div>
</div>
<script >
    $(window).load(function() {
      $('#slide').owlCarousel({
        itemsCustom: [ [0, 1], [320, 1], [479, 1], [768, 1], [992, 1], [1200, 1] ],
        responsiveRefreshRate: 50,
        slideSpeed: 200,
        paginationSpeed: 500,
        rewindSpeed: 600,
        autoPlay: false,
        stopOnHover: true,
        rewindNav: true,
        pagination: true,
        navigation: true,
        navigationText: ['<div class="carousel-previous disable-select"><span class="fa fa-angle-left"></span></div>', '<div class="carousel-next disable-select"><span class="fa fa-angle-right"></span></div>']
    });
});
</script>