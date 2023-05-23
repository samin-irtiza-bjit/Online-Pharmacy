<?php
    include '../library/config.php';
    include '../classes/class.users.php';

    $action = isset($_GET['action']) ? $_GET['action'] : '';
    switch ($action) {
        case 'newUser' : 
                        userNew();
                        break;
    }
    function userNew() {
        $FirstName = $_POST['First-Name'];
        $LastName = $_POST['Last-Name'];
        $ContactNumber = $_POST['Contact-Number'];
        $EmailAddress = $_POST['Email-Address'];
        $Username = $_POST['Username'];
        $Password = $_POST['Password'];
        $Retype = $_POST['Retype-Password'];
        $users = new Users();
        $users->new_user_request($ContactNumber, $EmailAddress, $Username, $Password, $FirstName, $LastName);
        header("location: ../index.php?mod=login");
        exit;
    }
?>