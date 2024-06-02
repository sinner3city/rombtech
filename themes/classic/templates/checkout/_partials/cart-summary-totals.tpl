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
<div class="">



  {block name='cart_summary_total'}
    {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}


      <div class="fsbasket-belt">
        {* <!-- <div class="card-block"> --> *}
        {foreach from=$cart.subtotals item="subtotal"}
          {if $subtotal.value && $subtotal.type !== 'tax' && $subtotal.type !== 'products'}
            <div class="" id="cart-subtotal-{$subtotal.type}">
              <span class="label t-left {if 'products' === $subtotal.type} js-subtotal{/if}">
                {if 'products' == $subtotal.type}
                  {$cart.summary_string}
                {else}
                  {$subtotal.label}
                {/if}
              </span>
              <span class="value t-left">
                {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
              </span>
              {if $subtotal.type === 'shipping'}
                <div><small class="value t-left">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
              {/if}
            </div>
          {/if}
        {/foreach}
        {* <!-- </div> --> *}

        <div class="t-right">
          <span class="label t-right">{$cart.totals.total_including_tax.label}</span>
          <span class="value t-right">{$cart.totals.total_including_tax.value}</span>
        </div>
      </div>

      {* <!-- <div class="">
            <span class="label">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
            <span class="value">{$cart.totals.total.value}</span>
          </div>  --> *}

    {else}



      <div class="fsbasket-belt">
        {* <!-- <div class="card-block"> --> *}
        {foreach from=$cart.subtotals item="subtotal"}
          {if $subtotal.value && $subtotal.type !== 'tax' && $subtotal.type !== 'products'}
            <div class="" id="cart-subtotal-{$subtotal.type}">
              <span class="label t-left {if 'products' === $subtotal.type} js-subtotal{/if}">
                {if 'products' == $subtotal.type}
                  {$cart.summary_string}
                {else}
                  {$subtotal.label}
                {/if}
              </span>
              <span class="value t-left">
                {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
              </span>
              {if $subtotal.type === 'shipping'}
                <div><small class="value t-left">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
              {/if}
            </div>
          {/if}
        {/foreach}
        {* <!-- </div> --> *}

        <div class="t-right">
          <span class="label t-right">{$cart.totals.total_including_tax.label}</span>
          <span class="value t-right">{$cart.totals.total_including_tax.value}</span>
        </div>
      </div>
    {/if}
  {/block}

  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}

  {*block name='cart_summary_tax'}
    {if $cart.subtotals.tax}
      <div class="cart-summary-line">
        <span class="label sub">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}</span>
        <span class="value sub">{$cart.subtotals.tax.value}</span>
      </div>
    {/if}
  {/block*}

</div>