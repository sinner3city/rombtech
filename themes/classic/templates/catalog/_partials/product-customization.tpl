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
<section class="product-customization">


  {if !$configuration.is_catalog}
    
        <header class="product-custom__header h4 card-title title--drop">

              {l s='Product customization' d='Shop.Theme.Catalog'} <i class="material-icons ico"></i>

        </header>

        <div class="card card-block">
          {block name='product_customization_form'}
            <form method="post" action="{$product.url}" enctype="multipart/form-data" class="">
              <ul class="clearfix">
                {foreach from=$customizations.fields item="field"}
                  <li class="product-customization-item">
                    {if $field.type == 'text'}
                      <label data-tooltip="{l s='250 char. max' d='Shop.Forms.Help'}"> {$field.label}</label>
                      <textarea placeholder="{l s='Your message here' d='Shop.Forms.Help'}" class="product-message" maxlength="250" {if $field.required} required {/if} name="{$field.input_name}">{if $field.text !== ''}{$field.text}{/if}</textarea>
                      {if $field.text !== ''}
                          <h6 class="customization-message">{l s='Your customization:' d='Shop.Theme.Catalog'}
                              <label>{$field.text}</label>
                          </h6>
                      {/if}
                    {elseif $field.type == 'image'}
                      {if $field.is_customized}
                        <br>
                        <img src="{$field.image.small.url}">
                        <a class="remove-image" href="{$field.remove_image_url}" rel="nofollow">{l s='Remove Image' d='Shop.Theme.Actions'}</a>
                      {/if}
                      
                      <label> {$field.label}</label>
                      <div class="custom-file">
                        <span class="js-file-name mg-r-s">{l s='No selected file' d='Shop.Forms.Help'}</span>
                        <input class="file-input js-file-input" {if $field.required} required {/if} type="file" name="{$field.input_name}">
                        <button class="btn btn-secondary" data-tooltip="{l s='.png .jpg .gif' d='Shop.Forms.Help'}">{l s='Choose file' d='Shop.Theme.Actions'}</button>
                      </div>
                    {/if}
                  </li>
                {/foreach}
              </ul>

              <div class="clearfix mg-t">
                <small>{l s='Don\'t forget to save your customization to be able to add to cart' d='Shop.Forms.Help'}</small><br>
                <button class="btn btn-primary float-xs-right" type="submit" name="submitCustomizedData">{l s='Save Customization' d='Shop.Theme.Actions'}</button>
              </div>
            </form>
          {/block}

        </div>
  {/if}


</section>