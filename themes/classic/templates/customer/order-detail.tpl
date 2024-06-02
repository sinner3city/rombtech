{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {block name='order_infos'}
    <div id="order-infos">
      <div class="box">
          <div class="">
            <div class="t-center mg-b-15">
              <h3>{$order.details.reference}</h3>
              <p>Zamówienie z dnia: {$order.details.order_date}</p>
            </div>

            <div class="t-center reorder-top-right flex-row-center-mid"></div>
                {foreach from=$order.history item=state}
                    <span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
                      {$state.ostate_name}
                    </span>
              {/foreach}
              <a href="{$order.details.reorder_url}" class="btn btn--primary">{l s='Reorder' d='Shop.Theme.Actions'}</a>
            </div>

            
          
          </div>
      </div>



    </div>
  {/block}

  {block name='order_history'}
    <section id="order-history" class="box">
      <h3>{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h3>
      <div class="hidden-sm-up history-lines hide">
        {foreach from=$order.history item=state}
          <div class="history-line">
            <div class="date">{$state.history_date}</div>
            <div class="state">
              <span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
                {$state.ostate_name}
              </span>
            </div>
          </div>
        {/foreach}
      </div>
    </section>
  {/block}

  {if $order.follow_up}
    <div class="box">
      <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
      <a href="{$order.follow_up}">{$order.follow_up}</a>
    </div>
  {/if}



  {$HOOK_DISPLAYORDERDETAIL nofilter}

  <div class="history-padding order-details-padding">
    {block name='order_detail'}
      {if $order.details.is_returnable}
        {include file='customer/_partials/order-detail-return.tpl'}
      {else}
        {include file='customer/_partials/order-detail-no-return.tpl'}
      {/if}
    {/block}

    {block name='order_carriers'}
      {if $order.shipping}
        <div class="box">
          <table class="table table-striped table-bordered hidden-sm-down">
            <thead class="thead-default">
              <tr>
                <th>{l s='Date' d='Shop.Theme.Global'}</th>
                <th>{l s='Carrier' d='Shop.Theme.Checkout'}</th>
                <th>{l s='Weight' d='Shop.Theme.Checkout'}</th>
                <th>{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
                <th>{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
              </tr>
            </thead>
            <tbody>
              {foreach from=$order.shipping item=line}
                <tr>
                  <td>{$line.shipping_date}</td>
                  <td>{$line.carrier_name}</td>
                  <td>{$line.shipping_weight}</td>
                  <td>{$line.shipping_cost}</td>
                  <td>{$line.tracking nofilter}</td>
                </tr>
              {/foreach}
            </tbody>
          </table>
          <div class="hidden-md-up shipping-lines  history-content">
            {foreach from=$order.shipping item=line}
              <div class="shipping-line">
                <ul>
                  <li>
                    <strong>{l s='Date' d='Shop.Theme.Global'}</strong> {$line.shipping_date}
                  </li>
                  <li>
                    <strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$line.carrier_name}
                  </li>
                  <li>
                    <strong>{l s='Weight' d='Shop.Theme.Checkout'}</strong> {$line.shipping_weight}
                  </li>
                  <li>
                    <strong>{l s='Shipping cost' d='Shop.Theme.Checkout'}</strong> {$line.shipping_cost}
                  </li>
                  <li>
                    <strong>{l s='Tracking number' d='Shop.Theme.Checkout'}</strong> {$line.tracking nofilter}
                  </li>
                </ul>
              </div>
            {/foreach}
          </div>
        </div>

        
        {block name='addresses'}
          <div class="addresses">
            {if $order.addresses.delivery}
              <div class="div-delivery">
                <article id="delivery-address" class="box">
                <h4 class="invoice-title">Dane do wysyłki</h4>
                  {* <h4>{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</h4> *}
                  <address>{$order.addresses.delivery.formatted nofilter}</address>
                </article>
              </div>
            {/if}
      
            <div class="div-invoice">
              <article id="invoice-address" class="box">
              <h4 class="invoice-title">Dane do faktury</h4>
                {* <h4>{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</h4> *}
                <address>{$order.addresses.invoice.formatted nofilter}</address>
              </article>
            </div>
            <div class="clearfix"></div>
          </div>
        {/block}
      {/if}
    {/block}
  </div>

  {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block}
{/block}
