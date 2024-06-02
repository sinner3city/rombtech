{assign var=home_s1_title value=CMS::getCMSTtitle(25, 1)} {assign
var=home_s1_content value=CMS::getCMSContent(25, 1)}


<div class="home-top relative">


  {hook h='displayHomeSection1'}

  {* <div class="home-banner-logo">
    <div class="home-logo">
      <img src="{$urls.media}logo.png" alt="{$shop_name}" />
    </div>

    <div>

    </div>


  </div> *}

  <blockquote class="infoblock pos--bl">

    <i class="material-icons ico">tips_and_updates</i>
    <div class="msg">
      <p>Slider pomoże Ci promować najważniejsze informacje w&nbsp;Twoim sklepie np. produkty, usługi, darmową dostawę
        lub&nbsp;promocję, której nie&nbsp;wolno przegapić!</p>

      {* <small class="style-normal">(to bedzię jakiś fajny komponent na animacji wyjeżdzał w ramach "demo tour")</small> *}

    </div>

    <div class="arrow-down "></div>

  </blockquote>
</div>



<section class="section section--premium demohide">
  <h2 class="section__title || section-premium__title mg-hor">
    <strong class="f-400 cp1">f</strong><span class="f-400">Shop</span> - sklep dla Twojej&nbsp;firmy
    {* <sup>(v.22.4.1)</sup> *}
    {*$home_s1_title.meta_title*}
  </h2>
  <article class="section__content content--max content--padding">
    <p>
      Połączyliśmy <strong>korporacyjne rozwiązania</strong> z <strong>psychologią marketingu</strong> aby maksymalnie
      wykorzystać Twój potencjał
      sprzedażowy.<br />
      Sklep internetowy fShop jest świetnie zoptymalizowany pod kątem wyszukiwarek a w połączeniu z rewelacyjnym
      interfejsem tworzą idealną platformę do sprzedaży.
    </p>

    {* <footer class="art__footer t-center">
      <a href="https://fshop.pl/demo/2/katalog-produktow" class="btn btn--primary">przykładowa lista produktów</a>
    </footer> *}
    {*$home_s1_content.content nofilter*}
  </article>
</section>

{hook h='displayHome'}


{*hook h='displayHomeSection1'*}


<section class="section section--news"
  data-splide2='{literal}{"type":"loop","focus":"left","perPage":3,"perMove":1,"interval": 2500,"speed":600,"rewind":true,"breakpoints": {"480":{"perPage": 1,"autoplay":true,"padding":0}}}{/literal}'>
  {* <h2 class="h3 section__title">
    <span class="cp1">Blog</span> / <span class="cp1aa">Co nowego?</span>
  </h2> *}
  {*
  <p class="section__subtitle">
    Prezentuj najważniejsze informacje o Twojej firmie i produktach
  </p>
  *}

  <blockquote class="infoblock pos--tr">

    <i class="material-icons ico">tips_and_updates</i>
    <div class="msg">
      <p>Poinformuj swoich klientów o najważniejszych wydarzeniach w Twojej firmie. Blog umożliwia prowadzenie
        artykułów, FAQ lub innych stron informacyjnych, które wspomagają SEO.</p>

    </div>

    <div class="arrow-down "></div>

  </blockquote>


  <div class="section__content">
    <div class="art__list mg-ver blog-list" data-col="3" data-slider="build">
      {foreach from=CMS::getCMSPages(1,2,true) item=cmspages}

        <article class="art">
          <a class="cms-category-page"
            href="{$link->getCMSLink($cmspages.id_cms, $cmspages.link_rewrite)|escape:'htmlall':'UTF-8'}">
            <header class="art__header">
              <h3 class="art__title">
                {$cmspages.meta_title|escape:'htmlall':'UTF-8'}
              </h3>
              <p class="art__subtitle">{$cmspages.meta_keywords}</p>
            </header>
            <figure class="art__figure">
              {$cmspages.content|strip_tags|truncate:150:'...'}
            </figure>
            <footer>dowiedz się więcej...</footer>
          </a>
        </article>
      {/foreach}
    </div>
  </div>
</section>