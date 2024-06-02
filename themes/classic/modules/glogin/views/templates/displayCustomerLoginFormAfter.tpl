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
    <div class="login-by login-by__google  t-center">
        <h4>Zaloguj się przez: </h4><br>


        <div class="flex-row-center-mid">

            <div class="glogin customBtndisplayCustomerLoginFormAfter">
                <div id="customBtndisplayCustomerLoginFormAfter" class="customGPlusSignIn" onclick="glogin_mypresta();">
                    <img class="logo-google" src="{$urls.theme_assets}images/gmail.png" alt="Zaloguj przez konto Google">
                </div>
            </div>
            

            <div class="clearfix">
                <button class="logo-fb-btn" type="button" onclick="fblogin_mypresta();">
                    <img class="logo-fb" src="{$urls.theme_assets}images/facebooklogo.png" alt="Zaloguj przez konto Facebook">
                </button>
            </div>

            <div class="plogin pldisplayCustomerLoginFormAfter text-xs-center clearfix">
                <div class="plogin displaytop"><p onclick="plogin_mypresta('{$plogin_button_url}');"><span>{l s='Log in' mod='plogin'}</span></p></div>
            </div>

        </div>
    </div>
{/if}