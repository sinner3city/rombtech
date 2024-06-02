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
 {block name='product_flags'}
 <ul class="product-item__flags">
   {foreach from=$product.flags item=flag}
   <li class="product-item__flag {$flag.type}" 
     data-tooltip="{if $flag.type == 'discount2'}Rabat za współpracę
     {elseif $flag.type == 'new'}Nowość
     {elseif $flag.type == 'on-sale'}Polecamy!{else}Rabat: {$flag.label}{/if}">
     {if $flag.type == 'on-sale'}<i class="material-icons">thumb_up_alt</i>{/if}
     {if $flag.type == 'new'}<i class="material-icons">new_releases</i>{/if}
     {if $flag.type == 'discount'}
       {if $product.discount_type === 'percentage'}
         <span class="product-item__discount">Rabat: {$product.discount_percentage}</span>
       {else}
       
       <span class="product-item__discount">Rabat: {$product.discount_amount_to_display}</span>
       <i class="material-icons">sell</i>
       {/if}
     {/if}
   </li>
   {/foreach}
 </ul>
{/block}