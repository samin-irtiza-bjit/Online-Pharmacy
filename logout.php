<?php
    require 'library/config.php';
    unset($_SESSION['c_login']);
    setcookie('username', '', time()-7000000, '/');
    header('location: index.php?mod=login');
?>