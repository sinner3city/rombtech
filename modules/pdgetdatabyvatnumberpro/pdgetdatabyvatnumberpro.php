<?php
/**
* 2012-2018 Patryk Marek PrestaDev.pl
*
* Patryk Marek PrestaDev.pl - Pd Get data by vat number Pro © All rights reserved.
*
* DISCLAIMER
*
* Do not edit, modify or copy this file.
* If you wish to customize it, contact us at info@prestadev.pl.
*
* @author    Patryk Marek PrestaDev.pl <info@prestadev.pl>
* @copyright 2012-2018 Patryk Marek - PrestaDev.pl
* @link      http://prestadev.pl
* @package   Pd Get data by vat number Pro for - PrestaShop 1.5.x and 1.6.x and 1.7.x
* @version   1.0.2
* @license   License is for use in domain / or one multistore enviroment (do not modify or reuse this code or part of it) if you want any changes please contact with me at info@prestadev.pl
* @date      7-06-2018
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once(__DIR__ . '/vendor/autoload.php');
require_once(__DIR__ . '/vendor/vat-validation/vatValidation.class.php');

class PdGetDataByVatnumberPro extends Module
{
    private static $sid = false;
    private $html = '';
    private $postErrors = array();
    public $regon_user_key;

    public function __construct()
    {
        $this->name = 'pdgetdatabyvatnumberpro';
        $this->tab = 'front_office_features';
        $this->version = '1.0.5';
        $this->author = 'PrestaDev.pl';
        $this->need_instance = 0;
        $this->module_key = '5f46066c31c75e2acfd21483395e7a4fg';
        $this->secure_key = Tools::encrypt($this->name);
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Autocomplete address data by vat number Pro');
        $this->description = $this->l('Allow to fetch customer data by VAT number using VIES or GUS database');

        $this->ps_version_15 = (version_compare(substr(_PS_VERSION_, 0, 3), '1.5', '=')) ? true : false;
        $this->ps_version_16 = (version_compare(substr(_PS_VERSION_, 0, 3), '1.6', '=')) ? true : false;
        $this->ps_version_17 = (version_compare(substr(_PS_VERSION_, 0, 3), '1.7', '=')) ? true : false;
        $this->regon_user_key = Configuration::get('PD_GDBVNP_USER_KEY');
        $this->country_iso_codes = $this->vatEUCountries();
        $this->module_dir = _MODULE_DIR_.$this->name.'/';
    }


    public function vatEUCountries()
    {
        $vat_iso_codes = array(
            '-' => $this->l('None'),
            'PL' => $this->l('Poland (PL)'),
            'AT' => $this->l('Austria (AT)'),
            'BE' => $this->l('Belgium (BE)'),
            'BG' => $this->l('Bulgaria (BG)'),
            'CY' => $this->l('Cyprus (CY)'),
            'CZ' => $this->l('Czech Republic (CZ)'),
            'DK' => $this->l('Denmark (DK)'),
            'FI' => $this->l('Finland (FI)'),
            'FR' => $this->l('France (FR)'),
            'EE' => $this->l('Estonia (ES)'),
            'DE' => $this->l('Germany (DE)'),
            'GR' => $this->l('Greece (EL)'),
            'HU' => $this->l('Hungary (HU)'),
            'IE' => $this->l('Irland (IE)'),
            'IT' => $this->l('Italy (IT)'),
            'LV' => $this->l('Latvia (LV)'),
            'LT' => $this->l('Lithuania (LT)'),
            'LU' => $this->l('Luxembourg (LU)'),
            'NL' => $this->l('Netherlands (NL)'),
            'MT' => $this->l('Malta (MT)'),
            'PT' => $this->l('Portugal (PT)'),
            'RO' => $this->l('Romania (RO)'),
            'SK' => $this->l('Slovakia (SK)'),
            'SI' => $this->l('Slovenia (SI)'),
            'ES' => $this->l('Spain (ES)'),
            'SE' => $this->l('Sweden (SE)'),
            'GB' => $this->l('United Kingdom (GB)'),
        );

        return $vat_iso_codes;
    }

    public function install()
    {
        if (!parent::install()
        || !$this->registerHook('displaySearchByNip')
        || !$this->registerHook('displayBackOfficeHeader')
        || !$this->registerHook('header')
        || !Configuration::updateValue('PD_GDBVNP_USER_KEY', '')
        ) {
            return false;
        }
        return true;
    }
    
    public function uninstall()
    {
        if (!parent::uninstall()) {
            return false;
        }
        return true;
    }
    
    /*
    ** Form Config Methods
    **
    */
    public function getContent()
    {
        if (Tools::isSubmit('btnSubmit')) {
            $this->_postValidation();
            if (!count($this->postErrors)) {
                $this->_postProcess();
            } else {
                foreach ($this->postErrors as $err) {
                    $this->html .= $this->displayError($err);
                }
            }
        } else {
            $this->html .= '<br />';
        }

        $this->html .= '<h2>'.$this->displayName.' (v'.$this->version.')</h2><p>'.$this->description.'</p>';
        $this->html .= $this->renderForm();
        $this->html .= '<br />';
        $this->html .= $this->_displayExtraForm();

        return $this->html;
    }

    public function renderForm()
    {
        $switch = version_compare(_PS_VERSION_, '1.6.0', '>=') ? 'switch' : 'radio';
        $fields_form_1 = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Module Configuration'),
                    'icon' => 'icon-cogs'
                ),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->l('User key'),
                        'desc' => $this->l('User key used to comunicate with GUS servers more info how to get key here: http://bip.stat.gov.pl/dzialalnosc-statystyki-publicznej/rejestr-regon/interfejsyapi/'),
                        'name' => 'PD_GDBVNP_USER_KEY',
                        'size' => 42,
                        'required' => true
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save settings'),
                )
            ),
        );

        $helper = new HelperForm();
        $helper->module = $this;
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->default_form_language = $lang->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
        $this->fields_form = array();

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'btnSubmit';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false).'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFieldsValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id
        );

        return $helper->generateForm(array($fields_form_1));
    }

    public function getConfigFieldsValues()
    {
        $return = array();
        $return['PD_GDBVNP_USER_KEY'] = Tools::getValue('PD_GDBVNP_USER_KEY', Configuration::get('PD_GDBVNP_USER_KEY'));
        return $return;
    }

    private function _postValidation()
    {
        if (Tools::getValue('PD_GDBVNP_USER_KEY') == '') {
            $this->postErrors[] = $this->l('Please provide user key');
        }
    }

    private function _postProcess()
    {
        Configuration::updateValue('PD_GDBVNP_USER_KEY', Tools::getValue('PD_GDBVNP_USER_KEY'));
        $this->html .= $this->displayConfirmation($this->l('Settings updated'));
    }


 	public function hookDisplayBackOfficeHeader($params)
    {
        Media::addJsDef(array(
            'pdgetdatabyvatnumberpro_secure_key' => $this->secure_key,
            'pdgetdatabyvatnumberpro_ajax_link' => $this->context->link->getModuleLink('pdgetdatabyvatnumberpro', 'ajax', array()),
            'pdgetdatabyvatnumberpro_response_ok' => Tools::htmlentitiesUTF8($this->l('Data was filled up in form'))
        ));

        if ($this->ps_version_15) {
            $this->context->controller->addCSS($this->_path.'views/css/styles_ps15.css', 'all');
        } elseif ($this->ps_version_16) {
            $this->context->controller->addCSS($this->_path.'views/css/styles_ps16.css', 'all');
        } else {
        	$this->context->controller->addCSS($this->_path.'views/css/styles_ps17.css', 'all');
        }
    }

    public function hookHeader($params)
    {
        Media::addJsDef(array(
            'pdgetdatabyvatnumberpro_secure_key' => $this->secure_key,
            'pdgetdatabyvatnumberpro_ajax_link' => $this->context->link->getModuleLink('pdgetdatabyvatnumberpro', 'ajax', array()),
            'pdgetdatabyvatnumberpro_response_ok' => Tools::htmlentitiesUTF8($this->l('Data was filled up in form'))
        ));

        if ($this->ps_version_15) {
            $this->context->controller->addCSS($this->_path.'views/css/styles_ps15.css', 'all');
        } elseif ($this->ps_version_16) {
            $this->context->controller->addCSS($this->_path.'views/css/styles_ps16.css', 'all');
        } else {
            $this->context->controller->registerStylesheet('modules-pdgetdatabyvatnumberpro-front', 'modules/'.$this->name.'/views/css/styles_ps17.css', array('media' => 'all', 'priority' => 150));
        }
    }

    public function callApiByNipAndCountryIso($nip, $nip_country_iso)
    {
        $nip = preg_replace('/[^a-zA-z0-9]/', '', $nip);
        if ($nip_country_iso == 'PL') {
            return $this->callRegonApiByNip($nip);
        } else {
            return $this->callViesApiByNip($nip, $nip_country_iso);
        }
    }

    public function getRegExpByCountryIsoCode() 
    {
        $xml = simplexml_load_file(dirname(__FILE__).'/vendor/postalCodeData.xml');
        $postcodes_regexp = array();
        foreach ($xml->postalCodeData->children() as $reg_country) {
            $iso_code = (string)$reg_country->Attributes();
            $reg_exp = (string)$reg_country;
            $postcodes_regexp[$iso_code] = $reg_exp;
        }
        return $postcodes_regexp;
    }

    public function callViesApiByNip($nip, $nip_country_iso)
    {

        $req_expresions_by_iso_code = $this->getRegExpByCountryIsoCode();
        $return_data = array();

        if (!$nip) {
            return array('error' => $this->l('Please provide vat number'));
        }

        if (!Validate::isGenericName($nip)) {
            return array('error' => $this->l('Vat number is not valid'));
        }

        $vatValidation = new vatValidation(array('debug' => false));
        $vatValidation->check($nip_country_iso, $nip);

        if ($vatValidation->isValid()) {

	        if ($nip_country_iso) {
	            $id_country = Country::getByIso($nip_country_iso);
	        } else {
	            $id_country = $this->context->country->id;
	        }

	        $address_string = $vatValidation->getAddress();
	        $address_array = explode(PHP_EOL, $address_string);

            // Sort out post code by reg expresions
            preg_match('/'.$req_expresions_by_iso_code[$nip_country_iso].'/m', $address_array[1], $matches);
	        $postcode = $matches[0];
            // end

           
            // get city
            $address_array_row_1 = explode(' ', $address_array[1]);
            $city = $address_array_row_1[1];

            return $return_data = array(
                'company' => $vatValidation->getName(),
                'postcode' => $postcode,
                'city' => $city ? $city : '',
                'firstname' => '',
                'lastname' => '',
                'address1' => isset($address_array[0]) ? $address_array[0] : '',
                'country_iso' => $nip_country_iso,
                'id_country' => $id_country,
                'vat_number' => $nip
            );
        } else {
            return array('error' => $this->l('No data found for provided vat number'));
        }
    }

    public function callRegonApiByNip($nip)
    {
        $return_data = array();

        if (!$nip) {
            return array('error' => $this->l('Please provide vat number'));
        }

        if (!Validate::isGenericName($nip)) {
            return array('error' => $this->l('Vat number is not valid'));
        }

        $gus = new \GusApi\GusApi(
            $this->regon_user_key,
            new \GusApi\Adapter\Soap\SoapAdapter(
                \GusApi\RegonConstantsInterface::BASE_WSDL_URL,
                \GusApi\RegonConstantsInterface::BASE_WSDL_ADDRESS
            )
        );

        if ($gus->serviceStatus() === \GusApi\RegonConstantsInterface::SERVICE_AVAILABLE) {
            try {
                if ((self::$sid == false) || !$gus->isLogged(self::$sid)) {
                    self::$sid = $gus->login();
                }

                if (isset($nip)) {
                    try {
                        $gusReports = $gus->getByNip(self::$sid, $nip);
                        $mapper = new \GusApi\ReportTypeMapper();
                        $reportType = $mapper->getReportType($gusReports[0]);

                        $data_full = $gus->getFullReport(
                            self::$sid,
                            $gusReports[0],
                            $reportType
                        );
                        //p($data_full);

                        if (isset($data_full->dane)) {
                            $street_name = $gusReports[0]->getStreet();
                            // adress
                            $address1 = $street_name;
                            if ((string)$data_full->dane->fiz_adSiedzNumerNieruchomosci != '') {
                                $address1 .= ' '.(string)$data_full->dane->fiz_adSiedzNumerNieruchomosci;
                            } elseif ((string)$data_full->dane->praw_adSiedzNumerNieruchomosci != '') {
                                $address1 .= ' '.(string)$data_full->dane->praw_adSiedzNumerNieruchomosci;
                            }

                            if ((string)$data_full->dane->fiz_adSiedzNumerLokalu != '') {
                                $address1 .= '/'.(string)$data_full->dane->fiz_adSiedzNumerLokalu;
                            } elseif ((string)$data_full->dane->praw_adSiedzNumerLokalu != '') {
                                $address1 .= '/'.(string)$data_full->dane->praw_adSiedzNumerLokalu;
                            }

                            // id country
                            if ((string)$data_full->dane->fiz_adSiedzKraj_Symbol != '') {
                                $iso_code = (string)$data_full->dane->fiz_adSiedzKraj_Symbol;
                            } elseif ((string)$data_full->dane->praw_adSiedzKraj_Symbol != '') {
                                $iso_code = (string)$data_full->dane->praw_adSiedzKraj_Symbol;
                            }

                            if ($iso_code) {
                                $id_country = Country::getByIso($iso_code);
                            } else {
                                $id_country = $this->context->country->id;
                            }

                            $return_data = array(
                                'company' => $gusReports[0]->getName(),
                                'postcode' => $gusReports[0]->getZipCode(),
                                'city' => $gusReports[0]->getCity(),
                                'firstname' => isset($data_full->dane->fiz_imie1) ? (string)$data_full->dane->fiz_imie1 : (string)$data_full->dane->praw_imie1,
                                'lastname' => isset($data_full->dane->fiz_nazwisko) ? (string)$data_full->dane->fiz_nazwisko : (string)$data_full->dane->praw_nazwisko,
                                'address1' => $address1,
                                'country_iso' => $iso_code,
                                'id_country' => $id_country,
                                'vat_number' => $nip
                            );
                        }
                        return $return_data;
                    } catch (\GusApi\Exception\NotFoundException $e) {
                        return array('error' => $this->l('No data found for provided vat number'));
                    }
                }
            } catch (\GusApi\Exception\InvalidUserKeyException $e) {
                return array('error' => $this->l('Bad user key!'));
            }
        } elseif ($gus->serviceStatus() === \GusApi\RegonConstantsInterface::SERVICE_UNAVAILABLE) {
            return array('error' => $this->l('Gus server is unavailable now, please try again later'));
        }
    }
    


    public function hookDisplaySearchByNip($params)
    {
        $this->smarty->assign(array(
        	'img_ps_dir' => _PS_IMG_,
            'img_dir' => $this->module_dir.'views/img/',
            'vat_iso_codes' => $this->country_iso_codes,
            'sl_country_iso' => $this->context->country->iso_code,
            'ps_version_15' => $this->ps_version_15,
            'ps_version_16' => $this->ps_version_16,
            'ps_version_17' => $this->ps_version_17
        ));

        if ($this->ps_version_17) {
            return $this->display(__FILE__, 'displaySearchForm_17.tpl');
        } else {
            return $this->display(__FILE__, 'displaySearchForm.tpl');
        }
    }


    private function _displayExtraForm()
    {

    	$admin_address_line_of_code = htmlentities('<label class="control-label col-lg-3 required" for="email">');
        if ($this->ps_version_17) {
            $this->html .= '<fieldset class="panel">
                        <div class="panel-heading">
                        <i class="icon-cogs"></i>
                        '.$this->l('Instalation instructions how to add collect data by nip to store forms').'
                        </div>
                            <div class="form-wrapper">
                            <ul>
                                <li>'.$this->l('First go to site: http://bip.stat.gov.pl/dzialalnosc-statystyki-publicznej/rejestr-regon/interfejsyapi/ and register your company to get user key to comunicate with GUS API').'</li>
                                <li>'.$this->l('When GUS send you user key please enter it in module settings abowe').'</li>
                                <li>'.$this->l('Last step is to add to choosen places in our store form to get data by NIP, belowe are instructions how to do it:').'</li>
                            </ul>
             '.$this->l('Please open file:').'
                                <b>themes/your-theme-name/templates/customer/_partials/address-form.tpl</b>
                                '.$this->l('for editing and add before block address_form_fields belowe line of code:').'
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea><br />
                            
                       '.$this->l('Please open file: (to add form to admin panel add address page)').'
                                <b>(your admin folder name)/themes/defaul/template/controller/addresses/helpers/form/form.tpl</b>
                                '.$this->l('for editing and add before ').$admin_address_line_of_code.$this->l(' add line of code:').'
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea>

	            </div>
	         </fieldset>';
        }

        if ($this->ps_version_16) {
            $this->html .= '<fieldset class="panel">
                        <div class="panel-heading">
                        <i class="icon-cogs"></i>
                        '.$this->l('Instalation instructions how to add collect data by nip to store forms').'
                        </div>
                            <div class="form-wrapper">
                            <ul>
                                <li>'.$this->l('First go to site: http://bip.stat.gov.pl/dzialalnosc-statystyki-publicznej/rejestr-regon/interfejsyapi/ and register your company to get user key to comunicate with GUS API').'</li>
                                <li>'.$this->l('When GUS send you user key please enter it in module settings abowe').'</li>
                                <li>'.$this->l('Last step is to add to choosen places in our store form to get data by NIP, belowe are instructions how to do it:').'</li>
                            </ul>

                                '.$this->l('Please open file: (to add form to coustomer address add section in my account)').'
                                <b>themes/your-theme-name/address.tpl</b>
                                '.$this->l('for editing and add before opening html form tag add belowe line of code:').'
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea><br />

                                '.$this->l('Please open file: (to add form to 5 step checkout new account page)').'
                                <b>themes/your-theme-name/authentication.tpl</b>
                                '.$this->l('for editing and add after that line: {if isset($PS_REGISTRATION_PROCESS_TYPE) && $PS_REGISTRATION_PROCESS_TYPE} line of code:').'
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea><br />

                                '.$this->l('Please open file: (to add form to OPC new account page)').'
                                <b>themes/your-theme-name/order-opc-new-account.tpl</b>
                                '.$this->l('for editing and add before html H3 tag containing text "Delivery address" add line of code:').'
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea><br />

                                '.$this->l('Please open file: (to add form to admin panel add address page)').'
                                <b>(your admin folder name)/themes/defaul/template/controller/addresses/helpers/form/form.tpl</b>
                                '.$this->l('for editing and add before ').$admin_address_line_of_code.$this->l(' add line of code:').'
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea>
                            </div>
                        </fieldset>';
        }

        if ($this->ps_version_15) {
            $this->html .= '<fieldset>
                        <legend>'.$this->l('Instalation instructions how to add collect data by nip to store forms').'</legend>
                            <div>
                            <ul>
                                <li>'.$this->l('First go to site: http://bip.stat.gov.pl/dzialalnosc-statystyki-publicznej/rejestr-regon/interfejsyapi/ and register your company to get user key to comunicate with GUS API').'</li>
                                <li>'.$this->l('When GUS send you user key please enter it in module settings abowe').'</li>
                                <li>'.$this->l('Last step is to add to choosen places in our store form to get data by NIP, belowe are instructions how to do it:').'</li>
                            </ul>

                                <p>'.$this->l('Please open file:').'
                                <b>themes/your-theme-name/address.tpl</b>
                                '.$this->l('for editing and add before opening html form tag add belowe line of code:').'
                                </p>
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea><br />

                                <p> '.$this->l('Please open file:').'
                                <b>themes/your-theme-name/authentication.tpl</b>
                                '.$this->l('for editing and add after that line: {if isset($PS_REGISTRATION_PROCESS_TYPE) && $PS_REGISTRATION_PROCESS_TYPE} line of code:').'</p>
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea><br />

                                <p>'.$this->l('Please open file:').'
                                <b>themes/your-theme-name/order-opc-new-account.tpl</b>
                                '.$this->l('for editing and add before html H3 tag containing text "Delivery address" add line of code:').'</p>
                                <textarea name="code" cols="100" rows="1">{hook h=\'displaySearchByNip\'}</textarea>

         

                            </div>
                        </fieldset>';
        }
    }
}
