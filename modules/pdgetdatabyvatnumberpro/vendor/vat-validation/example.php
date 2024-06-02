<?php
require_once('vatValidation.class.php');
$vatValidation = new vatValidation( array('debug' => false));


if($vatValidation->check('PL', '7532042652')) {
	echo '<h1>valid one!</h1>';
	echo 'denomination: ' . $vatValidation->getDenomination(). '<br/>';
	echo 'name: ' . $vatValidation->getName(). '<br/>';
	echo 'address: ' . $vatValidation->getAddress(). '<br/>';
} else {
	echo '<h1>Invalid VAT</h1>';
}
