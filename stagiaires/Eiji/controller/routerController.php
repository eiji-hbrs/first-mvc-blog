<?php
/**
 * Notre contrôleur
 */

/**
 * On va se connecter
 * à notre DB via PDO
 */
try{
    $dbConnect = new PDO(
        dsn : DB_DSN,
        username : DB_LOGIN,
        password : DB_PWD,
        options : [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO:: FETCH_ASSOC
        ]
    );
}catch(Exception $e){
    echo ($e->getMessage());
}

/**
 * Route 
 */

/**
 * homepage
 */
include_once BASE_URL."/view/homepage.view.html.php";


// var_dump($dbConnect);
$dbConnect = null;