<?php
/*
* PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
*
* @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
* @copyright 2010-2020 VEKIA
* @license   This program is not free software and you can't resell and redistribute it
*
* CONTACT WITH DEVELOPER
* support@mypresta.eu
*/


class myprestaloyaltyDefaultModuleFrontController extends ModuleFrontController
{
    public $ssl = true;
    public $display_column_left = false;

    public function __construct()
    {
        $this->auth = true;
        parent::__construct();

        $this->context = Context::getContext();

        include_once($this->module->getLocalPath() . 'LoyaltyModule.php');
        include_once($this->module->getLocalPath() . 'LoyaltyStateModule.php');

        // Declare smarty function to render pagination link
        smartyRegisterFunction($this->context->smarty, 'function', 'summarypaginationlink', array('LoyaltyDefaultModuleFrontController', 'getSummaryPaginationLink'));
    }

    /**
     * @see FrontController::postProcess()
     */
    public function postProcess()
    {
        if (Tools::getValue('process') == 'transformpoints')
            $this->processTransformPoints();
    }

    /**
     * Transform loyalty point to a voucher
     */
    public function processTransformPoints()
    {
        $customer_points = (int)LoyaltyModule::getPointsByCustomer((int)$this->context->customer->id);
        if ($customer_points > 0) {
            /* Generate a voucher code */
            $voucher_code = null;
            do
                $voucher_code = 'FID' . rand(1000, 100000);
            while (CartRule::cartRuleExists($voucher_code));

            // Voucher creation and affectation to the customer
            $cart_rule = new CartRule();
            $cart_rule->code = $voucher_code;
            $cart_rule->id_customer = (int)$this->context->customer->id;
            $cart_rule->reduction_currency = (int)$this->context->currency->id;
            $cart_rule->reduction_amount = LoyaltyModule::getVoucherValue((int)$customer_points);
            $cart_rule->quantity = 1;
            $cart_rule->highlight = 1;
            $cart_rule->quantity_per_user = 1;
            $cart_rule->reduction_tax = (bool)Configuration::get('PS_LOYALTY_TAX');

            // If merchandise returns are allowed, the voucher musn't be usable before this max return date
            $date_from = Db::getInstance()->getValue('
			SELECT UNIX_TIMESTAMP(date_add) n
			FROM ' . _DB_PREFIX_ . 'loyalty
			WHERE id_cart_rule = 0 AND id_customer = ' . (int)$this->context->cookie->id_customer . '
			ORDER BY date_add DESC');

            if (Configuration::get('PS_ORDER_RETURN'))
                $date_from += 60 * 60 * 24 * (int)Configuration::get('PS_ORDER_RETURN_NB_DAYS');

            $cart_rule->date_from = date('Y-m-d H:i:s', $date_from);
            $cart_rule->date_to = date('Y-m-d H:i:s', strtotime($cart_rule->date_from . ' +1 year'));

            $cart_rule->minimum_amount = (float)Configuration::get('PS_LOYALTY_MINIMAL');
            $cart_rule->minimum_amount_currency = (int)$this->context->currency->id;
            $cart_rule->active = 1;

            $categories = Configuration::get('PS_LOYALTY_VOUCHER_CATEGORY');
            if ($categories != '' && $categories != 0)
                $categories = explode(',', Configuration::get('PS_LOYALTY_VOUCHER_CATEGORY'));
            else
                die (Tools::displayError());

            $languages = Language::getLanguages(true);
            $default_text = Configuration::get('PS_LOYALTY_VOUCHER_DETAILS', (int)Configuration::get('PS_LANG_DEFAULT'));

            foreach ($languages as $language) {
                $text = Configuration::get('PS_LOYALTY_VOUCHER_DETAILS', (int)$language['id_lang']);
                $cart_rule->name[(int)$language['id_lang']] = $text ? strval($text) : strval($default_text);
            }

            if (Configuration::get('PS_LOYALTY_UNCOMBINABLE') == 1) {
                $cart_rule->cart_rule_restriction = 1;
            }

            $contains_categories = is_array($categories) && count($categories);
            if ($contains_categories)
                $cart_rule->product_restriction = 1;
            $cart_rule->add();

            if (Configuration::get('PS_LOYALTY_UNCOMBINABLE') == 1) {
                myprestaloyalty::afterAdd($cart_rule, '', false);
            }

            //Restrict cartRules with categories
            if ($contains_categories) {

                //Creating rule group
                $id_cart_rule = (int)$cart_rule->id;
                $sql = "INSERT INTO " . _DB_PREFIX_ . "cart_rule_product_rule_group (id_cart_rule, quantity) VALUES ('$id_cart_rule', 1)";
                Db::getInstance()->execute($sql);
                $id_group = (int)Db::getInstance()->Insert_ID();

                //Creating product rule
                $sql = "INSERT INTO " . _DB_PREFIX_ . "cart_rule_product_rule (id_product_rule_group, type) VALUES ('$id_group', 'categories')";
                Db::getInstance()->execute($sql);
                $id_product_rule = (int)Db::getInstance()->Insert_ID();

                //Creating restrictions
                $values = array();
                foreach ($categories as $category) {
                    $category = (int)$category;
                    $values[] = "('$id_product_rule', '$category')";
                }
                $values = implode(',', $values);
                $sql = "INSERT INTO " . _DB_PREFIX_ . "cart_rule_product_rule_value (id_product_rule, id_item) VALUES $values";
                Db::getInstance()->execute($sql);
            }


            // Register order(s) which contributed to create this voucher
            if (!LoyaltyModule::registerDiscount($cart_rule))
                $cart_rule->delete();
        }

        Tools::redirect($this->context->link->getModuleLink('myprestaloyalty', 'default', array('process' => 'summary')));
    }

    /**
     * @see FrontController::initContent()
     */
    public function initContent()
    {
        parent::initContent();
        $this->context->controller->addJqueryPlugin(array('dimensions', 'cluetip'));

        if (Tools::getValue('process') == 'summary') {
            $this->assignSummaryExecution();
        }
    }

    /**
     * Render pagination link for summary
     *
     * @param (array) $params Array with to parameters p (for page number) and n (for nb of items per page)
     * @return string link
     */
    public static function getSummaryPaginationLink($params, &$smarty)
    {
        if (!isset($params['p']))
            $p = 1;
        else
            $p = $params['p'];

        if (!isset($params['n']))
            $n = 10;
        else
            $n = $params['n'];

        return Context::getContext()->link->getModuleLink(
            'myprestaloyalty',
            'default',
            array(
                'process' => 'summary',
                'p' => $p,
                'n' => $n,
            )
        );
    }

    /**
     * Assign summary template
     */
    public function assignSummaryExecution()
    {
        $customer_points = (int)LoyaltyModule::getPointsByCustomer((int)$this->context->customer->id);
        $orders = LoyaltyModule::getAllByIdCustomer((int)$this->context->customer->id, (int)$this->context->language->id);
        $displayorders = LoyaltyModule::getAllByIdCustomer(
            (int)$this->context->customer->id,
            (int)$this->context->language->id, false, true,
            ((int)Tools::getValue('n') > 0 ? (int)Tools::getValue('n') : 10),
            ((int)Tools::getValue('p') > 0 ? (int)Tools::getValue('p') : 1)
        );
        $this->context->smarty->assign(array(
            'orders' => $orders,
            'displayorders' => $displayorders,
            'totalPoints' => (int)$customer_points,
            'voucher' => LoyaltyModule::getVoucherValue($customer_points, (int)$this->context->currency->id),
            'validation_id' => LoyaltyStateModule::getValidationId(),
            'transformation_allowed' => $customer_points > 0,
            'pagel' => ((int)Tools::getValue('p') > 0 ? (int)Tools::getValue('p') : 1),
            'nbpagination' => ((int)Tools::getValue('n') > 0 ? (int)Tools::getValue('n') : 10),
            'nArray' => array(10, 20, 50),
            'max_page' => floor(count($orders) / ((int)Tools::getValue('n') > 0 ? (int)Tools::getValue('n') : 10)),
            'pagination_link' => Context::getContext()->link->getModuleLink('myprestaloyalty', 'default')
        ));

        /* Discounts */
        $nb_discounts = 0;
        $discounts = array();
        if ($ids_discount = LoyaltyModule::getDiscountByIdCustomer((int)$this->context->customer->id)) {
            $nb_discounts = count($ids_discount);
            foreach ($ids_discount as $key => $discount) {
                $discounts[$key] = new CartRule((int)$discount['id_cart_rule'], (int)$this->context->cookie->id_lang);
                $discounts[$key]->orders = LoyaltyModule::getOrdersByIdDiscount((int)$discount['id_cart_rule']);
            }
        }

        $all_categories = Category::getSimpleCategories((int)$this->context->cookie->id_lang);
        $voucher_categories = Configuration::get('PS_LOYALTY_VOUCHER_CATEGORY');
        if ($voucher_categories != '' && $voucher_categories != 0)
            $voucher_categories = explode(',', Configuration::get('PS_LOYALTY_VOUCHER_CATEGORY'));
        else
            die(Tools::displayError());

        if (count($voucher_categories) == count($all_categories))
            $categories_names = null;
        else {
            $categories_names = array();
            foreach ($all_categories as $k => $all_category)
                if (in_array($all_category['id_category'], $voucher_categories))
                    $categories_names[$all_category['id_category']] = trim($all_category['name']);
            if (!empty($categories_names))
                $categories_names = Tools::truncate(implode(', ', $categories_names), 100) . '.';
            else
                $categories_names = null;
        }
        $this->context->smarty->assign(array(
            'nbDiscounts' => (int)$nb_discounts,
            'discounts' => $discounts,
            'minimalLoyalty' => (float)Configuration::get('PS_LOYALTY_MINIMAL'),
            'categories' => $categories_names));

        $this->setTemplate('module:myprestaloyalty/views/templates/front/loyalty.tpl');
    }
}
