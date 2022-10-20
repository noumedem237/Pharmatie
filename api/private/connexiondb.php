<?php

function connexionDb()
{
    $host = "localhost";
    $dbname = "e-pharmadb";
    $user = "root";
    $pass = "";
    try {
        $bdd = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    } catch (Exception $e) {
    }
    return $bdd;
}
