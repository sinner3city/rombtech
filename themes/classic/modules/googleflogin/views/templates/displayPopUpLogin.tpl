{literal}
<script src="{/literal}../../modules/googleflogin/views/js/googleflogin.js{literal}"></script>
<link href="{/literal}../../modules/googleflogin/views/css/googleflogin.css{literal}" rel="stylesheet" type="text/css"/>
<script>
    var ggoogleflogin_appid = '{/literal}{$ggl_appid}{literal}';
    var ggl_loginloader = '{/literal}{$ggl_loginloader}{literal}';
</script>
{/literal}
<div class="loginpopupsocial">
    <div class="googleflogin">
        <div id="customBtnPopUp" class="logowanie-google" onclick="googleflogin_fshop();">
            <img class="logo-google" src="{$urls.theme_assets}images/gmail.png" alt="Zaloguj przez konto Google">
        </div>
    </div>
</div>