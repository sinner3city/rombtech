{*
* PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
*
* @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
* @copyright 2010-2020 VEKIA
* @license   This program is not free software and you can't resell and redistribute it
*
* CONTACT WITH DEVELOPER http://mypresta.eu
* support@mypresta.eu
*}

<script>
{if Configuration::get('fblogin_inapp') == 1}
    var fblogin_include_app = true;
{else}
    var fblogin_include_app = false;
{/if}
</script>

{literal}
<script src="{/literal}{literal}../../js/jquery/jquery-1.11.0.min.js"></script>
<script src="{/literal}../../modules/fblogin/js/fblogin.js{literal}"></script>
<script>
    var fblogin_appid = '{/literal}{$fbl_appid}{literal}';
    var fblogin_langcode = '{/literal}{$fbl_langcode}{literal}';
    {/literal}
    {if $ps_version==7}
        var baseDir = '{Context::getContext()->shop->getBaseURL(true, true)}';
    {else}
        var baseDir = '{$content_dir}';
    {/if}
    {literal}
</script>
<link href="{/literal}../../modules/fblogin/css/fblogin.css{literal}" rel="stylesheet" type="text/css"/>
{/literal}
<div class="loginpopupsocial">
    <div class="fblogin"><p onclick="fblogin_mypresta();"><span>{l s='Log in' mod='fblogin'}</span></p>
    </div>
</div>
