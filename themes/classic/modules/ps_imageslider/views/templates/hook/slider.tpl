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

{if $homeslider.slides}

  <div class="fs-slider-home carousel slide slider-style-1" data-slider="build" {literal}
      data-splide2='{"type": "loop", "padding":0, "speed": 1200, "interval": 4000, "pauseOnHover": true, "perPage":1,"perMove":1,"autoplay":true,"breakpoints":{"2700":{"perPage":1,"padding":0},"980":{"perPage":1,"padding":0},"480":{"perPage":1,"padding":0}}}'
    {/literal}>
    {foreach from=$homeslider.slides item=slide name='homeslider'}
      <div class="fs-slider-home__item" {if $slide.legend|strstr:"white"}data-cover="light" {else}data-cover="dark" {/if}
        {if $slide.legend|strstr:"left"}data-caption="left" {/if} style="background-image: url({$slide.image_url}?v=new)">
        <article class="fs-slider-home__text || slider-text">
          {if $slide.title || $slide.description}
            <figure class="fs-slider-home__caption || caption">

              <h2 class="fs-slider-home__h2 || display-1 text-uppercase">
                {if $slide.title != "logo"}{$slide.title}
                {else}<img src="{$urls.theme_assets}images/logo.png" alt="{$shop.name}" class="logo--slider">
                {/if}
              </h2>
              {if $slide.legend != ''}<h3 class="fs-slider-home__legend || display-1 text-uppercase">{$slide.legend}</h3>{/if}
              <div class="fs-slider-home__description || caption-description">{$slide.description|truncate:500 nofilter}</div>


              {if $slide.url != "#"}
                <a href="{$slide.url}" class="btn--primary nolink mg-t-s">
                  {if $slide.title == "logo"}aktywuj sklep dla Twojej firmy{else}dowiedz się więcej{/if}
                </a>
              {/if}

            </figure>
          {/if}
          {* <!-- <img src="{$urls.theme_assets}images/flaga.png" alt="Polski producent" class="slider--flag"> --> *}
        </article>
      </div>
    {/foreach}

  </div>
{/if}