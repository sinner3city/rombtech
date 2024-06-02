    
<div class="">
    {include file='sinner/topinfo.tpl'}

<div id="firmowywww" class="product--firmowywww animation--end product-container" itemscope itemtype="https://schema.org/Product"
    data-category="{$product.id_category_default}">
    <meta itemprop="url" content="{$product.url}">


    <section class="page-banner sinner--www section--bg" style="background-image: url({$urls.theme_assets}images/bgsite.png);">


            <header class="page-banner__header">
                <img src="{$urls.theme_assets}images/fstrona-txt.png" alt="">

                <p>Prezentacja Twojej firmy w nowoczesnej i przyjaznej formie a do tego intuicyjny panel administracyjny
                    (CMS), który ułatwi Ci dodawanie treści oraz zdjęć. Ocena wg. Google powyżej 90 punktów!</p>
                <div class="btns">
                    <a class="btn--buyrwd btn--secondary mg-t-s js__scroll" href="#startujemy">sprawdź cennik</a>
                    <span class="btn--demo btn--secondary mg-t-s">zobacz realizacje</span>
                </div>
            </header>

            
            <img src="{$urls.theme_assets}images/lady.png" src="#" alt="" class="banner-lady">

            
            {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
            {/block}
            <div class="product-actions">
                {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                    <input type="hidden" name="id_customization" value="{$product.id_customization}"
                        id="product_customization_id">
                    {block name='product_variants'}
                        {include file='catalog/_partials/product-variants.tpl'}
                    {/block}
                    {block name='product_pack'}
                    {if $packItems}
                    <section class="product-pack">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                        {block name='product_miniature'}
                        {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                        {/block}
                        {/foreach}
                    </section>
                    {/if}
                    {/block}
                    {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                    {/block}
                    {block name='product_add_to_cart'}
                        <div class="price-flex">
                            <div class="product-add-to-cart">
                            {block name='product_quantity'}
                                <div class="product-quantity clearfix">
                                    <div class="qty hide">
                                    <input
                                        type="number"
                                        name="qty"
                                        id="quantity_wanted"
                                        value="{$product.quantity_wanted}"
                                        class="input-group"
                                        min="{$product.minimal_quantity}"
                                        aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
                                    >
                                    </div>

                                    <div class="add">
                                    <button
                                        class="btn btn-secondary  add-to-cart btn--icon"
                                        data-button-action="add-to-cart"
                                        type="submit"
                                        {if !$product.add_to_cart_url}
                                        disabled
                                        {/if}
                                    >
                                        <i class="material-icons">shopping_cart</i>
                                        <!-- <i class="material-icons shopping-cart">&#xE547;</i> -->
                                        <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                                    </button>
                                    </div>

                                    {hook h='displayProductActions' product=$product}
                                </div>
                                {/block}
                            <a href="https://emilnadzoruje.pl" class="btn btn--secondary btn--demo js__scroll btn--icon">
                                <i class="fas fa-laptop-code"></i>
                                <span>DEMO</span></a>
                            <a href="https://emilnadzoruje.pl" class="btn btn--secondary btn--demo  btn--icon">
                                <i class="fas fa-laptop-code"></i>
                                <span>zobacz wersję demo</span></a>
                                </div>
                        </div>
                    {/block}

                    {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                    {block name='product_refresh'}{/block}
                </form>
                {/block}
            </div>

    </section>


    

    <article class="product-info-top || section--bg">

        <h1 class="h3 slider--title">Nowoczesna <strong class="cp3">strona internetowa</strong> Twojej firmy <br>z  <strong class="cp3">panelem CMS</strong>  do edycji treści</h1>

        <div class="splide slider--icons">
            <div class="splide__track"> 

            <ul class="splide__list || list--inline ico-top-text">
                <!-- <li class="splide__slide">
                    <i class="ico-top-text__ico material-icons">highlight_alt</i>
                    <p class="ico-top-text__text">Minimalizm</p>
                </li> -->
                <li class="splide__slide" data-tooltip="Bez okresu wypowiedzenia. Rezygnujesz w dowolnym momencie">
                    <i class="ico-top-text__ico material-icons">content_paste_off</i>
                    <p class="ico-top-text__text">Rezygnacja</p>
                </li>
                <!-- <li class="splide__slide">
                    <i class="ico-top-text__ico material-icons">directions_run</i>
                    <p class="ico-top-text__text">Rezygnacja</p>
                </li> -->
                <li class="splide__slide" data-tooltip="Panel CMS pozwoli Ci edytować treści oraz dodawać zdjęcia na Twojej stronie">
                    <i class="ico-top-text__ico material-icons">auto_awesome_motion</i>
                    <p class="ico-top-text__text">CMS</p>
                </li>
                <li class="splide__slide"  data-tooltip="Obserwuj działania klientów i reaguj w odpowiednim momencie.">
                    <i class="ico-top-text__ico material-icons">collections</i>
                    <p class="ico-top-text__text">Galeria zdjęć</p>
                </li>
                
                <!-- <li class="splide__slide" data-tooltip="Reklama to podstawa. Zacznij być widoczny!">
                    <i class="ico-top-text__ico material-icons">visibility</i>
                    <p class="ico-top-text__text">Reklama</p>
                </li> -->
                <li class="splide__slide"  data-tooltip="Najszybsza platforma na rynku wg. Google PageSpeed 90/100">
                    <i class="ico-top-text__ico material-icons">insights</i>
                    <p class="ico-top-text__text">Szybkość</p>
                </li>
                <li class="splide__slide" data-tooltip="Dostęp do Twojej oferty z każdego urządzenia mobilnego" >
                    <i class="ico-top-text__ico material-icons">important_devices</i>
                    <p class="ico-top-text__text">Mobilność</p>
                </li>
                <li class="splide__slide" data-tooltip="Atrakcyjność szablonu wzbogacamy subtelnymi animacjami">
                    <i class="ico-top-text__ico material-icons">auto_fix_high</i>
                    <p class="ico-top-text__text">Animacje</p>
                </li>
                <li class="splide__slide"  data-tooltip="Twoi klienci trafią do Ciebie dzięki interaktywnej mapie">
                    <i class="ico-top-text__ico material-icons">map</i>
                    <p class="ico-top-text__text">Mapa Google</p>
                </li>
                <li class="splide__slide"  data-tooltip="Statystyki Google Analytics to kopalnia wiedzy o Twoim sklepie. Warto analizować">
                    <i class="ico-top-text__ico material-icons">query_stats</i>
                    <p class="ico-top-text__text">Statystyki</p>
                </li>
                <!-- <li class="splide__slide"  data-tooltip="Profesjonalne rozwiązania w niskich abonamentach">
                    <i class="ico-top-text__ico material-icons">emoji_objects</i>
                    <p class="ico-top-text__text">Oszczędność</p>
                </li> -->
                <li class="splide__slide"  data-tooltip="Jakość kodu i zaawansowane techniki korporacyjne">
                    <i class="ico-top-text__ico material-icons">settings_ethernet</i>
                    <p class="ico-top-text__text">Optymalizacja</p>
                </li>
                <li class="splide__slide"  data-tooltip="Nasze rozwiązanie przeszło pozytywny audyt psychologa marketingu">
                    <i class="ico-top-text__ico material-icons">psychology</i>
                    <p class="ico-top-text__text">Psychologia</p>
                </li>
                <li class="splide__slide"  data-tooltip="Bezpieczeństwo to podstawa. Certyfikat SSL zagwarantuje bezpieczny przepływ wrażliwych danych">
                    <i class="ico-top-text__ico material-icons">admin_panel_settings</i>
                    <p class="ico-top-text__text">SSL</p>
                </li>
                <li class="splide__slide" data-tooltip="Strony dostosowane do wymogów RODO">
                    <i class="ico-top-text__ico material-icons">fingerprint</i>
                    <p class="ico-top-text__text">RODO</p>
                </li>
                <li class="splide__slide"  data-tooltip="Bezpłatnie poprawiamy każdy błąd a jego znalezienie nagradzamy darmowym miesiącem">
                    <i class="ico-top-text__ico material-icons">verified</i>
                    <p class="ico-top-text__text">Gwarancja</p>
                </li>
                <!-- <li class="splide__slide"  data-tooltip="Chcesz rozszerzyć działanie? Napisz do nas lub odwiedź dział z dodatkami">
                    <i class="ico-top-text__ico material-icons">dashboard_customize</i>
                    <p class="ico-top-text__text">Dodatki</p>
                </li> -->
                <!-- <li class="splide__slide"  data-tooltip="W razie problemów, odzyskujemy dane z ostatnich 24h!">
                    <i class="ico-top-text__ico material-icons">restore</i>
                    <p class="ico-top-text__text">Backup 24h</p>
                </li> -->
                <li class="splide__slide" data-tooltip="Darmowa domena na pierwszy rok z rozszerzeniem .pl w każdym abonamencie">
                    <i class="ico-top-text__ico material-icons">travel_explore</i>
                    <p class="ico-top-text__text">Domena</p>
                </li>
                <li class="splide__slide" data-tooltip="Bezpłatnie utrzymujemy Twój sklep na naszych serwerach">
                    <i class="ico-top-text__ico material-icons">real_estate_agent</i>
                    <p class="ico-top-text__text">Hosting</p>
                </li>
                <li class="splide__slide" data-tooltip="Otrzymasz 2 skrzynki pocztowe z własną domeną">
                    <i class="ico-top-text__ico material-icons">mark_email_read</i>
                    <p class="ico-top-text__text">E-mail</p>
                </li>
                <li class="splide__slide" data-tooltip="Strona internetowa przystosowana dla osób niepełnosprawnych">
                    <i class="ico-top-text__ico material-icons">accessible</i>
                    <p class="ico-top-text__text">WCAG 2.0</p>
                </li>
                <li class="splide__slide" data-tooltip="Pomagamy i wspieramy">
                    <i class="ico-top-text__ico material-icons">support</i>
                    <p class="ico-top-text__text">Support</p>
                </li>
                <li class="splide__slide" data-tooltip="Struktura przyjazna wyszukiwarkom">
                    <i class="ico-top-text__ico material-icons">edit_note</i>
                    <p class="ico-top-text__text">SEO+</p>
                </li>
                <li class="splide__slide" data-tooltip="Polityka prywatności">
                    <i class="ico-top-text__ico material-icons">cookie</i>
                    <p class="ico-top-text__text">Cookies</p>
                </li>
            </ul>
        </div>
        
        </div>
    </article>

    
    <section class="section section--intro-text">
        <header class="section__header || t-center mg-b-30">
            <h2 class="section__title">Najszybsza<strong class="cp1"> wizytówka  w sieci</strong></h2>
            <p class="section__subtitle">ZADBAJ O PROFESJONALNĄ PREZENTACJĘ TWOJEJ FIRMY</p>
        </header>
        <p class="content--max t-center ">
            Skorzystaj z naszego szablonu prezentacji. Współpracuj z nami na zasadach <strong class="cp1">WIN-WIN</strong>. Zależy nam aby Twoja firma była rozpoznawalna w sieci i zyskała nowych klientów do dalszego rozwoju. Dajemy Ci pełną swobodę w płatnościach oferując <strong>wygodne okresy aktywacji na 3,
            6 lub 12 miesięcy</strong>. Bez okresu
                wypowiedzenia i zobowiązań. Nie przedłużamy umowy automatycznie - o płatnościach przypominamy 14 dni przed zakończeniem usługi.
                <br><br>
                <img src="{$urls.theme_assets}media/pageinsight_cr2.png" alt="">
        </p>

        
    <div class="t-center hide">
        <br>
        <a href="https://pagespeed.web.dev/report?url=https%3A%2F%2Ffirmowystarter.pl%2F&hl=pl" target="_blank" class="btn btn--border btn--large">
            <strong> sprawdź nas <img src="{$urls.theme_assets}icons/ps.svg" height="28" class="mg-hor-ss" alt="">  Google PageSpeed</strong></a>
        </div>
        
    </section>

    



    <section class="section section--optifast mg-t-30">


        <div class="art__list" data-style="1" data-col="3" data-slider="auto">
            
            <article class="art">
    
                <figure class="art__figure">
                    <img data-src="{$urls.theme_assets}media/booster.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png">
                </figure>
    
                <div class="art__content">
    
                    <header class="art__header">
                        <h3 class="art__title"><span class="cp1">Szybsze</span> ładowanie</h3>
                        <p class="art__subtitle">zwiększa zaangażowanie</p>
                    </header>
        
                    
                    <p>Wolniejsze wczytywanie oferty to najczęstrza przyczyna porzucenia strony. Zadbaj o szybkie ładowanie i pełen komfort przeglądania Twojej oferty.
    
                        
                    </p>
    
                </div>
            
            </article>
        
            <article class="art">
    
                <figure class="art__figure">
                    <img data-src="{$urls.theme_assets}media/rwd.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png">
                </figure>
    
                <div class="art__content">
    
                    <header class="art__header">
                        <h3 class="art__title">100% <span class="cp1">dostępności</span></h3>
                        <p class="art__subtitle">Dla każdego klienta</p>
                    </header>
    
                    
                    <p>Wersja mobilna to już standard ale jej dostosowanie pod każde urządzenie to nie lada wyczyn. Nasz szablon zaprojektowaliśmy tak aby funkcjonował i działał na każdym urządzeniu.</p>
        
                </div>
            
            </article>
    
            
            <article class="art">
    
                <figure class="art__figure">
                    <img data-src="{$urls.theme_assets}media/google.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png">
                </figure>
    
                <div class="art__content">
    
                    <header class="art__header">
                        <h3 class="art__title"> <span class="cp1">Wyższe</span> pozycje</h2>
                        <p class="art__subtitle">w wynikach Google</p>
                        <!-- <h2 class="art__title">Wyższe pozycje w&nbsp;<span class="cp1">Google</span></h2> -->
                    </header>
    
                    
                    <p>Google to główne źródło pozyskiwania nowych klientów. Gigant reklamy docenia wysokiej jakości witryny, które umieszcza wyżej w swojej wyszukiwarce.</p>
        
                </div>
            
            </article>
            
        </div>
    

    </section>
    <div class="t-center">
        <!-- <h3 class="h2 mg-b-30">...rewelacyjna <span class="cp1">jakość i wysoka ocena</span> od 
            Google
        </h3> -->




    </div>


    <section class="section">

        <div class="splide slider--articles">
            <div class="splide__track">
    
                
                <ul class="splide__list">
                    <li class="splide__slide">
                        
                        <article class="slider-item">
                            <h3 class="slider-item__title">Prosta <span class="cp1">obsługa</span></h3>
                            <div class="slider-item__content">
                                <p>Aby zarządzać stroną z poziomu systemu CMS wystarczy wiedza z zakresu obsługi WORD.</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Wersja <span class="cp1">mobilna</span></h3>
                            <div class="slider-item__content">
                                <p>Dostęp do Twojej strony jest możliwy z każdego urządzenia. Dzięki dobrym praktykom pozyskasz większą ilość klientów</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Mapa <span class="cp1">google</span></h3>
                            <div class="slider-item__content">
                                <p>Mapa pomaga w lokalizacji Twojej siedziby. Każda strona zawiera zainstalowany moduł mapy google.</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Galeria <span class="cp1">zdjęć</span></h3>
                            <div class="slider-item__content">
                                <p>Dodawaj i twórz galerie zdjęć w której zaprezentujesz produkty i Twoją firmę z jak najlepszej strony.</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Statystyki <span class="cp1">www</span></h3>
                            <div class="slider-item__content">
                                <p>Google Analytics pozwoli Ci sprawdzać kiedy i skąd pozyskujesz najwięcej nowych klientów.</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Atrakcyjny <span class="cp1">wygląd</span></h3>
                            <div class="slider-item__content">
                                <p>Nowoczesny i minimalistyczny wygląd - to obecne trendy, które przekładamy na nasze
                                    szablony graficzne.</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Domena i <span class="cp1">hosting</span></h3>
                            <div class="slider-item__content">
                                <p>W każdym pakiecie znajduje się możliwość wybrania dowolnej domeny w rozszerzeniu .pl, która będzie Twoim
                                    adresem w sieci</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Kompletna <span class="cp1">konfiguracja</span></h3>
                            <div class="slider-item__content">
                                <p>Zainstalujemy, zarejestrujemy i skonfigurujemy za Ciebie każdą czynność do czasu publikacji</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Panel <span class="cp1">CMS</span></h3>
                            <div class="slider-item__content">
                                <p>Instalujemy i konfigurujemy popularny panel administracyjny CMS Made Simple</p>
                            </div>
                        </article>
                    </li>
                    <li class="splide__slide">
                        <article class="slider-item">
                            <h3 class="slider-item__title">Certyfikat <span class="cp1">SSL</span>
                            </h3>
                            <div class="slider-item__content">
                                <p>Certyfikat SSL zadba o bezpieczeństwo przesyłu danych na Twojej stronie co wzbudza większe zaufanie</p>
                            </div>
                        </article>
                    </li>
                    <!-- <li class="splide__slide">
                    </li> -->
                </ul>
            </div>
        </div>
    </section>

    
<section class="section">

    <header class="section__header">
        <h2 class="section__title">Minimalizm <span class="cp1">generuje zyski</span></h2>
        <p class="section__subtitle">Prezentacja Twojej oferty jest najważniejsza</p>
    </header>


    <article class="article t-center">

        <p class="">
            Lekkie i proste szablony <strong>generują większy ruch na stronie</strong> a co za tym idzie więcej zapytań ofertowych.
            Przygotowaliśmy <strong class="cp1">jeden dopracowany do perfekcji projekt</strong>, który w ramach aktywacji usługi dostosowujemy tak aby zgadzał się z profilem Twojej działalności. Nie daj się nabrać na kolorowe i przepchane grafiką projekty, które technologicznie kompletnie odbiegają od norm. My gwarantujemy, że Twoja strona będzie oceniana lepiej przez Google niż Twoja konkurencja!

        </p>

        {include file='sinner/chart.tpl'}
    </article>

   
    



</section>






<!-- <section class="section section--bg bg1 mg0">

 

</section> -->






    <div class="product-short-info sinner--sklep hide">
        
        <div class="product-information">
            {if $product.is_customizable && count($product.customizations.fields)}
            {block name='product_customization'}
            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
            {/block}
            {/if}
            {block name='hook_display_reassurance'}
            {hook h='displayReassurance'}
            {/block}
            {block name='product_description_short'}
            <div id="product-description-short-{$product.id}" class="" itemprop="description">
                {$product.description_short nofilter}</div>
            {/block}
        </div>
    </div>

    <!-- <div class="container"> -->
    {block name='product_tabs'}
    <div class="tabs pd-t">
        <div class="overflow-x">
            <ul class="nav nav-tabs" role="tablist">
                {if $product.description}
                <li class="nav-item">
                    <a class="nav-link{if $product.description} active{/if}" data-toggle="tab" href="#description"
                        role="tab" aria-controls="description" {if $product.description} aria-selected="true" {/if}>
                        <i class="material-icons">star</i>
                        Zalety?</a>
                </li>
                {/if}
                <li class="nav-item">
                    <a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#abo" role="tab"
                        aria-controls="abo" {if !$product.description} aria-selected="true" {/if}>
                        <i class="material-icons">widgets</i>
                        Zawartość
                        </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link{if !$product.description} active{/if} f-bold" target="blank" href="https://emilnadzoruje.pl"
                        role="tab" aria-controls="functions" {if !$product.description} aria-selected="true"
                        {/if}>
                        <i class="material-icons">mobile_friendly</i>
                        Zobacz demo</a>
                </li>
                <!-- <li class="nav-item">
                    <a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#stages"
                        role="tab" aria-controls="stages" {if !$product.description} aria-selected="true" {/if}>Etapy
                        realizacji</a>
                </li> -->
                {if $product.attachments}
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#attachments" role="tab" aria-controls="attachments">{l
                        s='Attachments' d='Shop.Theme.Catalog'}</a>
                </li>
                {/if}
                {foreach from=$product.extraContent item=extra key=extraKey}
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}" role="tab"
                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                </li>
                {/foreach}
            </ul>
        </div>


        
        <div class="tab-content pd-ver-60" id="tab-content">
            <div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">


                            
            <section class="">

                <div class="art__list list--reorder">

                    

                    <article class="art">

                        <figure class="art__figure">
                            <img data-src="{$urls.theme_assets}media/shopscreen.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png">
                            <!-- <img data-src="{$urls.theme_assets}media/add.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png"> -->
                            <!-- <img data-src="{$urls.theme_assets}media/adv.png" class="art__img || lazyload" src="{$urls.theme_assets}media/adv.png"> -->
                        </figure>

                        <div class="art__content">

                            <header class="art__header">
                                <h2 class="art__title">Przygotowanie <span class="cp1">projektu</span></h2>
                                <p class="art__subtitle">Nowoczesny wygląd i animacje</p>
                            </header>

                            
                            <p>Nie oferujemy zestawu graficznych szablonów, które są słabe techniczne. Mamy jeden doskonały widok na najwyższym poziomie optymalizacji - wszystko pod wyszukiwarkę Google! Każda aktwacja to komplet prac, które wykonujemy indywidualnie pod klienta. <strong>Wybieramy główne zdjęcie</strong>, <strong>podstawiamy logo</strong> oraz <strong>zmieniamy kolorystykę pod Twoje barwy</strong>. Nie musisz się martwić o brak umiejętności graficznych. <strong>To nasz ogromny plus</strong> - zależy nam na Twojej prezentacji. Dla wymagających klientów tworzymy również indywidualne szablony oraz moduły stosując wszystkie zalety naszego rozwiązania.</p>


                            <!-- <footer class="art__footer">
                                <a href="{$urls.base_url}100/reklama-w-google" class="btn btn--border">sprawdź pakiety
                                    reklamowe</a>
                            </footer> -->
                        </div>

                    </article>

                    <article class="art">

                        <figure class="art__figure">
                            <img data-src="{$urls.theme_assets}media/konfiguracja.png" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png">
                            <!-- <img data-src="{$urls.theme_assets}media/add.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png"> -->
                            <!-- <img data-src="{$urls.theme_assets}media/adv.png" class="art__img || lazyload" src="{$urls.theme_assets}media/adv.png"> -->
                        </figure>

                        <div class="art__content">

                            <header class="art__header">
                                <h2 class="art__title">Konfiguracja <span class="cp1">strony www</span></h2>
                                <p class="art__subtitle">Ustawienia i konfigurację zostaw nam</p>
                            </header>

                            
                            <p>Zarejestrujemy i skonfigurujemy za Ciebie domenę (.pl). Zainstalujemy panel CMS, ustawimy najważniejsze parametry, dodamy skrzynki e-mailowe oraz  certyfikat SSL. <strong>Całkowicie zdejmiemy z Ciebie ciężar konfiguracji</strong> strony internetowej. Dodajesz tylko treść i zdjęcia. Takiego podejścia ciężko szukać u konkurencji.</p>
                            

                        </div>

                    </article>

                    <article class="art">

                        <figure class="art__figure">
                            <img data-src="{$urls.theme_assets}media/psycho.png" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-300.png">
                        </figure>

                        <div class="art__content">

                            <header class="art__header">
                                <h3 class="art__title">Audyt <span class="cp1">psychologa</span></h3>
                                <p class="art__subtitle">Zadbaliśmy o każdy element prezentacji</p>
                            </header>
                        
                            <p>
                                
                                Sposób prezentacji Twoich produktów i oferty ma ogromny wpływ na decyzje klienta o zakupie. Kupujemy nie tylko oczami ale i... no właśnie tu wykorzystaliśmy wszystkie możliwe (socjo)techniki, które nadzorował <strong class="cp1">psycholog marketingu</strong>. Pozytywny audyt naszej wersji szablonu <strong>zwiększa Twoje szanse sprzedaży</strong> gdzie walka z konkurencją odbywa się na  wielu poziomach.</p>

                            <!-- <footer class="art__footer">
                                <a href="{$urls.base_url}100/reklama-w-google" class="btn btn--border">poznaj nasz zespół</a>
                            </footer> -->
                        </div>

                    </article>
                    
                    <article class="art">

                        <figure class="art__figure">
                            <img data-src="{$urls.theme_assets}media/booster.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png">
                        </figure>

                        <div class="art__content">

                            <header class="art__header">
                                <h2 class="art__title">Prędkość <span class="cp1">ładowania</span></h2>
                                <p class="art__subtitle">Najwyższe oceny wydajności</p>
                            </header>

                            
                            <p>Tak zaawansowanego szablonu nie dostaniesz nigdzie indziej. Jesteśmy zakręceni
                                na temat wydajności i świetnych wyników w wyszukiwarce Google. Nasze starania docenia gigant reklamy, który ocenia je na najwyższym poziomie ponad 90 na 100 punktów. To najszybsza oferta na rynku!</p>
                                


                             <footer class="art__footer">
                                <a href="https://developers.google.com/speed/pagespeed/insights/?hl=pl" target="blank" class="art__btn  btn--border">sprawdź ocenę w Google PageSpeed</a>
                            </footer> 
                        </div>
                    
                    </article>


                </div>

            </section>





                
            </div>
            <div class="tab-pane fade in" id="stages" role="tabpanel">

            </div>
            <div class="tab-pane fade in" id="abo" role="tabpanel">
                <section class="sinner2 section section--contain mg-t-0"
                    data-src-2background="{$urls.theme_assets}images/bg-purple2.jpg" data-rwd-background="none">

                    <div class="functions__list pd-t-30">
                        
                        <div class="">
                            <img src="{$urls.theme_assets}media/boxsite.png" alt="">

                        </div>
                        <div class="">
                            <article>
                                <h3 class="">W ramach aktywacji usługi:</h3>
                                <ul class="list">
                                    <li>Korzystasz z naszego specjalnie przygotowanego szablonu na licencji SasS</li>
                                    <li>Instalujemy system administracji (CMS Made Simple) wraz z naszymi modyfikacjami na podstawie wersji demo</li>
                                    <li>Wybieramy główne zdjęcie, podstawiamy logo oraz zmieniamy kolorystykę pod Twoje barwy</li>
                                    <li>Konfigurujemy wszystkie moduły pod Twoją firmę (np. mapy google)</li>
                                    <!-- <li>Tworzymy główny baner na stronie głównej pasujący do Twojej działalności</li> -->
                                    <li>Instalujemy niezbędne moduły do prezentacji Twojej oferty</li>
                                    <!-- <li>Przygotowanie wersji mobilnej sklepu (smartfony i tablety)</li> -->
                                    <li>Na 1 rok wykupujemy i rejestrujemy dla Ciebie domenę (.pl)</li>
                                    <li>Utrzymujemy Twoją stronę na naszych serwerach (hosting) z 3 GB przestrzenią (możliwość powiększenia).</li>
                                    <li>Tworzymy 2 skrzynki pocztowe e-mail o wybranej nazwie w Twojej domenie</li>
                                    <li>Instalujemy Certyfikat bezpieczeństwa SSL</li>
                                    <!-- <li>Wybor dostawcy płatności online (Przelewy24.pl, Dotpay lub PayU)</li> -->
                                    <li>Dostęp i wsparcie profesjonalistów na każdym etapie współpracy</li>
                                </ul>
                            </article>
                        </div>
                    </div>

                </section>
            </div>
            <div class="tab-pane fade in" id="functions" role="tabpanel">

                {block name='product_attachments'}
                {if $product.attachments}
                <div class="tab-pane fade in" id="attachments" role="tabpanel">
                    <section class="product-attachments">
                        <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                        {foreach from=$product.attachments item=attachment}
                        <div class="attachment">
                            <h4><a
                                    href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
                            </h4>
                            <p>{$attachment.description}</p <a
                                href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                            {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                            </a>
                        </div>
                        {/foreach}
                    </section>
                </div>
                {/if}
                {/block}
                {foreach from=$product.extraContent item=extra key=extraKey}
                <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach
                    $extra.attr as $key=> $val} {$key}="{$val}"{/foreach}>
                    {$extra.content nofilter}
                </div>
                {/foreach}
            </div>
        </div>
    </div>
    {/block}

    <section class="section content--padding">
        {block name='product_additional_info'}
        {include file='catalog/_partials/product-additional-info.tpl'}
        {/block}

    </section>
    {include file='sinner/gwarancja.tpl'}

    {include file='sinner/free.tpl'}


    <!-- </div> -->
    {block name='product_accessories'}
    {if $accessories}
    <section class="product-accessories clearfix">
        <p class="h5 text-uppercase ">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
        <div class="products">
            {foreach from=$accessories item="product_accessory"}
            {block name='product_miniature'}
            {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
            {/block}
            {/foreach}
        </div>
    </section>
    {/if}
    {/block}

    {block name='product_footer'}
    {* hook h='displayFooterProduct' product=$product category=$category *}
    {/block}
    {block name='product_images_modal'}
    {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}


    <section class="section section--bg bg1">

        <article class="art">
    
            <figure class="art__figure">
                <img data-src="{$urls.theme_assets}media/fsad.png" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png">
                <!-- <img data-src="{$urls.theme_assets}media/add.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png"> -->
                <!-- <img data-src="{$urls.theme_assets}media/adv.png" class="art__img || lazyload" src="{$urls.theme_assets}media/adv.png"> -->
            </figure>
    
            <div class="art__content">
    
                <header class="art__header">
                    <h2 class="art__title">Pamiętaj o <span class="cp1">reklamie</span></h2>
                    <p class="art__subtitle">Walcz o klienta w sieci</p>
                </header>
    
                
                <p>Posiadanie nawet najlepiej przygotowanej stony internetowej nie zagwarantuje sukcesu bez odpowiednej reklamy. Od lat zajmujemy się pozycjonowaniem SEO oraz prowadzeniem kampani w wyszukiwarce Google. Przeznacz możliwie największy budżet reklamowy aby zdobyć tylko  <strong>sprecyzowanych klientów.</strong> To inwestycja, która szybko się zwraca.</p>
    
    
                <footer class="art__footer">
                    <a href="{$urls.base_url}100/reklama-w-google" class="btn btn--secondary">Sprawdź pakiety
                        reklamowe</a>
                </footer>
            </div>
    
        </article>
    
    </section>
    
    

<section class="section section--bg mg-t-30 pd-t-30 t-left section--startujemy" id="startujemy"  data-src-background="{$urls.theme_assets}media/startujemy.png">
    <header class="section__header || t-center ">
        <h2 class="section__title">Gotowy? Startuje<span class="cp1">My</span>!</h2>
        <p class="section__subtitle">Im dłuższy okres tym tańsza usługa</p>
    </header>

    <p class="t-center">Nie przedłużamy automatycznie. Jeżeli nie opłacisz usługi, nie będzie aktywna. Brak zobowiązań. Brak okresu wypowiedzenia. Zero ryzyka. Decyduj na jak długo chcesz aktywować:</p>


    <div class="abo-block">

        <ul class="abo-block__list">
            <li class="abo-block__li">
                
                <img src="{$urls.theme_assets}media/best.png" alt="Najlepszy wybór" class="abo-block__best">
                <a href="#" class="abo-block__item item--active" data-value="12">
                    <span class="abo-block__label">Roczny</span>
                    <span class="abo-block__value">12</span>
                    <span class="abo-block__unit">miesięcy</span>
                </a>
            </li>
            <li class="abo-block__li">
                <a href="#" class="abo-block__item" data-value="6">
                    <span class="abo-block__label">Półroczny</span>
                    <span class="abo-block__value">6</span>
                    <span class="abo-block__unit">miesięcy</span>
                </a>
            </li>
            <li class="abo-block__li">
                <a href="#" class="abo-block__item" data-value="3">
                    <span class="abo-block__label">Kwartalny</span>
                    <span class="abo-block__value">3</span>
                    <span class="abo-block__unit">miesiące</span>
                </a>
            </li>
        </ul>

        <div class="abo-block__prices">
                          
              <div class="abo-block__price-selected price-detal-mc   " data-value="12">
                <span class="price-mc"  data-tooltip="przeliczenie kosztów netto w ujęciu miesięcznym"  content="774">47 zł/miesiąc</span>
                
                <div class="abo-block__summary">
                    <span class="abo-block__price-label">Łączny koszt 12 miesięcy: </span>
                    <span class="abo-block__price-value">564</span>
                    <span class="abo-block__price-tax"><span class="lower">{$product.labels.tax_long}</span> (+{$product.tax_name})</span>
                </div>
            </div>
                    
              <div class="abo-block__price-selected price-detal-mc hide" data-value="6">
                <span class="price-mc"  data-tooltip="przeliczenie kosztów netto w ujęciu miesięcznym"  content="774">69 zł/miesiąc</span>
                
            <div class="abo-block__summary">
                <span class="abo-block__price-label">Łączny koszt 6 miesięcy: </span>
                <span class="abo-block__price-value">414</span>
                <span class="abo-block__price-tax"><span class="lower">{$product.labels.tax_long}</span> (+{$product.tax_name})</span>
            </div>
            </div>
                    
              <div class="abo-block__price-selected price-detal-mc   hide" data-value="3">
                <span class="price-mc"  data-tooltip="przeliczenie kosztów netto w ujęciu miesięcznym"  content="774">99 zł/miesiąc</span>
                
            <div class="abo-block__summary">
                <span class="abo-block__price-label">Łączny koszt 3 miesięcy: </span>
                <span class="abo-block__price-value">297</span>
                <span class="abo-block__price-tax"><span class="lower">{$product.labels.tax_long}</span> (+{$product.tax_name})</span>
            </div>
            </div>
                
                


            <button class="abo-block__btn btn btn-secondary btn--icon" data-button-action="add-to-cart" type="submit">
                <i class="material-icons">shopping_cart</i>
                <!-- <i class="material-icons shopping-cart">&#xE547;</i> -->
                <span>Dodaj do koszyka</span>
              </button>

        </div>


        <div class="payu mg-t-bb">
            <div class="flex-row-center-mid">
                <img src="{$urls.theme_assets}media/banki/payu-pozniej.png" alt="payu">
                <img src="{$urls.theme_assets}media/banki/payu-raty.png" alt="payu">
            </div>

            <p class="payu-text">
            Dzięki PayU zrealizujesz płatność w formie przelewu online, odroczysz płatność na później lub nawet zrealizujesz ją w ratach!</p>


        </div>

        

    </div>

</section>


</div>





<!-- <article class="seo page-padding ">
    <h4>SEO BOOSTER</h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
        commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.</p>
</article> -->





</div>