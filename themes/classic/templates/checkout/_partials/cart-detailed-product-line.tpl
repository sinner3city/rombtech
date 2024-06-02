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
<div class="fsbasket-item">
  {* <!--  product left content: image--> *}
  <div class="fsbasket-item__img">
    <img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}">
  </div>

  {* <!--  product left body: description --> *}
  <div class="fsbasket-item__content">
    <div class="product-line-info">
      <a class="fsbasket-item__title" href="{$product.url}"
        data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
      {foreach from=$product.attributes key="attribute" item="value"}
        <div class="fsbasket-item__versions flex-row-left-mid">
          <strong class="fsbasket-item__attr">{$attribute} </strong>
          <span
            class="fsbasket-item__value">{if $value !== "12" && $value !== "6" && $value !== "3"}{$value}{/if}{if $value == "12"}:
            <span class="mc-label">1 rok</span>{/if}{if $value == "6"}: <span class="mc-label">6
              miesięcy</span>{/if}{if $value == "3"}: <span class="mc-label">3 miesiące</span>{/if}</span>
        </div>
      {/foreach}
    </div>

    <div class="fsbasket-item__prices {if $product.has_discount}has-discount{/if}">
      {if $product.has_discount}
        <div class="product-discount">
          <span class="regular-price">{$product.regular_price}</span>
          {if $product.discount_type === 'percentage'}
            <span class="discount discount-percentage">
              -{$product.discount_percentage_absolute}
            </span>
          {else}
            <span class="discount discount-amount">
              -{$product.discount_to_display}
            </span>
          {/if}
        </div>
      {/if}
      <div class="fsbasket-item__price">

        {* <!-- <strong class="label">Cena: </strong> --> *}

        <strong class="price">{$product.total}</strong> <span class="lowercase">{$product.labels.tax_long}</span> -
        <small> {$product.quantity} szt.</small>

        {* <!-- {if $product.unit_price_full}
          <div class="unit-price-cart">{$product.unit_price_full}</div>
        {/if}  --> *}

      </div>
      {* <!-- {$product.message} -->
      <!-- {$product|dump} --> *}


    </div>

    <br />



    {if is_array($product.customizations) && $product.customizations|count}

      {block name='cart_detailed_product_line_customization'}
        {foreach from=$product.customizations item="customization"}
          <a href="#" data-toggle="modal"
            data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
          <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}"
            tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                </div>
                <div class="modal-body">
                  {foreach from=$customization.fields item="field"}
                    <div class="product-customization-line row">
                      <div class="label">
                        {$field.label}
                      </div>
                      <div class="value">
                        {if $field.type == 'text'}
                          {if (int)$field.id_module}
                            {$field.text nofilter}
                          {else}
                            {$field.text}
                          {/if}
                        {elseif $field.type == 'image'}
                          <img src="{$field.image.small.url}">
                        {/if}
                      </div>
                    </div>
                  {/foreach}
                </div>
              </div>
            </div>
          </div>
        {/foreach}
      {/block}
    {/if}

  </div>

  <!--  product left body: description -->
  <div class="fsbasket-item__actions">
    <div class="">
      <div class="">
        <div class="flex-row-center-mid">
          <div class="price mg-r-s">
            <span class="product-price">
              <strong>
                {if isset($product.is_gift) && $product.is_gift}
                  <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
                {else}

                {/if}
              </strong>
            </span>
          </div>
          <div class="qty">
            {if isset($product.is_gift) && $product.is_gift}
              <span class="gift-quantity">{$product.quantity}</span>
            {else}

              {* <!-- <p class="qty__label">{$product.total} <small>{$product.labels.tax_short}</small></p> -->
              <!-- <p class="qty__label">ilość: </p> -->

              <!-- <select

                  class=""
                  data-update-url="{$product.update_quantity_url}"
                  data-product-id="{$product.id_product}"
                  name="qty"

              >
                <option value="1" {if $product.quantity == 1}selected{/if}>{$product.quantity}</option>
                <option value="2" {if $product.quantity == 2}selected{/if}>2</option>
                <option value="3" {if $product.quantity == 3}selected{/if}>3</option>
                <option value="4" {if $product.quantity == 4}selected{/if}>4</option>
                <option value="5" {if $product.quantity == 5}selected{/if}>5</option>
                <option value="6" {if $product.quantity == 6}selected{/if}>6</option>
                <option value="7" {if $product.quantity == 7}selected{/if}>7</option>
                <option value="8" {if $product.quantity == 8}selected{/if}>8</option>
                <option value="9" {if $product.quantity == 9}selected{/if}>9</option>
                <option value="10" {if $product.quantity == 10}selected{/if}>10</option>
              </select> --> *}


              <input class="js-cart-line-product-quantity" data-down-url="{$product.down_quantity_url}"
                data-up-url="{$product.up_quantity_url}" data-update-url="{$product.update_quantity_url}"
                data-product-id="{$product.id_product}" type="number" value="{$product.quantity}"
                name="product-quantity-spin" min="{$product.minimal_quantity}" />
            {/if}
          </div>
          <div class="flex-row-center mg-l-s">
            <a class="remove-from-cart" rel="nofollow" href="{$product.remove_from_cart_url}"
              data-link-action="delete-from-cart" data-id-product="{$product.id_product|escape:'javascript'}"
              data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
              data-id-customization="{$product.id_customization|escape:'javascript'}">
              {if !isset($product.is_gift) || !$product.is_gift}

                <i class="material-icons float-xs-left">delete</i>
              {/if}
            </a>
          </div>
        </div>
      </div>
      <div class="">
        <div class="">

          {block name='hook_cart_extra_product_actions'}
            {hook h='displayCartExtraProductActions' product=$product}
          {/block}

        </div>
      </div>
    </div>
  </div>

</div>