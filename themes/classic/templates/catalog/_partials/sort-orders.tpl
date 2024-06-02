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
{* <!-- <span class="sort-by">{l s='Sort by:' d='Shop.Theme.Global'}</span> --> *}

<button type="button" class="btn-unstyle btn-fastmode"
  data-tooltip="Aktywuj boczny panel do szybszego przeglądania produktów">
  <span class="btn-grid__label">Szybki podgląd</span>
  <i class="material-icons">
    offline_bolt
  </i>
</button>
<div class="products-sort-order dropdown">



  <button class="btn-unstyle select-title" rel="nofollow" data-toggle="dropdown" >


    <span class="btn-grid__label">Sortuj</span>


    <i class="material-icons">
      auto_awesome_motion
    </i>
  </button>

  <div class="dropdown-menu">
    {foreach from=$listing.sort_orders item=sort_order}
      <a rel="nofollow" href="{$sort_order.url}"
        class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}">
        {$sort_order.label}
      </a>
    {/foreach}
  </div>
</div>


<button type="button" class="btn-grid" data-tooltip="Lista produktów w 4 trybach">
  <span class="btn-grid__label">Zmień widok</span>
  <i class="material-icons grid--6" data-grid="6">grid_4x4</i>
  <i class="material-icons grid--4" data-grid="4">grid_3x3</i>
  <i class="material-icons grid--3" data-grid="3">apps</i>
  <i class="material-icons grid--2" data-grid="2">view_list</i>
</button>