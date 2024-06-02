<!-- custom loader -->

{* META DATA
======================================================================================================================================================
*}

{include file="_partials/head__customs--meta.tpl"}

{literal}
<script>
    
        
    var fblogin_appid = '389393556100987';
    var fblogin_langcode = 'pl_PL';
    
        var baseDir = 'https://firmowystarter.pl/';
            var fblogin_include_app = true;
    </script>
{/literal}

{* FONTS
======================================================================================================================================================
*}

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="
https://cdn.jsdelivr.net/npm/jquery-ui-slider@1.12.1/jquery-ui.min.css
" rel="stylesheet">

<link rel="preload"
    href="https://fonts.googleapis.com/css?family=Roboto+Condensed:ital,wght@0,100;0,300;0,400;0,500;0,700&display=swap"
    as="style">

<link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Roboto+Condensed:ital,wght@0,100;0,300;0,400;0,500;0,700&display=swap">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" crossorigin>



{* CSS
======================================================================================================================================================
*}

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.min.css" />



{* JAVASCRIPT ONLY ON PRODUCTION
======================================================================================================================================================
*}

{if $urls.shop_domain_url !== "https://localhost"}

    {* Global site tag (gtag.js) - Google Analytics *}

    {literal}
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-M3LJJ9DMQC"></script>
        <script>
            window.dataLayer = window.dataLayer || [];

            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());

            gtag('config', 'G-M3LJJ9DMQC');
        </script>

    {/literal}

    {* Video Recording *}

    {literal}

        <!-- Begin Inspectlet Asynchronous Code -->
        <script type="text/javascript">
            (function() {
                window.__insp = window.__insp || [];
                __insp.push(['wid', 167499687]);
                var ldinsp = function() {
                    if (typeof window.__inspld != "undefined") return;
                    window.__inspld = 1;
                    var insp = document.createElement('script');
                    insp.type = 'text/javascript';
                    insp.async = true;
                    insp.id = "inspsync";
                    insp.src = ('https:' == document.location.protocol ? 'https' : 'http') +
                        '://cdn.inspectlet.com/inspectlet.js?wid=167499687&r=' + Math.floor(new Date().getTime() /
                            3600000);
                    var x = document.getElementsByTagName('script')[0];
                    x.parentNode.insertBefore(insp, x);
                };
                setTimeout(ldinsp, 0);
            })();
        </script>
        <!-- End Inspectlet Asynchronous Code -->

    {/literal}

{/if}



{* JAVASCRIPT NESSASARY
======================================================================================================================================================
*}

{literal}
    <script defer src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0.36/dist/fancybox/fancybox.umd.js"></script>
{/literal}