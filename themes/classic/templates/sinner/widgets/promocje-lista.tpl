{widget_block name="ps_specials"}


{if isset($products) && is_array($products) && count($products) > 0}
    <h3 class="section-products__title t-center hide">
        Sprawdź nasze <span class="cp1">promocje!</span><br>
    </h3>
    <div class="art__list list--products list--special" data-style="1" data-col="4" data-slider="true" itemscope
        itemtype="https://schema.org/ItemList">
        <div class="splide">
            <div class="splide__track">
                <ul class="splide__list">
                    {foreach from=$products item=product}
                        <li class="splide__slide">{include file="catalog/_partials/miniatures/product_fs.tpl" product=$product}
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
{/if}

{/widget_block}