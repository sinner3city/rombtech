<script>
{if Configuration::get('facelogin_inapp') == 1}
    var facelogin_include_app = true;
{else}
    var facelogin_include_app = false;
{/if}
</script>

{literal}
<script src="{/literal}{literal}../../js/jquery/jquery-1.11.0.min.js"></script>
<script src="{/literal}../../modules/facelogin/js/facelogin.js{literal}"></script>
<script>
    var facelogin_appid = '{/literal}{$fbl_appid}{literal}';
    var facelogin_langcode = '{/literal}{$fbl_langcode}{literal}';
    {/literal}
    {if $ps_version==7}
        var baseDir = '{Context::getContext()->shop->getBaseURL(true, true)}';
    {else}
        var baseDir = '{$content_dir}';
    {/if}
    {literal}
</script>
<link href="{/literal}../../modules/facelogin/css/facelogin.css{literal}" rel="stylesheet" type="text/css"/>
{/literal}
<div class="loginpopupsocial">
    <div class="facelogin"><p onclick="facelogin_fshop();"><img class="logo-fb" src="{$urls.img_url}facebooklogo.png" alt="Zaloguj przez Facebook-a"></p>
    </div>
</div>
z