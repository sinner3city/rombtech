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
{if $cart.vouchers.allowed}
  {block name='cart_voucher'}

    <div class="fspromo-voucher">

      {if $cart.vouchers.added}
        {block name='cart_voucher_list'}
          <ul class="fspromo-voucher__name mg-ver-s">
            {foreach from=$cart.vouchers.added item=voucher}
              <li class="cart-summary-line flex-row-center-mid">
                <span class="label">{$voucher.name}</span>
                <strong>{$voucher.reduction_formatted}</strong>
                <div class="float-xs-right flex-row-mid">
                  <span class="value">{$voucher.reduction_formatted}</span>
                  <a href="{$voucher.delete_url}" data-link-action="remove-voucher"><i class="material-icons">&#xE872;</i></a>
                </div>
              </li>
            {/foreach}
          </ul>
        {/block}
      {/if}

      {* <!-- <p class="promo-code-button display-promo{if $cart.discounts|count > 0} with-discounts{/if}">
          <a class="collapse-button" href="#promo-code">
            {l s='Have a promo code?' d='Shop.Theme.Checkout'}
          </a>
        </p> --> *}

      <div id="fspromo" class="fspromo || collapse{if $cart.discounts|count > 0} in{/if}">


        {* <!-- <div class="fspromo-code"> --> *}

        {block name='cart_voucher_form'}
          <form action="{$urls.pages.cart}" data-link-action="add-voucher" method="post" class="fspromo-form flex-row-mid">
            <p class="fspromo-form__label">
              Masz kod rabatowy?
            </p>
            <input type="hidden" name="token" value="{$static_token}">
            <input type="hidden" name="addDiscount" value="1">
            <div class="flex-row">
              <input class="fspromo-form__input" type="text" name="discount_name"
                placeholder="{l s='Podaj kod aby uzyskać rabat' d='Shop.Theme.Checkout'}">
              <button type="submit"
                class="fspromo-form__btn || btn btn-secondary"><span>{l s='Add' d='Shop.Theme.Actions'}</span></button>
            </div>
          </form>
          {block name='cart_voucher_notifications'}
            <div class="alert alert-danger js-error" role="alert">
              <span class="ml-1 js-error-text"></span>
            </div>
          {/block}
        {/block}


        {* 
        <!-- <a class="collapse-button promo-code-button cancel-promo" role="button" data-toggle="collapse" data-target="#promo-code" aria-expanded="true" aria-controls="promo-code">
              {l s='Close' d='Shop.Theme.Checkout'}
            </a> -->
        <!-- </div> --> *}
      </div>




    </div>

  {/block}
{/if}