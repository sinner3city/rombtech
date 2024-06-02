<?php

/**
 * PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
 *
 * @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
 * @copyright 2010-2021 VEKIA
 * @license   This program is not free software and you can't resell and redistribute it
 *
 * CONTACT WITH DEVELOPER http://mypresta.eu
 * support@mypresta.eu
 */
class CartController extends CartControllerCore
{
    public function displayAjaxProductRefresh()
    {

        if ($this->id_product)
        {
            $url = $this->context->link->getProductLink($this->id_product, null, null, null, $this->context->language->id, null, (int)Product::getIdProductAttributesByIdAttributes($this->id_product, Tools::getValue('group'), true), false, false, true, ['quantity_wanted' => (int)$this->qty]);
            $url .= (parse_url($url, PHP_URL_QUERY) ? '&' : '?') . 'idpa=' . (int)Product::getIdProductAttributesByIdAttributes($this->id_product, Tools::getValue('group'), true);
        }
        else
        {
            $url = false;
        }
        ob_end_clean();

        header('Content-Type: application/json');
        $this->ajaxDie(Tools::jsonEncode([
            'success' => true,
            'productUrl' => $url
        ]));
    }
}

?>