
<?php
/**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 */

/**
 * @param Module $module
 *
 * @return bool
 */
<<<<<<<< HEAD:modules/statsforecast/upgrade/upgrade-2.0.4.php
function upgrade_module_2_0_4($module)
{
    $module->unregisterHook('AdminStatsModules');
    $module->registerHook('displayAdminStatsModules');
========
function upgrade_module_2_0_1($module)
{
    $module->unregisterHook('top');
    $module->registerHook('displayTop');
>>>>>>>> fshop-last-fixes:modules/pagesnotfound/upgrade/upgrade-2.0.1.php

    return true;
}
