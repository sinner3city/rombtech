{if !$logged}
    {if Configuration::get('fbl_createAccountTop') == 1}
        <div class="facelogin fblcreateAccountTop"><p onclick="facelogin_fshop();"><img class="logo-fb" src="{$urls.theme_assets}images/facebooklogo.png" alt="Zaloguj przez Facebook-a"></p>
        </div>
    {/if}
{/if}