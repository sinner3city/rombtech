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
{block name='customer_form'}
  {block name='customer_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form"
    method="post">
    {* <h4 class="title">Rejestracja:</h4> *}
    <section class="form-fields">
      {block "form_fields"}
        {foreach from=$formFields item="field"}
          {block "form_field"}
            {form_field field=$field}
          {/block}
        {/foreach}
      {/block}
    </section>

    {block name='customer_form_footer'}
      <footer class="form-footer clearfix">
        <input type="hidden" name="submitCreate" value="1">
        {block "form_buttons"}
          {* <!-- <div class="col-md-3">&nbsp;</div> -->
      <!-- <div class="col-md-7"> --> *}

          <button class="btn btn-primary form-control-submit " data-link-action="save-customer" type="submit">
            {if $page.page_name == 'identity'}

              {l s='Zapisz dane' d='Shop.Theme.Actions'}
            {else}
              {l s='Utwórz konto' d='Shop.Theme.Actions'}
            {/if}
          </button>
          {* <!-- </div> --> *}
        {/block}
      </footer>
    {/block}

  </form>
{/block}