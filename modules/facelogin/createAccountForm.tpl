{if !$logged}
    {if Configuration::get('fbl_createAccountForm') == 1}
        <div class="facelogin fblcreateaccountform"><p onclick="facelogin_fshop();"><img class="logo-fb" src="{$urls.theme_assets}images/facebooklogo.png" alt="Zaloguj przez Facebook-a"></p>
        </div>
    {/if}
{/if}