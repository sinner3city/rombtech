<?php
/**
 * Copyright 2015-2017 NETCAT (www.netcat.pl)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author NETCAT <firma@netcat.pl>
 * @copyright 2015-2017 NETCAT (www.netcat.pl)
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */

if (! defined('_PS_VERSION_')) {
    exit();
}

/**
 * Main NIP24 integration class
 */
class GusApiNip24pl extends Module
{
	const V1 = 1;
	const V2 = 2;
	
	private $psver;
    private $nip24;

    /**
     * Constructor
     */
    public function __construct()
    {
        // required stuff
        $this->name = 'gusapinip24pl';
        $this->tab = 'billing_invoicing';
        $this->version = '1.3.0';
        $this->author = 'nip24.pl';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array(
            'min' => '1.6.0.5',
            'max' => _PS_VERSION_
        );
        $this->secure_key = Tools::encrypt($this->name);
        $this->bootstrap = true;
        
        parent::__construct();
        
        $this->displayName = $this->l('NIP24 for PrestaShop');
        $this->description = $this->l('Plugin that integrates PrestaShop with NIP24 Service.');
        
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
		
		// version
		$this->psver = self::V1;
		
		if (substr(_PS_VERSION_, 0, 3) === '1.7') {
			$this->psver = self::V2;
		}
        
        // nip24 api
        require_once dirname(__FILE__) . '/NIP24/NIP24Client.php';
        
        \NIP24\NIP24Client::registerAutoloader();
        
        // create new client object
        $this->nip24 = new \NIP24\NIP24Client(Configuration::get('NIP24_OPTION_KEYID'), Configuration::get('NIP24_OPTION_KEY'));
        
        $this->nip24->setApp('PrestaShop/' . _PS_VERSION_);
        
        // url
        $url = Configuration::get('NIP24_OPTION_URL');
        
        if ($url != \NIP24\NIP24Client::PRODUCTION_URL && Tools::strlen($url) > 0) {
            $this->nip24->setURL($url);
        }
    }

    /**
     * Install function
     */
    public function install()
    {
        if (Shop::isFeatureActive()) {
            Shop::setContext(Shop::CONTEXT_ALL);
        }
        
        if (! parent::install()) {
            return false;
        }
        
        if (! $this->registerHook('header')) {
            return false;
        }
        
        return true;
    }

    /**
     * Uninstall function
     */
    public function uninstall()
    {
        if (! parent::uninstall()) {
            return false;
        }
        
        return true;
    }

    public function hookDisplayHeader()
    {
        $allowed_controllers = array(
            'address',
            'authentication',
            'order-opc',
			'order'
        );
        
		$_controller = $this->context->controller;
        $html = '';
        
        if (isset($_controller->php_self) && in_array($_controller->php_self, $allowed_controllers)) {
            $this->context->controller->addCSS($this->_path . 'views/css/gusapinip24pl.css', 'all');
			
			if ($this->psver == self::V2) {
				$this->context->controller->addJquery();
				$this->context->controller->addJS($this->_path . 'views/js/gusapinip24pl.v2.js', 'all');

				$html = '<script type="text/javascript">
					var nip24BaseDir = "' . (Configuration::get('PS_SSL_ENABLED') ? _PS_BASE_URL_SSL_ : _PS_BASE_URL_) . __PS_BASE_URI__ . '";
					var nip24StrEnter = "' . $this->l('Enter VAT ID number and press Fetch data button.') . '";
					var nip24StrVatID = "' . $this->l('VAT ID') . '";
					var nip24StrVatIDInvalid = "' . $this->l('VAT ID is invalid!') . '";
					var nip24StrOutdated = "' . $this->l('Data outdated?') . '";
					var nip24StrGet = "' . $this->l('Fetch data') . '";
					var nip24StrUpdate = "' . $this->l('Click here!') . '";
					</script>';
			}
			else {
				// v1 - default
				$this->context->controller->addJS($this->_path . 'views/js/gusapinip24pl.v1.js', 'all');

				$html = '<script type="text/javascript">
					$(document).ready(function() {
						if ($("#add_address").length > 0) {
							$("#add_address").prepend(' . $this->getSearchBlock('add') . ');
						}

						if ($("#new_account_form").length > 0) {
							if ($("#new_account_form #guest_email").length > 0) {
								$(' . $this->getSearchBlock('guest') . ').insertBefore($("#new_account_form #guest_email").parent());
							}
							else if ($("#new_account_form #email").length > 0) {
								$(' . $this->getSearchBlock('guest') . ').insertBefore($("#new_account_form #email").parent());
							}

							$(' . $this->getSearchBlock('invoice') . ').insertBefore($("#new_account_form #firstname_invoice").parent());
						}
					});
					</script>';
			}
        }
        
        return $html;
    }

    /**
     * Configuration page content
     * 
     * @return string
     */
    public function getContent()
    {
        $output = null;
        
        if (Tools::isSubmit('submit' . $this->name)) {
            $url = trim(strval(Tools::getValue('NIP24_OPTION_URL')));
            $keyid = trim(strval(Tools::getValue('NIP24_OPTION_KEYID')));
            $key = trim(strval(Tools::getValue('NIP24_OPTION_KEY')));
            
            if (! $url || empty($url)) {
                $output .= $this->displayError($this->l('Invalid NIP24 service address.'));
            } else {
                if (! $keyid || empty($keyid)) {
                    $output .= $this->displayError($this->l('Invalid NIP24 API key identifier.'));
                } else { 
                    if (! $key || empty($key)) {
                        $output .= $this->displayError($this->l('Invalid NIP24 API key value.'));
                    } else {
                        Configuration::updateValue('NIP24_OPTION_URL', $url);
                        Configuration::updateValue('NIP24_OPTION_KEYID', $keyid);
                        Configuration::updateValue('NIP24_OPTION_KEY', $key);
                        
                        $output .= $this->displayConfirmation($this->l('Settings updated.'));
                    }
                }
            }
        }
        
        return $output . $this->displayForm();
    }

    /**
     * Configuration page form
     */
    public function displayForm()
    {
        // get default language
        $default_lang = (int) Configuration::get('PS_LANG_DEFAULT');
        
        // init fields form array
        $fields_form[0]['form'] = array(
            'legend' => array(
                'title' => $this->l('Settings')
            ),
            'input' => array(
                array(
                    'type' => 'text',
                    'label' => $this->l('Service address'),
                    'name' => 'NIP24_OPTION_URL',
                    'size' => 20,
                    'required' => true
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('API key identifier'),
                    'name' => 'NIP24_OPTION_KEYID',
                    'size' => 20,
                    'required' => true
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('API key value'),
                    'name' => 'NIP24_OPTION_KEY',
                    'size' => 20,
                    'required' => true
                )
            ),
            'submit' => array(
                'title' => $this->l('Save'),
                'class' => 'btn btn-default pull-right'
            )
        );
        
        $helper = new HelperForm();
        
        // module, token and currentIndex
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->name;
        
        // lang
        $helper->default_form_language = $default_lang;
        $helper->allow_employee_form_lang = $default_lang;
        
        // title and toolbar
        $helper->title = $this->displayName;
        $helper->show_toolbar = true;
        $helper->toolbar_scroll = true;
        $helper->submit_action = 'submit' . $this->name;
        $helper->toolbar_btn = array(
            'save' => array(
                'desc' => $this->l('Save'),
                'href' => AdminController::$currentIndex . '&configure=' . $this->name . '&save' . $this->name . '&token=' . Tools::getAdminTokenLite('AdminModules')
            ),
            'back' => array(
                'desc' => $this->l('Back to list'),
                'href' => AdminController::$currentIndex . '&token=' . Tools::getAdminTokenLite('AdminModules')
            )
        );
        
        // load current values
        $helper->fields_value['NIP24_OPTION_URL'] = Configuration::get('NIP24_OPTION_URL');
        $helper->fields_value['NIP24_OPTION_KEYID'] = Configuration::get('NIP24_OPTION_KEYID');
        $helper->fields_value['NIP24_OPTION_KEY'] = Configuration::get('NIP24_OPTION_KEY');
        
        if (! $helper->fields_value['NIP24_OPTION_URL'] || empty($helper->fields_value['NIP24_OPTION_URL'])) {
            $helper->fields_value['NIP24_OPTION_URL'] = \NIP24\NIP24Client::PRODUCTION_URL;
        }
        
        return $helper->generateForm($fields_form);
    }

    /**
     * Action for checking VAT ID value
     * 
     * @return JSON
     */
    public function checkNIP($nip)
    {
        // check
        $res = '';
        
        if (\NIP24\NIP::isValid($nip)) {
            $res = '{"result":"OK"}';
        } else {
            $res = '{"result":"ERR"}';
        }
        
        echo $res;
    }

    /**
     * Get invoice data for specified NIP number
     * 
     * @param string $nip
     *            NIP number
     * @param bool $force
     *            false - get current data, true - force refresh
     * @param string $form
     *            form name
     * @return JSON|false
     */
    public function getInvoiceData($nip, $force, $form)
	{
		if ($this->psver == self::V2) {
			return $this->getInvoiceDataV2($nip, $force, $form);
		}
		else {
			// v1 - default
			return $this->getInvoiceDataV1($nip, $force, $form);
		}
	}
	
    private function getInvoiceDataV1($nip, $force, $form)
    {
        // get data
        $data = $this->nip24->getInvoiceDataExt(\NIP24\Number::NIP, $nip, $force == "true" ? true : false);
        $res = '';
        
        if (! $data) {
            return $res;
        }
        
        if ($form == 'guest') {
            // guest address
            $res = '{"form_id":"new_account_form"'
                . ', "firstname":' . Tools::jsonEncode($data->firstname)
                . ', "lastname":' . Tools::jsonEncode($data->lastname)
                . ', "company":' . Tools::jsonEncode($data->name)
                . ', "vat-number":' . Tools::jsonEncode($data->nip)
                . ', "vat_number":' . Tools::jsonEncode($data->nip)
                . ', "address1":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
                . ', "postcode":' . Tools::jsonEncode($data->postCode)
                . ', "city":' . Tools::jsonEncode($data->city)
                . ', "phone_mobile":' . Tools::jsonEncode($data->phone)
                . ', "phone":' . Tools::jsonEncode($data->phone)
                . ', "guest_email":' . Tools::jsonEncode($data->email)
                . ', "email":' . Tools::jsonEncode($data->email) . '}';
        } else {
            if ($form == 'invoice') {
                // invoice address
                $res = '{"form_id":"new_account_form"'
                    . ', "firstname_invoice":' . Tools::jsonEncode($data->firstname)
                    . ', "lastname_invoice":' . Tools::jsonEncode($data->lastname)
                    . ', "company_invoice":' . Tools::jsonEncode($data->name)
                    . ', "vat-number_invoice":' . Tools::jsonEncode($data->nip)
                    . ', "vat_number_invoice":' . Tools::jsonEncode($data->nip)
                    . ', "address1_invoice":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
                    . ', "postcode_invoice":' . Tools::jsonEncode($data->postCode)
                    . ', "city_invoice":' . Tools::jsonEncode($data->city)
                    . ', "phone_mobile_invoice":' . Tools::jsonEncode($data->phone)
                    . ', "phone_invoice":' . Tools::jsonEncode($data->phone) . '}';
            } else {
                // add_address form
                $res = '{"form_id":"add_address"'
                    . ', "firstname":' . Tools::jsonEncode($data->firstname)
                    . ', "lastname":' . Tools::jsonEncode($data->lastname)
                    . ', "company":' . Tools::jsonEncode($data->name)
                    . ', "vat-number":' . Tools::jsonEncode($data->nip)
                    . ', "vat_number":' . Tools::jsonEncode($data->nip)
                    . ', "address1":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
                    . ', "postcode":' . Tools::jsonEncode($data->postCode)
                    . ', "city":' . Tools::jsonEncode($data->city)
                    . ', "phone_mobile":' . Tools::jsonEncode($data->phone)
                    . ', "phone":' . Tools::jsonEncode($data->phone) . '}';
            }
        }
        
        echo $res;
    }

    private function getInvoiceDataV2($nip, $force, $form)
    {
        // get data
        $data = $this->nip24->getInvoiceDataExt(\NIP24\Number::NIP, $nip, $force == "true" ? true : false);
        $res = '';
        
        if (! $data) {
            return $res;
        }
        
        if ($form == 'guest') {
            // guest address
            $res = '{"form_id":"#new_account_form"'
                . ', "#firstname":' . Tools::jsonEncode($data->firstname)
                . ', "#lastname":' . Tools::jsonEncode($data->lastname)
                . ', "#company":' . Tools::jsonEncode($data->name)
                . ', "#vat-number":' . Tools::jsonEncode($data->nip)
                . ', "#vat_number":' . Tools::jsonEncode($data->nip)
                . ', "#address1":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
                . ', "#postcode":' . Tools::jsonEncode($data->postCode)
                . ', "#city":' . Tools::jsonEncode($data->city)
                . ', "#phone_mobile":' . Tools::jsonEncode($data->phone)
                . ', "#phone":' . Tools::jsonEncode($data->phone)
                . ', "#guest_email":' . Tools::jsonEncode($data->email)
                . ', "#email":' . Tools::jsonEncode($data->email) . '}';
        }
		else if ($form == 'delivery') {
            // checkout address
            $res = '{"form_id":"section#checkout-addresses-step form div#delivery-address"'
                . ', "input[name=firstname]":' . Tools::jsonEncode($data->firstname)
                . ', "input[name=lastname]":' . Tools::jsonEncode($data->lastname)
                . ', "input[name=company]":' . Tools::jsonEncode($data->name)
                . ', "input[name=vat_number]":' . Tools::jsonEncode($data->nip)
                . ', "input[name=address1]":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
                . ', "input[name=postcode]":' . Tools::jsonEncode($data->postCode)
                . ', "input[name=city]":' . Tools::jsonEncode($data->city)
                . ', "input[name=phone]":' . Tools::jsonEncode($data->phone)
                . ', "input[name=guest_email]":' . Tools::jsonEncode($data->email)
                . ', "input[name=email]":' . Tools::jsonEncode($data->email) . '}';
		}
		else if ($form == 'invoice') {
            // checkout address
            $res = '{"form_id":"section#checkout-addresses-step div#invoice-address form"'
                . ', "input[name=firstname]":' . Tools::jsonEncode($data->firstname)
                . ', "input[name=lastname]":' . Tools::jsonEncode($data->lastname)
                . ', "input[name=company]":' . Tools::jsonEncode($data->name)
                . ', "input[name=vat_number]":' . Tools::jsonEncode($data->nip)
                . ', "input[name=address1]":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
                . ', "input[name=postcode]":' . Tools::jsonEncode($data->postCode)
                . ', "input[name=city]":' . Tools::jsonEncode($data->city)
                . ', "input[name=phone]":' . Tools::jsonEncode($data->phone)
                . ', "input[name=guest_email]":' . Tools::jsonEncode($data->email)
                . ', "input[name=email]":' . Tools::jsonEncode($data->email) . '}';
		}
		else if ($form == 'address') {
            // add new address
            $res = '{"form_id":"div.address-form form"'
                . ', "input[name=firstname]":' . Tools::jsonEncode($data->firstname)
                . ', "input[name=lastname]":' . Tools::jsonEncode($data->lastname)
                . ', "input[name=company]":' . Tools::jsonEncode($data->name)
                . ', "input[name=vat_number]":' . Tools::jsonEncode($data->nip)
                . ', "input[name=address1]":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
                . ', "input[name=postcode]":' . Tools::jsonEncode($data->postCode)
                . ', "input[name=city]":' . Tools::jsonEncode($data->city)
                . ', "input[name=phone]":' . Tools::jsonEncode($data->phone)
                . ', "input[name=guest_email]":' . Tools::jsonEncode($data->email)
                . ', "input[name=email]":' . Tools::jsonEncode($data->email) . '}';
		}
		else if ($form == 'invoice') {
			// invoice address
			$res = '{"form_id":"#new_account_form"'
				. ', "#firstname_invoice":' . Tools::jsonEncode($data->firstname)
				. ', "#lastname_invoice":' . Tools::jsonEncode($data->lastname)
				. ', "#company_invoice":' . Tools::jsonEncode($data->name)
				. ', "#vat-number_invoice":' . Tools::jsonEncode($data->nip)
				. ', "#vat_number_invoice":' . Tools::jsonEncode($data->nip)
				. ', "#address1_invoice":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
				. ', "#postcode_invoice":' . Tools::jsonEncode($data->postCode)
				. ', "#city_invoice":' . Tools::jsonEncode($data->city)
				. ', "#phone_mobile_invoice":' . Tools::jsonEncode($data->phone)
				. ', "#phone_invoice":' . Tools::jsonEncode($data->phone) . '}';
		}
		else {
			// add_address form
			$res = '{"form_id":"#add_address"'
				. ', "#firstname":' . Tools::jsonEncode($data->firstname)
				. ', "#lastname":' . Tools::jsonEncode($data->lastname)
				. ', "#company":' . Tools::jsonEncode($data->name)
				. ', "#vat-number":' . Tools::jsonEncode($data->nip)
				. ', "#vat_number":' . Tools::jsonEncode($data->nip)
				. ', "#address1":' . Tools::jsonEncode($data->street . ' ' . $data->streetNumber . (empty($data->houseNumber) ? '' : '/' . $data->houseNumber))
				. ', "#postcode":' . Tools::jsonEncode($data->postCode)
				. ', "#city":' . Tools::jsonEncode($data->city)
				. ', "#phone_mobile":' . Tools::jsonEncode($data->phone)
				. ', "#phone":' . Tools::jsonEncode($data->phone) . '}';
		}
        
        echo $res;
    }

	/**
     * Get search block HTML code
     * 
     * @param string $form
     *            form name
     * @return string
     */
    private function getSearchBlock($form)
    {
        return '"<div id=\"nip24_' . $form . '_form\" class=\"std nip24-search-block\">'
            . '<p class=\"info-title\">' . $this->l('Enter VAT ID number and press Fetch data button.') . '</p>'
            . '<div class=\"form-group\">'
            . '<label for=\"nip24_' . $form . '_form_nip\">' . $this->l('VAT ID') . '</label>'
            . '<input id=\"nip24_' . $form . '_form_nip\" class=\"form-control validate\" data-validate=\"isGenericName\" name=\"nip\" type=\"text\"></input>'
            . '</div>'
            . '<p class=\"submit2\">'
            . '<button id=\"nip24_' . $form . '_form_get\" class=\"nip24-btn-fetch btn btn-default button button-medium\" type=\"button\" name=\"get\" onclick=\"nip24GetInvoiceData(false, \'' . $form . '\');\">' . $this->l('Fetch data') . '</button>' . '</p>' . '<p id=\"nip24_' . $form . '_form_err\" class=\"required\" style=\"display:none;\">' . $this->l('VAT ID is invalid!')
            . '</p>'
            . '<p id=\"nip24_' . $form . '_form_q\" class=\"required\" style=\"display:none;\">' . $this->l('Data outdated?') . ' <a href=\"javascript:nip24GetInvoiceData(true, \'' . $form . '\');\">' . $this->l('Click here!') . '</a></p>'
            . '<div class=\"clearfix\"></div>'
            . '</div>"';
    }
}

/* EOF */
