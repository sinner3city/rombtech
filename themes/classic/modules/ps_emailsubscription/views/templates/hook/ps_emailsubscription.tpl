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

<div class="block_newsletter">
  <div class="flex-row flex-wrap">
    <div id="block-newsletter-label" class="newsletter-lab">
      <h3 class="h4">Biuletyn informacyjny. Zapisz&nbsp;się.&nbsp;Warto.</h3>
      <p>Poznaj cenne wskazówki i ukierunkuj strategię rozwoju swojej firmy w internecie.
        {* <!-- <br>Dodatkowo otrzymasz <strong class="cp1">5% rabatu</strong> na dobry początek :) --> *}
      </p>
      {* <!-- <p>{l s='Get our latest news and special sales' d='Shop.Theme.Global'}</p> --> *}
    </div>
    <div class="newsletter-for">
      <h3 class="h4"></h3>
      <form action="{$urls.pages.index}.page-footer" method="post" autocomplete="off">
        {* <!-- <input autocomplete="false" name="hidden" type="text" style="display:none;"> --> *}
        {* <!-- <input type="email" name="hidden" class="hide" style="width: 0; height: 0; border: 0; padding: 0" /> --> *}

        <input class="btn btn-primary btn--primary float-xs-right" name="submitNewsletter" type="submit"
          value="{l s='Zapisz mnie!' d='Shop.Theme.Actions'}">
        <div class="input-wrapper">
          <input name="email" type="email" value="{$value}"
            placeholder="{l s='Your email address' d='Shop.Forms.Labels'}" aria-labelledby="block-newsletter-label">
        </div>
        <input type="hidden" name="action" value="0">
        <div class="">
          {if $conditions}
            <p>{$conditions}</p>
          {/if}
          {if $msg}
            <p class="alert {if $nw_error}alert-danger test2{else}alert-success{/if}">
              {$msg}
            </p>
          {/if}
          {if isset($id_module)}
            {hook h='displayGDPRConsent' id_module=$id_module}
          {/if}
        </div>
      </form>
    </div>
  </div>
</div>