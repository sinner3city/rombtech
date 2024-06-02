<?php
class AuthController extends AuthControllerCore
{
    /*
    * module: eicaptcha
    * date: 2021-02-09 16:09:58
    * version: 2.0.7
    */
    public function initContent()
    {
        if ( Tools::isSubmit('submitCreate') ) {
            Hook::exec('actionContactFormSubmitCaptcha');
              if ( ! sizeof( $this->context->controller->errors ) ) {
                parent::initContent();
            } else {
                $register_form = $this
                ->makeCustomerForm()
                ->setGuestAllowed(false)
                ->fillWith(Tools::getAllValues());
                FrontController::initContent();
                $this->context->smarty->assign([
                    'register_form' => $register_form->getProxy(),
                    'hook_create_account_top' => Hook::exec('displayCustomerAccountFormTop')
                ]);
                $this->setTemplate('customer/registration');
            }
        } else {
            parent::initContent();
        }
    }
}
