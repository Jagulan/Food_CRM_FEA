<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="FEA Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- font CSS -->
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- js-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/modernizr.custom.js"></script>
    <!--webfonts-->
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <!--animate-->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
    <!-- Metis Menu -->
    <script src="js/metisMenu.min.js"></script>
    <script src="js/custom.js"></script>
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/home.css" rel="stylesheet" type="text/css" />
    <!--//Metis Menu -->
</head>
<body class="">
    <form id="form1" runat="server">
        <div class="main-content">
            <div id="page-wrapper">
                <div class="left-side col-md-6">
                    <div class="content">
                        <img src="images/loginlogo.png" alt="Logo">
                        <h1>We are a Food Innovation Business,</h1>
                        <h2>which makes launching food product easier!!</h2>
                        <p style="font-size: 20px;">
                            If you are early-stage start-ups, established business or<br>
                            manufacturers, Consult us to bring your Food Product<br>
                            ideas/concepts to life.
                        </p>
                    </div>
                    <div class="grid-container">
                        <div class="square square-1">
                            <img src="images/rockett.png" alt="Icon 1">
                            <h3>Insight-Based Ideation</h3>
                            <p>
                                Draw heavily on target and
                                <br>
                                consumer insights
                            </p>
                        </div>

                        <div class="square square-2">
                            <img src="images/checklist.png" alt="Icon 2">
                            <h3>Conceptualisation</h3>
                            <p>Design actual concepts for the narrowed-down range of ideas</p>
                        </div>
                        <div class="square square-3">
                            <img src="images/checklist (1).png" alt="Icon 3">
                            <h3>Evaluation & Benchmarking</h3>
                            <p>
                                Test concepts with target<br>
                                consumers
                            </p>
                        </div>
                        <div class="square square-4">
                            <img src="images/exchange.png" alt="Icon 4">
                            <h3>Launch</h3>
                            <p>
                                Helping you bring your idea /<br>
                                product to life
                            </p>
                        </div>
                    </div>
                </div>
                <div class="main-page login-page col-md-6 ">
                    <div class="widget-shadow">
                        <div class="login-body">
                            <asp:Label ID="lbEmail" runat="server" Text="Email Address" Width="100%" ForeColor="GrayText"></asp:Label>
                            <span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;&nbsp;
                           
                            <asp:TextBox ID="txtEmail" runat="server" Width="100%" class="user" Placeholder="User Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ForeColor="red" ErrorMessage="Please enter the email" ValidationGroup="q1" Style="display: block;"></asp:RequiredFieldValidator>

                            <asp:Label ID="lbPassword" runat="server" Text="Password" Width="100%" ForeColor="GrayText"></asp:Label>
                            <span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;
                           
                            <asp:TextBox ID="txtPassword" runat="server" Width="100%" TextMode="Password" Placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ForeColor="red" ErrorMessage="Please enter the password" ValidationGroup="q1" Style="display: block;"></asp:RequiredFieldValidator>
                            <div style="text-align:left; padding-left:10%" >
                                <div>
                                    <asp:CheckBox ID="chkRememberMe" runat="server" Text="&nbsp; Remember Me" Checked="true" />
                                </div>
                                <p>
                                    <asp:Label ID="lblMessage" runat="server" Text="" Width="100%" ForeColor="Red" Font-Bold="true"></asp:Label>
                                </p>
                                <div class="clearfix"></div>
                            </div>
                            <asp:Button runat="server" Text="Sign In" OnClick="btnLogin_Click" Font-Bold="true" ID="btnLogin" ValidationGroup="q1" />

                        </div>
                    </div>
                </div>
            </div>
            <!--footer-->

            <div class="footer">
                <p>&copy; 2024 FEA. All Rights Reserved.</p>
            </div>

            <!--//footer-->
        </div>
        <!-- Classie -->
        <script src="js/classie.js"></script>
        <script>
            var menuLeft = document.getElementById('cbp-spmenu-s1'),
                showLeftPush = document.getElementById('showLeftPush'),
                body = document.body;

            showLeftPush.onclick = function () {
                classie.toggle(this, 'active');
                classie.toggle(body, 'cbp-spmenu-push-toright');
                classie.toggle(menuLeft, 'cbp-spmenu-open');
                disableOther('showLeftPush');
            };

            function disableOther(button) {
                if (button !== 'showLeftPush') {
                    classie.toggle(showLeftPush, 'disabled');
                }
            }
        </script>
        <!--scrolling js-->
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!--//scrolling js-->
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.js"> </script>
    </form>
</body>
</html>
