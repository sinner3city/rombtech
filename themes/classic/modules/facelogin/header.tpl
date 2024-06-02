{*
    {literal}
<script>
    {/literal}
    {if Tools::getValue('back','false') != 'false'}
    var back = '{Tools::getValue('back','false')}';
    {/if}
    {literal}
    var facelogin_appid = '{/literal}{$fbl_appid}{literal}';
    {/literal}
    {if $ps_version==7}
    var baseDir = prestashop.urls.base_url;
    {/if}
    {if Configuration::get('facelogin_inapp') == 1}
    var facelogin_include_app = true;
    {else}
    var facelogin_include_app = false;
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
*}