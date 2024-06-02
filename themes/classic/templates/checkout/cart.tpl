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
{extends file=$layout}

{block name='content'}

  <header class="page-heading">
    <h1 class="page-h1">{l s='Shopping Cart' d='Shop.Theme.Checkout'} </h1>
    <!-- <h1 class="page-h1">Twój koszyk: Świetny wybór! </h1> -->
  </header>


  <div class="fsbasket || content--max">


    {* <!-- Left Block: cart product informations & shpping --> *}
    <div class="fsbasket-list">

      {* <!-- cart products detailed --> *}
      <div class="">
        {block name='cart_overview'}
          {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
        {/block}
      </div>

      {block name='continue_shopping'}
        <div class="cart-back-to mg-t-s">
          <a class="link-ico" href="{url entity='category' id='2'}">
            <i class="material-icons">chevron_left</i>
            <span>{l s='Continue shopping' d='Shop.Theme.Actions'}</span>
          </a>
        </div>
      {/block}



      {block name='hook_reassurance'}
        {hook h='displayReassurance'}
      {/block}


      {if $cart.discounts|count > 0}
        <div class="promo-basket">
          <div class="fspromo-code__title mg-b-s">
            {foreach from=$cart.discounts item=discount}
              {if $discount.code == "StartujeMy!"}
                <span
                  class="">{l s='Oferta specjalna dla nowych klientów (ograniczona czasowo): ' d='Shop.Theme.Actions'}</span>
              {else}
                {l s='Mamy dla Ciebie ofertę specjalną: ' d='Shop.Theme.Actions'}
              {/if}
            {/foreach}
          </div>
          <ul class="js-discount fspromo-code__list">
            {foreach from=$cart.discounts item=discount}
              <li class="fspromo-code__item">
                <span class="label">
                  <span class="code">{$discount.name}&nbsp;<i class="fas fa-plus"></i></span>

                  <span class="code hide">{$discount.code}</span>
                </span>
              </li>
            {/foreach}
          </ul>
          {foreach from=$cart.discounts item=discount}
            {if $discount.code == "StartujeMy!"}
              {include file='checkout/_partials/promo-counter.tpl'}
            {/if}
          {/foreach}
        </div>
      {/if}


    </div>

    <aside class="fsbasket-aside">
      {block name='cart_summary'}
        <div class="fsbasket-sum">

          <h2 class="fsbasket-belt__titlepay">Do zapłaty:</h2>

          {block name='hook_shopping_cart'}
            {hook h='displayShoppingCart'}
          {/block}

          {block name='cart_totals'}
            {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
          {/block}



          {block name='cart_actions'}
            {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
          {/block}

        </div>
      {/block}

      <div class="mg-ver">

        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}

      </div>

      <section class="load--promo">



        {include file='sinner/widgets/promocje-box.tpl'}



      </section>
    </aside>






  </div>

  {* <!-- Right Block: cart subtotal & cart total --> *}



{/block}