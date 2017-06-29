<%@include file="HeaderLibrary.jsp" %>

<%@ page import="sarpestein.DBHelper" %>
<% int totalItems = 0;%>

<%@include file="Header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="well well-lg offer-box text-center">

                Coding School's Offer : &nbsp; <span class="glyphicon glyphicon-cog"></span>&nbsp;40 % off  on purchase of N 2,000 and above till 30th June, 2017 !                

            </div>
            <div class="main box-border">
                <div id="mi-slider" class="mi-slider">
                    <ul>

                        <li><a href="#">
                                <img src="assets/ItemSlider/images/lenovo1.jpg" alt="img01"><h4> Burst pz</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/lenovo2.jpg" alt="img02"><h4>Aspire 0ne</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/lenovo3.jpg" alt="img03"><h4>Solo</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/lenovo4.jpg" alt="img04"><h4>Aspire Z</h4>
                            </a></li>
                    </ul>
                    <ul>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/acer1.jpg" alt="img05"><h4>Inspiron 1</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/acer2.jpg" alt="img06"><h4>Acer lever</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/acer3.jpg" alt="img07"><h4>Inspiron</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/acer4.jpg" alt="img08"><h4>Inspiron</h4>
                            </a></li>
                    </ul>
                    <ul>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/samsung1.jpg" alt="img09"><h4>Core Duo</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/samsung2.jpg" alt="img10"><h4>Slim J</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/samsung3.jpg" alt="img11"><h4>Epic</h4>
                            </a></li>
                    </ul>
                    <ul>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/hp1.jpg" alt="img12"><h4>Celerom</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/hp2.jpg" alt="img13"><h4>Pro Book</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/hp3.jpg" alt="img14"><h4>EliteBook</h4>
                            </a></li>
                        <li><a href="#">
                                <img src="assets/ItemSlider/images/hp4.jpg" alt="img15"><h4>Inspiron</h4>
                            </a></li>
                    </ul>
                    <nav>
                        <a href="#">Lenovo</a>
                        <a href="#">Acer</a>
                        <a href="#">Samsung</a>
                        <a href="#">Hp</a>
                    </nav>
                </div>

            </div>
            <br />
        </div>

        <div class="col-md-3 text-center">
            <div class=" col-md-12 col-sm-6 col-xs-6" >
                <div class="offer-text">
                    10% off here
                </div>
                <div class="thumbnail product-box">
                    <img src="assets/img/dummyimg.png" alt="" />
                    <div class="caption">
                        <h3><a href="#">Samsung Galaxy S7</a></h3>
                        <p><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Add to cart</a></p>
                    </div>
                </div>
            </div>
            <div class=" col-md-12 col-sm-6 col-xs-6">
                <div class="offer-text2">
                    30% off here
                </div>
                <div class="thumbnail product-box">
                    <img src="assets/img/dummyimg.png" alt="" />
                    <div class="caption">
                        <h3><a href="#">Surface book </a></h3>
                        <p><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Add to cart</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col -->
    </div>


    <!-- /.row -->
    <div class="row">
        <div class="col-md-3">
            
<!--            Searching-->
            <div>
                 <a class="list-group-item active list-group-item-danger">Sort Items</a>
                
                <div class="list-group-item">
                    <div class="">
                        <label>Type: </label>
                        <select class="form-control dropdown input-sm" id="type" name="role" required>
                            <option value="">-- NONE --</option>
                            <%
                                query = "SELECT DISTINCT catalogue.type FROM catalogue ORDER BY catalogue.type ASC";
                                ResultSet set = st.executeQuery(query);
                                
                                while(set.next()) {
                            %>
                            <option value="<% out.println(set.getString("type")); %>"><% out.println(set.getString("type")); %></option> 
                            <% } %>
                        </select>
                    </div>
                    
                    <br>
                    
                    <div class="">
                        <label>Brand: </label>
                        <select class="form-control dropdown input-sm" id="brand" name="role" required>
                            <option value="">-- NONE --</option>
                            
                            <%
                                query = "SELECT DISTINCT brandName FROM catalogue ORDER BY brandName ASC";
                                set = st.executeQuery(query);
                                
                                while(set.next()) {
                            %>
                            <option value="<% out.println(set.getString("brandName")); %>"><% out.println(set.getString("brandName")); %></option>  
                            <% }%>
                        </select>  
                    </div>
                        
                        
                    <br>
                    
                    
                    <div class="">
                        <label>RAM (GB): </label>
                        <select class="form-control dropdown input-sm" id="ram" name="role" required>
                            <option value="">-- NONE --</option>
                            <%
                                query = "SELECT DISTINCT ram FROM catalogue ORDER BY ram ASC";
                                set = st.executeQuery(query);

                                while (set.next()) {
                            %>
                            <option value="<% out.println(set.getString("ram")); %>"><% out.println(set.getString("ram")); %></option> 
                            <% } %>
                        </select>
                    </div>
                        
                        
                    <br>
                    
                    <div class="">
                        <label>Screen Size (inches): </label>
                        <select class="form-control dropdown input-sm" id="screenSize" name="role" required>
                            <option value="">-- NONE --</option>
                            <%
                                query = "SELECT DISTINCT screenSize FROM catalogue ORDER BY screenSize ASC";
                                set = st.executeQuery(query);

                                while (set.next()) {
                            %>
                            <option value="<% out.println(set.getString("screenSize")); %>"><% out.println(set.getString("screenSize")); %></option> 
                            <% } %> 
                        </select>
                    </div>

                    <br>

                    <div class="">
                        <label>Storage Size (GB): </label>
                        <select class="form-control dropdown input-sm" id="storageSize" name="role" required>
                            <option value="">-- NONE --</option>
                            <%
                                query = "SELECT DISTINCT storageSize FROM catalogue ORDER BY storageSize ASC";
                                set = st.executeQuery(query);

                                while (set.next()) {
                            %>
                            <option value="<% out.println(set.getString("storageSize")); %>"><% out.println(set.getString("storageSize")); %></option> 
                            <% } %> 
                        </select>
                    </div>

                    <br>

                    <div class="">
                        <div class="form-group">
                            <label>Range Cost (N): </label>
                            <input type="number" class="form-control input-sm" id="minCost" name="role" required>
                        </div>
                    </div>
                    
                    <br>
                    
                    <div class="">
                        <button type="button" onclick="Search();" class="btn btn-danger">Search</button>
                    </div>
                    
                </div>
            </div>
            
            <br><br>
            
            <div>
                <a class="list-group-item active">Products
                </a>
                <ul class="list-group">
                    <%

                        String mainQuery = "SELECT DISTINCT type FROM catalogue";
                        ResultSet mainSet = st.executeQuery(mainQuery);
                    %>

                    <% while (mainSet.next()) {%>

                    <li class="list-group-item">
                        <%= mainSet.getString("type")%>

                        <span class="label label-primary pull-right">
                            <%
                                query = String.format("SELECT COUNT(*) AS total FROM catalogue WHERE type = '%s';",
                                        mainSet.getString("type"));

                                set = st2.executeQuery(query);

                                while (set.next()) {
                                    out.println(set.getString("total"));
                                } 
                            %>
                        </span>
                    </li>

                    <% } %>
                </ul>
            </div>
            <!-- /.div -->

            <div>
                <a class="list-group-item active list-group-item-warning">Brands
                </a>
                <ul class="list-group">
                    <%
                        mainQuery = "SELECT DISTINCT brandName FROM catalogue";
                        mainSet = st.executeQuery(mainQuery);

                        while (mainSet.next()) {
                    %>
                    <li class="list-group-item">
                        <%= mainSet.getString("brandName")%>
                        <span class="label label-danger pull-right">
                            <%
                                query = String.format("SELECT COUNT(*) AS total FROM catalogue WHERE brandName ='%s' ",
                                        mainSet.getString("brandName"));
                                //out.println(query);
                                set = st2.executeQuery(query);

                                while (set.next()) {
                                    totalItems += Integer.parseInt(set.getString("total"));
                                    out.println(set.getString("total"));
                                }
                            %>
                        </span>
                    </li>

                    <% }%>
                </ul>
            </div>                
            <!-- /.div -->
        </div>
        <!-- /.col -->


        <!-- Breadcrumb -->
        <div class="col-md-9">
            <div>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Devices</li>
                </ol>
            </div>
            <!-- /.div -->
            <div class="row">
                <div class="btn-group alg-right-pad">
                    <button type="button" class="btn btn-default"><strong><%= totalItems%> </strong>items</button>
                    <div class="btn-group">
                        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                            Sort Products &nbsp;
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">By Price Low</a></li>
                            <li class="divider"></li>
                            <li><a href="#">By Price High</a></li>
                            <li class="divider"></li>
                            <li><a href="#">By Popularity</a></li>
                            <li class="divider"></li>
                            <li><a href="#">By Reviews</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row" id="cartContents">

                <%
                    query = "SELECT * FROM catalogue LIMIT 30;";

                    ResultSet newSet = st2.executeQuery(query);
                    int count = 0;

                    while (newSet.next()) {
                        // out.println(set.getString("type"));
                                    
                %>

                <div class="col-md-4 text-center col-sm-6 col-xs-6">
                    <div class="thumbnail product-box">
                        <img src="
                             <% 
                                if(newSet.getString("type").toLowerCase().equals("laptop"))
                                {
                                    out.print(String.format("assets/img/laptops/%s", newSet.getString("picturePath")));
                                }
                                else
                                {
                                    out.print(String.format("assets/img/tabs/%s", newSet.getString("picturePath")));
                                }
                            %>" alt="" class="img-responsive" style="width: 250px; height: 180px"/>
                        
                        <hr class="padding: 0 50px 0 50px;">
                        <div class="caption">
                            <h3>
                                <a href="#">
                                    <%
                                        out.println(newSet.getString("brandName") + " "
                                                + ((newSet.getString("model") == null) ? "" : newSet.getString("model")));
                                    %>
                                </a>
                            </h3>
                            <p>Price : <strong>N <%= newSet.getString("cost")%></strong>  </p>
                            <p>
                                Supplier: <a href="#"><%= newSet.getString("supplier")%></a> <br>
                                RAM: <a href="#"><%= newSet.getString("ram") + " GB"%></a> <br>
                                Storage Size: <a href="#"><%= newSet.getString("storageSize") + " GB"%></a> <br>
                                Screen Size: <a href="#"><%= newSet.getString("screenSize")%> </a>"
                            </p>
                            <p>
                                <a id="<%= "cart-item-" + newSet.getString("id") %>"  class="btn btn-danger" role="button" onclick="addToCart(this.id);">
                                    <span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart
                                </a>
                                <a href="#" class="btn btn-primary" role="button">See Details</a></p>
                        </div>
                    </div>
                </div>

                <% count++; }%>

                <!--                        
                                         /.col 
                                        <div class="col-md-4 text-center col-sm-6 col-xs-6">
                                            <div class="thumbnail product-box">
                                                <img src="assets/img/dummyimg.png" alt="" />
                                                <div class="caption">
                                                    <h3><a href="#">Samsung Galaxy </a></h3>
                                                    <p>Price : <strong>$ 3,45,900</strong>  </p>
                                                    <p><a href="#">Ptional dismiss button </a></p>
                                                    <p>Ptional dismiss button in tional dismiss button in   </p>
                                                    <p><a href="#" class="btn btn-success" role="button">Add To Cart</a> <a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                                </div>
                                            </div>
                                        </div>
                                         /.col 
                                        <div class="col-md-4 text-center col-sm-6 col-xs-6">
                                            <div class="thumbnail product-box">
                                                <img src="assets/img/dummyimg.png" alt="" />
                                                <div class="caption">
                                                    <h3><a href="#">Samsung Galaxy </a></h3>
                                                    <p>Price : <strong>$ 3,45,900</strong>  </p>
                                                    <p><a href="#">Ptional dismiss button </a></p>
                                                    <p>Ptional dismiss button in tional dismiss button in   </p>
                                                    <p><a href="#" class="btn btn-success" role="button">Add To Cart</a> <a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                                </div>
                                            </div>
                                        </div>-->
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="row">
                <ul class="pagination alg-right-pad">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<div class="col-md-12 download-app-box text-center">

    <span class="glyphicon glyphicon-download-alt"></span>Download Our Android App and Get 10% additional Off on all Devices . <a href="#" class="btn btn-danger btn-lg">DOWNLOAD  NOW</a>

</div>

<script type="text/javascript">
    function DisplayCartItems() {

    $.ajax({
        type: "GET",
        url: 'Checkout',
        data: {session : '<%=session.getAttribute("cartDetails")%>'},
        success: function (message) {

            if (message === "invalid")
            {
                alert("Invalid cart item.");
            }
            else
            {
                cartContents = document.getElementById('checkout-body');

                cartContents.innerHTML = message;

                alert("Please feel free to view all items");
                
                $('#modal-show-btn').show();
            }
        },
        error: function () {
            alertify.alert('Login failure', "Please verify your email or password");
        }
    });

}
</script>

<%@include file="footer.jsp" %>