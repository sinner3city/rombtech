<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit15aac4a0c023ea6858154be3c65f4383
{
    public static $classMap = array (
        'Ps_Currencyselector' => __DIR__ . '/../..' . '/ps_currencyselector.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->classMap = ComposerStaticInit15aac4a0c023ea6858154be3c65f4383::$classMap;

        }, null, ClassLoader::class);
    }
}