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
{block name='login_form'}

  {block name='login_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">


    {block name='login_form_fields'}
      {foreach from=$formFields item="field"}
        {block name='form_field'}
          {form_field field=$field}
        {/block}
      {/foreach}
    {/block}



    {block name='login_form_footer'}


      <footer class="form-footer login-footer text-sm-center clearfix">

        <a href="{$urls.pages.password}" rel="nofollow" class="link--forgot pd-r-s">
          {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
        </a>

        <input type="hidden" name="submitLogin" value="1">
        {block name='form_buttons'}
          <button id="submit-login" class="btn btn-primary" data-link-action="sign-in" type="submit"
            class="form-control-submit">
            {l s='Sign in' d='Shop.Theme.Actions'}
          </button>

          {* <!-- <strong class="lub">lub</strong> --> *}



          <div class="no-account hide">
            <a href="{$urls.pages.register}" class="btn btn-primary" data-link-action="display-register-form">
              załóż konto
              {* <!-- {l s='No account? Create one here' d='Shop.Theme.Customeraccount'} --> *}
            </a>
          </div>


          <br>




        {/block}
      </footer>


    {/block}

  </form>
{/block}