<?php

include_once('../../config/config.inc.php');
include_once('../../init.php');
include_once('facelogin.php');

$thismodule = new facelogin();
$thismodule->verifycustomer(Tools::getValue('resp'));

?>