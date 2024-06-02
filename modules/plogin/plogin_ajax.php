<?php
/*
* PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
*
* @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
* @copyright 2010-2020 VEKIA
* @license   This program is not free software and you can't resell and redistribute it
*
* CONTACT WITH DEVELOPER http://mypresta.eu
* support@mypresta.eu
*/

include_once('../../config/config.inc.php');
include_once('../../init.php');
include_once('plogin.php');

$thismodule = new plogin();
//$thismodule->verifycustomer(Tools::getValue('resp'));

$host = ("https://api.paypal.com/");
$clientId = Configuration::get('plogin_clientid');
$clientSecret = Configuration::get('plogin_secret');
$arrResponseToken = false;

function get_access_token($url, $postdata)
{
    global $clientId, $clientSecret;
    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $postdata);
    curl_setopt($curl, CURLOPT_USERPWD, $clientId . ":" . $clientSecret);
    $response = curl_exec($curl);
    $jsonResponse = json_decode($response);
    return (isset($jsonResponse->access_token) ? $jsonResponse->access_token : false);
}

if (isset($_GET['code']))
{
    $postArgs = 'client_secret=' . $clientSecret . '&code=' . $_GET['code'] . '&client_id=' . $clientId . '&grant_type=authorization_code';
    $url = $host . 'v1/oauth2/token';
    $token = get_access_token($url, $postArgs);
    if ($token)
    {
        $strAccess_Token = $token;
        $chToken = curl_init("https://api.paypal.com/v1/identity/openidconnect/userinfo/?schema=openid&access_token=" . $strAccess_Token);
        curl_setopt($chToken, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($chToken, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($chToken, CURLOPT_SSL_VERIFYHOST, false);
        //curl_setopt($chToken, CURLOPT_POSTFIELDS, $postdata);
        curl_setopt_array($chToken, array(CURLOPT_RETURNTRANSFER => 1));
        $arrResponseToken = curl_exec($chToken);
        if ($arrResponseToken === false)
        {
            $arrResponseToken = 'Curl error: ' . curl_error($chToken);
            $flag_result = 0;
        }
    }
}
else
{
    echo 'no return code, contact with support please';

}


if ($arrResponseToken)
{
    $thismodule->verifycustomer($arrResponseToken);
    Tools::redirect($thismodule->returnPageUrl());
}
else
{
    Tools::redirect($thismodule->returnPageUrl());
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="plogin_ajax/css/style.css"/>
</head>
<body>
<div class="login">
    <div class="login-screen">
        <div class="app-title">
            <img src="img/paypal-logo-png.png" style="max-width:265px;"/>
            <img src="img/loader.gif"/>

        </div>
    </div>
</div>
</body>
</html>