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


<html lang="{$language.iso_code}"
  id="{if strpos($urls.base_url, '/fshop/') !== false || strpos($base_url, '/demo/') !== false}fshopdemo{else}{$page.page_name}{/if}">

<head>
  {block name='head'}
    {include file='_partials/head.tpl'}
  {/block}
</head>

<body onclick id="{$page.page_name}" class="grid--4 page-body {$page.body_classes|classnames} {if $notifications.error || $notifications.warning || $notifications.success || $notifications.info}panel-top--active{/if}">



  {block name='hook_after_body_opening_tag'}
    {hook h='displayAfterBodyOpeningTag'}
  {/block}


  {block name='product_activation'}
    {include file='catalog/_partials/product-activation.tpl'}
  {/block}


  {block name='header'}
    {include file='_partials/header.tpl'}
  {/block}




  <main class="page-main || page-container">



    {block name='breadcrumb'}
      {include file='_partials/breadcrumb.tpl'}
    {/block}


    {hook h="displayWrapperTop"}


    {block name="content_wrapper"}
      <div class="page-content left-column right-column">
        {hook h="displayContentWrapperTop"}
        {block name="content"}
          <p>Hello world! This is HTML5 Boilerplate.</p>
        {/block}
        {hook h="displayContentWrapperBottom"}
      </div>
    {/block}

    {block name="right_column"}
      <div class="page-right">
        {if $page.page_name == 'product'}
          {hook h='displayRightColumnProduct'}
        {else}
          {hook h="displayRightColumn"}
        {/if}
      </div>
    {/block}
    {hook h="displayWrapperBottom"}
    {* <!-- </section> --> *}


  </main>

  <footer class="page-footer">
    {block name="footer"}
      {include file="_partials/footer.tpl"}
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