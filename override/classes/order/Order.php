<?php
/**
 * Author: FER-TECH
 * Based on: SEQUENTIAL NUMERIC ORDER REFERENCE override by Obewanz
 * Date: 17.11.2018
 * Generating random numeric reference
 * Prestashop v. 1.7.4.3
 */


Class Order extends OrderCore
{
    public static function generateReference()
    {
        $regenerate = 1;
        $retries = 0;

        while($regenerate > 0){
            // Generate new randomised reference number
            $newReference = strtoupper(Tools::passwdGen(9, 'NUMERIC'));

            // After 10 tries, change first numer to random letter
            if($retries > 10){
                $newReference = substr_replace($newReference, Tools::passwdGen(1, 'NO_NUMERIC') ,0,1);
            }

            //Check if new reference number is unique
            $regenerate = self::checkIfReferenceNumberExist($newReference);

            $retries++;
        }

        return $newReference;
    }

    private static function checkIfReferenceNumberExist($newReferenceNumber)
    {
        $quantityOfReferences =
            Db::getInstance()->getValue('
              SELECT COUNT(id_order)
              FROM '._DB_PREFIX_.'orders
              WHERE reference = "'. $newReferenceNumber .'"
            ');

        return $quantityOfReferences;
    }
}

?>