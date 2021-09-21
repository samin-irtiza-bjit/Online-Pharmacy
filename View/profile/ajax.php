<?php
    include '../library/config.php';
    include '../classes/class.users.php';

    $users = new Users();

    if (isset($_POST['indicator'])) {
        $contact = $_POST['contact'];
        $email = $_POST['email'];
        $usr_id = $_POST['usr_id'];
        $id = $_POST['usr_id'];
        $result = $users->edit_prof($contact, $email, $usr_id);
        $list = $users->get_profile_info($_SESSION['c_userid']);
        foreach ($list as $value) {
?>
    <label class="profile-label w-100" style="margin-bottom: 0px;">Contact Number</br></label>
    <label class="profile-details"><?php echo $value['contact_no'] ?></label>
    <label class="profile-label w-100" style="margin-bottom: 0px;">Email</br></label>
    <label class="profile-details" style="margin-bottom: 0px;">
<?php
            if ($value['email'] == "") {
                echo 'No Email Address';
            } else {
                echo $value['email'];
            }
?>
    <a id="change_pass" class="profile-pass-button" onclick="div_show_change_password()">CHANGE PASSWORD</a>
    </div>
</div>
<?php   }
?>
    </label>
<?php
        exit();
    }
    if (isset($_POST['indicator-pass'])) {
        $users = new Users();
        $usr_id = $_POST['usr_id'];
        $current_pass = $_POST['current-pass'];
        $new_pass = $_POST['new-pass'];
        $confirm = $_POST['confirm-new-pass'];
        $list = $users->get_password($usr_id);
        if ($list) {
            foreach ($list as $value) {
                if ($value['usr_password'] == md5($current_pass)) {
                    $new_confirmed_pass = md5($new_pass);
                    $results = $users->new_pssword($new_confirmed_pass, $usr_id);
                } else {
                    echo "wrong";
                }
            }
        }
        exit();
    }
    if (isset($_POST['history_click'])) {
        $result = $users->get_order_details($_POST['or_id']);
        if ($result) {
?>
    <span class="orderhistory-popup">Order #<?php echo $_POST['or_id']; ?></span>
    <span style="float: right;margin: 24px;color:#333;" class="">Date Ordered:
<?php
            $date = new DateTime($users->get_order_date($_POST['or_id']));
            echo $date->format('M j, Y');
?>  
    </span>
    <table id="ohistory-table">
        <tr>
            <th class="profile-th" style="width: 230px;">Product Name</th>
            <th class="profile-th" style="width: 330px;">Formulation</th>
            <th class="profile-th">Packaging</th>
            <th class="profile-th ta-right">Quantity</th>
        </tr>
    </table>
    <div class="ohistory-scroll">
        <table id="ohistory-table">
<?php
            foreach ($result as $values) {
?>
            <tr class="profile-tr" style="border-bottom: 1px solid #dddddd;">
                <td class="profile-td" style="width: 230px;"><span style="font-weight: 400;"><?php echo $values['pro_brand']; ?></span>
                <?php echo $values['pro_generic']; ?></td>
                <td class="profile-td" style="width: 330px;"><?php echo $values['pro_formulation']; ?></td>
                <td class="profile-td"><?php echo $values['pro_packaging']; ?></td>
                <td class="profile-td ta-right"><?php echo $values['qty_total']; ?></td>
            </tr>
<?php
            }
        }
?>
        </table>
    </div>
    <div style="float: left;margin-left: 24px; margin-top: 12px; margin-bottom: 0px;">
        <span class="material-label">SUBTOTAL</span></br><span class="popup-order-data">Rs
<?php
        $subtotal = $users->get_order_total($_POST['or_id']);
        echo number_format((float) $subtotal, 2, '.', ',');
?>
        </span>
    </div>
    <div style="float: left;margin-left: 80px; margin-top: 12px; margin-bottom: 0px;">
        <span class="popup-order-details">DELIVERY STATUS</span></br><span id="<?php echo $users->get_order_delivery_status($_POST['or_id']); ?>"
        class="popup-order-data check-delivery-value"><?php echo $users->convert_delivery_status($users->get_order_delivery_status($_POST['or_id'])); ?></span>
    </div>
    <div style="float: left;margin-left: 80px; margin-top:12px; margin-bottom: 0px;">
        <span class="popup-order-details">PAYMENT STATUS</span></br><span class="popup-order-data">--------</span>
    </div>
<?php
    }
    if (isset($_POST['mark_unread'])) {
        $users->mark_unread_notif($_POST['n_id'], $_SESSION['clientid']);
    }
    if (isset($_POST['delete_notif'])) {
        $result = $users->delete_notif($_POST['n_id'], $_SESSION['clientid']);
        echo $result;
    }
    if (isset($_POST['clear_all'])) {
        $result = $users->clear_notif($_SESSION['clientid']);
        echo $result;
    }
    if (isset($_POST['cancel_order'])) {
        $result = $users->cancel_order($_POST['or_id']);
        echo $result;
    }
?>