<!--Footer -->
        <div class="col-md-12 footer-box">
            <div class="row">
                <div class="col-md-4">
                    <strong>Send us a message </strong>
                    <hr>
                    <form>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" required="required" placeholder="Full name">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" required="required" placeholder="Email address">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <textarea name="message" id="message" required="required" class="form-control" rows="3" placeholder="Message"></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-md-4">
                    <strong>Our Location</strong>
                    <hr>
                    <p>
                        10 Idiroko Road,<br />
                        Covenant University, Ota<br />
                        Ogun State, Nigeria.<br /><br />
                        Call: +234-8053935637<br>
                        Email: sales@sarpestein.com<br>
                    </p>

                </div>
                <div class="col-md-4 social-box">
                    <strong>We are Social </strong>
                    <hr>
                    <a href="#"><i class="fa fa-facebook-square fa-3x "></i></a>
                    <a href="#"><i class="fa fa-twitter-square fa-3x "></i></a>
                    <a href="#"><i class="fa fa-google-plus-square fa-3x c"></i></a>
                    <a href="#"><i class="fa fa-linkedin-square fa-3x "></i></a>
                    <a href="#"><i class="fa fa-pinterest-square fa-3x "></i></a>
                    <p>
                        We help build electronic marketplace for electronic devices such as laptops and mobile tablets.
                    </p>
                </div>
            </div>
            <hr>
        </div>
        <!-- /.col -->
        <div class="col-md-12 end-box text-center">
            &copy; 2017 Sarpestein &nbsp; | &nbsp; All Rights Reserved
        </div>
        <!-- /.col -->


        <!-- Modal -->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="signinLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Sign In</h4>
              </div>
              <div class="modal-body">

                <!-- Modal Body -->
                <div>
                     
                    <form action="" method="">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Email address</label>
                          <input type="email" class="form-control input-sm" id="loginEmail" name="email" placeholder="Enter email">
                        </div>

                        <div class="form-group">
                          <label for="exampleInputPassword">Password</label>
                          <input type="password" class="form-control input-sm" id="loginPassword" name="password" placeholder="Enter password">
                        </div>
                        <br>
                        
                        <button type="button" class="btn btn-danger pull-left" onclick="login();">Sign in</button>
                    </form>
                    <br><br><br>
                  </div>
              </div>
              <div class="modal-footer">
                  <p class="text-center">
                      <strong>&copy; Powered by Java group 1</strong>
                  </p>
              </div>
            </div>
          </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="signinLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Sign up</h4>
                    </div>
                    <div class="modal-body">

                        <!-- Modal Body -->
                        <div>

                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control input-sm" id="exampleInputEmail" name="email" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword">Password</label>
                                    <input type="password" class="form-control input-sm" id="exampleInputPassword" name="password" placeholder="Enter password">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control input-sm" id="exampleInputEmail" name="email" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword">Password</label>
                                    <input type="password" class="form-control input-sm" id="exampleInputPassword" name="password" placeholder="Enter password">
                                </div>
                                
                                <br><br>

                                <button type="submit" class="btn btn-danger pull-left">Sign in</button>
                            </form>
                            <br>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <p class="text-center">
                            <strong>&copy; Powered by Java group 1</strong>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="signinLabel" style="">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header info active text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Checkout</h4>
                    </div>
                    <div class="modal-body">

                        <!-- Modal Body -->
                        <hr style="opacity: 0.6">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="assets/img/dummyimg.png">
                            </div>
                            <div class="col-md-9">
                                <h3 id="items-title">The title</h3>
                                <p>
                                    Supplier: <a href="" id="items-supplier"> </a> <br>
                                    RAM: <a href=""  id="items-ram"></a> <br>
                                    Storage Size: <a href=""  id="items-storage-size"></a> <br>
                                    Screen Size: <a href="" id="items-screen-size"> </a>"
                                </p>
                            </div>
                        </div>
                        <hr>
                        
                        
                        
                        <br>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-success pull-left">Checkout</button>
                            <button type="submit" data-dismiss="modal" class="btn btn-default pull-left">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <!--Footer end -->
        <!--Jquery file  -->
        <script src="assets/js/jquery-1.10.2.js"></script>

        <!--bootstrap JavaScript file  -->
        <script src="assets/js/bootstrap.js"></script>

        <!--Slider JavaScript file  -->
        <script src="assets/ItemSlider/js/modernizr.custom.63321.js"></script>
        <script src="assets/ItemSlider/js/jquery.catslider.js"></script>
        <script>
            $(function () {
                $('#mi-slider').catslider();
            });
        </script>
    </body>
</html>
