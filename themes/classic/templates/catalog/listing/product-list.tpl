{** * 2007-2019 PrestaShop and Contributors * * NOTICE OF LICENSE * * This
source file is subject to the Academic Free License 3.0 (AFL-3.0) * that is
bundled with this package in the file LICENSE.txt. * It is also available
through the world-wide-web at this URL: *
https://opensource.org/licenses/AFL-3.0 * If you did not receive a copy of the
license and are unable to * obtain it through the world-wide-web, please send an
email * to license@prestashop.com so we can send you a copy immediately. * *
DISCLAIMER * * Do not edit or add to this file if you wish to upgrade PrestaShop
to newer * versions in the future. If you wish to customize PrestaShop for your
* needs please refer to https://www.prestashop.com for more information. * *
@author PrestaShop SA
<contact@prestashop.com>
  * @copyright 2007-2019 PrestaShop SA and Contributors * @license
  https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0) *
  International Registered Trademark & Property of PrestaShop SA *}


{extends file=$layout}

{block name='content'}


  {if isset($category)}

    <h2 class="h1 category-heading">
      {if $category.id_parent !== '1'}<a href="{$link->getCategoryLink({$category.id_parent})}">{/if}
        {if $category.id_parent !== '1'}<i class="material-icons mg-r-ss" data-tooltip="powrót">reply</i>{/if}
        <span>{$category.name}</span>
        {if $category.id_parent !== '1'}</a>{/if}
    </h2>

    <div id="js-product-list-header" class="">
      {if $listing.pagination.items_shown_from == 1}
        <div class="block-category">
          <div class="block-category-inner {if !$category.description && !$category.image.large.url} mg-b-s{/if}">
            {if $category.description}
              <div id="category-description" class="text-muted">
                <a href="#" class="toggle-content__link">
                  <p>Opis</p>
                  <i class="material-icons">expand_more</i>
                </a>
                <div class="toggle-content__content">
                  {$category.description nofilter}
                </div>
              </div>
              {/if} {if $category.image.large.url}
              <div class="category-cover">
                <img src="{$category.image.large.url}"
                  alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" />
              </div>
            {/if}
          </div>
        </div>
      {/if}
    </div>

  {/if}


  {if $listing.products|count > 1}

    <nav class="filter-navi">

      {hook h="displayLeftColumn"}
      {block name='product_list_top'}
        {include
                      file='catalog/_partials/products-top.tpl' listing=$listing}
      {/block}
    </nav>

  {/if}

  <section id="products">
    {if $listing.products|count}

      <div>
        {block name='product_list'} {include file='catalog/_partials/products.tpl'
                  listing=$listing} {/block}
      </div>

      <div id="js-product-list-bottom2">
        {block name='product_list_bottom'} {include
                  file='catalog/_partials/products-bottom.tpl' listing=$listing} {/block}
      </div>

    {else}

      <div id="js-product-list">{include file='errors/not-found.tpl'}</div>

      <div id="js-product-list-bottom2"></div>
      <div class="section--brands-dont-load"></div>

    {/if}
  </section>

  {*include file='sinner/widgets/promocje-lista.tpl'*}

  {if $listing.products|count > 6}
    <div class="page-up">
      <a href="#category" class="btn btn-border js__scroll">
        <i class="material-icons">keyboard_double_arrow_up</i>
      </a>
    </div>

  {/if}
{/block}