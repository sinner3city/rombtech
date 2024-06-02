<?php
/**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */

use PrestaShop\PrestaShop\Core\Payment\PaymentOption;

if (!defined('_PS_VERSION_')) {
    exit;
}

class Ps_Przelewbankowy extends PaymentModule
{
    const FLAG_DISPLAY_PAYMENT_INVITE = 'BANK_PRZELEW_PAYMENT_INVITE';

    protected $_html = '';
    protected $_postErrors = array();

    public $details;
    public $owner;
    public $address;
    public $extra_mail_vars;

    public function __construct()
    {
        $this->name = 'ps_przelewbankowy';
        $this->tab = 'payments_gateways';
        $this->version = '2.1.0';
        $this->ps_versions_compliancy = array('min' => '1.7.1.0', 'max' => _PS_VERSION_);
        $this->author = 'PrestaShop';
        $this->controllers = array('payment', 'validation');
        $this->is_eu_compatible = 1;

        $this->currencies = true;
        $this->currencies_mode = 'checkbox';

        $config = Configuration::getMultiple(array('BANK_PRZELEW_DETAILS', 'BANK_PRZELEW_OWNER', 'BANK_PRZELEW_ADDRESS', 'BANK_PRZELEW_RESERVATION_DAYS'));
        if (!empty($config['BANK_PRZELEW_OWNER'])) {
            $this->owner = $config['BANK_PRZELEW_OWNER'];
        }
        if (!empty($config['BANK_PRZELEW_DETAILS'])) {
            $this->details = $config['BANK_PRZELEW_DETAILS'];
        }
        if (!empty($config['BANK_PRZELEW_ADDRESS'])) {
            $this->address = $config['BANK_PRZELEW_ADDRESS'];
        }
        if (!empty($config['BANK_PRZELEW_RESERVATION_DAYS'])) {
            $this->reservation_days = $config['BANK_PRZELEW_RESERVATION_DAYS'];
        }

        $this->bootstrap = true;
        parent::__construct();

        $this->displayName = $this->trans('Przelew payment', array(), 'Modules.Przelewpayment.Admin');
        $this->description = $this->trans('Accept przelew payments by displaying your account details during the checkout and make it easy for your customers to purchase on your store.', array(), 'Modules.Przelewpayment.Admin');
        $this->confirmUninstall = $this->trans('Are you sure about removing these details?', array(), 'Modules.Przelewpayment.Admin');
        if (!isset($this->owner) || !isset($this->details) || !isset($this->address)) {
            $this->warning = $this->trans('Account owner and account details must be configured before using this module.', array(), 'Modules.Przelewpayment.Admin');
        }
        if (!count(Currency::checkPaymentCurrencies($this->id))) {
            $this->warning = $this->trans('No currency has been set for this module.', array(), 'Modules.Przelewpayment.Admin');
        }

        $this->extra_mail_vars = array(
                                        '{bankprzelew_owner}' => Configuration::get('BANK_PRZELEW_OWNER'),
                                        '{bankprzelew_details}' => nl2br(Configuration::get('BANK_PRZELEW_DETAILS')),
                                        '{bankprzelew_address}' => nl2br(Configuration::get('BANK_PRZELEW_ADDRESS')),
                                        );
    }

    public function install()
    {
        Configuration::updateValue(self::FLAG_DISPLAY_PAYMENT_INVITE, true);
        if (!parent::install() || !$this->registerHook('paymentReturn') || !$this->registerHook('paymentOptions')) {
            return false;
        }
        return true;
    }

    public function uninstall()
    {
        $languages = Language::getLanguages(false);
        foreach ($languages as $lang) {
            if (!Configuration::deleteByName('BANK_PRZELEW_CUSTOM_TEXT', $lang['id_lang'])) {
                return false;
            }
        }

        if (!Configuration::deleteByName('BANK_PRZELEW_DETAILS')
                || !Configuration::deleteByName('BANK_PRZELEW_OWNER')
                || !Configuration::deleteByName('BANK_PRZELEW_ADDRESS')
                || !Configuration::deleteByName('BANK_PRZELEW_RESERVATION_DAYS')
                || !Configuration::deleteByName(self::FLAG_DISPLAY_PAYMENT_INVITE)
                || !parent::uninstall()) {
            return false;
        }
        return true;
    }

    protected function _postValidation()
    {
        if (Tools::isSubmit('btnSubmit')) {
            Configuration::updateValue(self::FLAG_DISPLAY_PAYMENT_INVITE,
                Tools::getValue(self::FLAG_DISPLAY_PAYMENT_INVITE));

            if (!Tools::getValue('BANK_PRZELEW_DETAILS')) {
                $this->_postErrors[] = $this->trans('Account details are required.', array(), 'Modules.Przelewpayment.Admin');
            } elseif (!Tools::getValue('BANK_PRZELEW_OWNER')) {
                $this->_postErrors[] = $this->trans('Account owner is required.', array(), "Modules.Przelewpayment.Admin");
            }
        }
    }

    protected function _postProcess()
    {
        if (Tools::isSubmit('btnSubmit')) {
            Configuration::updateValue('BANK_PRZELEW_DETAILS', Tools::getValue('BANK_PRZELEW_DETAILS'));
            Configuration::updateValue('BANK_PRZELEW_OWNER', Tools::getValue('BANK_PRZELEW_OWNER'));
            Configuration::updateValue('BANK_PRZELEW_ADDRESS', Tools::getValue('BANK_PRZELEW_ADDRESS'));

            $custom_text = array();
            $languages = Language::getLanguages(false);
            foreach ($languages as $lang) {
                if (Tools::getIsset('BANK_PRZELEW_CUSTOM_TEXT_'.$lang['id_lang'])) {
                    $custom_text[$lang['id_lang']] = Tools::getValue('BANK_PRZELEW_CUSTOM_TEXT_'.$lang['id_lang']);
                }
            }
            Configuration::updateValue('BANK_PRZELEW_RESERVATION_DAYS', Tools::getValue('BANK_PRZELEW_RESERVATION_DAYS'));
            Configuration::updateValue('BANK_PRZELEW_CUSTOM_TEXT', $custom_text);
        }
        $this->_html .= $this->displayConfirmation($this->trans('Settings updated', array(), 'Admin.Global'));
    }

    protected function _displayBankPrzelew()
    {
        return $this->display(__FILE__, 'infos.tpl');
    }

    public function getContent()
    {
        if (Tools::isSubmit('btnSubmit')) {
            $this->_postValidation();
            if (!count($this->_postErrors)) {
                $this->_postProcess();
            } else {
                foreach ($this->_postErrors as $err) {
                    $this->_html .= $this->displayError($err);
                }
            }
        } else {
            $this->_html .= '<br />';
        }

        $this->_html .= $this->_displayBankPrzelew();
        $this->_html .= $this->renderForm();

        return $this->_html;
    }

    public function hookPaymentOptions($params)
    {
        if (!$this->active) {
            return [];
        }

        if (!$this->checkCurrency($params['cart'])) {
            return [];
        }

        $this->smarty->assign(
            $this->getTemplateVarInfos()
        );

        $newOption = new PaymentOption();
        $newOption->setModuleName($this->name)
                ->setCallToActionText($this->trans('Pay by bank przelew', array(), 'Modules.Przelewpayment.Shop'))
                ->setAction($this->context->link->getModuleLink($this->name, 'validation', array(), true))
                ->setAdditionalInformation($this->fetch('module:ps_przelewbankowy/views/templates/hook/ps_przelewbankowy_intro.tpl'));
        $payment_options = [
            $newOption,
        ];

        return $payment_options;
    }

    public function hookPaymentReturn($params)
    {
        if (!$this->active || !Configuration::get(self::FLAG_DISPLAY_PAYMENT_INVITE)) {
            return;
        }

        $state = $params['order']->getCurrentState();
        if (
            in_array(
                $state,
                array(
                    Configuration::get('PS_OS_BANKPRZELEW'),
                    Configuration::get('PS_OS_OUTOFSTOCK'),
                    Configuration::get('PS_OS_OUTOFSTOCK_UNPAID'),
                )
        )) {
            $bankprzelewOwner = $this->owner;
            if (!$bankprzelewOwner) {
                $bankprzelewOwner = '___________';
            }

            $bankprzelewDetails = Tools::nl2br($this->details);
            if (!$bankprzelewDetails) {
                $bankprzelewDetails = '___________';
            }

            $bankprzelewAddress = Tools::nl2br($this->address);
            if (!$bankprzelewAddress) {
                $bankprzelewAddress = '___________';
            }

            $totalToPaid = $params['order']->getOrdersTotalPaid() - $params['order']->getTotalPaid();
            $this->smarty->assign(array(
                'shop_name' => $this->context->shop->name,
                'total' => Tools::displayPrice(
                    $totalToPaid,
                    new Currency($params['order']->id_currency),
                    false
                ),
                'bankprzelewDetails' => $bankprzelewDetails,
                'bankprzelewAddress' => $bankprzelewAddress,
                'bankprzelewOwner' => $bankprzelewOwner,
                'status' => 'ok',
                'reference' => $params['order']->reference,
                'contact_url' => $this->context->link->getPageLink('contact', true)
            ));
        } else {
            $this->smarty->assign(
                array(
                    'status' => 'failed',
                    'contact_url' => $this->context->link->getPageLink('contact', true),
                )
            );
        }

        return $this->fetch('module:ps_przelewbankowy/views/templates/hook/payment_return.tpl');
    }

    public function checkCurrency($cart)
    {
        $currency_order = new Currency($cart->id_currency);
        $currencies_module = $this->getCurrency($cart->id_currency);

        if (is_array($currencies_module)) {
            foreach ($currencies_module as $currency_module) {
                if ($currency_order->id == $currency_module['id_currency']) {
                    return true;
                }
            }
        }
        return false;
    }

    public function renderForm()
    {
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->trans('Account details', array(), 'Modules.Przelewpayment.Admin'),
                    'icon' => 'icon-envelope'
                ),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->trans('Account owner', array(), 'Modules.Przelewpayment.Admin'),
                        'name' => 'BANK_PRZELEW_OWNER',
                        'required' => true
                    ),
                    array(
                        'type' => 'textarea',
                        'label' => $this->trans('Account details', array(), 'Modules.Przelewpayment.Admin'),
                        'name' => 'BANK_PRZELEW_DETAILS',
                        'desc' => $this->trans('Such as bank branch, IBAN number, BIC, etc.', array(), 'Modules.Przelewpayment.Admin'),
                        'required' => true
                    ),
                    array(
                        'type' => 'textarea',
                        'label' => $this->trans('Bank address', array(), 'Modules.Przelewpayment.Admin'),
                        'name' => 'BANK_PRZELEW_ADDRESS',
                        'required' => true
                    ),
                ),
                'submit' => array(
                    'title' => $this->trans('Save', array(), 'Admin.Actions'),
                )
            ),
        );
        $fields_form_customization = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->trans('Customization', array(), 'Modules.Przelewpayment.Admin'),
                    'icon' => 'icon-cogs'
                ),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->trans('Reservation period', array(), 'Modules.Przelewpayment.Admin'),
                        'desc' => $this->trans('Number of days the items remain reserved', array(), 'Modules.Przelewpayment.Admin'),
                        'name' => 'BANK_PRZELEW_RESERVATION_DAYS',
                    ),
                    array(
                        'type' => 'textarea',
                        'label' => $this->trans('Information to the customer', array(), 'Modules.Przelewpayment.Admin'),
                        'name' => 'BANK_PRZELEW_CUSTOM_TEXT',
                        'desc' => $this->trans('Information on the bank transfer (processing time, starting of the shipping...)', array(), 'Modules.Przelewpayment.Admin'),
                        'lang' => true
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->trans('Display the invitation to pay in the order confirmation page', array(), 'Modules.Przelewpayment.Admin'),
                        'name' => self::FLAG_DISPLAY_PAYMENT_INVITE,
                        'is_bool' => true,
                        'hint' => $this->trans('Your country\'s legislation may require you to send the invitation to pay by email only. Disabling the option will hide the invitation on the confirmation page.', array(), 'Modules.Przelewpayment.Admin'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->trans('Enabled', array(), 'Admin.Global'),
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->trans('Disabled', array(), 'Admin.Global'),
                            )
                        ),
                    ),
                ),
                'submit' => array(
                    'title' => $this->trans('Save', array(), 'Admin.Actions'),
                )
            ),
        );

        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->default_form_language = $lang->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? : 0;
        $this->fields_form = array();
        $helper->id = (int)Tools::getValue('id_carrier');
        $helper->identifier = $this->identifier;
        $helper->submit_action = 'btnSubmit';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false).'&configure='
            .$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFieldsValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id
        );

        return $helper->generateForm(array($fields_form, $fields_form_customization));
    }

    public function getConfigFieldsValues()
    {
        $custom_text = array();
        $languages = Language::getLanguages(false);
        foreach ($languages as $lang) {
            $custom_text[$lang['id_lang']] = Tools::getValue(
                'BANK_PRZELEW_CUSTOM_TEXT_'.$lang['id_lang'],
                Configuration::get('BANK_PRZELEW_CUSTOM_TEXT', $lang['id_lang'])
            );
        }

        return array(
            'BANK_PRZELEW_DETAILS' => Tools::getValue('BANK_PRZELEW_DETAILS', Configuration::get('BANK_PRZELEW_DETAILS')),
            'BANK_PRZELEW_OWNER' => Tools::getValue('BANK_PRZELEW_OWNER', Configuration::get('BANK_PRZELEW_OWNER')),
            'BANK_PRZELEW_ADDRESS' => Tools::getValue('BANK_PRZELEW_ADDRESS', Configuration::get('BANK_PRZELEW_ADDRESS')),
            'BANK_PRZELEW_RESERVATION_DAYS' => Tools::getValue('BANK_PRZELEW_RESERVATION_DAYS', Configuration::get('BANK_PRZELEW_RESERVATION_DAYS')),
            'BANK_PRZELEW_CUSTOM_TEXT' => $custom_text,
            self::FLAG_DISPLAY_PAYMENT_INVITE => Tools::getValue(self::FLAG_DISPLAY_PAYMENT_INVITE,
                Configuration::get(self::FLAG_DISPLAY_PAYMENT_INVITE))
        );
    }

    public function getTemplateVarInfos()
    {
        $cart = $this->context->cart;
        $total = sprintf(
            $this->trans('%1$s (tax incl.)', array(), 'Modules.Przelewpayment.Shop'),
            Tools::displayPrice($cart->getOrderTotal(true, Cart::BOTH))
        );

         $bankprzelewOwner = $this->owner;
        if (!$bankprzelewOwner) {
            $bankprzelewOwner = '___________';
        }

        $bankprzelewDetails = Tools::nl2br($this->details);
        if (!$bankprzelewDetails) {
            $bankprzelewDetails = '___________';
        }

        $bankprzelewAddress = Tools::nl2br($this->address);
        if (!$bankprzelewAddress) {
            $bankprzelewAddress = '___________';
        }

        $bankprzelewReservationDays = Configuration::get('BANK_PRZELEW_RESERVATION_DAYS');
        if (false === $bankprzelewReservationDays) {
            $bankprzelewReservationDays = 7;
        }

        $bankprzelewCustomText = Tools::nl2br(Configuration::get('BANK_PRZELEW_CUSTOM_TEXT', $this->context->language->id));
        if (false === $bankprzelewCustomText) {
            $bankprzelewCustomText = '';
        }

        return array(
            'total' => $total,
            'bankprzelewDetails' => $bankprzelewDetails,
            'bankprzelewAddress' => $bankprzelewAddress,
            'bankprzelewOwner' => $bankprzelewOwner,
            'bankprzelewReservationDays' => (int)$bankprzelewReservationDays,
            'bankprzelewCustomText' => $bankprzelewCustomText,
        );
    }
}
