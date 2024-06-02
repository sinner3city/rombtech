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

class plogin extends Module
{
    public function __construct()
    {
        $this->name = 'plogin';
        $this->tab = 'front_office_features';
        $this->version = '1.7.2';
        $this->author = 'MyPresta.eu';
        $this->module_key = 'c735fdbd6499b43f4b2b8bb1eb34489c';
        $this->mypresta_link = 'https://mypresta.eu/modules/social-networks/paypal-login-connect.html';
        parent::__construct();
        $this->displayName = $this->l('Paypal Login');
        $this->description = $this->l('With this module you can allow your customers to log in with their paypal account.');
        if ($this->psversion() == 4) {
            global $smarty;
            $this->smarty = $smarty;
        }

        $this->modulehooks['top']['ps14'] = 1;
        $this->modulehooks['top']['ps15'] = 1;
        $this->modulehooks['top']['ps16'] = 1;
        $this->modulehooks['top']['ps17'] = 1;
        $this->modulehooks['displayNav1']['ps14'] = 0;
        $this->modulehooks['displayNav1']['ps15'] = 0;
        $this->modulehooks['displayNav1']['ps16'] = 0;
        $this->modulehooks['displayNav1']['ps17'] = 1;
        $this->modulehooks['displayNav2']['ps14'] = 0;
        $this->modulehooks['displayNav2']['ps15'] = 0;
        $this->modulehooks['displayNav2']['ps16'] = 0;
        $this->modulehooks['displayNav2']['ps17'] = 1;
        $this->modulehooks['displaytopColumn']['ps14'] = 0;
        $this->modulehooks['displaytopColumn']['ps15'] = 0;
        $this->modulehooks['displaytopColumn']['ps16'] = 1;
        $this->modulehooks['displaytopColumn']['ps17'] = 0;
        $this->modulehooks['displayNav']['ps14'] = 0;
        $this->modulehooks['displayNav']['ps15'] = 0;
        $this->modulehooks['displayNav']['ps16'] = 1;
        $this->modulehooks['displayNav']['ps17'] = 0;
        $this->modulehooks['leftcolumn']['ps14'] = 1;
        $this->modulehooks['leftcolumn']['ps15'] = 1;
        $this->modulehooks['leftcolumn']['ps16'] = 1;
        $this->modulehooks['leftcolumn']['ps17'] = 1;
        $this->modulehooks['rightcolumn']['ps14'] = 1;
        $this->modulehooks['rightcolumn']['ps15'] = 1;
        $this->modulehooks['rightcolumn']['ps16'] = 1;
        $this->modulehooks['rightcolumn']['ps17'] = 1;
        $this->modulehooks['footer']['ps14'] = 1;
        $this->modulehooks['footer']['ps15'] = 1;
        $this->modulehooks['footer']['ps16'] = 1;
        $this->modulehooks['footer']['ps17'] = 1;
        $this->modulehooks['home']['ps14'] = 1;
        $this->modulehooks['home']['ps15'] = 1;
        $this->modulehooks['home']['ps16'] = 1;
        $this->modulehooks['home']['ps17'] = 1;
        $this->modulehooks['createAccountForm']['ps14'] = 1;
        $this->modulehooks['createAccountForm']['ps15'] = 1;
        $this->modulehooks['createAccountForm']['ps16'] = 1;
        $this->modulehooks['createAccountForm']['ps17'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps14'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps15'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps16'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps17'] = 1;
        $this->modulehooks['shoppingCart']['ps14'] = 1;
        $this->modulehooks['shoppingCart']['ps15'] = 1;
        $this->modulehooks['shoppingCart']['ps16'] = 1;
        $this->modulehooks['shoppingCart']['ps17'] = 1;
        $this->modulehooks['createAccountTop']['ps14'] = 1;
        $this->modulehooks['createAccountTop']['ps15'] = 1;
        $this->modulehooks['createAccountTop']['ps16'] = 1;
        $this->modulehooks['createAccountTop']['ps17'] = 1;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps14'] = 0;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps15'] = 0;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps16'] = 0;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps17'] = 1;
        $this->modulehooks['popuplogin']['ps14'] = 0;
        $this->modulehooks['popuplogin']['ps15'] = 0;
        $this->modulehooks['popuplogin']['ps16'] = 1;
        $this->modulehooks['popuplogin']['ps17'] = 1;
        $this->checkforupdates();
    }

    public function checkforupdates($display_msg = 0, $form = 0)
    {
        // ---------- //
        // ---------- //
        // VERSION 16 //
        // ---------- //
        // ---------- //
        $this->mkey = "nlc";
        if (@file_exists('../modules/' . $this->name . '/key.php')) {
            @require_once('../modules/' . $this->name . '/key.php');
        } else {
            if (@file_exists(dirname(__FILE__) . $this->name . '/key.php')) {
                @require_once(dirname(__FILE__) . $this->name . '/key.php');
            } else {
                if (@file_exists('modules/' . $this->name . '/key.php')) {
                    @require_once('modules/' . $this->name . '/key.php');
                }
            }
        }
        if ($form == 1) {
            return '
            <div class="panel" id="fieldset_myprestaupdates" style="margin-top:20px;">
            ' . ($this->psversion() == 6 || $this->psversion() == 7 ? '<div class="panel-heading"><i class="icon-wrench"></i> ' . $this->l('MyPresta updates') . '</div>' : '') . '
			<div class="form-wrapper" style="padding:0px!important;">
            <div id="module_block_settings">
                    <fieldset id="fieldset_module_block_settings">
                         ' . ($this->psversion() == 5 ? '<legend style="">' . $this->l('MyPresta updates') . '</legend>' : '') . '
                        <form action="' . $_SERVER['REQUEST_URI'] . '" method="post">
                            <label>' . $this->l('Check updates') . '</label>
                            <div class="margin-form">' . (Tools::isSubmit('submit_settings_updates_now') ? ($this->inconsistency(0) ? '' : '') . $this->checkforupdates(1) : '') . '
                                <button style="margin: 0px; top: -3px; position: relative;" type="submit" name="submit_settings_updates_now" class="button btn btn-default" />
                                <i class="process-icon-update"></i>
                                ' . $this->l('Check now') . '
                                </button>
                            </div>
                            <label>' . $this->l('Updates notifications') . '</label>
                            <div class="margin-form">
                                <select name="mypresta_updates">
                                    <option value="-">' . $this->l('-- select --') . '</option>
                                    <option value="1" ' . ((int)(Configuration::get('mypresta_updates') == 1) ? 'selected="selected"' : '') . '>' . $this->l('Enable') . '</option>
                                    <option value="0" ' . ((int)(Configuration::get('mypresta_updates') == 0) ? 'selected="selected"' : '') . '>' . $this->l('Disable') . '</option>
                                </select>
                                <p class="clear">' . $this->l('Turn this option on if you want to check MyPresta.eu for module updates automatically. This option will display notification about new versions of this addon.') . '</p>
                            </div>
                            <label>' . $this->l('Module page') . '</label>
                            <div class="margin-form">
                                <a style="font-size:14px;" href="' . $this->mypresta_link . '" target="_blank">' . $this->displayName . '</a>
                                <p class="clear">' . $this->l('This is direct link to official addon page, where you can read about changes in the module (changelog)') . '</p>
                            </div>
                            <div class="panel-footer">
                                <button type="submit" name="submit_settings_updates"class="button btn btn-default pull-right" />
                                <i class="process-icon-save"></i>
                                ' . $this->l('Save') . '
                                </button>
                            </div>
                        </form>
                    </fieldset>
                    <style>
                    #fieldset_myprestaupdates {
                        display:block;clear:both;
                        float:inherit!important;
                    }
                    </style>
                </div>
            </div>
            </div>';
        } else {
            if (defined('_PS_ADMIN_DIR_')) {
                if (Tools::isSubmit('submit_settings_updates')) {
                    Configuration::updateValue('mypresta_updates', Tools::getValue('mypresta_updates'));
                }
                if (Configuration::get('mypresta_updates') != 0 || (bool)Configuration::get('mypresta_updates') != false) {
                    if (Configuration::get('update_' . $this->name) < (date("U") - 259200)) {
                        $actual_version = ploginUpdate::verify($this->name, (isset($this->mkey) ? $this->mkey : 'nokey'), $this->version);
                    }
                    if (ploginUpdate::version($this->version) < ploginUpdate::version(Configuration::get('updatev_' . $this->name)) && Tools::getValue('ajax', 'false') == 'false') {
                        $this->context->controller->warnings[] = '<strong>' . $this->displayName . '</strong>: ' . $this->l('New version available, check http://MyPresta.eu for more informations') . ' <a href="' . $this->mypresta_link . '">' . $this->l('More details in changelog') . '</a>';
                        $this->warning = $this->context->controller->warnings[0];
                    }
                } else {
                    if (Configuration::get('update_' . $this->name) < (date("U") - 259200)) {
                        $actual_version = ploginUpdate::verify($this->name, (isset($this->mkey) ? $this->mkey : 'nokey'), $this->version);
                    }
                }
                if ($display_msg == 1) {
                    if (ploginUpdate::version($this->version) < ploginUpdate::version(ploginUpdate::verify($this->name, (isset($this->mkey) ? $this->mkey : 'nokey'), $this->version))) {
                        return "<span style='color:red; font-weight:bold; font-size:16px; margin-right:10px;'>" . $this->l('New version available!') . "</span>";
                    } else {
                        return "<span style='color:green; font-weight:bold; font-size:16px; margin-right:10px;'>" . $this->l('Module is up to date!') . "</span>";
                    }
                }
            }
        }
    }

    public function inconsistency($return = 0) {
        return;
    }

    public function psversion($part = 1)
    {
        $version = _PS_VERSION_;
        $exp = $explode = explode(".", $version);
        if ($part == 1) {
            return $exp[1];
        }
        if ($part == 2) {
            return $exp[2];
        }
        if ($part == 3) {
            return $exp[3];
        }
    }

    public function install()
    {
        $prefix = _DB_PREFIX_;
        $sql = array();
        $sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'plogin` (
                  `id_plogin` int(10) unsigned NOT NULL AUTO_INCREMENT,
                  `id_social` VARCHAR(50) NOT NULL,
                  `type` VARCHAR(10) NOT NULL,
                  `hash` VARCHAR(100) NOT NULL,
                  `id_customer` INT(10) UNSIGNED NOT NULL,
                  PRIMARY KEY (`id_plogin`),
                  UNIQUE  `id_plogin_unique` (`id_plogin`)
                 ) ENGINE=' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8';

        if (!parent::install() || !$this->registerHook('header') || !$this->runSql($sql) || !$this->installModuleHooks() || !Configuration::updateValue('glogin_groupid', Configuration::get('PS_CUSTOMER_GROUP'))) {
            return false;
        }
        return true;
    }

    public function installModuleHooks()
    {
        foreach ($this->modulehooks AS $modulehook => $value) {
            if (($this->psversion() == 4 && $value['ps14'] == 1) || ($this->psversion() == 5 && $value['ps15'] == 1) || ($this->psversion() == 6 && $value['ps16'] == 1) || ($this->psversion() == 7 && $value['ps17'] == 1)) {
                if ($this->registerHook($modulehook) == false) {
                    return false;
                }
            }
        }
        return true;
    }

    public function runSql($sql)
    {
        foreach ($sql as $s) {
            if (!Db::getInstance()->Execute($s)) {
                //return FALSE;
            }
        }
        return true;
    }

    public function verifycustomer($post)
    {
        $post = json_decode($post);
        $post = (array)$post;
        if (isset($post['email'])) {
            if ($this->check_core($post['email']) == false) {
                if ($this->check_db($post['email']) == false) {
                    $this->loginprocess($this->registeraccount_db($post, $this->registeraccount_core($post), ""));
                    $this->update_plogin_db($post, $this->check_core($post['email']));
                } else {
                    $this->loginprocess($this->registeraccount_core($post));
                    $this->update_plogin_db($post, $this->check_core($post['email']));
                }
            } else {
                if ($this->check_db($post['email']) == false) {
                    $this->loginprocess($this->registeraccount_db($post, $this->check_core($post['email']), ""));
                    $this->update_plogin_db($post, $this->check_core($post['email']));
                } else {
                    $this->loginprocess($this->check_core($post['email']));
                    $this->update_plogin_db($post, $this->check_core($post['email']));
                }
            }
        } else {
            echo "alert('no email address');";
        }
    }

    public function update_plogin_db($post, $id_customer)
    {
        Db::getInstance()->Execute('UPDATE `' . _DB_PREFIX_ . 'plogin` SET `id_customer`=' . $id_customer . ' WHERE `id_social`="' . $post['email'] . '"');
    }

    public function check_core($email)
    {
        $customer = new Customer();
        $cust = $customer->getByEmail($email);
        if ($cust == false) {
            return false;
        } else {
            return $cust->id;
        }
    }

    public function check_db($fbid)
    {
        return Db::getInstance()->getRow('SELECT id_customer FROM `' . _DB_PREFIX_ . 'plogin` WHERE id_social="' . $fbid . '"');
    }

    public function registeraccount_db($post, $id_customer, $passwd)
    {
        Db::getInstance()->Execute('INSERT INTO `' . _DB_PREFIX_ . 'plogin` (`id_social`,`type`,`hash`,`id_customer`) VALUES ("' . $post['email'] . '","paypal","' . $passwd . '","' . $id_customer . '")');
        return $id_customer;
    }

    public function registeraccount_core($post)
    {
        if (isset($post['name'])) {
            $exploded = explode(" ", $post['name']);
        } else {
            $exploded = array();
            $exploded[0] = '';
            $exploded[1] = '';
        }
        $passwd = md5(Tools::passwdGen(8));
        $customer = new Customer();
        $customer->passwd = $passwd;
        $customer->email = $post['email'];
        $customer->firstname = (isset($post['given_name']) ? $post['given_name']:$exploded[0]);
        $customer->lastname = (isset($post['family_name']) ? $post['given_name']:$exploded[1]);
        $customer->active = 1;
        $customer->newsletter = 1;
        if ($customer->add()) {
            $_POST['email'] = $post['email'];
            if ($this->psversion() != 4 && $this->psversion() != 3) {
                Hook::Exec('actionCustomerAccountAdd', array(
                    '_POST' => $_POST,
                    'newCustomer' => $customer,
                    'plogin' => true
                ));
            } else {
                Module::hookExec('actionCustomerAccountAdd', array(
                    'newCustomer' => $customer,
                    'plogin' => true
                ));
            }
        }
        $customer->cleanGroups();
        $customer->addGroups(array((int)Configuration::get('plogin_groupid')));

        if (Configuration::get('PS_CUSTOMER_CREATION_EMAIL') && Configuration::get('plogin_semail') == 1) {
            Mail::Send($this->context->language->id, 'account', Mail::l('Welcome!'), array(
                '{firstname}' => $customer->firstname,
                '{lastname}' => $customer->lastname,
                '{email}' => $customer->email,
                '{passwd}' => $passwd
            ), $customer->email, $customer->firstname . ' ' . $customer->lastname);
        }

        return $customer->id;
    }

    public function loginprocess($id_customer)
    {
        if ($this->psversion() == 5 || $this->psversion() == 6 || $this->psversion() == 7) {
            $customer = new Customer($id_customer);
            if ($this->psversion() != 7) {
                $this->context->cookie->id_compare = isset($this->context->cookie->id_compare) ? $this->context->cookie->id_compare : CompareProduct::getIdCompareByIdCustomer($customer->id);
            }
            $this->context->cookie->id_customer = (int)($customer->id);
            $this->context->cookie->customer_lastname = $customer->lastname;
            $this->context->cookie->customer_firstname = $customer->firstname;
            $this->context->cookie->logged = 1;
            $customer->logged = 1;
            $this->context->cookie->is_guest = $customer->isGuest();
            $this->context->cookie->passwd = $customer->passwd;
            $this->context->cookie->email = $customer->email;

            // Add customer to the context
            $this->context->customer = $customer;

            if (Configuration::get('PS_CART_FOLLOWING') && (empty($this->context->cookie->id_cart) || Cart::getNbProducts($this->context->cookie->id_cart) == 0) && $id_cart = (int)Cart::lastNoneOrderedCart($this->context->customer->id)) {
                $this->context->cart = new Cart($id_cart);
            } else {
                $this->context->cart->id_carrier = 0;
                $this->context->cart->setDeliveryOption(null);
                $this->context->cart->id_address_delivery = Address::getFirstCustomerAddressId((int)($customer->id));
                $this->context->cart->id_address_invoice = Address::getFirstCustomerAddressId((int)($customer->id));
            }
            $this->context->cart->id_customer = (int)$customer->id;
            $this->context->cart->secure_key = $customer->secure_key;
            $this->context->cookie->write();
            $this->context->cart->save();
            $this->context->cookie->id_cart = (int)$this->context->cart->id;
            $this->context->cookie->write();
            $this->context->cart->autosetProductAddress();
            if ($this->psversion() == 7) {
                $this->context->updateCustomer($customer);
            }
            
            Hook::exec('actionAuthentication');
            
            // Login information have changed, so we check if the cart rules still apply
            CartRule::autoRemoveFromCart($this->context);
            CartRule::autoAddToCart($this->context);
            if ($this->psversion() == 5 || $this->psversion() == 6 || $this->psversion() == 7) {
                if (Tools::getValue('back')) {
                    if (Validate::isUrl(Tools::getValue('back'))) {
                        echo "top.location.href='" . (Tools::getValue('back')) . "'";
                    } else {
                        echo "top.location.href='" . 'index.php?controller=' . (Tools::getValue('back')) . "'";
                    }
                } else {
                    echo 'top.location.reload();';
                }
            } else {
                echo 'top.location.reload();';
            }
        }


        if ($this->psversion() == 4) {
            Module::hookExec('beforeAuthentication');
            global $cookie;
            global $cart;
            $customer = new Customer($id_customer);
            //$cookie->id_compare = isset($cookie->id_compare) ? $cookie->id_compare: CompareProduct::getIdCompareByIdCustomer($customer->id);
            $cookie->id_customer = (int)($customer->id);
            $cookie->customer_lastname = $customer->lastname;
            $cookie->customer_firstname = $customer->firstname;
            $cookie->logged = 1;
            $cookie->is_guest = $customer->isGuest();
            $cookie->passwd = $customer->passwd;
            $cookie->email = $customer->email;
            if (Configuration::get('PS_CART_FOLLOWING') and (empty($cookie->id_cart) or Cart::getNbProducts($cookie->id_cart) == 0)) {
                $cookie->id_cart = (int)(Cart::lastNoneOrderedCart((int)($customer->id)));
            }
            /* Update cart address */
            $cart->id_carrier = 0;
            $cart->id_address_delivery = Address::getFirstCustomerAddressId((int)($customer->id));
            $cart->id_address_invoice = Address::getFirstCustomerAddressId((int)($customer->id));
            // If a logged guest logs in as a customer, the cart secure key was already set and needs to be updated
            $cart->secure_key = $customer->secure_key;
            $cart->update();
            Module::hookExec('authentication');
            echo 'location.reload();';
        }
    }

    public function getContent()
    {
        $output = "";
        if (Tools::isSubmit('hooks_settings')) {
            Configuration::updateValue('plogin_shoppingCart', Tools::getValue('plogin_shoppingCart'));
            Configuration::updateValue('plogin_shoppingCartExtra', Tools::getValue('plogin_shoppingCartExtra'));
            Configuration::updateValue('plogin_displayNav2', Tools::getValue('plogin_displayNav2'));
            Configuration::updateValue('plogin_displayTop', Tools::getValue('plogin_displayTop'));
            Configuration::updateValue('plogin_displayNav1', Tools::getValue('plogin_displayNav1'));
            Configuration::updateValue('plogin_displayNav', Tools::getValue('plogin_displayNav'));
            Configuration::updateValue('plogin_home', Tools::getValue('plogin_home'));
            Configuration::updateValue('plogin_footer', Tools::getValue('plogin_footer'));
            Configuration::updateValue('plogin_createAccountForm', Tools::getValue('plogin_createAccountForm'));
            Configuration::updateValue('plogin_popuplogin', Tools::getValue('plogin_popuplogin'));
        }

        if (Tools::isSubmit('fblapp_settings')) {
            Configuration::updateValue('plogin_clientid', Tools::getValue('plogin_clientid'));
            Configuration::updateValue('plogin_secret', Tools::getValue('plogin_secret'));
        }

        if (Tools::isSubmit('register_settings')) {
            Configuration::updateValue('plogin_groupid', Tools::getValue('plogin_groupid'));
            Configuration::updateValue('plogin_semail', Tools::getValue('plogin_semail'));
        }


        return $output . $this->displayForm() . $this->checkforupdates(0, 1);
    }

    public function displayForm()
    {
        if ($this->psversion() == 5 || $this->psversion() == 6 || $this->psversion() == 7) {
            if (Hook::getIdByName(preg_replace("/[^\da-z]/i", '', trim('popuplogin'))) == true) {
                $popuplogin = '<div>
                    <label>' . $this->l('PopUp login') . '</label>
                        <div class="margin-form">
                            <input type="checkbox" name="plogin_popuplogin" value="1" ' . (Configuration::get('plogin_popuplogin') == 1 ? 'checked="yes"' : '') . '/>
                  		</div>
                    </div>';
            } else {
                $popuplogin = '<div>
                    <label>' . $this->l('PopUp login') . '</label>
                        <div class="margin-form">
           					' . $this->l('popup login module is not installed, hook doesnt exist') . '
        				</div>
                    </div>';
            }
        } elseif ($this->psversion() == 4) {
            $popuplogin = '        <div>
                                            <label>' . $this->l('PopUp login') . '</label>
                            				<div class="margin-form">
                            					<input type="checkbox" name="plogin_popuplogin" value="1" ' . (Configuration::get('plogin_popuplogin') == 1 ? 'checked="yes"' : '') . '/>
                            				</div>
                                        </div>';
        }


        $checkbox_options = '';
        foreach ($this->modulehooks AS $modulehook => $value) {
            if (Tools::getValue('hooks_settings', 'false') != 'false') {
                if (Tools::getValue('plogin_' . $modulehook, 'false') != 'false') {
                    if (Tools::getValue('plogin_' . $modulehook) == 1) {
                        Configuration::updateValue('plogin_' . $modulehook, 1);
                    } else {
                        Configuration::updateValue('plogin_' . $modulehook, 0);
                    }
                } else {
                    Configuration::updateValue('plogin_' . $modulehook, 0);
                }
            }
            if (($this->psversion() == 4 && $value['ps14'] == 1) || ($this->psversion() == 5 && $value['ps15'] == 1) || ($this->psversion() == 6 && $value['ps16'] == 1) || ($this->psversion() == 7 && $value['ps17'] == 1)) {
                $checkbox_options .= '<label>' . $modulehook . ':</label><div class="margin-form" style="text-align:left;">' . "<input type=\"checkbox\" value=\"1\" name=\"plogin_$modulehook\" " . (Configuration::get('plogin_' . $modulehook) == 1 ? 'checked' : '') . "></div>";
            }
        }


        return '
        
                    <div style="margin-bottom:20px;">
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                            <fieldset style="margin-top:10px;">
                                <legend><img src="' . $this->_path . 'logo.gif" alt="" title="" />' . $this->l('PayPal API') . '</legend>
                                <div>
                                    <label>' . $this->l('Client ID') . '</label>
                    				<div class="margin-form">
                    					<input type="text" name="plogin_clientid" value="' . Configuration::get('plogin_clientid') . '"/>
                                        ' . $this->l('read') . ' <a target="_blank" href="https://mypresta.eu/en/art/basic-tutorials/paypal-clientid-secret-for-prestashop.html">' . $this->l('how to create ClientID') . '</a>
                    				</div>
                                </div>
                                <div>
                                    <label>' . $this->l('Secret') . '</label>
                    				<div class="margin-form">
                    					<input type="text" name="plogin_secret" value="' . Configuration::get('plogin_secret') . '"/>
                                        ' . $this->l('read') . ' <a target="_blank" href="https://mypresta.eu/en/art/basic-tutorials/paypal-clientid-secret-for-prestashop.html">' . $this->l('how to create Secret?') . '</a>
                    				</div>
                                </div>
                                <div>
                                    <label>' . $this->l('Return URL') . '</label>
                    				<div class="margin-form">
                    					' . $this->returnPageUrl() . 'modules/plogin/plogin_ajax.php
                    				</div>
                                </div>
                               
                                                                         
                				<center><input type="submit" name="fblapp_settings" value="' . $this->l('Save') . '" class="button" /></center>          
                            </fieldset>
                        </form>
                    </div>
                            
                    <div>
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                            <fieldset style="margin-top:10px;">
                                <legend><img src="' . $this->_path . 'logo.gif" alt="" title="" />' . $this->l('Display login button in:') . '</legend>
                                ' . $checkbox_options . $popuplogin . '                              
                				<center><input type="submit" name="hooks_settings" value="' . $this->l('Save') . '" class="button" /></center>          
                            </fieldset>
                        </form>
                    </div>
                    
                    <div>
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                            <fieldset style="margin-top:10px;">
                                <legend><img src="' . $this->_path . 'logo.gif" alt="" title="" />' . $this->l('Register settings:') . '</legend>
                                <div>
                                    <label>' . $this->l('Associate customer with group:') . '</label>
                    				<div class="margin-form">
                                    <select name="plogin_groupid">
                                    <option>' . $this->l('-- SELECT --') . '</option>
                                        ' . $this->customerGroup(Configuration::get('plogin_groupid')) . '
                                    </select>
                    				</div>
                                </div>

                                <div style="clear:both; margin-bottom:20px;">
                                    <label>' . $this->l('Send email with account register confirmation:') . '</label>
                    			    <div class="margin-form">
                                    <select name="plogin_semail">
                                        <option>' . $this->l('-- SELECT --') . '</option>
                                        <option value="1" ' . (Configuration::get('plogin_semail') == 1 ? 'selected' : '') . '>' . $this->l('Yes') . '</option>
                                        <option value="0" ' . (Configuration::get('plogin_semail') != 1 ? 'selected' : '') . '>' . $this->l('No') . '</option>
                                    </select>
                    				</div>
                                </div>
                				<center><input type="submit" name="register_settings" value="' . $this->l('Save') . '" class="button" /></center>          
                            </fieldset>
                        </form>
                    </div>
                    
                    ';
    }

    public function customerGroup($group_id)
    {
        global $cookie;
        $return = '';
        foreach (Group::getGroups($cookie->id_lang, $id_shop = false) as $key => $value) {
            $return .= '<option ' . ($group_id == $value['id_group'] ? 'selected="yes"' : '') . ' value="' . $value['id_group'] . '">' . $value['name'] . '</option>';
        }
        return $return;
    }

    public function returnPageUrl()
    {
        $protocol_link = (Configuration::get('PS_SSL_ENABLED') || Tools::usingSecureMode()) ? 'https://' : 'http://';
        $useSSL = (Configuration::get('PS_SSL_ENABLED') || Tools::usingSecureMode()) ? true : false;
        $protocol_content = ($useSSL) ? 'https://' : 'http://';
        return $protocol_content . Tools::getHttpHost() . __PS_BASE_URI__;
    }

    public function plogin_buttonurl()
    {
        return "https://www.paypal.com/connect?flowEntry=static&client_id=" . Configuration::get('plogin_clientid') . "&response_type=code&scope=profile email&redirect_uri=" . $this->returnPageUrl() . "modules/plogin/plogin_ajax.php";
    }

    public function hookHeader($params)
    {
        global $cookie;
        if ($this->psversion() != 4) {
            $logged = $this->context->customer->isLogged();
        } else {
            $logged = $cookie->isLogged();
        }

        $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
        if ($this->psversion() == 5 || $this->psversion() == 6 || $this->psversion() == 7) {
            $this->context->controller->addJS(($this->_path) . 'js/plogin.js', 'all');
            $this->context->controller->addCSS(($this->_path) . 'css/plogin.css', 'all');
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('ps_version', $this->psversion());
        }
        if ($this->psversion() == 4) {
            Tools::addJS(($this->_path) . 'js/plogin.js', 'all');
            Tools::addCSS(($this->_path) . 'css/plogin.css', 'all');
            global $smarty;
            $smarty->assign('ps_version', $this->psversion());
        }
        return $this->display(__file__, 'header.tpl');
    }

    public function hookdisplayNav($params)
    {
        if (Configuration::get('plogin_displayNav') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayNav.tpl');
        }
    }

    public function hookdisplayNav1($params)
    {
        if (Configuration::get('plogin_displayNav1') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayNav1.tpl');
        }
    }

    public function hookdisplayNav2($params)
    {
        if (Configuration::get('plogin_displayNav2') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayNav2.tpl');
        }
    }

    public function hookdisplayCustomerLoginFormAfter($params)
    {
        if (Configuration::get('plogin_displayCustomerLoginFormAfter') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayCustomerLoginFormAfter.tpl');
        }
    }

    public function hookdisplayleftColumn($params)
    {
        if (Configuration::get('plogin_leftcolumn') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayleftColumn.tpl');
        }
    }

    public function hookdisplayrightColumn($params)
    {
        if (Configuration::get('plogin_rightcolumn') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayrightColumn.tpl');
        }
    }

    public function hookTop($params)
    {
        return $this->hookdisplayTop($params);
    }

    public function hookdisplayTop($params)
    {
        if (Configuration::get('plogin_top') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayTop.tpl');
        }
    }

    public function hookFooter($params)
    {
        return $this->hookdisplayFooter($params);
    }

    public function hookdisplayFooter($params)
    {
        if (Configuration::get('plogin_footer') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('ppl_psver', $this->psversion());
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayFooter.tpl');
        }
    }

    public function hookdisplayHome($params)
    {
        if (Configuration::get('plogin_home') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displayHome.tpl');
        }
    }

    public function hookHome($params)
    {
        return $this->hookdisplayHome($params);
    }

    public function hookdisplayTopColumn($params)
    {
        if (Configuration::get('plogin_displaytopColumn') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'displaytopColumn.tpl');
        }
    }

    public function hookshoppingCart($params)
    {
        if (Configuration::get('plogin_shoppingCart') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'shoppingCart.tpl');
        }
    }

    public function hookcreateAccountForm($params)
    {

        if (Configuration::get('plogin_createAccountForm') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'createAccountForm.tpl');
        }
    }

    public function hookcreateAccountTop($params)
    {
        if (Configuration::get('plogin_createAccountTop') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'createAccountForm.tpl');
        }
    }

    public function hookshoppingCartExtra($params)
    {
        if (Configuration::get('plogin_shoppingCartExtra') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->display(__file__, 'shoppingCartExtra.tpl');
        }
    }

    public function hookpopuplogin($params)
    {
        if (Configuration::get('plogin_popuplogin') == 1) {
            $logged = $this->context->customer->isLogged();
            $this->context->smarty->assign('logged', $logged);
            $this->context->smarty->assign('plogin_button_url', $this->plogin_buttonurl());
            return $this->context->smarty->fetch(_PS_MODULE_DIR_ . $this->name . '/displayPopUpLogin.tpl');
        }
    }
}

if (file_exists(_PS_MODULE_DIR_ . 'plogin/PayPal-PHP-SDK/vendor/autoload.php')) {
    require_once _PS_MODULE_DIR_ . 'plogin/PayPal-PHP-SDK/vendor/autoload.php';
}

class ploginUpdate extends plogin
{
    public static function version($version)
    {
        $version = (int)str_replace(".", "", $version);
        if (strlen($version) == 3) {
            $version = (int)$version . "0";
        }
        if (strlen($version) == 2) {
            $version = (int)$version . "00";
        }
        if (strlen($version) == 1) {
            $version = (int)$version . "000";
        }
        if (strlen($version) == 0) {
            $version = (int)$version . "0000";
        }
        return (int)$version;
    }

    public static function encrypt($string)
    {
        return base64_encode($string);
    }

    public static function verify($module, $key, $version)
    {
        if (ini_get("allow_url_fopen")) {
            if (function_exists("file_get_contents")) {
                $actual_version = @file_get_contents('http://dev.mypresta.eu/update/get.php?module=' . $module . "&version=" . self::encrypt($version) . "&lic=$key&u=" . self::encrypt(_PS_BASE_URL_ . __PS_BASE_URI__));
            }
        }
        Configuration::updateValue("update_" . $module, date("U"));
        Configuration::updateValue("updatev_" . $module, $actual_version);
        return $actual_version;
    }
}