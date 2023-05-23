<div id="cart-container" style=>
    <div class="continue_button" style="margin-top:80px;">
        <a class="btn-continueshopping" href="index.php?mod=products&amp;cat=all">← Continue Shopping </a>
    </div>
    <hr>
    <h3 style="margin-top: 20px; margin-bottom: 10px; color:#333333;">Cart</h3>
    <div class="cart-wrapper w-100">
        <div class="card-style w-100" style="min-height: 300px; text-align: center;">
            <svg id="loading-screen" style="margin-top: 10%;" class="spinner" width="40px" height="40px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
            </svg>
            <div id="cart-loaded">
            </div>
        </div>
    </div>
    <div id="cart-ads-wrapper">
        <div id="cart-ads-content">
            <h5>WHEN WILL I RECEIVE MY ORDERED MEDICINES?</h5>
            <p>Ordered medicines made will automatically be processed. The timeframe for the delivery of items will be
                based on the location of the shipping address. This approximately takes 3-14 delivery days.</p>
        </div>
        <div id="cart-ads-content">
            <h5>WHAT PAYMENT METHODS SHOULD I USE?</h5>
            <p>To offer you a good shopping experience, BRACU Pharma accepts payments through Cash and Online Payment ONLY.</p>
        </div>
        <div id="cart-ads-content">
            <h5>AM I SECURED WITH ONLINE ORDERING?</h5>
            <p>BRACU Pharma takes the utmost care of securing information provided to our website. We prioritize safety during the ordering 
                process to be restricted to staff and ensures that employees are up-to-date with securityand privacy policies.</p>
        </div>
    </div>
</div>

<style>
    hr {
        background-color: #e4e4e4;
        height: 1px;
        border: 0;
    }
</style>

<script>
    $(document).ready(function () {
        displayTable();
        $('body').on("click", "#submit_checkout", function (e) {
            $.ajax({
                url: "cart/ajax.php",
                method: "POST",
                data: $("#form_cart").serialize(),
                success: function (data) {
                    $.ajax({
                        url: "cart/ajax.php",
                        method: "POST",
                        data: {
                            "inform_client": 1
                        },
                        success: function (data) {
                            alert("Order success!");
                        }
                    });
                    window.location = "index.php?mod=profile";
                }
            });

        });
        $('body').on("click", "#rdo_sold", function (e) {
            $.ajax({
                url: "cart/ajax.php",
                method: "POST",
                data: {
                    "payterm_radio": 1
                },
                success: function (data) {
                    $("#terms_field").html(data);
                }
            });
        });
        $('body').on("click", "#rdo_consignment", function (e) {
            $.ajax({
                url: "cart/ajax.php",
                method: "POST",
                data: {
                    "payterm_radio_consignment": 1
                },
                success: function (data) {
                    $("#terms_field").html(data);
                }
            });
        });
        $("#remove_btn").click(function () {
            var id_remove = $("#id_remove").val();
            $.ajax({
                url: "cart/ajax.php",
                method: "POST",
                data: {
                    "remove_cart": 1,
                    "id": id_remove
                },
                success: function (data) {
                    updateCartCounter();
                    pop_cart_hide();
                    displayTable();

                }
            });
        });
    });
    function displayTable() {
        $.ajax({
            url: "cart/ajax.php",
            method: "POST",
            data: {
                "display_table": 1
            },
            success: function (data) {
                setTimeout(function () {
                    $("#cart-loaded").html(data);
                    $("#loading-screen").css("display", "none");
                    $(".card-style").css("text-align", "left");
                }, 0);
            }
        });
        $.ajax({
            url: "cart/ajax.php",
            method: "POST",
            data: {
                "payterm_radio": 1
            },
            success: function (data) {
                $("#terms_field").html(data);
            }
        });

    }
    function updateCartCounter() {
        $("#cart-item-counter").load(window.location.href + " #cart-item-counter");
    }
</script>