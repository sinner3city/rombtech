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
* @author PrestaShop SA <contact@prestashop.com>
  * @copyright 2007-2019 PrestaShop SA and Contributors
  * @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
  * International Registered Trademark & Property of PrestaShop SA
  *}

  {* {$product.description|dump} *}
{block name='product_miniature_item'}

  <article itemprop="itemListElement" itemscope itemtype="https://schema.org/Product"
    class="{if $product.id_category_default == '100'}product-category{/if} product-item || art product-miniature js-product-miniature viewed"
    data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">


    {assign var='description' value=$product.description}
    {assign var='regex' value='/<img\s+src="([^"]+)"/'}
    {assign var='matches' value=''}

    {if preg_match($regex, $description, $matches)}
        {assign var='first_image_url' value=$matches[1]}
    {/if}

{* Teraz zmienna $first_image_url zawiera URL pierwszego zdjęcia *}


    {* <meta itemprop="description" content="{$product.description_short|strip_tags}" /> *}



    {block name='quick_view'}
      <div class="highlighted-informations {if !$product.main_variants} no-variants{/if} hidden-sm-down">

        <a class="product-item__quick quick-view" href="#" data-link-action="quickview"
          data-tooltip="{l s='Quick view' d='Shop.Theme.Actions'}">
          {* <!-- <i class="material-icons search">&#xE8B6;</i> --> *}

          <span class="material-icons">
            offline_bolt
          </span>
        </a>
      </div>
    {/block}

    {* <a href="#" class="art__fav-link">
      <i class="fav-link fav--add material-icons" data-tooltip="Zapisz do ulubionych">favorite_border</i>
      <i class="fav-link fav--saved material-icons" data-tooltip="Usuń z ulubionych">favorite</i>
      <i class="fav-link fav--remove material-icons">heart_broken</i>
    </a> *}

    <a href="{$product.url}" class="product-item__link || art__link-art">

      <figure class="product-item__cover || art__figure">

        {hook h='displayProductPriceBlock' product=$product type='weight'}
        {block name='product_thumbnail'}


          <div class="product-item__picture" style="position: relative;">
          

          {* <div style="position: absolute">
          {$productDescription}
          </div> *}

            {* <img itemprop="image" src="{$product.cover.medium.url}" class="hide" alt='{$product.name}' /> *}

            {* // find from $product.description first img tag and return url *}
            {* {assign var='productDescription' value=$product.description} *}
            {* {assign var='productDescription' value=$productDescription|replace:'<img src="':'<img src='|replace:'" alt="':'" alt='|replace:'" />':'" />'} *}


            {* {assign var='productDescription' value=$productDescription|replace:'<img src="':'<img src='|replace:'" alt="':'" alt='|replace:'" />':'" />'} *}


            

            {if $product.cover}
              <img class="art__img || lazy2" src="{$first_image_url}"
                data-splide-lazy="{$first_image_url}"
                data-src="{$first_image_url}"
                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:100:'...'}{/if}"
                data-full-size-image-url="{$first_image_url}" itemprop="image" />

            {else}
              <img class="art__img || lazy3" src="{$first_image_url}" data-src="{$first_image_url}" alt="{$product.name}" itemprop="image" />
            {/if}
          </div>
        {/block}




      </figure>



      {include file='catalog/_partials/product-flags.tpl'}

      <div class="product-item__info || art__content">

        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}

        {block name='product_name'}

          {assign var=subTitle value="-"|explode:$product.name}

          <div class="product-item__header || art__header">
            <p class="product-item__subtitle || art__subtitle">{$product.category_name}</p>
            {* <!-- <h4 class="product-item__title || art__title" itemprop="name">{$product.name|truncate:100:'...'}</h4> --> *}
            <h4 class="product-item__title || art__title" itemprop="name">{$product.name|truncate:100:'...'}</h4>

          </div>

          <p class="product-item__desc hide">{$product.description|strip_tags:'UTF-8'}</p>



          {block name='product_price_and_shipping'}
            {if $product.show_price}
              <div class="product-item__prices" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
                <meta itemprop="priceCurrency" content="{$currency.iso_code}" />
                <meta itemprop="price" content="{$product.price_amount}" />

                {hook h='displayProductPriceBlock' product=$product type="before_price"}

                {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                {hook h='displayProductPriceBlock' product=$product type='weight'}


                {* <!-- <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span> --> *}
                <div aria-label="{l s='Price' d='Shop.Theme.Catalog'}"
                  class="product-item__price || art__btn btn--price  btn--secondary">

                  {if $product.has_discount}
                    {hook h='displayProductPriceBlock' product=$product type="old_price"}
                    <u class="product-item__regular-price">{$product.regular_price_amount|string_format:"%.2f"|replace:'.':','}
                    </u>
                  {/if}

                  {($product.price_amount|string_format:"%.2f")|replace:'.':','}

                  <small class="label-sign mg-l-ss {if $product.has_discount}sign--discount{/if}">{$currency.sign}</small>

                  <span class="tax-label">{$product.labels.tax_long}</span>
                </div>


                <div class="product-item__current-price-vat">

                  <span class="product-item__price-tax">
                    {($product.price_amount / ($product.rate/100 + 1))|string_format:"%.2f"|replace:'.':','}
                    {$currency.sign}
                  </span>
                  <span class="product-item__price-tax hide">
                    {($product.price_amount * ($product.rate/100 + 1))|replace:'.':','}
                    {$currency.sign}
                    {$product.labels.tax_long}
                  </span>
                  netto{*$product.tax_name*}
                </div>

              </div>
            {/if}
          {/block}
        {/block}

      </div>

      <div class="product-item__footer || t-center">

        <div class="product-item__shortdesc">
          {$product.description_short|strip_tags:'UTF-8'|truncate:100:'...'}
        </div>


      </div>


    </a>

    <form class="product-item__add hide" action="{$urls.pages.cart}" method="post">
      <input type="hidden" name="token" value="{$static_token}">
      <input type="hidden" value="{$product.id_product}" name="id_product">
      <input type="number" class="input-group form-control hide" name="qty" min="1" value="1">
      <button data-button-action="add-to-cart" class="btn btn-primary btn-add-listing" type="submit">
        <i class="material-icons">shopping_cart</i><span class="btn-label">Do koszyka</span>
      </button>
    </form>

    {* <!-- DO SPRAWDZENIA -->

    <!-- QUICKVIEW END --> *}




    {* {block name='product_variants'}



      {if $product.main_variants}



        {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}



      {/if}



    {/block} *}
  </article>
{/block}