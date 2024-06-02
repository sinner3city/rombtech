{*$product|dump*}
<a href="{$link->getCategoryLink({$product.id_category_default})}" class="category-back" title="{$product.category}"
    data-id="{$product.id_category_default}">powrót do: {$product.category_name}</a>



<section id="fs_product" class="fs_product || product-container" itemscope itemtype="https://schema.org/Product"
    data-category="{$product.id_category_default}">
    <meta itemprop="url" content="{$product.url}">


    <aside class="product-detail__scroll">


        {block name='product_flags'}

            <ul class="product-item__flags  {if $page.page_name == 'product'}flags--ribbon{/if}">
                {foreach from=$product.flags item=flag}
                    <li class="product-item__flag {$flag.type}">

                        {if $flag.type == 'new'}Nowość{/if}
                        {if $flag.type == 'discount'}Promocja{/if}
                        {if $flag.type == 'on-sale'}Polecamy{/if}

                    </li>
                {/foreach}
            </ul>
        {/block}
        <div class="ico--scroll flex-row-center-mid">
            <img src="{$urls.theme_assets}images/badge.png" alt="" class="badge">
            <i class="ico material-icons">
                keyboard_double_arrow_down
            </i>
            <p class="info-label">Przewiń w dół</p>
            {* <!-- <span class="info">Przewiń myszką w dół</span> --> *}
        </div>



        {hook h='displayAfterProductThumbs'}
        <div class="product-detail__images">
            {block name='product_images'}

                <section class="fs-gallery" itemscope itemtype="http://schema.org/ImageGallery">
                    {* <!-- <ul> --> *}
                    {foreach from=$product.images item=image}
                        {* <!-- <li> --> *}
                        {*$image|dump*}
                        <figure class="fs-gallery__item" itemprop="associatedMedia" itemscope
                            itemtype="http://schema.org/ImageObject">



                            {* <!-- <a href="{$image.bySize.product_test.url}" data-size="800x{$image.bySize.product_test.height}" data-author="" class="fs-gallery__link"> --> *}
                            {* <!-- <img  src="images/placeholder-bg.png" data-splide-lazy="gallery/food/th/15.jpg" alt="" class="fs-gallery__thumb" height="400"
                                        width="400" /> --> *}

                            <img class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if} || lazy"
                                data-image-medium-src="{$image.bySize.product_test.url}"
                                data-src="{$image.bySize.product_test.url}" data-fancybox="gallery"
                                data-image-large-src="{$image.bySize.product_test.url}"
                                src="{$urls.theme_assets}images/placeholder-300.png" alt="{$image.legend}" itemprop="image"
                                height="{$image.bySize.product_test.height}"
                                width="{$image.bySize.product_test.width}">
                            {* <!-- </a> --> *}
                            <figcaption class="wcag__hide">{$image.legend}</figcaption>
                        </figure>
                    {/foreach}
                    {* <!-- </li> --> *}
                    {* <!-- </ul> --> *}

                    <i class="ico-swipe-mobile material-icons">
                        swipe
                    </i>
                </section>
            {/block}

        </div>

        <div class="dev-ops hide">
            {*$product.embedded_attributes|dump*}
            <a href="#" class="dev-close">[ X ]</a>
        </div>


    </aside>


    <div class="product-detail-top">



        <section class="product-detail" id="product-card-page">


            <header class="product-header">
                {* <!-- <input type="text" id="group_2" placeholder="Enter something" /> --> *}

                {if isset($product_manufacturer->id)}
                    <div class="product-manufacturer">
                        {if isset($manufacturer_image_url)}
                            <a href="{$product_brand_url}">
                                <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo"
                                    alt="{$product_manufacturer->name}">
                            </a>
                        {else}
                            <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
                            <span>
                                <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                            </span>
                        {/if}
                    </div>
                {/if}

                <h1 class="product-detail__title flex-wrap || h1" itemprop="name" data-id-product="{$product.id}">
                    {block name='page_title'}{$product.name}{/block}<br>


                    <a href="#" class="art__fav-link" data-id-product2="{$product.id}">
                        <i class="fav-link fav--add material-icons"
                            data-tooltip="Zapisz do ulubionych">favorite_border</i>
                        <i class="fav-link fav--saved material-icons" data-tooltip="Usuń z ulubionych">favorite</i>
                        <i class="fav-link fav--remove material-icons">heart_broken</i>
                    </a>

                </h1>




            </header>

            {include file='catalog/_partials/product-prices.tpl'}


            <div class="product-actions">



                {block name='product_buy'}

                    <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                        <input type="hidden" name="token" value="{$static_token}">
                        <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                        <input type="hidden" name="id_customization" value="{$product.id_customization}"
                            id="product_customization_id">



                        {block name='product_pack'}
                            {if $packItems}
                                <section class="product-pack">
                                    <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                                    {foreach from=$packItems item="product_pack"}
                                        {block name='product_miniature'}
                                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                                        {/block}
                                        <!-- end product_miniature -->
                                    {/foreach}
                                </section>
                            {/if}
                        {/block}
                        <!-- end product_pack -->




                        <div class="product-options" id="variants-obs">


                            {if $product.id_product_attribute != 0}
                                {* <!-- <p class="variants-title">Warianty produktu:</p> --> *}
                                {block name='product_variants'}
                                    {include file='catalog/_partials/product-variants.tpl'}
                                {/block}
                                <!-- end product_variants -->
                            {/if}


                            {block name='product_add_to_cart'}
                                {include file='catalog/_partials/product-add-to-cart.tpl'}
                            {/block}
                            <!-- end product_add_to_cart -->

                        </div>

                        {* Input to refresh product HTML removed, block kept for compatibility with themes *}

                        {block name='product_refresh'}{/block}
                    </form>

                {/block}
                <!-- end product_buy -->


                {if $product.is_customizable && count($product.customizations.fields)}
                    {block name='product_customization'}
                        {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                    {/block}
                    <!-- end product_customization -->
                {/if}

            </div>



            {* <!-- Zmiana variants wymaga modyfikacji core.js (".product-variants").replaceWit --> *}

            <div class="product-information">

                {* <!-- <h2 class="prod-info-title">Informacje</h2> --> *}


                {block name='hook_display_reassurance'}
                    {hook h='displayReassurance'}
                {/block}
                {* <!-- end hook_display_reassurance --> *}

                {block name='product_description_short'}
                    {if $product.description_short}
                        <article class="product-description">
                            <a href="#" class="toggle-content__link link--active">
                                <h2 class="product-title-top">Charakterystyka produktu</h2>
                                <i class="material-icons">expand_more</i>
                            </a>
                            <div class="toggle-content__content">
                                {$product.description_short nofilter}
                            </div>
                        </article>
                    {/if}
                {/block}

                {*include file='glasscolor/easyclean.tpl'*}

                <div class="product-values pd-b-s hide">
                    <img src="{$urls.theme_assets}media/bestglass.png" alt="{$shop.name}" class="glassbest">
                </div>
                {block name='product_description'}
                    {if $product.description}
                        <article class="product-description">
                            <a href="#" class="toggle-content__link link--active">
                                <p>Opis produktu</p>
                                <i class="material-icons">expand_more</i>
                            </a>
                            <div class="toggle-content__content">
                                {$product.description nofilter}
                            </div>
                        </article>
                    {/if}
                {/block}
                {* <!-- end product_description --> *}




                {*include file='glasscolor/product-info.tpl'*}

                {block name='product_tabs'}

                    <div class="product-tabs || tabs tabs--left pd-t">


                        <div class="overflow-x">
                            <ul class="nav nav-tabs" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active {if $product.grouped_features}active{/if}" data-toggle="tab"
                                        href="#product-details2" role="tab" aria-controls="product-details2">
                                        <i class="material-icons ico--red">assignment</i>
                                        <span>Specyfikacja</span>
                                    </a>
                                </li>

                                {* <!-- <li class="nav-item">
                                            <a class="nav-link {if !$product.grouped_features}active2{/if}" data-toggle="tab"
                                                href="#reviews" role="tab" aria-controls="reviews" aria-selected="true">Opinie</a>
                                        </li> --> *}
                            {*if $product.attachments}
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#attachments" role="tab"
                                            aria-controls="attachments">
                                            <i class="material-icons">picture_as_pdf</i>
                                            {l s='Attachments' d='Shop.Theme.Catalog'}</a>
                                    </li>
                                    {/if*}
                            {foreach from=$product.extraContent item=extra key=extraKey}
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}" role="tab"
                                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                                </li>
                            {/foreach}
                            <li class="nav-item">
                                <a class="nav-link {if !$product.grouped_features}{/if}" data-toggle="tab"
                                    href="#payments" role="tab" aria-controls="payments">
                                    <i class="material-icons">local_shipping</i>
                                    <span>Dostawa</span>

                                </a>
                            </li>
                            <li class="nav-item hide">
                                <a class="nav-link {if !$product.grouped_features}{/if}" data-toggle="tab"
                                    href="#question" role="tab" aria-controls="question">
                                    <i class="material-icons ico--green">contact_support</i>
                                    <span>Masz pytania?</span>

                                </a>
                            </li>

                        </ul>

                    </div>

                    <div class="tab-content" id="tab-content">

                        <div class="tab-pane {if !$product.grouped_features}{/if}" id="payments" role="tabpanel">


                            {assign var=new_smarty_var value=CMS::getCMSContent(17, 1)}
                            {$new_smarty_var.content nofilter}

                        </div>

                        <div class="tab-pane {if !$product.grouped_features}active2{/if}" id="reviews" role="tabpanel">

                            <p>Opinie o produkcie (0)</p>

                        </div>


                        <div class="tab-pane{if $product.description}{/if} pd-t-ss" id="question" role="tabpanel">

                            {* <!-- <p class="product-attach__title">Wypełnij formularz lub zadzwoń:</p> --> *}


                            {*widget name="contactform"*}

                        </div>






                        <div class="tab-pane active {if $product.grouped_features}{/if}" id="product-details2"
                            data-product="$product.embedded_attributes|json_encode" role="tabpanel">



                            {block name='product_features'}


                                <section class="product-detail-table">
                                    <p class="product-detail__table-title mg0">Parametry techniczne</p>

                                    <table class="table-product">

                                        {foreach from=$product.attributes item="property_value" key="property"}

                                            <tr>
                                                <td class="name">
                                                    <div class="product-attr--js"
                                                        data-attr="{$property_value.id_attribute_group}" data-type="name">
                                                        {$property_value.group}</div>
                                                </td>
                                                <td class="value">
                                                    <div class="product-attr--js"
                                                        data-attr="{$property_value.id_attribute_group}" data-type="value">
                                                        {$property_value.name}</div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        {* <!-- 
                                                <tr>
                                                    <td class="name">Model</td>
                                                    <td class="value"><div class="product-attr--js" data-attr="1" data-type="reference">{$property_value.reference}</div>
                                                    </td>
                                                </tr> -->

                                        <!-- <tr>
                                                <td class="name">Szerokość</td>
                                                <td class="value">{$product.width|string_format:"%.2f"|replace:'.':','} cm
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="name">Wysokość</td>
                                                <td class="value">{$product.height|string_format:"%.2f"|replace:'.':','} cm
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="name">Długość</td>
                                                <td class="value">{$product.depth|string_format:"%.2f"|replace:'.':','} cm
                                                </td>
                                            </tr> --> *}

                                        {foreach from=$product.grouped_features item=feature}
                                            <tr>
                                                <td class="name">{$feature.name}</td>
                                                <td class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</td>
                                            </tr>
                                        {/foreach}
                                        {if !empty($product.specific_references)}
                                            {foreach from=$product.specific_references item=reference key=key}
                                                <tr>
                                                    <td class="name">{$key}</td>
                                                    <td class="value">{$reference}</td>
                                                </tr>
                                            {/foreach}
                                        {/if}



                                        <tr>
                                            <td class="name">Waga produktu</td>
                                            <td class="value">{$product.weight|string_format:"%.2f"|replace:'.':','} kg
                                            </td>
                                        </tr>
                                    </table>


                                </section>
                            {/block}



                            {block name='product_attachments'}

                                {if $product.attachments}

                                    <div class="section-files">

                                        <p class="product-attach__title">{l s='Download' d='Shop.Theme.Actions'}:</p>

                                        <ul class="product-attach">


                                            {foreach from=$product.attachments item=attachment}


                                                <li class="product-attach__item">

                                                    <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}"
                                                        data-tooltip="{$attachment.description}">

                                                        <i class="material-icons">picture_as_pdf</i>
                                                        <h4 class="product-attach__title">{$attachment.name}
                                                            <small>({$attachment.file_size_formatted}) </small>
                                                        </h4>

                                                    </a>



                                                </li>
                                            {/foreach}
                                        </ul>

                                    </div>


                                {/if}
                            {/block}


                        </div>


                    </div>


                </div>
                {/block}
                <!-- end product_tabs -->







                {block name='product_accessories'}
                    {if $accessories}

                        <section class="product-accessories clearfix">

                            <h3 class="section-products__title">
                                <span class="cp1">Najczęściej </span> kupowane
                            </h3>

                            <div class="art__list list--products list--accessories" data-style="1" data-col="4"
                                data-slider="true">

                                <div class="splide" {literal}data-splide='{"perPage": 2}' {/literal} itemscope
                                    itemtype="https://schema.org/ItemList">
                                    <div class="splide__track">
                                        <ul class="splide__list">
                                            {foreach from=$accessories item="product_accessory"}
                                                <li class="splide__slide">
                                                    {include file="catalog/_partials/miniatures/product_fs.tpl" product=$product_accessory}
                                                </li>
                                            {/foreach}

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </section>
                    {/if}
                {/block}
                <!-- end product_accessories -->
                {block name='product_footer'}

                    {if isset($category)}
                        {hook h='displayFooterProduct' product=$product category=$category}
                    {/if}

                {/block}
                <!-- end product_footer -->



            </div>
        </section>


    </div>




    <div class="product-detail__footer">


        <section class="section page-content page-cms page-cms-19">

            <div class="section__header t-center">
                {* 
                <h2 class="section__title"><strong class="cp1">Promocje!</strong> sprawdź
                </h2> *}


                {assign var=new_smarty_var value=CMS::getCMSContent(19, 1)}
                {$new_smarty_var.content nofilter}

            </div>




        </section>

        <section class="section section-products products--special">
            <!-- <h3 class="section-products__title t-center">
                Sprawdź nasze <span class="cp1">promocje!</span><br>
            </h3>
             -->
            {include file='sinner/widgets/promocje-lista.tpl'}

        </section>




        <section class="section flex-row-center-mid flex-wrap-mt content--max hide">

            {*include file='sinner/promo-counter.tpl'*}
            <article class="payu-raty">
                {assign var=new_smarty_var value=CMS::getCMSContent(24, 1)}
                {$new_smarty_var.content nofilter}


            </article>

        </section>




        <div class="page-up">

            <a href="#fs_product" class="btn btn-border js__scroll">
                <i class="material-icons">keyboard_double_arrow_up</i>
            </a>

        </div>

    </div>

    {block name='product_images_modal'}
        {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}
</section>