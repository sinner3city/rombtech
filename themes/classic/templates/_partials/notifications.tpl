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

{if isset($notifications)}

<div class="panel panel-top {if $notifications.error || $notifications.warning || $notifications.success || $notifications.info}panel-top--active{/if}" data-panel="top">
  <div class="panel__container">
    <section attr-id="notifications">
      <div class="container">
        {if $notifications.error}
          {block name='notifications_error'}
            <article class="alert alert-danger test" role="alert" data-alert="danger">
              <ul>
                {foreach $notifications.error as $notif}
                  <li>{$notif nofilter}</li>
                {/foreach}
              </ul>
            </article>
          {/block}
        {/if}
    
        {if $notifications.warning}
          {block name='notifications_warning'}
            <article class="alert alert-warning" role="alert" data-alert="warning">
              <ul>
                {foreach $notifications.warning as $notif}
                  <li>{$notif nofilter}</li>
                {/foreach}
              </ul>
            </article>
          {/block}
        {/if}
    
        {if $notifications.success}
          {block name='notifications_success'}
            <article class="alert alert-success" role="alert" data-alert="success">
              <ul>
                {foreach $notifications.success as $notif}
                  <li>{$notif nofilter}</li>
                {/foreach}
              </ul>
            </article>
          {/block}
        {/if}
    
        {if $notifications.info}
          {block name='notifications_info'}
            <article class="alert alert-info" role="alert" data-alert="info">
              <ul>
                {foreach $notifications.info as $notif}
                  <li>{$notif nofilter}</li>
                {/foreach}
              </ul>
            </article>
          {/block}
        {/if}
      </div>
    </section>
  </div>
  <i class="panel__close material-icons">close</i>
</div>


{/if}
