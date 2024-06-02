  <section class="section section--news"
    data-splide='{literal}{"type":"loop","focus":"center","perPage":3,"perMove":1,"interval": 2500,"speed":600,"rewind":true,"breakpoints": {"480":{"perPage": 1,"autoplay":true,"padding":0}}}{/literal}'>
    <h2 class="section__title">
      <!-- Aktualności i&nbsp;<span class="cp1">blog</span></h2> -->
      <p class="section__subtitle">Prezentuj najważniejsze informacje o Twojej firmie i produktach</p>
      <div class="section__content">
        <div class="art__list mg-ver blog-list" data-col="3" data-slider="build">
          {foreach from=CMS::getCMSPages(1,3,true) item=cmspages}

            <article class="art">
              <a class="cms-category-page"
                href="{$link->getCMSLink($cmspages.id_cms, $cmspages.link_rewrite)|escape:'htmlall':'UTF-8'}">

                <header class="art__header">
                  <h3 class="art__title">{$cmspages.meta_title|escape:'htmlall':'UTF-8'}</h3>
                  <p class="art__subtitle">{$cmspages.meta_keywords}</p>
                </header>
                <figure class="art__figure">
                  {$cmspages.content|strip_tags|truncate:150:'...'}
                </figure>
                <footer>
                  dowiedz się więcej...
                </footer>
              </a>
            </article>
          {/foreach}
        </div>
      </div>
</section>