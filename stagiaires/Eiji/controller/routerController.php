<?php
/**
 * Notre contrôleur
 */

/**
 * On va se connecter
 * à notre DB via PDO
 */

$dbConnect = new PDO(
    DB_DSN
);

var_dump($dbConnect);