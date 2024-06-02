<?php
/**
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2021 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

class Classy_custom_js_cs extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'classy_custom_js_cs';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Classydevs';
        $this->need_instance = 0;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Classydevs Custom CSS and JS');
        $this->description = $this->l('A simple way to add custom CSS and js to your site.');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);

        $this->define_constants();
        
    }

    private function define_constants() {


		if ( ! defined( 'CLASSSY_CSSJS_CLASS_DIR' ) ) {
			define( 'CLASSSY_CSSJS_CLASS_DIR', _PS_MODULE_DIR_ . 'classy_custom_js_cs/classes/' );
		}

		if ( ! defined( 'CLASSSY_CSSJS_VERSION' ) ) {
			define( 'CLASSSY_CSSJS_VERSION', $this->version );
		}
	}

    /**
     * Don't forget to create update methods if needed:
     * http://doc.prestashop.com/display/PS16/Enabling+the+Auto-Update
     */
    public function install()
    {
        Configuration::updateValue('CLASSY_CUSTOM_JS_CS_LIVE_MODE', false);
        $this->addquickaccess();
        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('displayBackOfficeHeader') &&
            $this->registerHook('displayHeader');
    }

    public function uninstall()
    {
        Configuration::deleteByName('CLASSY_CUSTOM_CSS_ENABLE');
        Configuration::deleteByName('CLASSY_CUSTOM_JS_ENABLE');
        Configuration::deleteByName('CLASSY_CUSTOM_CSS');
        Configuration::deleteByName('CLASSY_CUSTOM_JS');
        Configuration::deleteByName('classy_custom_cssjs_quick_access');

        return parent::uninstall();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submitCLASSY_CUSTOM_JS_CSModule')) == true) {
            $this->postProcess();
        }

        $this->context->smarty->assign('module_dir', $this->_path);

        $output = $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');

        return $output.$this->renderForm();
    }
    

    /**
     * Create the form that will be displayed in the configuration of your module.
     */
    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitCLASSY_CUSTOM_JS_CSModule';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );

        return $helper->generateForm(array($this->getConfigForm()));
    }

    /**
     * Create the structure of your form.
     */
    protected function getConfigForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                'title' => $this->l('Settings'),
                'icon' => 'icon-cogs',
                ),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Enable CSS'),
                        'name' => 'CLASSY_CUSTOM_CSS_ENABLE',
                        'is_bool' => true,
                        'desc' => $this->l('Use this module in live mode'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Enabled')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('Disabled')
                            )
                        ),
                    ),
                    array(
                        'col' => 5,
                        'type' => 'textarea',
                        'desc' => $this->l('Enter a valid Css'),
                        'name' => 'CLASSY_CUSTOM_CSS',
                        'label' => $this->l('CSS'),
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Enable JS'),
                        'name' => 'CLASSY_CUSTOM_JS_ENABLE',
                        'is_bool' => true,
                        'desc' => $this->l('Use this module in live mode'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Enabled')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('Disabled')
                            )
                        ),
                    ),
                    array(
                        'col' => 5,
                        'type' => 'textarea',
                        'desc' => $this->l('Enter a valid java script'),
                        'name' => 'CLASSY_CUSTOM_JS',
                        'label' => $this->l('JS'),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }

    /**
     * Set values for the inputs.
     */
    protected function getConfigFormValues()
    {
        return array(
            'CLASSY_CUSTOM_CSS_ENABLE' => Configuration::get('CLASSY_CUSTOM_CSS_ENABLE', true),
            'CLASSY_CUSTOM_JS_ENABLE' => Configuration::get('CLASSY_CUSTOM_JS_ENABLE', true),
            'CLASSY_CUSTOM_CSS' => Configuration::get('CLASSY_CUSTOM_CSS', ''),
            'CLASSY_CUSTOM_JS' => Configuration::get('CLASSY_CUSTOM_JS', ''),
        );
    }

    /**
     * Save form data.
     */
    protected function postProcess()
    {
        $form_values = $this->getConfigFormValues();

        $arr_files = array(
            'CLASSY_CUSTOM_CSS' => 'css/front.css',
            'CLASSY_CUSTOM_JS' => 'js/firmowystarter.js'
        );

        foreach (array_keys($form_values) as $key) {
            $val = Tools::getValue($key);
            if(isset($arr_files[$key])){
                file_put_contents(_PS_MODULE_DIR_.'classy_custom_js_cs/views/' . $arr_files[$key], $val);
            } 
            Configuration::updateValue($key, $val);
        }

    }

    /**
    * Add the CSS & JavaScript files you want to be loaded in the BO.
    */
    public function hookDisplayBackOfficeHeader()
    {
        include_once CLASSSY_CSSJS_CLASS_DIR . 'classy_customcssjs_updater.php';
        new ClassyCustomcssupdater();


        if (Tools::getValue('configure') == $this->name) {
            // $this->context->controller->addJquery();
            // $this->context->controller->addJS($this->_path.'views/codemirror/5.16.0/codemirror.js');
            // $this->context->controller->addJS($this->_path.'views/codemirror/5.16.0/mode/javascript/javascript.js');
            // $this->context->controller->addJS($this->_path.'views/codemirror/5.16.0/mode/css/css.js');
            $this->context->controller->addJS($this->_path.'views/js/back.js');

            $this->context->controller->addCSS($this->_path.'views/css/back.css');
            // $this->context->controller->addCSS($this->_path.'views/codemirror/5.16.0/codemirror.css');
            // $this->context->controller->addCSS($this->_path.'views/codemirror/5.16.0/themes/monokai.min.css');
            // $this->context->controller->addCSS($this->_path.'views/codemirror/5.16.0/themes/material.css');    
      }
    }
    public function hookDisplayHeader()
    {
        $this->context->controller->addJquery();
        $cssenable = Configuration::get('CLASSY_CUSTOM_CSS_ENABLE', true);

        if($cssenable){
            $this->context->controller->addCSS($this->_path.'/views/css/front.css');
        }
        $jsenable = Configuration::get('CLASSY_CUSTOM_JS_ENABLE', true);
        if($jsenable){
            $this->context->controller->addJS($this->_path.'views/js/starter.js');
            $this->context->controller->addJS($this->_path.'views/js/firmowystarter.js');
        }
    }
    public function addquickaccess()
	{
		$link      = new Link();
		$qa        = new QuickAccess();
		$qa->link  = $link->getAdminLink('AdminModules') . '&configure=classy_custom_js_cs';
		$languages = Language::getLanguages(false);
		foreach ($languages as $language) {
			$qa->name[$language['id_lang']] = 'ClassyDevs Custom CSS and JS';
		}
		$qa->new_window = '0';
		if ($qa->save()) {
			Configuration::updateValue('classy_custom_cssjs_quick_access', $qa->id);
			return true;
		}
	}
}