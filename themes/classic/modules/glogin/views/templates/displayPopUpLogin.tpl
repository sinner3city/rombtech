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

{literal}
<script src="{/literal}../../modules/glogin/views/js/glogin.js{literal}"></script>
<link href="{/literal}../../modules/glogin/views/css/glogin.css{literal}" rel="stylesheet" type="text/css"/>
<script>
    var gglogin_appid = '{/literal}{$ggl_appid}{literal}';
    var ggl_loginloader = '{/literal}{$ggl_loginloader}{literal}';
</script>
{/literal}
<div class="loginpopupsocial">
    <div class="glogin">
        <div id="customBtnPopUp" class="customGPlusSignIn" onclick="glogin_mypresta();">
            <span class="buttonText">{l s='Log in' mod='glogin'}</span>
        </div>
    </div>
</div>