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
<!doctype html>
<html lang="{$language.iso_code}">

<head>
  {block name='head'}
    {include file='_partials/head.tpl'}
  {/block}
</head>

<body id="{$page.page_name}"
  class="{$page.body_classes|classnames} {if $notifications.error || $notifications.warning || $notifications.success || $notifications.info}panel-top--active{/if}">

  {block name='hook_after_body_opening_tag'}
    {hook h='displayAfterBodyOpeningTag'}
  {/block}


  {block name='header'}
    {include file='_partials/header.tpl'}
  {/block}

  {block name='notifications'}
    {include file='_partials/notifications.tpl'}
  {/block}


  {hook h="displayWrapperTop"}

  <main class="page-main || page-container">

    <header class="page-heading">
      <h1 class="page-h1">Finalizuj zamówienie
      </h1>
    </header>

    {block name='content'}
      <section attr-id="content" class="page-content">

        {* <!-- <div class="cart-grid-body"> --> *}
        {block name='cart_summary'}
          {render file='checkout/checkout-process.tpl' ui=$checkout_process}
        {/block}
        {* <!-- </div> --> *}

      </section>
    {/block}

  </main>
  {hook h="displayWrapperBottom"}


  <footer class="page-footer">
    {block name='footer'}
      {include file='checkout/_partials/footer.tpl'}
    {/block}
  </footer>


  <div class="scripts">

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}

    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

  </div>


</body>

</html>