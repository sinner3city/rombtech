{block name='head_charset'}
  <meta charset="utf-8">
{/block}




{* FS CUSTOM STUFF LOADER *}

{include file="_partials/head__customs.tpl"}


{* END *}


{block name='head_ie_compatibility'}

{/block}


{block name='head_seo'}
  <title>🏆💎 {block name='head_seo_title'}

      {if $page.page_name === "index"}

        Gotowy sklep internetowy w tanim abonamencie! Tylko 97 zł netto! - FirmowyStarter.pl

      {else}
        {$page.meta.title}

      {/if}

    {/block}</title>


  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">


  <!-- Meta Tags Generated via https://www.opengraph.xyz -->


  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  {block name='head_hreflang'}
    {foreach from=$urls.alternative_langs item=pageUrl key=code}
      <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
    {/foreach}
  {/block}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=0">
{/block}




{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
{/block}




{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}


{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}



{block name='hook_extra'}{/block}