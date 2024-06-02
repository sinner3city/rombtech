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



{block name='hook_footer_before'}
  {hook h='displayFooterBefore'}
{/block}

<section class="page-bottom">
  <div class="delivery-bottom">
    {* <p class="">Darmowa dostawa od 500 zł</p> *}
    <img src="{$urls.theme_assets}media/kurierzy/dhl.png" alt="kurierzy" class="mg-hor-s">
    <img src="{$urls.theme_assets}media/kurierzy/dpd_small.png" alt="kurierzy" class="mg-hor-s">
    <img src="{$urls.theme_assets}media/kurierzy/ups.png" alt="kurierzy" class="mg-hor-s">
    <img src="{$urls.theme_assets}media/kurierzy/inpost.png" alt="kurierzy" class="mg-hor-s">
  </div>
  <div class="pay-bottom">
    <p>Zapłacisz także ratalnie:</p>
    {* <!-- <img src="{$urls.theme_assets}media/banki/pay.png" alt="payu"> --> *}
    <img src="{$urls.theme_assets}media/banki/payu-raty2.png" alt="payu raty">
    <img src="{$urls.theme_assets}media/banki/payu-pozniej2.png" alt="payu pozniej">
  </div>
</section>

<section class="section section--contact" data-src-background2="{$urls.theme_assets}images/bg--footer.png">

  <div class="footer-info || flex-row  content--padding">



    <div class="social || t-center">

      <ul class="social__list">
        <li class="social__item"><a class="social__link link--fb" href="https://www.facebook.com/FirmowyStarter"
            target="_blank">
            <img src="{$urls.theme_assets}icons/facebook.svg" alt=""></a></li>


        <li class="social__item"><a class="social__link link--yt" href="https://www.youtube.com/@FirmowyStarter"
            target="_blank">
            <img src="{$urls.theme_assets}icons/youtube-icon.svg" alt=""></a></li>


        <li class="social__item"><a class="social__link link--insta" href="https://www.instagram.com/firmowystarter"
            target="_blank"><img src="{$urls.theme_assets}icons/instagram-icon.svg" alt=""></a></li>


        <li class="social__item"><a class="social__link link--tw" href="https://twitter.com/FirmowyStarter"
            target="_blank"><img src="{$urls.theme_assets}icons/twitter.svg" alt=""></a></li>

      </ul>
    </div>

    <div class="footer-contact flex-row-center-mid">

      <div class="flex-row-center-mid">

        <a href="tel:+48{$shop.phone|replace:' ':''}" class="footer-contact__link">+48 {$shop.phone}</a> <span
          class="sep">//</span>

        <a href="mailto:{$shop.email}" class="footer-contact__link">{$shop.email}</a>
      </div>
    </div>


    {widget name="ps_contactinfo" hook="displayFooter"}


  </div>

  <nav class="footer-menu">
    {block name='hook_footer'}
      {hook h='displayFooter'}
    {/block}

  </nav>

  <div class="copyrights t-center">
    Wszelkie prawa zastrzeżone © 2009-2024. fShop.pl
  </div>

</section>




<div class="panel panel-bottom" data-panel="bottom">

  <div class="panel__container">
    {if $page.page_name == "product"}
      {include file='sinner/promo-bar.tpl'}
    {/if}
  </div>
  <i class="panel__close material-icons">close</i>
</div>