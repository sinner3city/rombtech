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

<div class="gloader"></div>
{if Configuration::get('ggl_footer') == 1}
    {if !$logged}
        <div class="glogin customBtnFooter">
            <div id="customBtnFooter" class="customGPlusSignIn" onclick="glogin_mypresta();">
                <span class="buttonText">{l s='Log in' mod='glogin'}</span>
            </div>
        </div>
    {/if}
{/if}