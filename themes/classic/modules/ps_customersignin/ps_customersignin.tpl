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


{if !$logged}

  <div class="nav-top-user js-dropdown">
    <a class=" nav-top__link link--account" href="{$my_account_url}"
      title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow" data-target="#"
      data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" aria-label="Panel klienta">

      <i class="material-icons">manage_accounts</i>
      <span class="page-header__btn-label">{l s='Panel Klienta' d='Shop.Theme.Actions'}</span>
    </a>

    <ul class="dropdown-menu">
      <li>
        <a title="Logowanie" rel="nofollow" href="{$my_account_url}" class="dropdown-item">Logowanie</a>
      </li>
      <li class="current">
        <a title="Rejestracja" rel="nofollow" href="{$urls.pages.register}" class="dropdown-item">Rejestracja klienta</a>
      </li>
    </ul>
  </div>
{else}

  <div class="nav-top-user">
    <a class=" nav-top__link link--account link--logged" href="{$my_account_url}"
      title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow" data-target="#"
      aria-label="Panel klienta">

      <i class="material-icons">manage_accounts</i>
      <span class="page-header__btn-label">{l s='Twoje konto' d='Shop.Theme.Actions'}</span>
    </a>

  </div>
{/if}