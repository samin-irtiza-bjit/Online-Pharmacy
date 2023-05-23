<?php
    session_start();

    $hosted = false;
    if ($hosted) {
        define('DB_SERVER', 'localhost');
        define('DB_USERNAME', 'root');
        define('DB_PASSWORD', '');
        define('DB_DATABASE', 'db_pharmacy');
    } else {
        define('DB_SERVER', 'localhost');
        define('DB_USERNAME', 'pharma');
        define('DB_PASSWORD', 'pharmapass');
        define('DB_DATABASE', 'db_pharmacy');
    }
    if(!mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE)){
        $dbname=DB_DATABASE;
        $conn= mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD) or die( mysqli_error($conn));
        $sql1 = "CREATE DATABASE IF NOT EXISTS $dbname";
        $q=mysqli_query($conn,$sql1) or die( mysqli_error($conn));
        $conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);
        $sql1 = file_get_contents('db_pharmacy.sql');
        $conn-> multi_query($sql1);
    }
?>
