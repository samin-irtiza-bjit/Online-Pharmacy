<div class="center-div-register w-100" style="margin-top:80px;">
    <div class="card-wrapper w-100">
        <div class="card-style w-100" style="border-radius:25px; box-shadow: 0px 0px 10px 0px; ">
            <div id="login-form">
                <h2 class="material-header" style="text-align : center;">Sign Up</h2>
                <span class="required">* Required</span>
                <form name="login" onsubmit="return validateFormTwo();" onkeyup="onkeyUpFunctionForRegister()" method="post" action="register/process.php?action=newUser">
                    <h5 class="material-input-header">Username <span style="color: #E54043;">*</span></h5>
                    <input type="text" placeholder="Your answer" class="w-60 material-input" autocomplete="off" id="field_username" name="Username" required />

                    <h5 class="material-input-header">First Name <span style="color: #E54043;">*</span></h5>
                    <input type="text" placeholder="Your answer" class="w-60 material-input" autocomplete="off" id="first-name" name="First-Name" required />

                    <h5 class="material-input-header">Last Name <span style="color: #E54043;">*</span></h5>
                    <input type="text" placeholder="Your answer" class="w-60 material-input" autocomplete="off" id="last-name" name="Last-Name" required />

                    <h5 class="material-input-header">Email Address <span style="color: #E54043;">*</span></h5>
                    <input type="text" placeholder="Your answer" class="w-60 material-input" autocomplete="off" id="email" name="Email-Address" />

                    <h5 class="material-input-header">Contact Number <span style="color: #E54043;">*</span></h5>
                    <input type="number" placeholder="Your answer" class="w-60 material-input" autocomplete="off" id="field_contact" name="Contact-Number" required />

                    <h5 class="material-input-header">Password <span style="color: #E54043;">*</span></h5>
                    <input type="password" placeholder="Password" class="w-60 material-input" autocomplete="off" id="pass" name="Password" required />

                    <h5 class="material-input-header">Confirm Password <span style="color: #E54043;">*</span></h5>
                    <input type="password" placeholder="Confirm Password" class="w-60 material-input" autocomplete="off" id="retype" name="Retype-Password" required />
                    
                    <div style="display: inline-block" class="w-100">
                        <input type="submit" class="material-button-main" id="val" name="submit" value="SUBMIT" />
                        <button class="material-button" onclick="window.location.href = 'index.php?mod=login'">CANCEL</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#lto_number').on('keypress', function (e) {
            return e.metaKey || e.which <= 0 || e.which == 8 || /[0-9]/.test(String.fromCharCode(e.which));
        });

        $('#field_contact').on('keypress', function (e) {
            return e.metaKey || e.which <= 0 || e.which == 8 || /[0-9]/.test(String.fromCharCode(e.which));
        });

        $('#field_username').on('keypress', function (e) {
            return e.metaKey || e.which <= 0 || e.which == 8 || /[0-9a-zA-Z]/.test(String.fromCharCode(e.which));
        });
    });
</script>