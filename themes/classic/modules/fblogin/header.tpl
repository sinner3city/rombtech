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

{literal}
<script>
    {/literal}
    {if Tools::getValue('back','false') != 'false'}
    var back = '{Tools::getValue('back','false')}';
    {/if}
    {literal}
    var fblogin_appid = '{/literal}{$fbl_appid}{literal}';
    var fblogin_langcode = '{/literal}{$fbl_langcode}{literal}';
    {/literal}
    {if $ps_version==7}
    var baseDir = '{$urls.base_url}';
    {/if}
    {if Configuration::get('fblogin_inapp') == 1}
    var fblogin_include_app = true;
    {else}
    var fblogin_include_app = false;
    {/if}
</script>
{if $page_name=="identity" && isset($passwd)}
{literal}
    <script>
        $(document).ready(function () {
            $("#old_passwd,#passwd,#confirmation").parent().hide();
            $("#old_passwd").val('{/literal}{$passwd}{literal}');
            $("#passwd").val('{/literal}{$passwd}{literal}');
            $("#confirmation").val('{/literal}{$passwd}{literal}');
        })
    </script>
{/literal}
{/if}