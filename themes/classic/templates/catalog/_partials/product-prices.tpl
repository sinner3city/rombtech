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


{block name='product_price_and_shipping'}

    {if $product.show_price}
        <div class="product-prices">
            <div class="product-price-section || flex-row-mid">



                {if $product.has_discount}

                    <div class="label-price label--discount">

                        {if $product.has_discount}
                            {if $product.discount_type === 'percentage'}
                                <span
                                    class="discount discount-percentage">{l s='Save %percentage%' d='Shop.Theme.Catalog'
                                                                                                 sprintf=['%percentage%' => $product.discount_percentage_absolute]}</span>
                                <i class="discount-ico material-icons">sell</i>
                            {else}
                                <span class="discount discount-amount">


                                    <strong class="cp1"> Taniej o {l s='%amount%!' d='Shop.Theme.Catalog' sprintf=['%amount%' =>
                                                                                                 $product.discount_to_display]}</strong>

                                    <i class="discount-ico material-icons">sell</i>
                                </span>



                            {/if}
                        {/if}
                        <p itemprop="price" class="label-price__price-promo">
                            {*($product.price_amount|string_format:"%.2f")|replace:'.':','*}
                            {$product.price} brutto
                        </p>





                        <!-- <span class="label-price__tax">{$currency.sign} netto</span> -->

                        {if $product.has_discount & $product.discount_type !== 'percentage'}<u
                            class="label-price__oldprice">{$product.regular_price} </u>{/if} &nbsp; <small class="taxtax"> </small>
                        <span class="label-price__price-vat">( {($product.price_amount / ($product.rate/100 +
                                                                1))|string_format:"%.2f"|replace:'.':','} zł netto bez
                            {$product.tax_name}
                            VAT)</span>



                    </div>

                {else}

                    <div class="label-price label--block">
                        <i class="material-icons">sell</i>

                        <p itemprop="price" class="label-price__price">
                            {$product.price} brutto
                            {*($product.price_amount|string_format:"%.2f")|replace:'.':','*}
                            {if $product.has_discount & $product.discount_type !== 'percentage'}<u
                                class="label-price__oldprice">{$product.regular_price} </u>{/if} &nbsp; <small class="taxtax">
                            </small>
                        </p>

                        <span class="label-price__price-vat">(razem z podatkiem {$product.tax_name})</span>

                        {* <!-- <span class="label-price__tax">{$currency.sign} {$product.labels.tax_long}</span> --> *}


                        {* <!-- <span class="label-price__price-vat">({($product.price_amount * ($product.rate/100 +
                     1))|replace:'.':','}
                     {$currency.sign} brutto z {$product.tax_name})</span> --> *}
                    </div>
                {/if}






                {* {$urls|dump} *}
                <div class="discount-right">

                    <a href="{$link->getCategoryLink({$product.id_category_default})}" class="detal-back-btn btn btn--border"><i
                            class="material-icons rtl-no-flip arrow">undo</i>wróć
                        do katalogu</a>



                </div>
            </div>

        </div>
    {/if}
{/block}
<!-- end product_price_and_shipping -->