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
 

<div id="js-product-list">
  <!-- <div class="product-item-list"> -->
    <!-- <div class="art__list list--products list--recommended" data-style="1" data-col="{if $listing.products|count < 5}4{else}{if $smarty.cookies.grid}{$smarty.cookies.grid}{else}6{/if}{/if}" data-slider="false"> -->
    <div class="art__list list--products list--recommended" data-style="1" data-col="{if $listing.products|count < 5 && !$smarty.cookies.grid}6{else}{if $smarty.cookies.grid}{$smarty.cookies.grid}{else}6{/if}{/if}" data-slider="false">

      <nav class="slider-nav">
          <a href="#" class="slider-nav__prev"><i class="material-icons">navigate_before</i></a>
          <a href="#" class="slider-nav__next"><i class="material-icons">navigate_next</i></a>
      </nav>
      
        {foreach from=$listing.products item="product"}
          {block name='product_miniature'}
            {include file='catalog/_partials/miniatures/product_fs.tpl' product=$product}
          {/block}
        {/foreach}

    </div>
  <!-- </div> -->

  {block name='pagination'}
    {include file='_partials/pagination.tpl' pagination=$listing.pagination}
  {/block}

  <div class="hidden-md-up t-center up pd-t-b">

    <a href="#category" class="btn btn-secondary js__scroll">
      <i class="material-icons">&#xE316;</i>
      {l s='Back to top' d='Shop.Theme.Actions'}
    </a>

  </div>
</div>
