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


{hook h='displayAfterProductThumbs'}
{* <!-- <div class="images-container"> --> *}


{block name='product_cover'}
  <div class="product-cover">
    {if $product.cover}
      <img class="js-qv-product-cover" src="{$product.cover.bySize.medium_default.url}" alt="{$product.cover.legend}"
        title="{$product.cover.legend}" itemprop="image" width="{$product.cover.bySize.medium_default.width}"
        height="{$product.cover.bySize.medium_default.height}">
      <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
        <i class="material-icons zoom-in">&#xE8FF;</i>
      </div>
    {else}
      <img src="{$urls.no_picture_image.bySize.medium_default.url}">
    {/if}
  </div>
{/block}


{* <!-- </div> --> *}