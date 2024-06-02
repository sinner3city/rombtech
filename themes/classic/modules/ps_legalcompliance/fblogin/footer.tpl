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


<div class="fbloader"></div>
{if $fb_psver==4}
    <script>
        var baseUri = baseDir;
    </script>
{/if}

{if !$logged}
    {if Configuration::get('fbl_footer') == 1}
        <div class="fblogin fblfooter"><p onclick="fblogin_mypresta();"><span>{l s='Log in' mod='fblogin'}</span></p>
        </div>
    {/if}
{/if}