<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Saperstein technological device company">
        <meta name="author" content="">
        <title>Saperstein Devices</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!-- Fontawesome core CSS -->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <!--GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
        <!--Slide Show Css -->
        <link href="assets/ItemSlider/css/main-style.css" rel="stylesheet" />
        <!-- custom CSS here -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- Alertify scripts -->
        <script src="assets/js/alertify.min.js"></script>
        <!-- custom scripts -->
        <script src="assets/js/sarpestein.js"></script>
    </head>
    
    
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><strong>SAPERSTEIN</strong> devices</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                    <ul class="nav navbar-nav navbar-right">
                        <li id="loginBtn" data-toggle="modal" data-target="#loginModal"><a href="#">
                                <% 
                                    try
                                    {
                                        session = request.getSession(false);
                                        if ( !(session.getAttribute("cart") == null) ) {
                                            out.println(session.getAttribute("cart"));
                                        }
                                        else
                                        {
                                            out.println("Login");
                                        }
                                    }
                                    catch (Exception ex) { out.println("Login"); }
                                %>
                            </a></li>
                        <li data-toggle="modal" data-target="#registerModal"><a href="#">Signup</a></li>
                        
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Contact us <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><strong>Call: </strong>+234-8053935637</a></li>
                                <li><a href="#"><strong>Mail: </strong>sales@saperstein.com</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><strong>Address: </strong>
                                        <div>
                                            10 Idiroko Road,<br />
                                            Covenant University, Ota<br />
                                            Ogun State, Nigeria.<br />
                                        </div>
                                    </a></li>
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-shopping-cart"></span>Cart &nbsp; &nbsp;
                                <span class="label label-danger pull-right" style="padding: 5px;" id="cart-value">0</span>
                            </a>
                            
                            <ul class="dropdown-menu">
                                <li data-toggle="modal" data-target="#checkoutModal">
                                    <a href="#"><span class="glyphicon glyphicon-ok"></span> Checkout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-center" role="search">
                        <div class="form-group">
                            <input type="text" placeholder="Enter Keyword Here ..." class="form-control">
                        </div>
                        &nbsp; 
                        <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span> Search</button>
                    </form>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>