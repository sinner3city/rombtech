<?php
class facelogin extends Module
{
    public function __construct()
    {
        ini_set("display_errors", 0);
        error_reporting(0); //E_ALL
        $this->name = 'facelogin';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Fshop fb login';
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = "Fshop Facebook Login";
        $this->description = "Szybkie logowanie przez facebooka.";

        $this->modulehooks['top']['ps14'] = 1;
        $this->modulehooks['top']['ps15'] = 1;
        $this->modulehooks['top']['ps16'] = 1;
        $this->modulehooks['top']['ps17'] = 1;
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
        $this->modulehooks['leftcolumn']['ps14'] = 1;
        $this->modulehooks['leftcolumn']['ps15'] = 1;
        $this->modulehooks['leftcolumn']['ps16'] = 1;
        $this->modulehooks['leftcolumn']['ps17'] = 1;
        $this->modulehooks['facelogin']['ps14'] = 1;
        $this->modulehooks['facelogin']['ps15'] = 1;
        $this->modulehooks['facelogin']['ps16'] = 1;
        $this->modulehooks['facelogin']['ps17'] = 1;
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
        $this->modulehooks['displayPersonalInformationTop']['ps14'] = 0;
        $this->modulehooks['displayPersonalInformationTop']['ps15'] = 0;
        $this->modulehooks['displayPersonalInformationTop']['ps16'] = 0;
        $this->modulehooks['displayPersonalInformationTop']['ps17'] = 1;

    }

    public function inconsistency()
    {
        return true;
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
        $sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'facelogin` (
                  `id_facelogin` int(10) unsigned NOT NULL AUTO_INCREMENT,
                  `id_social` VARCHAR(20) NOT NULL,
                  `type` VARCHAR(10) NOT NULL,
                  `hash` VARCHAR(100) NOT NULL,
                  `id_customer` INT(10) UNSIGNED NOT NULL,
                  PRIMARY KEY (`id_facelogin`),
                  UNIQUE  `id_facelogin_unique` (`id_facelogin`)
                 ) ENGINE=' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8';
        if (!parent::install() or !$this->runSql($sql) or !$this->registerHook('header') or ($this->psversion() != 4 && $this->psversion() != 5 ? !$this->registerHook('dashboardZoneOne') : true) or !$this->installModuleHooks() or !Configuration::updateValue('facelogin_groupid', Configuration::get('PS_CUSTOMER_GROUP'))) {
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
                    $this->update_facelogin_db($post, $this->check_core($post['email']));
                } else {
                    $this->loginprocess($this->registeraccount_core($post));
                    $this->update_facelogin_db($post, $this->check_core($post['email']));
                }
            } else {
                if ($this->check_db($post['id']) == false) {
                    $this->loginprocess($this->registeraccount_db($post, $this->check_core($post['email']), ""));
                    $this->update_facelogin_db($post, $this->check_core($post['email']));
                } else {
                    $this->loginprocess($this->check_core($post['email']));
                    $this->update_facelogin_db($post, $this->check_core($post['email']));
                }
            }
        } else {
            echo "alert(\"" . $this->l('To register and login with Facebook login you must verify your email address in your facebook account ') . "\");";
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
        return Db::getInstance()->getRow('SELECT id_customer FROM `' . _DB_PREFIX_ . 'facelogin` WHERE id_social="' . $fbid . '"');
    }

    public function check_db_id_customer($id)
    {
        $entry = Db::getInstance()->getRow('SELECT id_customer FROM `' . _DB_PREFIX_ . 'facelogin` WHERE id_customer="' . $id . '"');
        if (isset($entry['id_customer'])) {
            return true;
        } else {
            return false;
        }
    }

    public function registeraccount_db($post, $id_customer, $passwd)
    {
        Db::getInstance()->Execute('INSERT INTO `' . _DB_PREFIX_ . 'facelogin` (`id_social`,`type`,`hash`,`id_customer`) VALUES ("' . $post['id'] . '","fb","' . $passwd . '","' . $id_customer . '")');
        return $id_customer;
    }

    public function update_facelogin_db($post, $id_customer)
    {
        Db::getInstance()->Execute('UPDATE `' . _DB_PREFIX_ . 'facelogin` SET `id_customer`=' . $id_customer . ' WHERE `id_social`=' . $post['id']);
    }

    public function registeraccount_core($post)
    {
        $passwd = md5(Tools::passwdGen(8));
        $customer = new Customer();
        if (isset($post['gender'])) {
            if ($post['gender'] == 'male') {
                $customer->id_gender = 1;
            } elseif ($post['gender'] == 'female') {
                $customer->id_gender = 2;
            }
        }
        $customer->passwd = $passwd;
        $customer->email = $post['email'];
        $customer->firstname = $post['first_name'];
        $customer->lastname = $post['last_name'];
        $customer->active = 1;
        $customer->newsletter = 0;
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
                    '_POST' => $_POST,
                    'facelogin' => true,
                    'newCustomer' => $customer
                ));
            }
        }
        $customer->cleanGroups();
        $customer->addGroups(array((int)Configuration::get('facelogin_groupid')));

        if (Configuration::get('PS_CUSTOMER_CREATION_EMAIL') && Configuration::get('facelogin_semail') == 1) {
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
            Hook::exec('actionAuthentication');

            if ($this->psversion() == 7) {
                $this->context->updateCustomer($customer);
            }

            CartRule::autoRemoveFromCart($this->context);
            CartRule::autoAddToCart($this->context);
            if ($this->psversion() == 5 || $this->psversion() == 6 || $this->psversion() == 7) {
                if (Tools::getValue('back')) {
                    if (Validate::isAbsoluteUrl(Tools::getValue('back'))) {
                        echo "top.location.href='" . (Tools::getValue('back')) . "'";
                    } else {
                        echo "top.location.href='" . '' . ($this->context->link->getPageLink(Tools::getValue('back'))) . "'";
                    }
                } else {
                    echo 'top.location.reload();';
                }
            } else {
                echo 'top.location.reload();';
            }
        }
    }

    public function getContent()
    {
        $output = "";
        if (Tools::isSubmit('hooks_settings')) {
            Configuration::updateValue('fbl_popuplogin', Tools::getValue('fbl_popuplogin'));
        }
        if (Tools::isSubmit('fblapp_settings')) {
            Configuration::updateValue('facelogin_inapp', Tools::getValue('facelogin_inapp'));
            Configuration::updateValue('fbl_appid', Tools::getValue('fbl_appid'));
            Configuration::updateValue('fbl_langarray', Tools::getValue('fbl_langarray'));
        }
        if (Tools::isSubmit('register_settings')) {
            Configuration::updateValue('facelogin_groupid', Tools::getValue('facelogin_groupid'));
            Configuration::updateValue('facelogin_semail', Tools::getValue('facelogin_semail'));
            Configuration::updateValue('facelogin_identity', Tools::getValue('facelogin_identity'));
        }
        return $output . $this->displayForm();
    }

    public function displayForm()
    {
        if ($this->psversion() == 5 || $this->psversion() == 6 || $this->psversion() == 7) {
            if (Hook::getIdByName(preg_replace("/[^\da-z]/i", '', trim('popuplogin'))) == true) {
                $popuplogin = '<td class="margin-form"><input type="checkbox" name="fbl_popuplogin" value="1" ' . (Configuration::get('fbl_popuplogin') == 1 ? 'checked="yes"' : '') . '/></td><td>' . $this->l('PopUp login') . '</td>';
            } else {
                $popuplogin = '<td>' . $this->l('popup login module is not installed, hook doesnt exist') . '</td><td>' . $this->l('PopUp login') . '</td>';
            }
        }
        $languages = Language::getLanguages(false);
        $id_lang_default = (int)Configuration::get('PS_LANG_DEFAULT');
        $langiso = "";
        foreach ($languages as $language) {
            $langiso .= '<div id="header_fbl_langarray_' . $language['id_lang'] . '" style="display: ' . ($language['id_lang'] == $id_lang_default ? 'block' : 'none') . ';float: left;">
        <input type="text" id=fbl_langarray' . $language['id_lang'] . '" name="fbl_langarray[' . $language['id_lang'] . ']" value="' . Configuration::get('fbl_langarray', $language['id_lang']) . '">
        </div>';
        }
        $langiso .= "<div class='flags_block'>" . $this->displayFlags($languages, $id_lang_default, 'header_fbl_langarray', 'header_fbl_langarray', true) . "</div>";
        $checkbox_options = '';
        foreach ($this->modulehooks AS $modulehook => $value) {
            if (($this->psversion() == 4 && $value['ps14'] == 1) || ($this->psversion() == 5 && $value['ps15'] == 1) || ($this->psversion() == 6 && $value['ps16'] == 1) || ($this->psversion() == 7 && $value['ps17'] == 1)) {
                if (Tools::getValue('hooks_settings', 'false') != 'false') {
                    if (Tools::getValue('fbl_' . $modulehook, 'false') != 'false') {
                        if (Tools::getValue('fbl_' . $modulehook) == 1) {
                            Configuration::updateValue('fbl_' . $modulehook, 1);
                        } else {
                            Configuration::updateValue('fbl_' . $modulehook, 0);
                        }
                    } else {
                        Configuration::updateValue('fbl_' . $modulehook, 0);
                    }
                }
                $checkbox_options .= '<tr><td style="width:150px;">' . "<input type=\"checkbox\" value=\"1\" name=\"fbl_$modulehook\" " . (Configuration::get('fbl_' . $modulehook) == 1 ? 'checked' : '') . "></td><td>" . $modulehook . "</td></tr>";
            }
        }
        return '
        <link rel="stylesheet" media="all" href="../modules/' . $this->name . '/css.css" type="text/css" />
                    <div class="panel">
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                            <h3>' . $this->l('Facebook APP ID') . '</h3>
                                                            
                                
                            <div style="clear:both; margin-bottom:20px;">
                                <label>' . $this->l('Include facebook SDK (all.js)') . '</label>
                    			<div class="margin-form">
                                <select name="facelogin_inapp">
                                    <option value="1" ' . (Configuration::get('facelogin_inapp') == 1 ? 'selected' : '') . '>' . $this->l('Yes') . '</option>
                                    <option value="0" ' . (Configuration::get('facelogin_inapp') != 1 ? 'selected' : '') . '>' . $this->l('No') . '</option>
                                </select>
                    		</div>
                      </div>  
                                
                            <label>' . $this->l('Facebook APP ID') . '</label>
                    		<div class="margin-form">
                    		    <input type="text" name="fbl_appid" value="' . Configuration::get('fbl_appid') . '"/>
                    		</div>
                    		<br/>
 
                            <div style="display:block; clear:both;">
            		            <div style="display:block; clear:both; margin-top:20px;">
                                    <label>' . $this->l('APP language codes') . ':</label>
                                    <div class="margin-form" style="text-align:left;">
                                        <div id="header_fbl_langarray_1" style="display: block;float: left;">
        <input type="text" id="fbl_langarray" name="fbl_langarray" value="pl_PL">
        </div>
                                    </div>	
            		            </div>
            	            </div>
                            <div class="panel-footer">
                                 <button class="btn btn-default pull-right" name="fblapp_settings" value="1"/><i class="process-icon-save"></i>' . $this->l('Save') . '</button>
                            </div>
                        </form>
                    </div>                                            
                    
                            
                   <div class="panel">
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">    
                        <h3>' . $this->l('Display login button in:') . '</h3>
                        <div class="alert alert-info">' . $this->l('Select position where the module will display button to log in with Facebook') . '</div>
                        <table class="table table-bordered">
                            <tr>
                                <th>' . $this->l('Enabled') . '</th>
                                <th>' . $this->l('Position') . '</th>
                            </tr>' . $checkbox_options . ' ' . $popuplogin . '
                        </table>
                        <div class="panel-footer">
                            <button class="btn btn-default pull-right" type="submit" name="hooks_settings" value="1" class="button" /><i class="process-icon-save"></i>' . $this->l('Save') . '</button>
                        </div>
                        </form>
                   </div>
                    
                    <div class="panel">
                        <form action="' . Tools::safeOutput($_SERVER['REQUEST_URI']) . '" method="post">
                            <h3>' . $this->l('Register settings:') . '</h3>
                                <div style="clear:both; margin-bottom:10px;">
                                    <label>' . $this->l('Associate customer with group:') . '</label>
                    			    <div class="margin-form">
                                    <select name="facelogin_groupid">
                                    <option>' . $this->l('-- SELECT --') . '</option>
                                    ' . $this->customerGroup(Configuration::get('facelogin_groupid')) . '
                                    </select>
                    				</div>
                                </div>
                                <div style="clear:both; margin-bottom:20px;">
                                    <label>' . $this->l('Send email with account register confirmation:') . '</label>
                    			    <div class="margin-form">
                                    <select name="facelogin_semail">
                                        <option>' . $this->l('-- SELECT --') . '</option>
                                        <option value="1" ' . (Configuration::get('facelogin_semail') == 1 ? 'selected' : '') . '>' . $this->l('Yes') . '</option>
                                        <option value="0" ' . (Configuration::get('facelogin_semail') != 1 ? 'selected' : '') . '>' . $this->l('No') . '</option>
                                    </select>
                    				</div>
                                </div>           
                                    <div class="bootstrap clearfix">
                                    </div>
                                <div style="clear:both; margin-bottom:20px;">
                                    <label>' . $this->l('Do not allow to alter password') . '</label>
                    			    <div class="margin-form">
                                    <select name="facelogin_identity">
                                        <option>' . $this->l('-- SELECT --') . '</option>
                                        <option value="1" ' . (Configuration::get('facelogin_identity') == 1 ? 'selected' : '') . '>' . $this->l('Yes') . '</option>
                                        <option value="0" ' . (Configuration::get('facelogin_identity') != 1 ? 'selected' : '') . '>' . $this->l('No') . '</option>
                                    </select>
                    				</div>
                                </div>
                                <div class="panel-footer">
                				    <button class="btn btn-default pull-right"  name="register_settings" value="1"/><i class="process-icon-save"></i>' . $this->l('Save') . '</button>
                				</div>
                            </fieldset>
                        </form>
                    </div>

                    <div class="panel">
                            <h3>' . $this->l('Accounts created with FB Login:') . '</h3>
                            <table class="table" style="width:100%;">
                            <tr>
                                <th>' . $this->l('Image') . '</th>
                                <th>' . $this->l('Name') . '</th>
                                <th>' . $this->l('Email') . '</th>
                                <th>' . $this->l('Register date') . '</th>
                                <th>' . $this->l('Options') . '</th>
                            </tr>
                            ' . $this->displayListOfAccounts() . '
                            </table>
                        </fieldset>
                   </div>';
    }

    public function displayListOfAccounts()
    {
        $accounts = Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'facelogin`');
        $return = '';
        if (count($accounts) > 0) {
            foreach ($accounts AS $account => $value) {
                $customer = new Customer($value['id_customer']);
                if (isset($customer->email)) {
                    $return .= "
            <tr>
                <td><img src='https://graph.facebook.com/" . $value['id_social'] . "/picture?type=square'/></a></td>
                <td>" . $customer->firstname . ' ' . $customer->lastname . "</td>
                <td>" . $customer->email . "</td>
                <td>" . $customer->date_add . "</td>
                <td><a target='_blank' href='https://facebook.com/" . $value['id_social'] . "'>" . $this->l('See FB profile') . "</a></td>
            </tr>";
                }
            }
        } else {
            $return = '<tr><td colspan="5"><div class="alert alert-warning">' . $this->l('No accounts created') . '</div></td></tr>';
        }
        return $return;
    }

    public function displayListOfAccountsLast($nb)
    {
        $accounts = Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'facelogin` ORDER BY id_facelogin DESC LIMIT ' . $nb);
        $return = '';
        foreach ($accounts AS $account => $value) {
            $customer = new Customer($value['id_customer']);
            if (isset($customer->email)) {
                $return .= "
                <tr>
                    <td><img src='https://graph.facebook.com/" . $value['id_social'] . "/picture?type=square'/></a></td>
                    <td>" . $customer->firstname . ' ' . $customer->lastname . "</td>
                    <td><a target='_blank' href='https://facebook.com/" . $value['id_social'] . "'>" . $this->l('See FB profile') . "</a></td>
                </tr>";
            }
        }
        return $return;
    }

    public function nbOfAccounts()
    {
        $accounts = Db::getInstance()->ExecuteS('SELECT count(*) as counter FROM `' . _DB_PREFIX_ . 'facelogin`');
        return (isset($accounts[0]['counter']) ? $accounts[0]['counter'] : 0);
    }

    public function customerGroup($group_id)
    {
        $return = '';
        foreach (Group::getGroups($this->context->language->id, $id_shop = false) as $key => $value) {
            $return .= '<option ' . ($group_id == $value['id_group'] ? 'selected="yes"' : '') . ' value="' . $value['id_group'] . '">' . $value['name'] . '</option>';
        }
        return $return;
    }

    public function hookHeader($params)
    {
        $passwd = false;
        if (Tools::getValue('controller', 'false') != 'false') {
            if (Tools::getValue('controller') == "identity" && Configuration::get('facelogin_identity') == 1) {
                if (isset($this->context->cookie)) {
                    if (isset($this->context->cookie->id_customer)) {
                        if ($this->check_db_id_customer($this->context->cookie->id_customer)) {
                            $passwd = Tools::passwdGen(8);
                            $customer = new Customer($this->context->cookie->id_customer);
                            $customer->passwd = Tools::encrypt($passwd);
                            $this->context->cookie->passwd = Tools::encrypt($passwd);
                            $this->context->cookie->write();
                            $customer->update();
                            $this->context->smarty->assign('passwd', $passwd);
                        }
                    }
                }
            }
        }
        if ($this->psversion() == 5 || $this->psversion() == 6) {
            $this->context->controller->addJS(($this->_path) . 'js/facelogin.js', 'all');
            $this->context->controller->addCSS(($this->_path) . 'css/facelogin.css', 'all');
        } elseif ($this->psversion() == 7) {
            $this->context->controller->addJS(($this->_path) . 'js/facelogin.js', 'all');
            $this->context->controller->addCSS(($this->_path) . 'css/facelogin17.css', 'all');
        }

        if ($this->psversion() != 4) {
            $logged = $this->context->customer->isLogged();
        }

        $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
        $this->smarty->assign('ps_version', $this->psversion());
        $this->smarty->assign('logged', $logged);
        $this->smarty->assign('fbl_langcode', Configuration::get('fbl_langarray', $this->context->language->id));
        return $this->display(__file__, 'header.tpl');
    }

    public function hookFooter($params)
    {
        $this->smarty->assign('fb_psver', $this->psversion());
        return $this->display(__file__, 'footer.tpl');
    }

    public function hookdisplayTop($params)
    {
        if (Configuration::get('fbl_top') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'top.tpl');
        }
    }

    public function hooktop($params)
    {
        if (Configuration::get('fbl_top') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'top.tpl');
        }
    }

    public function hookdisplaytopColumn($params)
    {
        if (Configuration::get('fbl_displaytopColumn') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'topColumn.tpl');
        }
    }

    public function hookhome($params)
    {
        if (Configuration::get('fbl_home') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'home.tpl');
        }
    }

    public function hookdisplayNav($params)
    {
        if (Configuration::get('fbl_displayNav') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'displayNav.tpl');
        }
    }

    public function hookdisplayNav1($params)
    {
        if (Configuration::get('fbl_displayNav1') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'displayNav.tpl');
        }
    }

    public function hookdisplayNav2($params)
    {
        if (Configuration::get('fbl_displayNav2') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'displayNav.tpl');
        }
    }

    public function hookshoppingCart($params)
    {
        if (Configuration::get('fbl_shoppingCart') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'shoppingCart.tpl');
        }
    }

    public function hookdisplayCustomerLoginFormAfter($params)
    {
        if (Configuration::get('fbl_displayCustomerLoginFormAfter') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'displayCustomerLoginFormAfter.tpl');
        }
    }


    public function hookdisplayPersonalInformationTop($params)
    {
        if (Configuration::get('fbl_displayPersonalInformationTop') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'displayPersonalInformationTop.tpl');
        }
    }


    public function hookshoppingcartextra($params)
    {
        if (Configuration::get('fbl_shoppingCartExtra') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'shoppingCartExtra.tpl');
        }
    }

    public function hookleftcolumn($params)
    {
        if (Configuration::get('fbl_leftcolumn') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'leftcolumn.tpl');
        }
    }

    public function hookfacelogin($params)
    {
        if (Configuration::get('fbl_facelogin') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'facelogin.tpl');
        }
    }

    public function hookrightcolumn($params)
    {
        if (Configuration::get('fbl_rightcolumn') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'rightcolumn.tpl');
        }
    }

    public function hookpopuplogin($params)
    {
        if (Configuration::get('fbl_popuplogin') == 1) {
            $this->context->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            $this->context->smarty->assign('ps_version', $this->psversion());
            $this->context->smarty->assign('fbl_langcode', Configuration::get('fbl_langarray', $this->context->language->id));
            return $this->context->smarty->fetch(_PS_MODULE_DIR_ . $this->name . '/displayPopUpLogin.tpl');
        }
    }

    public function hookcreateaccountform($params)
    {
        if (Configuration::get('fbl_createAccountForm') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'createAccountForm.tpl');
        }
    }

    public function hookcreateaccounttop($params)
    {
        if (Configuration::get('fbl_createAccountTop') == 1) {
            $this->smarty->assign('fbl_appid', Configuration::get('fbl_appid'));
            return $this->display(__file__, 'createAccountTop.tpl');
        }
    }

    public function hookdashboardZoneOne($params)
    {
        $this->context->smarty->assign('last_accounts', $this->displayListOfAccountsLast(3));
        $this->context->smarty->assign('nb_of_fb_accounts', $this->nbOfAccounts());
        return $this->display(__file__, 'dashboardZoneOne.tpl');
    }
}

class faceloginUpdate extends facelogin
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
