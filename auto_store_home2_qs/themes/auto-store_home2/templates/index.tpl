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
* @copyright 2007-2016 PrestaShop SA
* @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
{extends file=$layout}
{block name='content'}
    <section id="content" class="page-home">
    {block name='page_content_top'}{/block}
                {hook h="blockPosition1"} 
                {hook h="newproductslider"} 
                 {hook h="blockPosition2"}
                <div class="row">
                     <div class="col-xs-12 col-sm-4">
                        {hook h="featuredproductslider"} 
                     </div>
                     <div class="col-xs-12 col-sm-4">
                         {hook h="onecateproductslider"} 
                     </div>
                     <div class="col-xs-12 col-sm-4">
                          {hook h="bestsellers"} 
                     </div>
                 </div>
                  <div class="row banner_1">
                    {hook h="blockPosition3"}
                    <div class="col-xs-12 col-sm-12 col-md-3">
                          {hook h="testimonials"}
                     </div>
                  </div>
			{hook h="tabcateslider"} 
        {block name='page_content'}
            {$HOOK_HOME nofilter}
        {/block}
</section>
{/block}
