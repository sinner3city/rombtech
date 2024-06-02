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

<div class="ploader"></div>
{if !$logged}
    {if $ppl_psver==4}
        <script>
            var baseUri = baseDir;
        </script>
    {/if}

    {if Configuration::get('plogin_footer') == 1}
        <div class="plogin-link plogin displayfooter" id="plogin">
            <p onclick="plogin_mypresta('{$plogin_button_url}');"><span>{l s='Log in' mod='plogin'}</span></p>
        </div>
    {/if}
{/if}