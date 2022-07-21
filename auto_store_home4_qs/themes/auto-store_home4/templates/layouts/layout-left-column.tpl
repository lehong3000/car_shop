{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='layouts/layout-both-columns.tpl'}

{block name='right_column'}{/block}

{block name='content_wrapper'}
  <div id="content-wrapper" class="left-column col-xs-12 col-sm-8 col-md-9">
      {if ($page.page_name!='category') &&($page.page_name!='index')}
                <div class="bn-top ">
                    <div class="container_img_bread no-img ">
                        {hook h="blockPosition8"}
                        {block name='breadcrumb'}
                            {include file='_partials/breadcrumb.tpl'}
                        {/block}
                    </div>
                </div>
            {/if}
            {if ($page.page_name =='category')}
                {if  isset($category) && $category.image.large.url}
                    <div class="bn-top ">
                        <div class="container_img_bread has-img ">
                            {block name='breadcrumb'}
                                {include file='_partials/breadcrumb.tpl'}
                            {/block}          
                            <div class="category-cover">
                                <img src="{$category.image.large.url}" alt="{$category.image.legend}">
                            </div>
                        </div>
                    </div>   
                {else}
                    <div class="bn-top ">
                        <div class="container_img_bread no-img ">
                            {hook h="blockPosition8"}
                            {block name='breadcrumb'}
                                {include file='_partials/breadcrumb.tpl'}
                            {/block}
                        </div>

                    </div>                        
                {/if}
            {/if}  
    {block name='content'}
      <p>Hello world! This is HTML5 Boilerplate.</p>
    {/block}
  </div>
{/block}
