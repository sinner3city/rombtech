
<div class="fbloader"></div>
{if $fb_psver==4}
    <script>
        var baseUri = baseDir;
    </script>
{/if}

{if !$logged}
    {if Configuration::get('fbl_footer') == 1}
        <div class="facelogin fblfooter"><p onclick="facelogin_fshop();"><img class="logo-fb" src="{$urls.theme_assets}images/facebooklogo.png" alt="Zaloguj przez Facebook-a"></p>
        </div>
    {/if}
{/if}