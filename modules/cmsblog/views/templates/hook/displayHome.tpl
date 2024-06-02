<div id="featured-products_block_center" class="block products_block clearfix">
  <h2 class="h2 products-section-title text-uppercase flex-row-center mg-b-0">
    <span class="titleLeft">{$Into_text}</span>

  </h2>

<ul class="producttags">

{foreach from=$cmsCats item=cat}

<li class="hide">
  <a href="index.php?id_cms_category={$cat.id_cms_category}&controller=cms">{$cat.name}</a>
  /content/category/{$cat.id_cms_category}-firmowe?id_cms_category={$cat.id_cms_category}
  </li>
{/foreach}
</ul>
<hr/>

{if isset($cmsPages) AND $cmsPages}
<div class="block_content">

<ul class="product_list--blog flex-row">
  {foreach from=$cmsPages item=article}
  <li class="ajax_block_product col-xs-12 col-sm-4 col-md-3 first-in-line first-item-of-tablet-line first-item-of-mobile-line">
    <div class="obrazek" data-load="{$article.id_cms}">

    </div>  
    <h2 class="s_title_block"><a href="{$link->getCMSLink({$article.id_cms})}" class="link">{$article.meta_title}</a></h2>
      <div class="product_desc">{$article.content|strip_tags:'UTF-8'|truncate:100:'...'}</div>
      <div>
      <p><strong><a href="{$link->getCMSLink({$article.id_cms})}" class="btn-secondary btn-small">Read More</strong></a></p>
      </div>
      </li>
    {/foreach}
  </ul>
</div>

{else}
		<p>{l s='No articles yet' mod='cmsblog'}</p>
	{/if}
</div>	


<!-- 
$('.ajax_block_product').each(function () {
  $('.obrazek', $(this)).load($('.link', $(this)).attr('href') + ' .cover');
});
 -->
