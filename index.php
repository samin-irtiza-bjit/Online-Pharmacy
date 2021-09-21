<?php
    include 'library/config.php';
    include 'classes/class.users.php';
    include 'classes/class.products.php';

    $user = new Users();
    $product = new Products();

    if (isset($_REQUEST['login'])) {
        extract($_REQUEST);
        $login = $user->check_login($username, md5($password));
        if ($login) {
            setcookie('username', $username, time() + (86400 * 30), "/");
            header('location: index.php');
        } else {
            header('location: index.php?mod=login&auth=error');
        }
    }

    $module = (isset($_GET['mod']) && $_GET['mod'] != '') ? $_GET['mod'] : '';
    $action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';
?>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <title>BRACU Pharmacy</title>
    <link rel="shortcut icon" href="img/bubu.ico" type="image/x-icon">
    <link rel="icon" href="img/bubu.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css" media="screen and (max-width: 1260px)">
    <link href="css/jquery.dataTables.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

    <script src="js/jquery.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/javascript.js"></script>
    <script src="js/chart.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,600,700,900" rel="stylesheet">
</head>

<body class="background-material">
    <div id="main-container">
        <div id="Splash-pic">
            <div id="hidden">
                <ul>
                    <li><a class="logo" href="index.php"><img src="img/bubu.png" height="21px" />&nbsp;<strong>BRACU Pharmacy</strong></a></li>
                    <li><button id="burgers">&#9776;</button></li>
                    <li><button id="cross">&#735;</button></li>
                </ul>
            </div>
            <div id="navi">
                <ul>
                    <li><a class="logo" href="index.php"><img src="img/bubu.png" height="21px" /><strong> BRACU Pharmacy</strong></a></li>
                    <?php 
                        if ($user->get_session()) { 
                    ?>
                    <li id="cart-item-counter"><a class="cart-icon" href="index.php?mod=viewcart"><?php echo file_get_contents("img/shopping-cart.svg"); ?> <?php echo $product->count_cart($_SESSION['c_userid']); ?> items</a></li>
                    <?php
                        }
                    ?>
                    <?php
                        if (!$user->get_session()) {
                    ?>
                    <li><a href="index.php?mod=register">Sign up now</a></li>
                    <?php
                        }
                    ?>
                    <li><a href="index.php?mod=upload">Upload Prescription</a></li>
                    <li><a href="index.php?mod=products&cat=all">Order Medicines</a></li>
                    <li><a href="index.php#information">Information</a></li>
                    <li><a href="index.php#feature">Features</a></li>
                </ul>
                <h5>Welcome, <?php if ($user->get_session()) { ?><a href="index.php?mod=profile"><?php echo $_SESSION['c_userfullname']; ?></a> | <a href="logout.php">Log Out</a><?php } else { ?>Guest | <a href="index.php?mod=login">Login</a><?php } ?></a></h5>
            </div>
            <div id="main" style="margin:0px;">
                <div id="hidden-menu">
                    <ul>
                        <li><a href="index.php">Home</a></li>
                        <li><a href="index.php#feature">Features</a></li>
                        <li><a href="index.php#information">Information</a></li>
                        <li><a href="index.php?mod=products&cat=all">Order Medicines</a></li>
                        <li><a href="index.php?mod=upload">Upload Prescription</a></li>
                        <?php
                            if (!$user->get_session()) {
                        ?>
                        <li><a href="index.php?mod=register">Sign up now</a></li>
                        <?php
                            }
                        ?>
                        <?php
                            if ($user->get_session()) {
                        ?>
                        <li id="hiddencartcounter"><a class="cart-icon" href="index.php?mod=viewcart"><?php echo file_get_contents("img/shopping-cart.svg"); ?><?php echo $product->count_cart_hidden($_SESSION['c_userid']); ?> items</a></li>
                        <?php 
                            }
                        ?>
                    </ul>
                </div>
                <?php
                    switch ($module) {
                        case 'profile':
                                        if ($user->get_session()) {
                                            require_once 'profile/index.php';
                                        } else {
                                            header('location: index.php');
                                        }
                                        break;
                        case 'viewcart':
                                        if ($user->get_session()) {
                                            require_once 'cart/cart.php';
                                        } else {
                                            header('location: index.php');
                                        }
                                        break;
                        case 'login':
                                        require_once 'login/login.php';
                                        break;
                        case 'products':
                                        require_once 'products/index.php';
                                        break;
                        case 'ordering':
                                        require_once 'order/index.php';
                                        break;
                        case 'register':
                                        require_once 'register/register.php';
                                        break;
                        case 'upload':
                                        require_once 'uploads/prescription.php';
                                        break;
                        default:
                                require_once 'home/home.php';
                                break;
                    }
                ?>
            </div>
        </div>
    </div>
    <div id="ohistory-modal">
    <div class="modal-center-wrapper">
        <div id="products-popup-order">
            <svg id="loading-screen" style="margin-top: 150px; margin-bottom: 100px;" class="spinner" width="40px" height="40px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
            </svg>
            <div id="ohistory-content">
            </div>
            <div class="modal-footer">
                <button id="" style="background-color: #eb0909; float:none; margin-right:10px;" class="material-button-main show-cancel-modal">Cancel Order</button>
                <button class="material-button-main" onclick="ohistory_hide()">close</button>
            </div>
        </div>
    </div>
</div>
<?php
                    if($user->get_session()){
?>
<div id="popup-modal">
    <div class="modal-center-wrapper">
        <div id="products-popup-order">
            <input type="hidden" id="addtocart-id" value="000">
            <div class="popup-loading">
                <svg style="margin-top: 150px;" class="spinner" width="40px" height="40px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                    <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
                </svg>
            </div>
            <div class="popup-reveal">
                <div class="modal-header">
                    <h2 id="addtocart-title" class="w-90">Product Name</h2>
                </div>
                <div class="modal-body">
                    <div class="float-right">
                        <label class="popup-edit-title">Packaging</label></br>
                        <p class="float-right" id="popup-display-packaging"></p>
                    </div>
                    <div class="block">
                        <label class="popup-edit-title">Brand</label></br>
                        <p id="popup-display-brand"></p>
                    </div>
                    <div class="block">
                        <label class="popup-edit-title">Formulation</label></br>
                        <p id="popup-display-formulation"></p>
                    </div>
                    <div class="block w-100">
                        <div class="atc_price">
                            <label class="popup-edit-title">Unit Price</label></br>
                            <p class="block" id="popup-display-price"></p><input type="hidden" id="addtocart-price" class="popup-qty bold" value="1">
                        </div>
                        <div id="atc_input">
                            <label class="popup-edit-title" style="margin-bottom: 0px;">Order Quantity</label></br>
                            <input type="number" step="1" id="addtocart-qty" style="text-align: right; margin-top: 5px; margin-bottom: 8px;" class="material-input w-70" min="1" value="1" name="qty" required />
                        </div>
                    </div>
                </div>
                <p id="curr-qty"></p>
                <div class="modal-footer" style="margin-top: 80px;">
                    <button class="material-button" id="atc_cancel" onclick="div_hide()">Cancel</button>
                    <button type="submit" id="atc_btn" class="material-button-main" style="float: right;" name="submit">Add to Cart</button>
                    <hr class="oos-hr">
                    <p id="out-of-stock">OUT OF STOCK</p>
                    <hr class="oos-hr">
                    <button class="material-button-main" id="atc_close" onclick="div_hide()">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
                    }else{
?>
<div id="popup-modal">
    <div class="modal-center-wrapper">
        <div id="products-popup-order">
            <div class="modal-header">
                <h2>Notice</h2>
            </div>
            <div class="modal-body">
                <h5>You need to be logged in to view more details.</h5>
                <a href="index.php?mod=login">Click here to login</a>
            </div>
            <div class="modal-footer" style="margin-top: 10px;">
                <button type="submit" class="material-button-main" onclick="login_alert_OK()" name="submit">CLOSE</button>
            </div>
        </div>
    </div>
</div>
<?php
                    }
?>
<div id="cart-modal">
    <div class="modal-center-wrapper">
        <input type="hidden" id="id_remove">
        <div class="background_overlay" style="display:block"></div>
        <div id="products-popup-order">
            <div class="modal-header">
                <span onclick="pop_cart_hide()" class="close">&times;</span>
                <h2 id="addtocart-title" style="color: red;	text-transform: uppercase; font-weight: 400;" value="asd"> Warning</h2>
            </div>
            <div class="modal-body">
                <p class="remove-warning">Remove this item from cart?</p>
            </div>
            <div class="modal-footer">
                <button type="submit" class="material-button" onclick="pop_cart_hide()" name="submit">Cancel</button>
                <button type="submit" class="material-button-main" id="remove_btn" name="submit">Remove</button>
            </div>
        </div>
    </div>
</div>
<div id="cancel-order-modal">
    <div class="modal-center-wrapper">
        <input type="hidden" id="id_remove">
        <div class="background_overlay" style="display:block"></div>
        <div id="products-popup-order">
            <div class="modal-header">
                <span onclick="pop_cancel_order_hide()" class="close">&times;</span>
                <h2 id="addtocart-title" style="color: red;	text-transform: uppercase; font-weight: 400;" value="asd"> Warning</h2>
            </div>
            <div class="modal-body">
                <p class="remove-warning">Are you sure you want to cancel your order? This action cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button type="submit" class="material-button" onclick="pop_cancel_order_hide()" name="submit">No</button>
                <button type="submit" class="material-button-main cancel-order-btn" id="" name="submit">yes</button>
            </div>
        </div>
    </div>
</div>
<div id="cart-removeall-modal">
    <div class="modal-center-wrapper">
        <div class="background_overlay" style="display:block"></div>
        <div id="products-popup-order">
            <div class="modal-header">
                <span onclick="pop_cart_removeall_hide()" class="close">&times;</span>
                <h2 id="addtocart-title" style="color: red;	text-transform: uppercase; font-weight: 400;" value="asd"> Warning</h2>
            </div>
            <div class="modal-body">
                <p class="remove-warning">Remove all items in cart? This action cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button type="submit" class="material-button" onclick="pop_cart_removeall_hide()" name="submit">Cancel</button>
                <button type="submit" class="material-button-main" onclick="pop_cart_removeall_confirm()" name="submit">Remove All</button>
            </div>
        </div>
    </div>
</div>
<?php
	require_once 'profile/popup.php';
	require_once 'profile/popupChangePass.php';
?>
</body>

</html>

<script type="text/javascript">
    function btngreen() {
        document.getElementById("navigation").style.backgroundColor = "rgba(25,137,38,1)";
    }
    $(".show-cancel-modal").click(function () {
        $('#cancel-order-modal').css("display", "table");
    });
    $(".cancel-order-btn").click(function () {
        var can_id = $('.cancel-order-btn').attr("id");
        $.ajax({
            url: "profile/ajax.php",
            method: "POST",
            data: {
                "cancel_order": 1,
                "or_id": can_id
            },
            success: function (data) {
                window.location = "index.php?mod=profile&view=history";
            }
        });
    });
</script>