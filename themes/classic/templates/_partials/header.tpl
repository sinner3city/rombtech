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
* @author PrestaShop SA <contact@prestashop.com>
  * @copyright 2007-2019 PrestaShop SA and Contributors
  * @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
  * International Registered Trademark & Property of PrestaShop SA
  *}



<header class="page-header">
  <div class="page-header__bg">
    <a href="{$urls.base_url}" class="page-logo" title="logo">
      <img src="{$urls.theme_assets}images/slogo.svg" alt="{$shop.name}" />
      <p class="page-logo__name">
        dla<span class="cp1">Narzędzi</span>.pl
      </p>
    </a>

    {* {$listing|dump} *}

    {*
          <p class="topcontact">
              <a class="topcontact__phone" href="tel:+48{$shop.phone}"><i class="material-icons"> call
                  </i>{$shop.phone}</a>
              <i class="cp1 pd-r-ss">//</i>
              <strong class="topcontact__email">{$shop.email}</strong>
          </p>

          *} {* {block name='header_banner'}

          <div class="header-banner">
              <div class="rebate-topinfo">
                  <strong class="rebate-topinfo__label">Uwaga!</strong>
                  <strong class="rebate-topinfo__val cp1"></strong>
                  <p class="rebate-topinfo__name" data-tooltip="Rabat znajdziesz w koszyku"></p>
              </div>
              {hook h='displayBanner'}
          </div>
          {/block} *}

    <div class="page-header__right || flex-row-center-mid">
      {* {hook h='displayNav1'} *}
      {hook h='displayNav2'}
    </div>

    <!-- <nav class="nav-top"> -->
    <nav class="page-menu">
      <div class="page-menu__bg"></div>
      <div class="page-menu__scroll">{hook h='displayTop'}</div>
    </nav>
    <!-- </nav> -->
  </div>
</header>


<aside class="page-sidebar">

  <a href="#" class="nav-top__link link--burger">
    <div class="menu-burger__btn">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </a>

  <div class="page__panel-right">
    <a href="{$urls.base_url}" class="page__panel-logo" title="Strony i sklepy internetowe w abonamencie!">

      <img src="{$urls.theme_assets}images/fshop_logo.png" alt="" class="mg-b-ss">

    </a>
    {hook h='displayNav2'}

    <nav class="page-menu">
      <div class="page-menu__bg"></div>
      <div class="page-menu__scroll">
        <div id="js__menu-clone"></div>
        {include file='sinner/promo-counter.tpl'}
      </div>
    </nav>

  </div>

</aside>