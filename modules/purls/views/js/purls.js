/*
 * PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
 *
 * @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
 * @copyright 2010-2021 VEKIA
 * @license   This program is not free software and you can't resell and redistribute it
 *
 * CONTACT WITH DEVELOPER http://mypresta.eu
 * support@mypresta.eu
 */


$(document).ready(function () {
    if ($("#idpa").length === 0) {
        $('button[name=submitCustomizedData]').closest('form').append('<input id="idpa" name="idpa" value="' + getIdpa() + '" type="hidden">');
        $('button[name=submitCustomizedData]').closest('form').append('<input id="id_product_attribute_customization" name="id_product_attribute" value="' + getIdpa() + '" type="hidden">');
        $('.remove-image').attr('href', function () {
            return addParams($(this).attr('href'));
        });
    }
});

prestashop.on("updateProduct", function () {
    $(document).ajaxComplete(function () {
        if ($('button[name=submitCustomizedData]').length > 0) {
            if ($("#idpa").length === 0) {
                $('button[name=submitCustomizedData]').closest('form').append('<input id="idpa" name="idpa" value="' + getIdpa() + '" type="hidden">');
                $('button[name=submitCustomizedData]').closest('form').append('<input id="id_product_attribute_customization" name="id_product_attribute" value="' + getIdpa() + '" type="hidden">');
                $('.remove-image').attr('href', function () {
                    return addParams($(this).attr('href'));
                });
            }
        }
    });
});

function getIdpa() {
    if ($('#product-details').length != 0) {
        attr = $('#product-details').attr('data-product');
        if (typeof attr !== typeof undefined && attr !== false) {
            var product_object = jQuery.parseJSON(attr);
            return product_object.id_product_attribute;
        }
    }
}

function addParams(myUrl) {
    name = 'idpa';
    value = getIdpa();

    var re = new RegExp("([?&]" + name + "=)[^&]+", "");

    function add(sep) {
        myUrl += sep + name + "=" + encodeURIComponent(value);
    }

    function change() {
        myUrl = myUrl.replace(re, "$1" + encodeURIComponent(value));
    }

    if (myUrl.indexOf("?") === -1) {
        add("?");
    } else {
        if (re.test(myUrl)) {
            change();
        } else {
            add("&");
        }
    }
    return myUrl;
}

