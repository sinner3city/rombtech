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
    <script>
        var plogin_button_url = '{$plogin_button_url}';
        {if Tools::getValue('back','false') != 'false'}
            var back = '{Tools::getValue('back','false')}';
        {/if}
        {if $ps_version==7}
            var baseDir = prestashop.urls.base_url;
        {/if}
    </script>
{/if}