<?php
    if ($user->get_session()) {
        header("location: index.php");
    }
?>
<section id="information" class="section-padding featureblock">
    <div class="individual-main-container">
        <div id="main-login-left-div" style="margin-top: 59px;">
            <div id="main-login-left-div-sub-top">Why register to BRACU Pharma web portal?</div>
            <div id="main-login-left-div-sub-mid"><strong class="font-roboto">OBJECTIVES</strong>
            </div>
            <div id="main-login-left-div-sub-bot">
                - Online Ordering For Easy Convenience</br>
                - Receive Pharmacy Products right at your doorstep</br>
                - Check composition details</br>
                - Shopping-like Experience</br>
                - Fast and Secured Transactions</br>
                - User Friendly Interface</br>
                - Great Customer Satisfaction</br></br>
            </div>
        </div>
        <div id="main-login-right-div" style="margin-top: 135px; border-radius: 25px; box-shadow: 0px 0px 10px 0px;">
            <div class="material-header" style="margin-bottom: 15px;">Login</div>
            <div id="main-login-right-div-sub-mid">
                <form id="form-login">
                    <input id="username" name="username" type="text" class="material-input w-100" autocomplete="off" placeholder="Username" required />
                    
                    <input id="password" name="password" type="password" class="material-input w-100" autocomplete="off" placeholder="Password" required />
                    
                    <div id="login-error" class="login-error">Username or password does not exist.</div>
                    <?php 
                        if (isset($_GET['auth'])) { 
                    ?>
                    <p id="login-failed-label">Username or password do not match</p>
                    <?php
                        }
                    ?>
                    <button class="material-button-main" style="float: right; margin-bottom: 60px;" type="submit" name="login">LOGIN</button>
                </form>
            </div>
            <div id="main-login-right-div-sub-bot" class="w-100" style="text-align: center; margin-bottom: 20px; display: inline-block">Don't have an account yet? <a href="index.php?mod=register">Sign up</a>
            </div>
        </div>
    </div>
</section>