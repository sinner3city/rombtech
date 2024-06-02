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
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}"
    data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">

    {if $product.category == 'reklama-w-google'}
    <!-- <a href="{$urls.base_url}100/reklama-w-google"> --> {else} <a href="{$product.url}"></a>
    {/if}
    <div class="thumbnail-container">
      {hook h='displayProductPriceBlock' product=$product type='weight'}
      {block name='product_thumbnail'}
        {if $product.cover}
          <div class="thumbnail product-thumbnail">
            <img src="{$product.cover.bySize.home_default.url}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:100:'...'}{/if}"
              data-full-size-image-url="{$product.cover.medium.url}" />
          </div>
        {else}
          <div class="thumbnail product-thumbnail">
            <img src="{$urls.no_picture_image.bySize.home_default.url}" />w
          </div>
        {/if}
      {/block}



      {* <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} --> *}
      {block name='product_flags'}
        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
          {/foreach}
        </ul>
      {/block}

      <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
        {block name='quick_view'}
          <a class="quick-view" href="#" data-link-action="quickview">
            <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
          </a>
        {/block}

        {block name='product_variants'}
          {if $product.main_variants}
            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
          {/if}
        {/block}
      </div>
    </div>
    <div class="product-description">






      {block name='product_reviews'}
        {hook h='displayProductListReviews' product=$product}
      {/block}

      {block name='product_name'}
        {if $product.category == 'strona-www' || $product.category == 'sklep-internetowy'}
          {* <!-- <h3 class="h3 product-title title-price">129 zł {$product.labels.tax_long}/mc</h3> --> *}
        {else}
          <div class="product-short-desc">
            {$product.description_short}
          </div>
          <h2 class="h3 product-title" itemprop="name">{$product.name|truncate:100:'...'}
            <small class="product-short-users">{$product.description}</small>
          </h2>

          {block name='product_price_and_shipping'}
            {if $product.show_price}
              <div class="product-price-and-shipping">
                {if $product.has_discount}
                  {hook h='displayProductPriceBlock' product=$product type="old_price"}

                  <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                  <span class="regular-price">{$product.regular_price}</span>
                  {if $product.discount_type === 'percentage'}
                    <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                  {elseif $product.discount_type === 'amount'}
                    <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                  {/if}
                {/if}

                {hook h='displayProductPriceBlock' product=$product type="before_price"}




                {if $product.category == 'strona-www' || $product.category == 'sklep-internetowy'}

                  {* <!-- <p class="abo-label-summary">(łączny koszt za 12 miesięcy)</p> -->
                <!-- <h3 class="title-price-label">miesięczny koszt:</h3> --> *}

                  <h3 class="h3 product-title title-price"><span class="price-js"></span> zł<span class="cp1i">/mc</span></h3>
                  <p class="abo-label-mc">(miesięczny koszt {$product.labels.tax_long})</p>

                  <br><br>



                  <h3 class="abo-period-title">ABONAMENT <span class="white">ROCZNY</span></h3>

                  <span itemprop="price" class="price">{$product.price} {$product.labels.tax_long}</span>
                  <br><br>






                  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                  <p class="btn btn-primary">wybieram</p>

                {else}

                  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                  <span itemprop="price" class="price">{$product.price_amount|string_format:"%.0f"} zł
                    {$product.labels.tax_long}</span>
                  <div class="current-price-vat">
                    <span class="price">{($product.price_amount * 1.23)|replace:'.':','}</span>
                    <span class="price-tax">({$product.tax_name})</span>
                  </div>



                {/if}

                {hook h='displayProductPriceBlock' product=$product type='unit_price'}


              </div>
            {/if}
          {/block}
          <div class="t-center">
            <form action="{$urls.pages.cart}" method="post">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" value="{$product.id_product}" name="id_product">
              <input type="number" class="input-group form-control hide" name="qty" min="1" value="1">
              <button data-button-action="add-to-cart" class="btn btn-primary btn-add-listing" type="submit">
                Dodaj do koszyka
              </button>
            </form>

          </div>
        {/if}
      {/block}

    </div>
    {if $product.category !== 'reklama-w-google'}</a>{/if}
  </article>



{/block}