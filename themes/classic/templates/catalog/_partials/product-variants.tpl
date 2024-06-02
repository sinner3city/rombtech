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


 <div class="product-variants">


  <div class="attr-view--selected hide" >

      {foreach from=$groups key=id_attribute_group item=group}

      {if !empty($group.attributes)}
      {*$group.attributes.reference*}
        {foreach from=$group.attributes key=id_attribute item=group_attribute}

          {if $group_attribute.selected}
          
          <div class="attr" id="attr-{$id_attribute_group}" data-id="{$id_attribute_group}">
            <span class="name">{$group.name}</span>  
            <span class="value">{$group_attribute.name}</span>  
            <span class="reference">{$product.attributes[{$id_attribute_group}].reference}</span>  
          </div>
          {/if}
        {/foreach}

        {/if}
      {/foreach}
  </div>

  <div class="attr-view--product flex-wrap">

    {foreach from=$groups key=id_attribute_group item=group}
      {if !empty($group.attributes)}
      <div class="clearfix product-variants-item" data-group="{$group.group_type}">
        <span class="control-label">{$group.name}: </span>
        {if $group.group_type == 'select'}
          <select
            class="form-control form-control-select"
            id="group_{$id_attribute_group}"
            data-product-attribute="{$id_attribute_group}"
            name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
            {/foreach}
          </select>
        {elseif $group.group_type == 'color'}
          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="float-xs-left input-container">
                <label data-tooltip="{$group_attribute.name}">
                  <input class="input-color" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                    {if $group_attribute.html_color_code && !$group_attribute.texture}class="color" style="background-color: {$group_attribute.html_color_code}" {/if}
                    {if $group_attribute.texture}class="color texture" style="background-image: url({$group_attribute.texture})" {/if}
                  ><span class="sr-only"></span></span>
                </label>
              </li>
            {/foreach}
          </ul>
        {elseif $group.group_type == 'radio'}
          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="input-container float-xs-left">
                <label>
                  <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span class="radio-label">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>
        {/if}
      </div>
      {/if}
    {/foreach}
   </div>
 </div>
 