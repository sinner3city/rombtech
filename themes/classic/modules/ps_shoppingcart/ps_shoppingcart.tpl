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
<div class="nav-top-cart">
  {* <!-- <div class= > -->
    <!-- <div class="header"> --> *}

  <a rel="nofollow" href="{$cart_url}" data-tooltip="Koszyk: {$cart.totals.total_excluding_tax.value}"
    class="nav-top__link link--cart blockcart cart-preview {if $cart.products_count > 0}active{else}active{/if}"
    data-refresh-url="{$refresh_url}">

    <i class="material-icons">shopping_cart</i>
    <span class="page-header__basket-count">{$cart.products_count}</span>
  </a>
  {* <!-- </div> -->
  <!-- </div> --> *}


</div>
{* <!-- <p>Menu</p> --> *}