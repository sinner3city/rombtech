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
    var plogin_button_url = '{$plogin_button_url}';
    {if Tools::getValue('back','false') != 'false'}
    var back = '{Tools::getValue('back','false')}';
    {/if}
</script>


{literal}
<script src="{/literal}../../modules/plogin/js/plogin.js{literal}"></script>
<link href="{/literal}../../modules/plogin/css/plogin.css{literal}" rel="stylesheet" type="text/css"/>
{/literal}
<div class="loginpopupsocial">
    <div class="plogin"><p onclick="plogin_mypresta('{$plogin_button_url}');"><span>{l s='Log in' mod='plogin'}</span></p></div>
</div>