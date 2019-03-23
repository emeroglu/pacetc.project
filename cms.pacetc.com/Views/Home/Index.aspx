<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Pace | Content Management</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link rel="shortcut icon" type="image/x-icon" href="/img/symbol.png" />

    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="/css/style.css" rel="stylesheet" />
    <link href="/css/style_responsive.css" rel="stylesheet" />
    <link href="/css/style_default.css" rel="stylesheet" id="style_color" />

    <link href="/assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/assets/uniform/css/uniform.default.css" />
    <link href="/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
    <link href="/assets/jqvmap/jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .input-append, .input-prepend
        {
            margin-bottom: 20px;
        }
    </style>

    <script type="text/javascript">
        function Login() {
            var username = document.getElementById("input-username").value;
            var password = document.getElementById("input-password").value;

            $.ajax({
                url: "/Login",
                type: 'get',
                contentType: "json",
                data: { "username": username, "password": password },
                success: function (data) {
                    if (data == "f")
                        location.href = "/";
                    else
                        location.href = "/Stats?token=" + data;
                }
            });
        }
    </script>
</head>
<body class="login-body" style="background: rgba(4, 53, 114, 0.01) !important;">
    <div id="login" style="width: 395px;">
        <!-- BEGIN LOGIN FORM -->
        <div id="loginform" class="form-vertical no-padding no-margin">
            <div class="lock">
                <img src="/img/symbol.png" />
            </div>
            <div class="control-wrap" style="margin-left: 25px;">
                <h4>Admin Login</h4>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span>
                            <input id="input-username" type="text" placeholder="Username" name="username" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-key"></i></span>
                            <input id="input-password" type="password" placeholder="Password" name="password" />
                        </div>
                        <div class="clearfix space5"></div>
                    </div>
                </div>
                <input type="button" onclick="Login()" id="login-btn" class="btn btn-block login-btn" value="Login" style="background: #012e6f !important;" />
            </div>
        </div>
    </div>
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script src="/assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/jquery.blockui.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <!-- ie8 fixes -->
    <!--[if lt IE 9]>
	<script src="/js/excanvas.js"></script>
	<script src="/js/respond.js"></script>
	<![endif]-->
    <script src="/assets/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
    <script src="/assets/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
    <script src="/assets/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
    <script src="/assets/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
    <script src="/assets/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
    <script src="/assets/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
    <script src="/assets/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
    <script src="/assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="/assets/flot/jquery.flot.js"></script>
    <script src="/assets/flot/jquery.flot.resize.js"></script>

    <script src="/assets/flot/jquery.flot.pie.js"></script>
    <script src="/assets/flot/jquery.flot.stack.js"></script>
    <script src="/assets/flot/jquery.flot.crosshair.js"></script>

    <script src="/js/jquery.peity.min.js"></script>
    <script type="text/javascript" src="/assets/uniform/jquery.uniform.min.js"></script>
    <script src="/js/scripts.js"></script>
    <script>
        jQuery(document).ready(function () {
            // initiate layout and plugins
            App.setMainPage(true);
            App.init();
        });
    </script>
</body>
</html>
