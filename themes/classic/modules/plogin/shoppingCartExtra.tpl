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

{if !$logged}
    <div class="plogin shoppingcartextra"><p onclick="plogin_mypresta('{$plogin_button_url}');"><span>{l s='Log in' mod='plogin'}</span></p></div>
{/if}