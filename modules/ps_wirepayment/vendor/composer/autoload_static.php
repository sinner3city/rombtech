<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInite36ed216325ebed7ca9b3dd86f71f77a
{
    public static $classMap = array (
        'Ps_Wirepayment' => __DIR__ . '/../..' . '/ps_wirepayment.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->classMap = ComposerStaticInite36ed216325ebed7ca9b3dd86f71f77a::$classMap;

        }, null, ClassLoader::class);
    }
}
