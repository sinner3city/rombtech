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

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul class="category-sub__list {if $depth>0} list--submenu{/if}{if $depth==0} list--main{/if}">
        {foreach from=$nodes item=node}
          <li data-depth="{$depth}" class="category-sub__item {if $node.children}item--submenu{/if}">
            {if $depth===0}
              <a href="{$node.link}" data-depth="{$depth}" data-category-id="{$node.id}" class="category-sub__link">{$node.name}</a>
              {if $node.children}
                <div data-depth="{$depth}" class="category-sub__arrow || navbar-toggler collapse-icons closed" data-toggle="dropdown" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons add">&#xE145;</i>
                  <i class="material-icons remove">&#xE15B;</i>
                </div>
                {* <!-- <div data-depth="{$depth}" class="category-sub__drop" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div> --> *}
              {/if}
            {else}
              <a data-depth="{$depth}" class="category-sub__link" data-category-id="{$node.id}" href="{$node.link}">{$node.name}</a>
              {if $node.children}
                <div data-depth="{$depth}" class="category-sub__arrow || navbar-toggler collapse-icons closed" data-toggle="dropdown" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons add">&#xE145;</i>
                  <i class="material-icons remove">&#xE15B;</i>
                </div>
                {* <!-- <div  data-depth="{$depth}" class="category-sub__drop" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div> --> *}
              {/if}
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}


{if isset($category)}

  <div class="block-categories cat-for-rwd">


    {if $categories.children|count}
      <ul class="category-top-menu">

        <li><a class="category-top-menu__title"
            href="{if $category.id_parent !== '1'}{$link->getCategoryLink({$category.id_parent})}{/if}">
            {$categories.name}
            {if $categories.children|count}<span class="page-menu__drop-ico || material-icons hide">expand_more</span>{/if}
          </a>
        </li>
        <li>{categories nodes=$categories.children}</li>
        {* <!-- <li><a href="{$link->getCategoryLink(2)}" class="category-sub__back"><i class="material-icons">undo</i>powrót</a></li> --> *}
      </ul>
    {/if}
  </div>


{/if}