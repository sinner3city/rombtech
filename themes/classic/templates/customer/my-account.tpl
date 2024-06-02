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
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="myaccount-dash">
    <div class="myaccount-dash__links">

      <a class="myaccount-dash__link" id="identity-link" href="{$urls.pages.identity}">
        <i class="material-icons">&#xE853;</i>
        <span class="link-item">
          {l s='Information' d='Shop.Theme.Customeraccount'}
        </span>
      </a>

      {if $customer.addresses|count}
        <a class="myaccount-dash__link" id="addresses-link" href="{$urls.pages.addresses}">
          <i class="material-icons">&#xE56A;</i>
          <span class="link-item">
            {l s='Addresses' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {else}
        <a class="myaccount-dash__link" id="address-link" href="{$urls.pages.address}">
          <i class="material-icons">&#xE567;</i>
          <span class="link-item">
            {l s='Add first address' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="myaccount-dash__link" id="history-link" href="{$urls.pages.history}">
          <i class="material-icons">&#xE916;</i>
          <span class="link-item">
            {l s='Order history and details' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="myaccount-dash__link" id="order-slips-link" href="{$urls.pages.order_slip}">
          <i class="material-icons">&#xE8B0;</i>
          <span class="link-item">
            {l s='Credit slips' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if $configuration.voucher_enabled && !$configuration.is_catalog}
        <a class="myaccount-dash__link" id="discounts-link" href="{$urls.pages.discount}">
          <i class="material-icons">&#xE54E;</i>
          <span class="link-item">
            {l s='Vouchers' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if $configuration.return_enabled && !$configuration.is_catalog}
        <a class="myaccount-dash__link" id="returns-link" href="{$urls.pages.order_follow}">
          <i class="material-icons">&#xE860;</i>
          <span class="link-item">
            {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
      {/block}

      <a class="myaccount-dash__link" id="returns-logout" href="{$logout_url}">
        <i class="material-icons">&#xE853;</i>
        <span class="link-item">
          {l s='Sign out' d='Shop.Theme.Actions'}
        </span>
      </a>

    </div>
  </div>
{/block}


