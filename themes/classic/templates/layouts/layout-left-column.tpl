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
{extends file='layouts/layout-both-columns.tpl'}

<!-- lay left-column -->

  {block name='right_column'}{/block}

        {block name='content_wrapper'}

      {block name="left_column"}
        <aside class="page-content-left">

              <svg class="loader-svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="204px" height="204px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                <circle cx="50" cy="50" r="19" stroke-width="2" stroke="#f94d12" stroke-dasharray="29.845130209103033 29.845130209103033" fill="none" stroke-linecap="round">
                  <animateTransform attributeName="transform" type="rotate" dur="1.8518518518518516s" repeatCount="indefinite" keyTimes="0;1" values="0 50 50;360 50 50"></animateTransform>
                </circle>
                <circle cx="50" cy="50" r="16" stroke-width="2" stroke="#3e3e3e" stroke-dasharray="25.132741228718345 25.132741228718345" stroke-dashoffset="25.132741228718345" fill="none" stroke-linecap="round">
                  <animateTransform attributeName="transform" type="rotate" dur="1.8518518518518516s" repeatCount="indefinite" keyTimes="0;1" values="0 50 50;-360 50 50"></animateTransform>
                </circle>
                </svg>


                {hook h='displayLeftColumnProduct'}
                {if $page.page_name == 'product'}
                  {hook h='displayLeftColumnProduct'}
                {/if}
        </aside>
      {/block}

      <section class="page-content-listing">
        
        {hook h="displayContentWrapperTop"}
        {block name='content'}
        
          <p>Hello world! This is HTML5 Boilerplate.</p>
        {/block}
        {hook h="displayContentWrapperBottom"}
      </section>
  {/block}
