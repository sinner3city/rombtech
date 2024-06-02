    <div class="">
        {include file='sinner/topinfo.tpl'}

        <div class="product--firmowysklep animation--end product-container" itemscope
            itemtype="https://schema.org/Product" data-category="{$product.id_category_default}">
            <meta itemprop="url" content="{$product.url}">


            <section class="page-banner sinner--sklep section--bg"
                style="background-image: url({$urls.theme_assets}images/bgsklep.png);">


                <header class="page-banner__header">
                    <img src="{$urls.theme_assets}images/fsklep.png" alt="">

                    <p>Jest skuteczny, szybki i doceniony przez wyszukiwarkę Google. Połączyliśmy korporacyjne
                        technologie z psychologią marketingu. Sprzedawaj lepiej i więcej niż Twoja konkurencja.</p>
                    <div class="btns">
                        {* <!-- <span class="btn--demo btn--secondary mg-t-s">zobacz demo sklepu</span> --> *}
                        <a class="btn--buyrwd btn--secondary mg-t-s js__scroll" href="#startujemy">sprawdź cennik</a>
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
                                                    <input type="number" name="qty" id="quantity_wanted"
                                                        value="{$product.quantity_wanted}" class="input-group"
                                                        min="{$product.minimal_quantity}"
                                                        aria-label="{l s='Quantity' d='Shop.Theme.Actions'}">
                                                </div>

                                                <div class="add">
                                                    <button class="btn btn-secondary  add-to-cart btn--icon"
                                                        data-button-action="add-to-cart" type="submit"
                                                        {if !$product.add_to_cart_url} disabled {/if}>
                                                        <i class="material-icons">shopping_cart</i>
                                                        {* <!-- <i class="material-icons shopping-cart">&#xE547;</i> --> *}
                                                        <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                                                    </button>
                                                </div>

                                                {hook h='displayProductActions' product=$product}
                                            </div>
                                        {/block}
                                        <a href="/katalog-produktow-2"
                                            class="btn btn--secondary btn--demo js__scroll btn--icon">
                                            <i class="fas fa-laptop-code"></i>
                                            <span>DEMO</span></a>
                                        <a href="/katalog-produktow-2" class="btn btn--secondary btn--demo  btn--icon">
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

                <h1 class="h3 slider--title">Najskuteczniejszy sklep internetowy, który łączy <strong
                        class="cp1">HI-TECH</strong><br> z <strong class="cp1">psychologią marketingu</strong> tworząc
                    doskonałą platformę do sprzedaży.</h1>

                <div class="splide slider--icons">
                    <div class="splide__track">

                        <ul class="splide__list || list--inline ico-top-text">
                            {* <!-- <li class="splide__slide">
                    <i class="ico-top-text__ico material-icons">highlight_alt</i>
                    <p class="ico-top-text__text">Minimalizm</p>
                </li> --> *}
                            <li class="splide__slide"
                                data-tooltip="Bez okresu wypowiedzenia. Rezygnujesz w dowolnym momencie">
                                <i class="ico-top-text__ico material-icons">content_paste_off</i>
                                <p class="ico-top-text__text">Rezygnacja</p>
                            </li>
                            {* <!-- <li class="splide__slide">
                    <i class="ico-top-text__ico material-icons">directions_run</i>
                    <p class="ico-top-text__text">Rezygnacja</p>
                </li> --> *}
                            <li class="splide__slide" data-tooltip="Instalujemy i konfigurujemy dowolnego kuriera">
                                <i class="ico-top-text__ico material-icons">local_shipping</i>
                                <p class="ico-top-text__text">Dostawa</p>
                            </li>

                            <li class="splide__slide" data-tooltip="Reklama to podstawa. Zacznij być widoczny!">
                                <i class="ico-top-text__ico material-icons">visibility</i>
                                <p class="ico-top-text__text">Reklama</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Najszybsza platforma na rynku wg. Google PageSpeed 90/100">
                                <i class="ico-top-text__ico material-icons">insights</i>
                                <p class="ico-top-text__text">Szybkość</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Dostęp do Twojej oferty z każdego urządzenia mobilnego">
                                <i class="ico-top-text__ico material-icons">important_devices</i>
                                <p class="ico-top-text__text">Mobilność</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Atrakcyjność szablonu wzbogacamy subtelnymi animacjami">
                                <i class="ico-top-text__ico material-icons">auto_fix_high</i>
                                <p class="ico-top-text__text">Animacje</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Sklepy dostosowane do wymogów RODO">
                                <i class="ico-top-text__ico material-icons">fingerprint</i>
                                <p class="ico-top-text__text">RODO</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Struktura przyjazna wyszukiwarkom">
                                <i class="ico-top-text__ico material-icons">edit_note</i>
                                <p class="ico-top-text__text">SEO+</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Moduły komunikacji: facebook chat, whatsapp, skype">
                                <i class="ico-top-text__ico material-icons">whatsapp</i>
                                <p class="ico-top-text__text">Chat online</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Rabaty, promocje oraz program lojalnościowy">
                                <i class="ico-top-text__ico material-icons">loyalty</i>
                                <p class="ico-top-text__text">Rabaty</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Statystyki Google Analytics to kopalnia wiedzy o Twoim sklepie. Warto analizować">
                                <i class="ico-top-text__ico material-icons">query_stats</i>
                                <p class="ico-top-text__text">Statystyki</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Profesjonalne rozwiązania w niskich abonamentach">
                                <i class="ico-top-text__ico material-icons">emoji_objects</i>
                                <p class="ico-top-text__text">Oszczędność</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Moduł płatności online (PayU lub Przelewy24.pl)">
                                <i class="ico-top-text__ico material-icons">credit_score</i>
                                <p class="ico-top-text__text">Płatności online</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Jakość kodu i zaawansowane techniki">
                                <i class="ico-top-text__ico material-icons">settings_ethernet</i>
                                <p class="ico-top-text__text">Optymalizacja</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Rozbudowany magazyn pozwoli Ci w łatwy sposób kontrolować dużą ilość produktów.">
                                <i class="ico-top-text__ico material-icons">view_in_ar</i>
                                <p class="ico-top-text__text">Magazyn</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Możliwość płatności ratalnej zwiększy sprzedaż w Twoim sklepie">
                                <i class="ico-top-text__ico material-icons">money_off</i>
                                <p class="ico-top-text__text">Raty</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Nasze rozwiązanie przeszło pozytywny audyt psychologa marketingu">
                                <i class="ico-top-text__ico material-icons">psychology</i>
                                <p class="ico-top-text__text">Psychologia</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Pozwól klientom na komentowanie i ocenianie produktów">
                                <i class="ico-top-text__ico material-icons">record_voice_over</i>
                                <p class="ico-top-text__text">Komentarze</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Bezpieczeństwo to podstawa. Certyfikat SSL zagwarantuje bezpieczny przepływ wrażliwych danych">
                                <i class="ico-top-text__ico material-icons">admin_panel_settings</i>
                                <p class="ico-top-text__text">SSL</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Obserwuj działania klientów i reaguj w odpowiednim momencie.">
                                <i class="ico-top-text__ico material-icons">missed_video_call</i>
                                <p class="ico-top-text__text">Monitoring</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Przydatny moduł, który pozwoli zapisywać ulubione produkty do listy.">
                                <i class="ico-top-text__ico material-icons">favorite_border</i>
                                <p class="ico-top-text__text">Ulubione</p>
                            </li>

                            <li class="splide__slide"
                                data-tooltip="Bezpłatnie poprawiamy każdy błąd a jego znalezienie nagradzamy darmowym miesiącem">
                                <i class="ico-top-text__ico material-icons">verified</i>
                                <p class="ico-top-text__text">Gwarancja</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Maksymalnie uprościliśmy sposób rejestracji i logowania">
                                <i class="ico-top-text__ico material-icons">task_alt</i>
                                <p class="ico-top-text__text">Rejestracja</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Czegoś Ci brakuje w sklepie? Napisz do nas lub odwiedź dział z rozszerzeniami">
                                <i class="ico-top-text__ico material-icons">dashboard_customize</i>
                                <p class="ico-top-text__text">Dodatki</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="W razie problemów, odzyskujemy dane z ostatnich 24h!">
                                <i class="ico-top-text__ico material-icons">restore</i>
                                <p class="ico-top-text__text">Backup 24h</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Darmowa domena na pierwszy rok z rozszerzeniem .pl w każdym abonamencie">
                                <i class="ico-top-text__ico material-icons">travel_explore</i>
                                <p class="ico-top-text__text">Domena</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Bezpłatnie utrzymujemy Twój sklep na naszych serwerach">
                                <i class="ico-top-text__ico material-icons">real_estate_agent</i>
                                <p class="ico-top-text__text">Hosting</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Otrzymasz skrzynki pocztowe z własną domeną">
                                <i class="ico-top-text__ico material-icons">mark_email_read</i>
                                <p class="ico-top-text__text">E-mail</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Sklep dostępny także dla osób niepełnosprawnych">
                                <i class="ico-top-text__ico material-icons">accessible</i>
                                <p class="ico-top-text__text">WCAG 2.0</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Pomagamy i wspieramy">
                                <i class="ico-top-text__ico material-icons">support</i>
                                <p class="ico-top-text__text">Support</p>
                            </li>
                            <li class="splide__slide" data-tooltip="Polityka prywatności">
                                <i class="ico-top-text__ico material-icons">cookie</i>
                                <p class="ico-top-text__text">Cookies</p>
                            </li>
                            <li class="splide__slide"
                                data-tooltip="Całą uwagę koncentrujemy na produktach a dbałość o detale tylko wzmacnia pozytywny odbiór">
                                <i class="ico-top-text__ico material-icons">crop_original</i>
                                <p class="ico-top-text__text">Minimalizm</p>
                            </li>
                        </ul>
                    </div>

                </div>
            </article>


            <section class="section section--intro-text">
                <header class="section__header || t-center mg-b-30">
                    <h2 class="section__title">Zacznij <strong class="cp1">zarabiać</strong> <span>w&nbsp;sieci</span>
                    </h2>
                    <p class="section__subtitle">Poznaj najskuteczniejszy sklep na rynku!</p>
                </header>
                <p class="content--max t-center">
                    Współpracuj z nami na zasadach <strong>WIN-WIN</strong>. Zależy nam aby Twój sklep przynosił dochody
                    bo
                    wiemy, że zostaniesz z nami dłużej. <br> Poświęciliśmy blisko <strong class="cp1">2500
                        godzin</strong> aby stworzyć najlepszą platformę do sprzedaży.<br><br> Dajemy Ci pełną swobodę w
                    płatnościach oferując wygodne okresy aktywacji na 3,
                    6 lub 12 miesięcy. <strong>Bez okresu
                        wypowiedzenia</strong>. W razie potrzeby
                    zrezygnujesz kiedy chcesz bo nie przedłużamy umowy automatycznie - przypominamy 14 dni przed końcem
                    okresu
                    i do Ciebie należy decyzja o dalszej współpracy.

                </p>
            </section>






            {include file='sinner/optymalizacja.tpl'}


            <section class="section section--bg section--google bg1">

                <header class="section__header">
                    <img src="{$urls.theme_assets}icons/google.svg" height="100" class="mg-b-15" alt="">
                    <h2 class="h1 section__title"><span class="cp1">Optymalizacja</span> ma znaczenie!</h2>
                    <strong class="section__subtitle">Nasze doświadczenie i jakoś kodu docenia Google</strong>
                </header>

                <article class="article">
                    <p>
                        Czym jest optymalizacja? To wiedza i modyfikacje stosowane na różnych płaszczyznach w celu
                        zwiększenia szybkości i atrakcyjności kodu pod względem wydajności. Tylko <strong>doświadczeni
                            programiści</strong> znają jej tajemnice aby sprostać wysokim standardom narzuconym przez
                        giganta reklamowego.
                    </p>

                    <p>
                        Wysoka ocena na podstawie narzędzia
                        PageSpeed Insights by Google jest jednym z czynników, który <strong>decyduje o wysokich
                            pozycjach w wyszukiwarce</strong>. Zachęcamy do sprawdzania i testowania pod linkiem
                        poniżej.
                    </p>

                    <footer class="article__footer">
                        <a href="https://pagespeed.web.dev/report?url=https%3A%2F%2Ffirmowystarter.pl%2F&hl=pl"
                            target="_blank" class="btn btn--primary btn--large">
                            sprawdź <img src="{$urls.theme_assets}icons/ps.svg" height="28" class="mg-hor-s" alt="">
                            <strong>Google PageSpeed</strong></a>
                    </footer>
                </article>




            </section>



            <section class="section hide">

                <div class="splide slider--articles">
                    <div class="splide__track">
                        <ul class="splide__list">
                            <li class="splide__slide">

                                <article class="slider-item">
                                    <h3 class="slider-item__title">Prosta <span class="color">obsługa</span></h3>
                                    <div class="slider-item__content">
                                        <p>Wiele sklepów może przytłoczyć nadmierną i często niepotrzebną ilością
                                            funkcjonalności.</p>
                                        <p>Nasi specjaliści dobrali wyłącznie te moduły, których naprawdę potrzebujesz.
                                        </p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Wersja <span class="color">mobilna</span></h3>
                                    <div class="slider-item__content">
                                        <p>Nasze sklepy dostosowane są do urządzeń mobilnych jak smarftony czy tablety
                                            aby
                                            udostępnić sprzedaż twoich produktów w każdy możliwy sposób!</p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Płatności <span class="color">online</span></h3>
                                    <div class="slider-item__content">
                                        <p>Płatności internetowe to jeden z kluczowych aspektów dzięki którym klienci
                                            decydują
                                            się na zakup.</p>
                                        <p>Polecamy: Przelewy24.pl</p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Płatność <span class="color">ratalna</span></h3>
                                    <div class="slider-item__content">
                                        <p>Udostępnij sprzedaż ratalną w sklepie a zamówienia poszybują w górę! Do
                                            Ciebie trafia
                                            pełna kwota za towar a formalnościami zajmie się moduł płatności online
                                            (przelewy24.pl)</p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Statystyki <span class="color">sklepu</span></h3>
                                    <div class="slider-item__content">
                                        <p>Każdy sklep posiada zainstalowany moduł Google Analytics, który pokaże Ci
                                            kiedy i
                                            skąd przyszli Twoi klienci.</p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Atrakcyjny <span class="color">wygląd</span></h3>
                                    <div class="slider-item__content">
                                        <p>Nowoczesny i minimalistyczny design - to obecne trendy, które przekładamy na
                                            nasze
                                            szablony graficzne.</p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Domena i <span class="color">serwer</span></h3>
                                    <div class="slider-item__content">
                                        <p>W każdym pakiecie znajduje się możliwość wybrania dowolnej domeny, która
                                            będzie Twoim
                                            adresem w sieci. Dodatkowo oferujemy szybki i niezawodny serwer.</p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Pełna <span class="color">konfiguracja</span></h3>
                                    <div class="slider-item__content">
                                        <p>Od sklepu, domeny aż po serwer i SSL. Wszystko skonfigurujemy i przygotujemy
                                            za
                                            Ciebie! Nie potrzebujesz żadnej specjalistycznej wiedzy.</p>
                                    </div>
                                </article>
                            </li>
                            <li class="splide__slide">
                                <article class="slider-item">
                                    <h3 class="slider-item__title">Bezpieczeństwo <span class="color">transakcji</span>
                                    </h3>
                                    <div class="slider-item__content">
                                        <p>W cenie abonamentu instalujemy certyfikat SSL, który zabezpieczy transakcje
                                            oraz dane
                                            Twoich klientów przed nieuprawnionym dostępem.</p>
                                    </div>
                                </article>
                            </li>
                            {* <!-- <li class="splide__slide">
                    </li> --> *}
                        </ul>
                    </div>
                </div>

            </section>





            <section class="section">

                <header class="section__header">
                    <h2 class="section__title">Minimalizm <span class="cp1">generuje zyski</span></h2>
                    <p class="section__subtitle">Prezentacja Twoich produktów jest najważniejsza</p>
                </header>


                <article class="article t-center">

                    <p class="">
                        Lekkie i proste szablony generują większą ilość zamówień w sklepach internetowych.


                        Jak to możliwe? Chodzi o prędkość wczytywania. Witryny, które z pozoru są atrakcyjne wizualnie
                        zwykle serwują sporą ilość danych, które trzeba ściągnąć aby wyświetlić stronę.

                    </p>
                </article>



                {include file='sinner/chart.tpl'}





            </section>


            <section class="section">
                <article class="article mg-ver-60">
                    <h3 class="h2 mg-b-30">Bądź świadomy.
                        <span class="cp1">Nie daj się złapać!</span>
                    </h3>

                    <p>

                        Wszystkie znane sklepy internetowe <strong>nie posiadają oprawy graficznej</strong> i skupiają
                        się wyłącznie na prezentacji produktów. Walcząc o najwyższe pozycje w wyszukiwarce należy
                        ładować minimalną ilość danych aby zapewnić maksymalną szybkość działania.

                        Google ceni takie sklepy i promuje je wyżej w swoich wynikach.
                    </p>

                    <footer class="">
                        <img src="{$urls.theme_assets}media/pageinsight_cr2.png" alt=""><br><br>

                        {* <!-- <a href="https://developers.google.com/speed/pagespeed/insights/?hl=pl" target="_blank" class="btn btn--border btn--large"><strong> sprawdź:  <img src="{$urls.theme_assets}icons/ps.svg" height="28" class="mg-hor-ss" alt="">  Google PageSpeed</strong></a> --> *}
                    </footer>


                    {* <!-- <p class="">Jesteśmy tak pewni naszego rozwiązania, że sami go używamy przy sprzedaży!</p> --> *}



                    {* <!-- <p class="">
            Od początku naszym założeniem było stworzenie systemu, który zapewni najwyższą skuteczność sprzedaży. Zależy nam na sukcesie naszych klientów, którym pomagamy na każdym etapie bo takie podejście przekłada się na wieloletnią współpracę (WIN-WIN).
        </p> --> *}

                </article>

            </section>

            {include file='sinner/review.tpl'}

            {include file='sinner/stats.tpl'}



            {include file='sinner/free.tpl'}




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

            {* <!-- <div class="container"> --> *}
            {block name='product_tabs'}
                <div class="tabs pd-t">
                    <div class="overflow-x">
                        <ul class="nav nav-tabs" role="tablist">
                            {if $product.description}
                                <li class="nav-item">
                                    <a class="nav-link{if $product.description} active{/if}" data-toggle="tab"
                                        href="#description" role="tab" aria-controls="description" {if $product.description}
                                        aria-selected="true" {/if}>
                                        <i class="material-icons">star</i>
                                        Zalety?</a>
                                </li>
                            {/if}
                            <li class="nav-item">
                                <a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#abo"
                                    role="tab" aria-controls="abo" {if !$product.description} aria-selected="true" {/if}>
                                    <i class="material-icons">widgets</i>
                                    Zawartość
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link{if !$product.description} active{/if} f-bold" target="blank"
                                    href="/katalog-produktow-2" role="tab" aria-controls="functions"
                                    {if !$product.description} aria-selected="true" {/if}>
                                    <i class="material-icons">mobile_friendly</i>
                                    Zobacz demo</a>
                            </li>
                            {* <!-- <li class="nav-item">
                    <a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#stages"
                        role="tab" aria-controls="stages" {if !$product.description} aria-selected="true" {/if}>Etapy
                        realizacji</a>
                </li> --> *}
                            {if $product.attachments}
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#attachments" role="tab"
                                        aria-controls="attachments">{l
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
                                            <img data-src="{$urls.theme_assets}media/konfiguracja.png"
                                                class="art__img || lazyload"
                                                src="{$urls.theme_assets}images/placeholder-500.png">
                                            {* <!-- <img data-src="{$urls.theme_assets}media/add.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png"> --> *}
                                            {* <!-- <img data-src="{$urls.theme_assets}media/adv.png" class="art__img || lazyload" src="{$urls.theme_assets}media/adv.png"> --> *}
                                        </figure>

                                        <div class="art__content">

                                            <header class="art__header">
                                                <h2 class="art__title">Konfiguracja <span class="cp1">sklepu</span></h2>
                                                <p class="art__subtitle">Ustawienia sklepu zostaw nam</p>
                                            </header>


                                            <p>Po zakupie poprosimy Cię o najważniejsze dane takie jak cennik dostawy, wybór
                                                bramki płatniczej czy informacji o potencjalnych rabatach dla Twoich
                                                klientów. <strong>Całkowicie zdejmiemy z Ciebie ciężar konfiguracji
                                                    sklepu</strong> tak aby Twoje czynnośći ograniczyły się jedynie do
                                                wprowadzania produktów. Takiego podejścia nie znajdziesz u konkurencji.</p>


                                        </div>

                                    </article>
                                    <article class="art">

                                        <figure class="art__figure">
                                            <img data-src="{$urls.theme_assets}media/shopscreen.jpg"
                                                class="art__img || lazyload"
                                                src="{$urls.theme_assets}images/placeholder-500.png">
                                            {* <!-- <img data-src="{$urls.theme_assets}media/add.jpg" class="art__img || lazyload" src="{$urls.theme_assets}images/placeholder-500.png"> --> *}
                                            {* <!-- <img data-src="{$urls.theme_assets}media/adv.png" class="art__img || lazyload" src="{$urls.theme_assets}media/adv.png"> --> *}
                                        </figure>

                                        <div class="art__content">

                                            <header class="art__header">
                                                <h2 class="art__title">Projekt i <span class="cp1">animacje</span></h2>
                                                <p class="art__subtitle">Nowoczesny wygląd i dynamika przyciągają uwagę</p>
                                            </header>


                                            <p>Przygotowaliśmy jeden doskonale przygotowany szablon, który oprócz zalet
                                                technologicznych swoją uwagę przyciąga subtelnymi animacjami. Każde
                                                zamówienie w ramach abonamentu dostosowujemy pod kątem kolorystycznym aby
                                                współgrał z identyfikacją Twojej firmy. Dla wymagających klientów tworzymy
                                                również indywidualne szablony oraz dowolne modyfikacje funkcjonalności
                                                sklepu.</p>


                                            {* <!-- <footer class="art__footer">
                                <a href="{url entity='category' id='100'}" class="btn btn--border">sprawdź pakiety
                                    reklamowe</a>
                            </footer> --> *}
                                        </div>

                                    </article>



                                    <article class="art">

                                        <figure class="art__figure">
                                            <img data-src="{$urls.theme_assets}media/psycho.png"
                                                class="art__img || lazyload"
                                                src="{$urls.theme_assets}images/placeholder-300.png">
                                        </figure>

                                        <div class="art__content">

                                            <header class="art__header">
                                                <h3 class="art__title">Audyt <span class="cp1">psychologa</span></h3>
                                                <p class="art__subtitle">Zadbaliśmy o każdy element sprzedaży</p>
                                            </header>

                                            <p>

                                                Sposób prezentacji Twoich produktów ma ogromny wpływ na decyzje klienta o
                                                zakupie. Kupujemy nie tylko oczami ale i... no właśnie tu wykorzystaliśmy
                                                wszystkie możliwe (socjo)techniki, które nadzorował <strong
                                                    class="cp1">psycholog marketingu</strong>. Pozytywny audyt naszej wersji
                                                sklepu <strong>zwiększa Twoje szanse sprzedaży</strong> gdzie walka z
                                                konkurencją odbywa się na wielu poziomach.</p>

                                            {* <!-- <footer class="art__footer">
                                <a href="{url entity='category' id='100'}" class="btn btn--border">poznaj nasz zespół</a>
                            </footer> --> *}
                                        </div>

                                    </article>

                                    <article class="art">

                                        <figure class="art__figure">
                                            <img data-src="{$urls.theme_assets}media/booster.jpg"
                                                class="art__img || lazyload"
                                                src="{$urls.theme_assets}images/placeholder-500.png">
                                        </figure>

                                        <div class="art__content">

                                            <header class="art__header">
                                                <h2 class="art__title">Niesamowita <span class="cp1">szybkość</span></h2>
                                                <p class="art__subtitle">Słabe łącze To już nie problem</p>
                                            </header>


                                            <p>Tak zaawansowanego sklepu nie dostaniesz nigdzie indziej. Jesteśmy zakręceni
                                                w temacie wydajności dlatego działanie i szybkość onieśmiela
                                                konkurencję. Nasze starania potwierdza Google przyznając nam najwyższą ocenę
                                                na tle innych rozwiązań na rynku.</p>



                                            <footer class="art__footer">
                                                <a href="https://pagespeed.web.dev/report?url=https%3A%2F%2Ffirmowystarter.pl%2F&hl=pl"
                                                    target="blank" class="art__btn  btn--border">sprawdź ocenę w Google
                                                    PageSpeed</a>
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
                                        <img src="{$urls.theme_assets}media/box.png" alt="">

                                    </div>
                                    <div class="">
                                        <article>
                                            <h3 class="">W ramach aktywacji:</h3>
                                            <ul class="list">
                                                <li>Korzystasz z naszego specjalnie przygotowanego szablonu na licencji SasS
                                                </li>
                                                <li>Instalujemy sklep internetowy (prestashop) wraz z modyfikacjami i naszym
                                                    unikalnym szablonem wg. wersji demonstracyjnej</li>
                                                <li>Zarządasz sklepem przez panel administracyjny na wydzielonych
                                                    uprawnieniach (możliwość dodania dodatkowych kont dla pracowników)</li>
                                                <li>Dostosowujemy kolory sklepu zgodnie z identyfikacją Twojej firmy</li>
                                                {* <!-- <li>Tworzymy główny baner na stronie głównej pasujący do Twojej działalności</li> --> *}
                                                <li>Konfigurujemy wszystkie moduły niezbędne do sprzedaży</li>
                                                <li>Instalujemy moduły od zewnętrznych dostawców</li>
                                                {* <!-- <li>Przygotowanie wersji mobilnej sklepu (smartfony i tablety)</li> --> *}
                                                <li>Na 1 rok rejestrujemy i konfigurujemy dla Ciebie nową domenę (.pl)</li>
                                                <li>Utrzymujemy Twój sklep na naszych serwerach (hosting) z 3 GB
                                                    przestrzenią (możliwość powiększenia).</li>
                                                <li>Tworzymy 2 skrzynki pocztowe e-mail o wybranej nazwie w Twojej domenie
                                                </li>
                                                <li>Instalujemy Certyfikat bezpieczeństwa SSL</li>
                                                {* <!-- <li>Wybor dostawcy płatności online (Przelewy24.pl, Dotpay lub PayU)</li> --> *}
                                                <li>Dostęp i wsparcie profesjonalistów na każdym etapie współpracy</li>
                                                <li>...</li>
                                                <li>Gurujesz nad konkurencją :-)</li>
                                            </ul>
                                        </article>
                                    </div>
                                </div>

                            </section>
                        </div>
                        <div class="tab-pane fade in" id="functions" role="tabpanel">
                            <div class="functions__list">

                            </div>

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
                        $extra.attr as $key=> $val} {$key}="{$val}" {/foreach}>
                                {$extra.content nofilter}
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
            {/block}

            {*include file='sinner/polecane.tpl'*}
            <section class="section content--padding">
                {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                {/block}

            </section>

            {include file='sinner/gwarancja.tpl'}




            {* <!-- </div> --> *}
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




            <section id="startujemy" class="section section--bg mg-t-30 pd-t-30 t-left section--startujemy"
                data-src-background="{$urls.theme_assets}media/startujemy.png">
                <header class="section__header || t-center ">
                    <h2 class="section__title">Gotowy? Startuje<span class="cp1">My</span>!</h2>
                    <p class="section__subtitle">Im dłuższy plan tym tańsza usługa</p>
                </header>

                <p class="t-center">Nie przedłużamy automatycznie. Jeżeli nie opłacisz usługi, nie będzie aktywna. Brak
                    zobowiązań. Brak okresu wypowiedzenia. Zero ryzyka. Decyduj na jak długo chcesz aktywować:</p>


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
                            <span class="price-mc" content="774">97 zł/miesiąc</span>

                            <div class="abo-block__summary">
                                <span class="abo-block__price-label">Łączny koszt 12 miesięcy: </span>
                                <span class="abo-block__price-value">1164</span>
                                <span class="abo-block__price-tax"><span class="lower">{$product.labels.tax_long}</span>
                                    (+{$product.tax_name})</span>
                            </div>
                        </div>

                        <div class="abo-block__price-selected price-detal-mc hide" data-value="6">
                            <span class="price-mc" content="774">147 zł/miesiąc</span>

                            <div class="abo-block__summary">
                                <span class="abo-block__price-label">Łączny koszt 6 miesięcy: </span>
                                <span class="abo-block__price-value">882</span>
                                <span class="abo-block__price-tax"><span class="lower">{$product.labels.tax_long}</span>
                                    (+{$product.tax_name})</span>
                            </div>
                        </div>

                        <div class="abo-block__price-selected price-detal-mc   hide" data-value="3">
                            <span class="price-mc" content="774">199 zł/miesiąc</span>

                            <div class="abo-block__summary">
                                <span class="abo-block__price-label">Łączny koszt 3 miesięcy: </span>
                                <span class="abo-block__price-value">597</span>
                                <span class="abo-block__price-tax"><span class="lower">{$product.labels.tax_long}</span>
                                    (+{$product.tax_name})</span>
                            </div>
                        </div>




                        <button class="abo-block__btn btn btn-secondary btn--icon" data-button-action="add-to-cart"
                            type="submit">
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
                            Dzięki PayU zrealizujesz płatność w formie przelewu online, odroczysz płatność na później
                            lub nawet zrealizujesz ją w ratach!</p>


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