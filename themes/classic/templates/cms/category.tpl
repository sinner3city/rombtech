{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {$cms_category.name}
{/block}


{block name='page_content'}


  {block name='cms_sub_categories'}
    {if $sub_categories}


      <!-- <h2>{*l s='List of sub categories in %name%:' d='Shop.Theme.Global' sprintf=['%name%' => $cms_category.name]*}</h2> -->
      <!-- <h2 class="category-top-menu__title">{$cms_category.name} <span class="sep mg-hor-ss">//</span> Artykuły:</h2> -->
      <!-- <ul> -->
      <div class="link-list--border blog-cats">
        <!-- <p class="mg-r-s">Podkategorie:</p> -->
        {foreach from=$sub_categories item=sub_category}
          <a data-depth="0" class="link--border" href="{$sub_category.link}">

            {$sub_category.name}
            <!-- <p>{$sub_category.description}</p> -->
          </a>
        {/foreach}
      </div>
      <!-- </ul> -->

    {/if}
  {/block}

  {block name='cms_sub_pages'}
    {if $cms_pages}

      <!-- <h2 class="cms-category-page-title">{*l s='List of pages in %category_name%:' d='Shop.Theme.Global' sprintf=['%category_name%' => $cms_category.name]*}</h2> -->
      <!-- <h2 class="cms-category-page-title">{$cms_category.name} <span class="sep">//</span> Artykuły</h2> -->
      <!-- <ul> -->
      <div class="art__list mg-ver blog-list" data-style="1" data-col="4" data-slider="false">
        <!-- <nav class="slider-nav">
          <a href="#" class="slider-nav__prev"><i class="material-icons">navigate_before</i></a>
          <a href="#" class="slider-nav__next"><i class="material-icons">navigate_next</i></a>
      </nav> -->
        {foreach from=$cms_pages item=cms_page}
          {*$cms_page|dump*}




          <article class="art">
            <a class="cms-category-page" href="{$cms_page.link}">

              <header class="art__header">
                <h3 class="art__title">{$cms_page.meta_title}</h3>
                <p class="art__subtitle">{$cms_page.meta_keywords}</p>
              </header>
              <figure class="art__figure">
                {$cms_page.content|strip_tags|truncate:150:'...'}
              {*if $cms_category.id != '4'}
                      {strip_tags($cms_page.content|truncate:250:'...',"<img><p>") nofilter}

              {else}
                        {$cms_page.content|strip_tags|truncate:150:'...'}

              {/if*}
            </figure>
            <footer>
              dowiedz się więcej...
            </footer>
          </a>
        </article>
      {/foreach}
    </div>
    <!-- </ul> -->
  {/if}
{/block}
{/block}