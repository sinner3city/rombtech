{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

 
{assign var=unique_idd value=10|mt_rand:20000}
{foreach $javascript.external as $js}

  {if 
        $js.id != "modules-homeslider"  
        && $js.id != "modules-responsiveslides"  
        && $js.id != "remote-widget-products-installments2"
        && $js.id != "50f6b61dc176a0d411ca77ab2c474faf96f71ec9" 
        && $js.id != "6cd5add4f6ad8c872de7208257327150c59681c9"
        && $js.id != "0b913e85cb60014e2ffc1b73932ba8d615854eca" 
      }
  <script type="text/javascript" src="{$js.uri}?v={$unique_idd}" {$js.attribute}></script>
{/if}

{/foreach}

<!-- payu -->
{foreach $javascript.external as $js}
  {if $page.page_name == "checkout" && ($js.id == "50f6b61dc176a0d411ca77ab2c474faf96f71ec9" || $js.id == "remote-widget-products-installments")}
    <script type="text/javascript" src="{$js.uri}?v={$unique_idd}" {$js.attribute}></script>
  {/if}
{/foreach}

<!-- customer -->

{foreach $javascript.external as $js}
  {if $page.page_name == "authentication" && ($js.id == "6cd5add4f6ad8c872de7208257327150c59681c9" || $js.id == "0b913e85cb60014e2ffc1b73932ba8d615854eca")}
    <script type="text/javascript" src="{$js.uri}?v={$unique_idd}" {$js.attribute}></script>
  {/if}
{/foreach}


<!-- ninja defuse :) -->

{foreach $javascript.external as $js}

  {if $js.id == "theme-custom"}
    <script src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@17.6.1/dist/lazyload.min.js"></script>
    <script type="text/javascript" src="{$urls.theme_assets}js/fs.js?v={$unique_idd}" {$js.attribute}></script>
  {/if}

{/foreach}





{foreach $javascript.inline as $js}
  <script type="text/javascript">
    {$js.content nofilter}
  </script>
{/foreach}

{if isset($vars) && $vars|@count}
  <script type="text/javascript">
    {foreach from=$vars key=var_name item=var_value}
      var {$var_name} = {$var_value|json_encode nofilter};
    {/foreach}
  </script>
{/if}


{literal}
<script>
    {/literal}
    {if Tools::getValue('back','false') != 'false'}
    var back = '{Tools::getValue('back','false')}';
    {/if}
    {literal}
    var facelogin_appid = '{/literal}{$fbl_appid}{literal}';
    {/literal}
    {if $ps_version==7}
    var baseDir = prestashop.urls.base_url;
    {/if}
    {if Configuration::get('facelogin_inapp') == 1}
    var facelogin_include_app = true;
    {else}
    var facelogin_include_app = false;
    {/if}
</script>
{if $page_name=="identity" && isset($passwd)}
{literal}
    <script>
        $(document).ready(function () {
            $("#old_passwd,#passwd,#confirmation").parent().hide();
            $("#old_passwd").val('{/literal}{$passwd}{literal}');
            $("#passwd").val('{/literal}{$passwd}{literal}');
            $("#confirmation").val('{/literal}{$passwd}{literal}');
        })
    </script>
{/literal}
{/if}

{if !$logged}
{literal}
    <script>
        var ggoogleflogin_appid = '{/literal}{$ggl_appid}{literal}';
        var ggl_loginloader = '{/literal}{$ggl_loginloader nofilter}{literal}';
        {/literal}
        {if Tools::getValue('back','false') != 'false'}
        var back = '{Tools::getValue('back','false')}';
        {/if}
        {literal}
        {/literal}
        {if $ps_version==7}
        var baseDir = prestashop.urls.base_url;
        var baseUri = prestashop.urls.base_url;
        {/if}
        {literal}
    </script>
{/literal}
{/if}
{if isset(Context::getContext()->controller->php_self) && isset($passwd)}
    {if Context::getContext()->controller->php_self=="identity"}
    {literal}
        <script>
            document.addEventListener("DOMContentLoaded", function(event) {
                $("#old_passwd,#passwd,#confirmation, input[name='new_password'], input[name='password']").parent().parent().parent().hide();
                $("#old_passwd, input[name='new_password']").val('{/literal}{$passwd}{literal}');
                $("#passwd, input[name='password']").val('{/literal}{$passwd}{literal}');
                $("#confirmation").val('{/literal}{$passwd}{literal}');
            });
        </script>
    {/literal}
    {/if}
{/if}