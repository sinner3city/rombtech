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

function runloader(){
    $(".ploader").fadeIn(500);    
}
function stoploader(){
    $(".ploader").fadeOut(3500);    
}

function plogin_mypresta(url){
    runloader();
    window.top.location.replace(url);
}