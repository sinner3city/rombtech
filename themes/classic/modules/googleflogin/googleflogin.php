<?php


class googleflogin extends Module
{
    public function __construct()
    {
        $this->name = 'googleflogin';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Fshop google login';
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = $this->l('Fshop Google Login');
        $this->description = $this->l('Rejestracja i logowanie przez google.');

        $this->modulehooks['top']['ps14'] = 1;
        $this->modulehooks['top']['ps15'] = 1;
        $this->modulehooks['top']['ps16'] = 1;
        $this->modulehooks['top']['ps17'] = 1;
        $this->modulehooks['footer']['ps14'] = 1;
        $this->modulehooks['footer']['ps15'] = 1;
        $this->modulehooks['footer']['ps16'] = 1;
        $this->modulehooks['footer']['ps17'] = 1;
        $this->modulehooks['displaytopColumn']['ps14'] = 0;
        $this->modulehooks['displaytopColumn']['ps15'] = 0;
        $this->modulehooks['displaytopColumn']['ps16'] = 1;
        $this->modulehooks['displaytopColumn']['ps17'] = 0;
        $this->modulehooks['displayNav']['ps14'] = 0;
        $this->modulehooks['displayNav']['ps15'] = 0;
        $this->modulehooks['displayNav']['ps16'] = 1;
        $this->modulehooks['displayNav']['ps17'] = 0;
        $this->modulehooks['displayNav1']['ps14'] = 0;
        $this->modulehooks['displayNav1']['ps15'] = 0;
        $this->modulehooks['displayNav1']['ps16'] = 0;
        $this->modulehooks['displayNav1']['ps17'] = 1;
        $this->modulehooks['displayNav2']['ps14'] = 0;
        $this->modulehooks['displayNav2']['ps15'] = 0;
        $this->modulehooks['displayNav2']['ps16'] = 0;
        $this->modulehooks['displayNav2']['ps17'] = 1;
        $this->modulehooks['shoppingCart']['ps14'] = 1;
        $this->modulehooks['shoppingCart']['ps15'] = 1;
        $this->modulehooks['shoppingCart']['ps16'] = 1;
        $this->modulehooks['shoppingCart']['ps17'] = 1;
        $this->modulehooks['googleflogin']['ps14'] = 1;
        $this->modulehooks['googleflogin']['ps15'] = 1;
        $this->modulehooks['googleflogin']['ps16'] = 1;
        $this->modulehooks['googleflogin']['ps17'] = 1;
        $this->modulehooks['leftcolumn']['ps14'] = 1;
        $this->modulehooks['leftcolumn']['ps15'] = 1;
        $this->modulehooks['leftcolumn']['ps16'] = 1;
        $this->modulehooks['leftcolumn']['ps17'] = 1;
        $this->modulehooks['rightcolumn']['ps14'] = 1;
        $this->modulehooks['rightcolumn']['ps15'] = 1;
        $this->modulehooks['rightcolumn']['ps16'] = 1;
        $this->modulehooks['rightcolumn']['ps17'] = 1;
        $this->modulehooks['home']['ps14'] = 1;
        $this->modulehooks['home']['ps15'] = 1;
        $this->modulehooks['home']['ps16'] = 1;
        $this->modulehooks['home']['ps17'] = 1;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps14'] = 0;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps15'] = 0;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps16'] = 0;
        $this->modulehooks['displayCustomerLoginFormAfter']['ps17'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps14'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps15'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps16'] = 1;
        $this->modulehooks['shoppingCartExtra']['ps17'] = 1;
        $this->modulehooks['createAccountForm']['ps14'] = 1;
        $this->modulehooks['createAccountForm']['ps15'] = 1;
        $this->modulehooks['createAccountForm']['ps16'] = 1;
        $this->modulehooks['createAccountForm']['ps17'] = 1;
        $this->modulehooks['createAccountTop']['ps14'] = 1;
        $this->modulehooks['createAccountTop']['ps15'] = 1;
        $this->modulehooks['createAccountTop']['ps16'] = 1;
        $this->modulehooks['createAccountTop']['ps17'] = 1;
        $this->modulehooks['popuplogin']['ps14'] = 0;
        $this->modulehooks['popuplogin']['ps15'] = 0;
        $this->modulehooks['popuplogin']['ps16'] = 1;
        $this->modulehooks['popuplogin']['ps17'] = 1;
        $this->modulehooks['displayPersonalInformationTop']['ps14'] = 0;
        $this->modulehooks['displayPersonalInformationTop']['ps15'] = 0;
        $this->modulehooks['displayPersonalInformationTop']['ps16'] = 0;
        $this->modulehooks['displayPersonalInformationTop']['ps17'] = 1;
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
        $sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'googleflogin` (
                  `id_fblogin` int(10) unsigned NOT NULL AUTO_INCREMENT,
                  `id_social` VARCHAR(20) NOT NULL,
                  `type` VARCHAR(10) NOT NULL,
                  `hash` VARCHAR(100) NOT NULL,
                  `id_customer` INT(10) UNSIGNED NOT NULL,
                  PRIMARY KEY (`id_fblogin`),
                  UNIQUE  `id_fblogin_unique` (`id_fblogin`)
                 ) ENGINE=' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8';

        if (!parent::install() || !$this->registerHook('header') || !$this->registerHook('dashboardZoneOne') || !$this->runSql($sql) || !$this->installModuleHooks() || !Configuration::updateValue('googleflogin_groupid', Configuration::get('PS_CUSTOMER_GROUP'))) {
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
            }
        }
        return true;
    }

    public function verifycustomer($post)
    {
        if (isset($post['email'])) {
            if ($this->check_core($post['email']) == false) {
                if ($this->check_db($post['id']) == false) {
                    $this->loginprocess($this->registeraccount_db($post, $this->registeraccount_core($post), ""));
                    $this->update_googleflogin_db($post, $this->check_core($post['email']));
                } else {
                    $this->loginprocess($this->registeraccount_core($post));
                    $this->update_googleflogin_db($post, $this->check_core($post['email']));
                }
            } else {
                if ($this->check_db($post['id']) == false) {
                    $this->loginprocess($this->registeraccount_db($post, $this->check_core($post['email']), ""));
                    $this->update_googleflogin_db($post, $this->check_core($post['email']));
                } else {
                    $this->loginprocess($this->check_core($post['email']));
                    $this->update_googleflogin_db($post, $this->check_core($post['email']));
                }
            }
        } else {
            $post['email'] = $post['id'] . "@plus.google.com";
            if ($this->check_core($post['email']) == false) {
                if ($this->check_db($post['id']) == false) {
                    $this->loginprocess($this->registeraccount_db($post, $this->registeraccount_core($post), ""));
                } else {
                    $this->loginprocess($this->registeraccount_core($post));
                }
            } else {
                if ($this->check_db($post['id']) == false) {
                    $this->loginprocess($this->registeraccount_db($post, $this->check_core($post['email']), ""));
                } else {
                    $this->loginprocess($this->check_core($post['email']));
                }
            }
        }
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
        return Db::getInstance()->getRow('SELECT id_customer FROM `' . _DB_PREFIX_ . 'googleflogin` WHERE id_social="' . $fbid . '"');
    }

    public function registeraccount_db($post, $id_customer, $passwd)
    {
        Db::getInstance()->Execute('INSERT INTO `' . _DB_PREFIX_ . 'googleflogin` (`id_social`,`type`,`hash`,`id_customer`) VALUES ("' . $post['id'] . '","gg","' . $passwd . '","' . $id_customer . '")');
        return $id_customer;
    }

    public function update_googleflogin_db($post, $id_customer)
    {
        Db::getInstance()->Execute('UPDATE `' . _DB_PREFIX_ . 'googleflogin` SET `id_customer`=' . $id_customer . ' WHERE `id_social`=' . $post['id']);
    }

    public function registeraccount_core($post)
    {
        $passwd = md5(Tools::passwdGen(8));
        $customer = new Customer();
        $customer->passwd = $passwd;
        $customer->email = $post['email'];
        $customer->firstname = $post['given_name'];
        $customer->lastname = $post['family_name'];
        $customer->active = 1;
        $customer->newsletter = 0;
        $customer->optin = 0;
        if (isset($post['gender'])) {
            if ($post['gender'] == "male") {
                $customer->id_gender = 1;
            } elseif ($post['gender'] == "female") {
                $customer->id_gender = 2;
            }
        }
        if ($customer->add()) {
            $_POST['email'] = $post['email'];
            if ($this->psversion() != 4 && $this->psversion() != 3) {
                Hook::Exec('actionCustomerAccountAdd', array(
                    'newCustomer' => $customer,
                    'googleflogin' => true
                ));
            } elseif ($this->psversion() == 5) {
                Module::hookExec('actionCustomerAccountAdd', array(
                    'newCustomer' => $customer,
                    'googleflogin' => true
                ));
            } else {
                Hook::Exec('actionCustomerAccountAdd', array(
                    '_POST' => $_POST,
                    'googleflogin' => true,
                    'newCustomer' => $customer
                ));
            }
        }
        $customer->cleanGroups();
        $customer->addGroups(array((int)Configuration::get('googleflogin_groupid')));

        if (Configuration::get('PS_CUSTOMER_CREATION_EMAIL') && Configuration::get('googleflogin_semail') == 1) {
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
        $this->context->cart->save();
        $this->context->cookie->id_cart = (int)$this->context->cart->id;
        $this->context->cookie->write();
        $this->context->cart->autosetProductAddress();

        if ($this->psversion() == 7) {
            $this->context->updateCustomer($customer);
        }
        Hook::exec('actionAuthentication');


        CartRule::autoRemoveFromCart($this->context);
        CartRule::autoAddToCart($this->context);
        if ($this->psversion() == 5 || $this->psversion() == 6 || $this->psversion() == 7) {
            if (Tools::getValue('back')) {
                if (Tools::getValue('back') != 0 && Tools::getValue('back') != '') {
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
        } else {
            echo 'top.location.reload();';
        }
    }

    public function getContent()
    {
        $output = "";
        if (Tools::isSubmit('hooks_settings')) {
            Configuration::updateValue('ggl_popuplogin', Tools::getValue('ggl_popuplogin'));
        }

        if (Tools::isSubmit('fblapp_settings')) {
            Configuration::updateValue('ggl_appid', Tools::getValue('ggl_appid'));
            Configuration::updateValue('googleflogin_semail', Tools::getValue('googleflogin_semail'));
            Configuration::updateValue('googleflogin_identity', Tools::getValue('googleflogin_identity'));
        }

        if (Tools::isSubmit('register_settings')) {
            Configuration::updateValue('googleflogin_groupid', Tools::getValue('googleflogin_groupid'));
        }


        return $output . $this->displayForm();
    }

    public function displayForm()
    {
        if (Hook::getIdByName(preg_replace("/[^\da-z]/i", '', trim('popuplogin'))) == true) {
            $popuplogin = '';
        } else {
            $popuplogin = '<tr>
                        <td style="width:150px">wyskakujące okienka są zablokowane</td>
        				<td>' . $this->l('PopUp login') . '</td>
                    </tr>';
        }

        $checkbox_options = '';
        foreach ($this->modulehooks AS $modulehook => $value) {
            if (Tools::getValue('hooks_settings', 'false') != 'false') {
                if (Tools::getValue('ggl_' . $modulehook, 'false') != 'false') {
                    if (Tools::getValue('ggl_' . $modulehook) == 1) {
                        Configuration::updateValue('ggl_' . $modulehook, 1);
                    } else {
                        Configuration::updateValue('ggl_' . $modulehook, 0);
                    }
                } else {
                    Configuration::updateValue('ggl_' . $modulehook, 0);
                }
            }
            if (($this->psversion() == 4 && $value['ps14'] == 1) || ($this->psversion() == 5 && $value['ps15'] == 1) || ($this->psversion() == 6 && $value['ps16'] == 1) || ($this->psversion() == 7 && $value['ps17'] == 1)) {
                $checkbox_options .= '<tr><td style="width:150px">' . "<input type=\"checkbox\" value=\"1\" name=\"ggl_$modulehook\" " . (Configuration::get('ggl_' . $modulehook) == 1 ? 'checked' : '') . "> </td><td>" . $modulehook . "</td></tr>";
            }
        }

        return '
                    <div class="panel">
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                            <h3>' . $this->l('Google Client ID') . '</h3>

                            <label>' . $this->l('Google Client ID') . '</label>
                    		<div class="margin-form">
                    		    <input type="text" name="ggl_appid" value="' . Configuration::get('ggl_appid') . '"/>
                    		</div>
                    		<br/>
                    		<div class="alert alert-info">
                                ' . $this->l('Brak Google API client ID. :') . '
                            </div>
                    		<br/><br/>
                           <div style="clear:both; margin-bottom:20px;">
                                    <label>' . $this->l('Send email with account register confirmation:') . '</label>
                    			    <div class="margin-form">
                                    <select name="googleflogin_semail">
                                        <option>' . $this->l('-- SELECT --') . '</option>
                                        <option value="1" ' . (Configuration::get('googleflogin_semail') == 1 ? 'selected' : '') . '>' . $this->l('Yes') . '</option>
                                        <option value="0" ' . (Configuration::get('googleflogin_semail') != 1 ? 'selected' : '') . '>' . $this->l('No') . '</option>
                                    </select>
                    				</div>
                                </div>
                                    <div class="bootstrap clearfix">
                                <div style="clear:both; margin-bottom:20px;">
                                    <label>' . $this->l('Do not allow to alter password') . '</label>
                    			    <div class="margin-form">
                                    <select name="googleflogin_identity">
                                        <option>' . $this->l('-- SELECT --') . '</option>
                                        <option value="1" ' . (Configuration::get('googleflogin_identity') == 1 ? 'selected' : '') . '>' . $this->l('Yes') . '</option>
                                        <option value="0" ' . (Configuration::get('googleflogin_identity') != 1 ? 'selected' : '') . '>' . $this->l('No') . '</option>
                                    </select><br/>
                    				</div>
                                </div>
                            <div class="panel-footer">
                                <button class="btn btn-default pull-right" type="submit" name="fblapp_settings" value="1" class="button" />
                                <i class="process-icon-save"></i>
                                ' . $this->l('Save') . '</button>
                            </div>
                        </form>
                    </div>


                    <div class="panel">
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                                <h3>' . $this->l('Display login button in:') . '</h3>
                                <div class="alert alert-info">
                                ' . $this->l('Select position where the module will display button to Log in+') . '
                                </div>
                                <table class="table table-bordered">
                                <tr>
                                <th>' . $this->l('Enabled') . '</th>
                                <th>' . $this->l('Position') . '</th>
                                </tr>
                                ' . $checkbox_options . $popuplogin . '
                                </table>
                				<div class="panel-footer">
                				    <button type="submit" name="hooks_settings" value="1" class="btn btn-default pull-right" />
                				    <i class="process-icon-save"></i>
                				    ' . $this->l('Save') . '
                				    </button>
                				</div>
                        </form>
                    </div>

                    <div class="panel">
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                        <h3>' . $this->l('Register settings:') . '</h3>
                        <label>' . $this->l('Associate customer with group:') . '</label>
                    	<div class="margin-form">
                            <select name="googleflogin_groupid">
                            <option>' . $this->l('-- SELECT --') . '</option>
                            ' . $this->customerGroup(Configuration::get('googleflogin_groupid')) . '
                            </select>
                        </div>
                        <div class="panel-footer">
                            <button type="submit" name="register_settings" value="1" class="btn btn-default pull-right" />
                            <i class="process-icon-save"></i>
                            ' . $this->l('Save') . '
                            </button>
                		</div>
                        </form>
                    </div>

                    <div class="panel">
                        <h3>' . $this->l('Accounts created with Google Login:') . '</h3>
                        <table class="table table-bordered" style="width:100%;">
                        <tr>
                            <th>' . $this->l('Name') . '</th>
                            <th>' . $this->l('Email') . '</th>
                            <th>' . $this->l('Register date') . '</th>
                        </tr>
                        ' . $this->displayListOfAccounts() . '
                        </table>
                   </div>';
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

    public function check_db_id_customer($id)
    {
        $entry = Db::getInstance()->getRow('SELECT id_customer FROM `' . _DB_PREFIX_ . 'googleflogin` WHERE id_customer="' . $id . '"');
        if (isset($entry['id_customer'])) {
            return true;
        } else {
            return false;
        }
    }

    public function hookHeader($params)
    {
        if (Tools::getValue('controller', 'false') != 'false') {
            if (Tools::getValue('controller') == "identity" && Configuration::get('googleflogin_identity') == 1 && Configuration::get('googleflogin_semail') != 1) {
                if (isset($this->context->cookie)) {
                    if (isset($this->context->cookie->id_customer)) {
                        if ($this->check_db_id_customer($this->context->cookie->id_customer)) {
                            $passwd = Tools::passwdGen(8);
                            $customer = new Customer($this->context->cookie->id_customer);
                            $customer->passwd = Tools::encrypt($passwd);
                            $this->context->cookie->passwd = Tools::encrypt($passwd);
                            $this->context->cookie->write();
                            $customer->update();
                            if ($this->psversion() == 7) {
                                $this->context->updateCustomer($customer);
                            }
                            $this->context->smarty->assign('passwd', $passwd);
                        }
                    }
                }
            }
        }

        $logged = $this->context->customer->isLogged();
        $this->context->smarty->assign('logged', $logged);
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        $this->context->smarty->assign('ggl_loginloader', $this->context->link->getModuleLink('googleflogin', 'loginloader', array('ajax' => 1)));
        $this->context->smarty->assign('ps_version', $this->psversion());

        if ($this->psversion() == 5 || $this->psversion() == 6) {
            $this->context->controller->addJS(($this->_path) . 'views/js/googleflogin.js', 'all');
            $this->context->controller->addCSS(($this->_path) . 'views/css/googleflogin.css', 'all');
        } else {
            $this->context->controller->addJS(($this->_path) . 'views/js/googleflogin.js', 'all');
            $this->context->controller->addCSS(($this->_path) . 'views/css/googleflogin17.css', 'all');
        }
        return $this->display(__FILE__, 'views/templates/header.tpl');
    }

    public function hookdisplayFooter($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        $this->context->smarty->assign('fb_psver', $this->psversion());
        return $this->display(__FILE__, 'views/templates/footer.tpl');
    }

    public function hookdisplayPersonalInformationTop($params)
    {
        if (Configuration::get('ggl_displayPersonalInformationTop') == 1) {
            $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
            return $this->display(__FILE__, 'views/templates/top.tpl');
        }
    }

    public function hookFooter($params)
    {
        return $this->hookdisplayFooter($params);
    }

    public function hookdisplayTop($params)
    {
        return $this->hookTop($params);
    }

    public function hookTop($params)
    {
        if (Configuration::get('ggl_top') == 1) {
            $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
            return $this->display(__FILE__, 'views/templates/top.tpl');
        }
    }

    public function hookdisplaytopColumn($params)
    {
        if (Configuration::get('ggl_top') == 1) {
            $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
            return $this->display(__FILE__, 'views/templates/topColumn.tpl');
        }
    }

    public function hookdisplayNav($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_displayNav') == 1) {
            return $this->display(__FILE__, 'views/templates/displayNav.tpl');
        }
    }

    public function hookdisplayNav1($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_displayNav1') == 1) {
            return $this->display(__FILE__, 'views/templates/displayNav1.tpl');
        }
    }

    public function hookdisplayNav2($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_displayNav2') == 1) {
            return $this->display(__FILE__, 'views/templates/displayNav2.tpl');
        }
    }

    public function hookshoppingCart($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_shoppingCart') == 1) {
            return $this->display(__FILE__, 'views/templates/shoppingCart.tpl');
        }
    }

    public function hookgoogleflogin($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_googleflogin') == 1) {
            return $this->display(__FILE__, 'views/templates/googleflogin.tpl');
        }
    }

    public function hookleftcolumn($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_leftcolumn') == 1) {
            return $this->display(__FILE__, 'views/templates/leftcolumn.tpl');
        }
    }

    public function hookrightcolumn($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_rightoclumn') == 1) {
            return $this->display(__FILE__, 'views/templates/rightoclumn.tpl');
        }
    }

    public function hookhome($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_home') == 1) {
            return $this->display(__FILE__, 'views/templates/home.tpl');
        }
    }

    public function hookdisplayCustomerLoginFormAfter($params)
    {

        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_displayCustomerLoginFormAfter') == 1) {
            return $this->display(__FILE__, 'views/templates/displayCustomerLoginFormAfter.tpl');
        }
    }

    public function hookshoppingCartExtra($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_shoppingCartExtra') == 1) {
            return $this->display(__FILE__, 'views/templates/shoppingCartExtra.tpl');
        }
    }

    public function hookcreateAccountForm($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_createAccountForm') == 1) {
            return $this->display(__FILE__, 'views/templates/createAccountForm.tpl');
        }
    }

    public function hookCreateAccountTop($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        if (Configuration::get('ggl_createAccountTop') == 1) {
            return $this->display(__FILE__, 'views/templates/createAccountTop.tpl');
        }
    }

    public function hookpopuplogin($params)
    {
        $this->context->smarty->assign('ggl_appid', Configuration::get('ggl_appid'));
        $this->context->smarty->assign('ggl_loginloader', $this->context->link->getModuleLink('googleflogin', 'loginloader', array('ajax' => 1)));
        return $this->context->smarty->fetch(_PS_MODULE_DIR_ . $this->name . '/views/templates/displayPopUpLogin.tpl');

    }

    public function hookdashboardZoneOne($params)
    {
        $this->context->smarty->assign('last_accounts', $this->displayListOfAccountsLast(10));
        $this->context->smarty->assign('nb_of_fb_accounts', $this->nbOfAccounts());
        return $this->display(__FILE__, 'views/templates/dashboardZoneOne.tpl');
    }

    public function nbOfAccounts()
    {
        $accounts = Db::getInstance()->ExecuteS('SELECT count(*) as counter FROM `' . _DB_PREFIX_ . 'googleflogin`');
        return (isset($accounts[0]['counter']) ? $accounts[0]['counter'] : 0);
    }

    public function displayListOfAccountsLast($nb)
    {
        $accounts = Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'googleflogin` ORDER BY id_social DESC LIMIT ' . $nb);
        $return = '';
        foreach ($accounts AS $account => $value) {
            $customer = new Customer($value['id_customer']);
            if (isset($customer->email)) {
                $return .= "
                <tr>
                    <td>" . $customer->firstname . ' ' . $customer->lastname . "</td>
                </tr>";
            }
        }
        return $return;
    }

    public function displayListOfAccounts()
    {
        $accounts = Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'googleflogin` ORDER BY id_social DESC');
        $return = '';
        foreach ($accounts AS $account => $value) {
            $customer = new Customer($value['id_customer']);
            if (isset($customer->email)) {
                $return .= "
            <tr>
                <td>" . $customer->firstname . ' ' . $customer->lastname . "</td>
                <td>" . $customer->email . "</td>
                <td>" . $customer->date_add . "</td>
            </tr>";
            }
        }
        return $return;
    }

    public function inconsistency($ret)
    {
        return;
    }

}

class googlefloginUpdate extends googleflogin
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

}
