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

<article class="contact-rich">

  <div class="block">
    <div class="icon"><i class="material-icons">&#xE55F;</i></div>
    <div class="data">{$contact_infos.address.formatted nofilter}</div>
  </div>
  <h4>fShop.pl</h4>
  {if $contact_infos.phone}
    <div class="block">
      <div class="icon"><i class="material-icons">&#xE0CD;</i></div>
      <div class="data">
        <h5 class="contact-rich-title h5">Telefon kontaktowy:</h5>
        <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
      </div>
    </div>
  {/if}
  {if $contact_infos.fax}
    <hr />
    <div class="block">
      <div class="icon"><i class="material-icons">&#xE0DF;</i></div>
      <div class="data">
        {l s='Fax:' d='Shop.Theme.Global'}<br />
        {$contact_infos.fax}
      </div>
    </div>
  {/if}
  {if $contact_infos.email}
    <hr />
    <div class="block">
      <div class="icon"><i class="material-icons">&#xE158;</i></div>
      <div class="data email">
        <h5 class="contact-rich-title h5">Napisz do nas:</h5>
        <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>
      </div>
    </div>
  {/if}
</article>