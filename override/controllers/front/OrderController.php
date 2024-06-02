<?php
class OrderController extends OrderControllerCore
{
    /*
    * module: eicaptcha
    * date: 2021-02-09 16:09:59
    * version: 2.0.7
    */
    public function postProcess()
    {
        if (
            Tools::isSubmit('submitCreate')
            && Module::isInstalled('eicaptcha')
            && Module::isEnabled('eicaptcha')
            && false === Module::getInstanceByName('eicaptcha')->hookActionContactFormSubmitCaptcha([])
            && !empty($this->errors)
        ) {
            unset($_POST['submitCreate']);
        }
        parent::postProcess();
    }
}