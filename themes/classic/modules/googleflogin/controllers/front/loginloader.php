<?php


include_once(dirname(__FILE__) . '../../../googleflogin.php');

class googlefloginloginloaderModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        $thismodule = new googleflogin();
        $thismodule = new googleflogin();
        $thismodule->verifycustomer(Tools::getValue('resp'));
        die();
    }
}