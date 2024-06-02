<?php
/**
 * Copyright 2015-2017 NETCAT (www.netcat.pl)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author NETCAT <firma@netcat.pl>
 * @copyright 2015-2017 NETCAT (www.netcat.pl)
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */

include (dirname(__FILE__) . '/../../config/config.inc.php');
include (dirname(__FILE__) . '/../../init.php');
include (dirname(__FILE__) . '/gusapinip24pl.php');

$nip24 = new GusApiNip24pl();

/*
 * if (!Tools::isSubmit('secure_key') || Tools::getValue('secure_key') != $nip24->secure_key
 * || !Tools::getValue('nip') || !Tools::getValue('force')) {
 *
 * die(1);
 * }
 */

if (Tools::getValue('action') == 'check') {
    echo $nip24->checkNIP(Tools::getValue('nip'));
} else {
    if (Tools::getValue('action') == 'get') {
        echo $nip24->getInvoiceData(Tools::getValue('nip'), Tools::getValue('force'), Tools::getValue('form'));
    } else {
        die(2);
    }
}

/* EOF */
