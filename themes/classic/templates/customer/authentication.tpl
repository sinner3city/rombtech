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
  {l s='Log in to your account' d='Shop.Theme.Customeraccount'}
  <p class="register-fb-label demohide">W dziale z
    {* <a href="https://firmowystarter.pl/dodatki-i-rozszerzenia/" target="_blank"> *}
    dodatkami i roszerzeniami
    {* </a>  *}
    znajdziesz logowanie przez FB czy Gmail'a
</p>
{/block}



{block name='page_content'}
<section class="login-by login-by__google t-center mg-b-ss">

  {block name='display_after_login_form'}
  {hook h='displayCustomerLoginFormAfter'}
  {/block}
</section>
<div class="fslogin__container">

  {block name='login_form_container'}
  <section class="login-form">
    {render file='customer/_partials/login-form.tpl' ui=$login_form}



    </section>

    {* <!-- <section class="log-create">


            <div class="no-account">
              <a href="{$urls.pages.register}" class="btn btn-primary" data-link-action="display-register-form">
                załóż konto

              </a>
            </div>


          </section> --> *}
  {/block}

</div>




{/block}