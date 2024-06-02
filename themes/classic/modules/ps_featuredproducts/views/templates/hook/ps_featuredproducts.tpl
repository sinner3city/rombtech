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


<section class="section section-products products--featured">
  {* <!-- <h2 class="h2 products-section-title text-uppercase flex-row-center"> *}
  {*l s='Popular Products' d='Shop.Theme.Catalog'*}
  {* Sklep internetowy a może Strona www?<br>Poznaj nasze produkty: *}

  {* </h2> --> *}

  <h3 class="section-products__title ">
    <span class="cp1">Polecane</span> <br>produkty
    {* <!-- <span class="titleLeft">Wyprzedaż</span> --> *}
  </h3>

  <blockquote class="infoblock pos--tr">

    <i class="material-icons ico">tips_and_updates</i>
    <div class="msg">
      <p>Scrollowanie list (prawo/lewo) można zainicjować dowolnym gestem: ruchem myszki lub przesuwając palcem po
        telefonie. To wygodny sposób przeglądania oferty w sklepie.</p>

    </div>

    <div class="arrow-down "></div>

  </blockquote>




  <div class="art__list list--products list--popular" data-style="1" data-col="3" data-slider="true" itemscope
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



  {* <!-- <a class="all-product-link" href="{$allProductsLink}">
    <p class="btn-primary">
    <span>{l s='All products' d='Shop.Theme.Catalog'}</span><i class="material-icons">&#xE315;</i></p>
  </a> --> *}
</section>