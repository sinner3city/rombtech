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

{* <!-- <div class="art__list list--products list--new" data-style="1" data-col="{if $products|@count < 5}4$products|@count{else}6{/if}" data-slider="false"> --> *}

<section class="section section-products products--ne hide clearfix mt-3">
  {hook h='displayHomeBeforeProducts'}

  <h3 class="section-products__title">
    <strong class="cp3">Nowe produkty</strong><br>sprawdź!
  </h3>



  <div class="art__list list--products list--new" data-style="1" data-col="4" data-slider="true" itemscope
    itemtype="https://schema.org/ItemList">

    <div class="splide">
      <div class="splide__track">
        <ul class="splide__list">
          {foreach from=$products item="product"}
            <li class="splide__slide">{include file="catalog/_partials/miniatures/product_fs.tpl" product=$product}</li>
          {/foreach}

        </ul>
      </div>
    </div>
  </div>


  {* <!-- <a class="all-product-link" href="{$allNewProductsLink}">
    <p class="btn--primary ico--right"><span>{l s='All new products' d='Shop.Theme.Catalog'}</span><i class="material-icons">&#xE315;</i></p>
  </a> --> *}
</section>