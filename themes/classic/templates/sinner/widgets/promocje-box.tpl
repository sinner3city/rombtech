{widget_block name="ps_specials"}
{if $products|@count > 0}

    {* <header class="page-heading">
        <h4 class="page-h4">Ostatnie okazje!</h4>
    </header> *}

    <div class="art__list list--products list--special" data-style="1" data-col="4" data-slider="box" itemscope
        itemtype="https://schema.org/ItemList">
        <div class="splide">
            <div class="splide__track">
                <ul class="splide__list">
                    {foreach from=$products item="product"}
                        <li class="splide__slide">{include file="catalog/_partials/miniatures/product_fs.tpl" product=$product}
                        </li>
                    {/foreach}

                </ul>
            </div>
        </div>
    </div>
{/if}
{/widget_block}