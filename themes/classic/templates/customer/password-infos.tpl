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
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {* <!-- <ul class="ps-alert-success"> --> *}
  {foreach $successes as $success}
    {* <!-- <li class="item"> --> *}
    <div class="alert alert-success">
      <ul>
        <li>{$success}</li>
      </ul>
    </div>
    {* <!-- </li> --> *}
  {/foreach}
  {* <!-- </ul> --> *}
{/block}

{block name='page_footer'}
  <ul>
    <li><a href="{$urls.pages.authentication}" class="account-link">
        <i class="material-icons">&#xE5CB;</i>
        <span>{l s='Back to Login' d='Shop.Theme.Actions'}</span>
      </a></li>
  </ul>
{/block}