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
<div id="quickview-modal-{$product.id}-{$product.id_product_attribute}" class="modal fade quickview" tabindex="-1"
  role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
          data-tooltip="Zamknij szybki podgląd">
          <i aria-hidden="true" class="material-icons">
            close
          </i>
        </button>

        <article class="qm-product">

          <h3 class="qm-product__title h3">{$product.name}</h3>



          <div class="qm-photos">

            {*include file='catalog/_partials/product-flags.tpl'*}
            <div class="qm-photos__container">


              {block name='product_images'}
                <div class="js-qv-mask mask">
                  <ul class="product-images js-qv-product-images">
                    {foreach from=$product.images item=image}
                      <li class="thumb-container">
                        <img class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                          data-image-medium-src="{$image.bySize.medium_default.url}"
                          data-image-large-src="{$image.bySize.medium_default.url}" src="{$image.bySize.home_default.url}"
                          alt="{$image.legend}" title="{$image.legend}" width="100" itemprop="image">
                      </li>
                    {/foreach}
                  </ul>
                </div>
              {/block}

              <div class="arrows js-arrows">
                <i class="material-icons arrow-up js-arrow-up">&#xE316;</i>
                <i class="material-icons arrow-down js-arrow-down">&#xE313;</i>
              </div>


              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
            </div>
          </div>



          <div class="qm-info">
            <h5 class="qm-info__title">Opis i warianty produktu:</h5>
            <div class="qm-product-description-short">
              <span class="demohide">W tym miejscu można wybrać najważniejsze cechy aby "Szybki podgląd" był najbardziej użyteczny</span>
              {$product.description|strip_tags:'UTF-8'|truncate:200:'...'}
            </div>

            {block name='product_description_short'}
              {if $product.description_short}
                {* <!-- <h5 class="qm-info__title">Krótki opis produktu:</h5> -->
                  <!-- <h5 class="qm-info__title">Opis i warianty produktu:</h5> -->
                  <!-- <div id="product-description-short" itemprop="description"> -->
                    <!-- W tym miejscu można wybrać najważniejsze cechy aby "Szybki podgląd" był najbardziej użyteczny --> *}
                {$product.description_short|strip_tags:'UTF-8'|truncate:200:'...'}
                {* <!-- </div> --> *}
              {/if}
            {/block}

            {block name='product_variants'}
              {if $product.main_variants}
                <div class="pd-t-s">
                  {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                </div>
              {/if}
            {/block}

            <div class="qm-prices">
              {block name='product_prices'}
                {include file='catalog/_partials/product-prices.tpl'}
              {/block}
            </div>
          </div>


          <a href="{if $product.id_category_default == 100}{url entity='category' id='100'}{else}{$product.url}{/if}"
            class="btn btn--border">
            <i class="material-icons">
              description
            </i>
            Zobacz pełen opis
          </a>

        </article>

      </div>
    </div>
  </div>
</div>