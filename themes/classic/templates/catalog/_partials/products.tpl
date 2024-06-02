<div id="js-product-list" itemscope itemtype="https://schema.org/ItemList">
  <div class="art__list list--products list--recommended {if $listing.products|count < 2}list--one{/if}" data-style="1"
    data-col="4" data-slider="false">
    <nav class="slider-nav">
      <a href="#" class="slider-nav__prev"><i class="material-icons">navigate_before</i></a>
      <a href="#" class="slider-nav__next"><i class="material-icons">navigate_next</i></a>
    </nav>

    {foreach from=$listing.products item="product"} {block
            name='product_miniature'} {include
            file='catalog/_partials/miniatures/product_fs.tpl' product=$product}
    {/block}
    {/foreach}
  </div>
  <!-- </div> -->

  {block name='pagination'} {include file='_partials/pagination.tpl'
    pagination=$listing.pagination} {/block}
</div>