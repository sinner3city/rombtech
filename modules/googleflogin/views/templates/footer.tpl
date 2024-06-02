<div class="gloader"></div>
{if Configuration::get('ggl_footer') == 1}
    {if !$logged}
        <div class="googleflogin customBtnFooter">
            <div id="customBtnFooter" class="logowanie-google" onclick="googleflogin_fshop();">
            <img class="logo-google" src="{$urls.theme_assets}images/gmail.png" alt="Zaloguj przez konto Google">
            </div>
        </div>
    {/if}
{/if}