<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Payroll_Outsourcing.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Payroll-Login</title>
    <!-- Custom Theme files -->
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Plans & Pricing Tables Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <!--web-fonts-->
    <link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css' />
    <!--web-fonts-->
    <link href="/css/login_style.css" rel="stylesheet" type="text/css" media="all" />


    <script src="/js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            Login();

        });

        $(document).bind('keypress', function (e) {
            if (e.keyCode == 13) {
                $('#btnLogin').trigger('click');
            }
        });


        function Login() {
            $('#btnLogin').click(function () {
                $('#spinner').show();
                var usr = $('#user').val();
                var pwd = $('#pwd').val();
                if (usr != '' && pwd != '' && usr == 'admin' && pwd == "admin") {
                    window.open("GUI/Dashboard/Payroll_Home.aspx#", "_self");
                }
                else {
                    $('#spError').html("Invalid userid and password.");
                    $('#spinner').hide();
                }
            });
        }
    </script>

</head>

<body>
    <div class="p_body js__p_body js__fadeout"></div>
    <div class="coms-overlay-page" id="spinner" style="display: none;">
        <img src="/img/loading_blue2.gif" />
    </div>
    <div class="overlay"></div>
    <div class="main">
        <div class="login">
            <div class="login-top">
                <img src="/img/p.png" />
            </div>
            <h1>Teamlease Payroll Login</h1>
            <div class="login-bottom">
                <form>
                    <input type="text" placeholder="Username" id="user" />
                    <input type="password" class="password" id="pwd" placeholder="Password" />
                    <a style="font-size: 15px; padding: .3em .3em; width: 45%; border: none; text-transform: capitalize;text-align:center; outline: none; border-radius: 5px; background: #127DA7; color: #fff; cursor: pointer; font-family: 'PT Sans Narrow', sans-serif; margin: 0 auto; display: block;"
                        id="btnLogin">Login</a>
                  
                </form>
                <a href="#">
                    <p>Forgot your password? Click Here</p>
                </a><br />
                  <span id="spError" style="color: red;font-size:11px;font-weight:bold ;margin-left:53px;" />
            </div>
        </div>
        <img src="img/teamlease_logo1.png" style="margin-left: 41%; padding: 14px 5px;" />
    </div>
    <div class="footer">
        <p>&copy 2016 TeamLease Services Limited . All rights reserved | <a href="http://www.Teamlease.com">www.Teamlease.com</a></p>
    </div>

</body>
</html>
