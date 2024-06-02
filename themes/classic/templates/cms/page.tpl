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
  {$cms.meta_title}
{/block}

{block name='page_content_container'}

  <section attr-id="content" class="page-content page-cms page-cms-{$cms.id}">


    {block name='cms_content'}
      {$cms.content nofilter}
    {/block}

    {block name='hook_cms_dispute_information'}
      {hook h='displayCMSDisputeInformation'}
    {/block}

    {block name='hook_cms_print_button'}
      {hook h='displayCMSPrintButton'}
    {/block}

    <a href="#" class="btn btn--primary history-go-back">powrót do kategorii</a>

    
   


    {if $cms.id == '13'}

      <div class="flex-row2 pd-t-30">

        {block name='left_column'}
          {* <!-- <div id="left-column" class="col-xs-12 col-sm-4 col-md-3"> --> *}
          {widget name="ps_contactinfo" hook='displayLeftColumn'}
          {* <!-- </div> --> *}
        {/block}

        {block name='page_content'}
          {widget name="contactform"}
        {/block}

        {* <p class="contact-sinner" style="text-align:center; font-size: 16px;">Administratorem danych osobowych oraz
          właścicielem serwisu fShop.pl jest SINNER STUDIO Krystian Wojda, z siedzibą w Gdynia, ul. Abrahama 2/22,
          81-352, nr NIP 586-218-45-61, REGON: 220723395. Rok założenia 2009.</p> *}


      </div>





    {/if}

  </section>
{/block}