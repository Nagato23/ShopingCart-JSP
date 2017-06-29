<%@include file="HeaderLibrary.jsp" %>

<%@ page import="sarpestein.DBHelper" %>
<% int totalItems = 0;%>

<%@include file="Header.jsp" %>

<% 
    session = request.getSession();
    
    String itemsString = session.getAttribute("cartDetails").toString();
    //(id:%s-price:%s);
    String[] items =  itemsString.split(";");
    
    int totalPrice = 0;
    
    

    String cartDetails = "";
    cartDetails += (String) session.getAttribute("cartDetails");
%>
<div class="container-fluid">
    <h1>Your Cart</h1>
    
    <% 
    for(String item : items)
    {
        String id ="";
        String price ="";
        
        id = item.replace("(" ,"").replace(")", "").split("-")[0].split(":")[1];
        price = item.replace("(" ,"").replace(")", "").split("-")[1].split(":")[1];
        
        
        ResultSet set = st.executeQuery("SELECT * FROM catalogue WHERE id = " + id);
        
        try
        {
            while(set.next()){
    %>
    <div class="col-md-4 text-center col-sm-6 col-xs-6">
        <div class="thumbnail product-box">
            <img src="
                 <%
                     if (set.getString("type").toLowerCase().equals("laptop")) {
                         out.print(String.format("assets/img/laptops/%s", set.getString("picturePath")));
                     } else {
                         out.print(String.format("assets/img/tabs/%s", set.getString("picturePath")));
                     }
                 %>" alt="" class="img-responsive" style="width: 250px; height: 180px"/>

            <hr class="padding: 0 50px 0 50px;">
            <div class="caption">
                <h3>
                    <a href="#">
                        <%
                            out.println(set.getString("brandName") + " "
                                    + ((set.getString("model") == null) ? "" : set.getString("model")));
                        %>
                    </a>
                </h3>
                <p>Price : <strong>N <%= set.getString("cost")%></strong>  </p>
                <p>
                    Supplier: <a href="#"><%= set.getString("supplier")%></a> <br>
                    RAM: <a href="#"><%= set.getString("ram") + " GB"%></a> <br>
                    Storage Size: <a href="#"><%= set.getString("storageSize") + " GB"%></a> <br>
                    Screen Size: <a href="#"><%= set.getString("screenSize")%> </a>"
                </p>
                <p>
                    <a id="<%= "cart-item-" + set.getString("id")%>"  class="btn btn-danger" role="button"">
                        <span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart
                    </a>
                    <a href="#" class="btn btn-primary" role="button">See Details</a></p>
            </div>
        </div>
    </div>

    
    <%
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        totalPrice += Integer.parseInt(price);
        
        st.execute("");
    }
    %>
    
</div>

<%@include file="footer.jsp" %>