{*
* PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
*
* @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
* @copyright 2010-2020 VEKIA
* @license   This program is not free software and you can't resell and redistribute it
*
* CONTACT WITH DEVELOPER
* support@mypresta.eu
*}

{if Tools::getValue('ajax')!=1}<section id="cardpoints">{/if}
    <header class="cardpoints__header">
        <h3 class="cardpoints__title"><span class="material-icons">
            verified
            </span>
            Program lojalnościowy dla stałych klientów</h3>
    </header>
    <div class="cardpoints_cart-info">
        {if $points > 0}
            Realizując to zamówienie otrzymasz <strong>{$points} punktów lojalnościowych</strong>, które wymienisz na <strong class="cp1">kod rabatowy o wartości {Tools::displayPrice($voucher)}</strong> przy kolejnym abonamencie.
        {else}
            {l s='Dodaj produkty do koszyka aby zobaczyć ile ottrzymasz punktów lojalnościowych.' mod='myprestaloyalty'}
        {/if}
    </div>
{if Tools::getValue('ajax')!=1}</section>{/if}