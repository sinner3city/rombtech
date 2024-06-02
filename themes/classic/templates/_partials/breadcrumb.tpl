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

  <nav data-depth="{$breadcrumb.count}" class="breadcrumb">

    <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumbs__list">
      {block name='breadcrumb'}
      {foreach from=$breadcrumb.links item=path name=breadcrumb}

            {block name='breadcrumb_item'}

                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumbs__item">


                  <a itemprop="item" href="{if $path.title == 'Strona główna'}{$urls.base_url}2/katalog{else}{$path.url}{/if}" class="breadcrumbs__link">

                    <span itemprop="name">{if $path.title == 'Strona główna'}Katalog{else}{$path.title}{/if}</span>
                  </a>
                  <span class="sep">//</span>
                  <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">

                </li>
            {/block}
      {/foreach}
      {/block}
    </ol>
  </nav>