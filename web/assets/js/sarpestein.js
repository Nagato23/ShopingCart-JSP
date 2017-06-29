function login() {
    var email = $('#loginEmail').val();
    var password = $('#loginPassword').val();


    alertify.alert("hello", "hello");
    
    $.ajax({
        type: "POST",
        url: 'login.jsp',
        data: {email: email, password: password},
        success: function (message) {
            if (message === "1") {
                alertify.alert('Login success', "You have been successfully logged in");

                $("#loginModal").modal('toggle');

                var loginBtn = document.getElementById('loginBtn');
                loginBtn.innerHTML = "Welcome";
                loginBtn.removeAttribute('data-target');
                loginBtn.removeAttribute('data-toggle');

            }
            else
            {
                alertify.alert('Login failure', "Please verify your email or password");
            }
        },
        error: function () {
            alertify.alert('Login failure', "Please verify your email or password");
        }
    });
    
    
}


function Search() {
    var type = $('#type').val();
    var brand = $('#brand').val();
    var ram = $('#ram').val();
    var screenSize = $('#screenSize').val();
    var storageSize = $('#storageSize').val();
    var cost = $('#minCost').val();
    
    $.ajax({
        type: "POST",
        url: 'SearchServlet',
        data: {type: type, brand: brand, ram: ram, screenSize:screenSize, storageSize: storageSize, cost: cost},
        success: function (message) {
            cartContents = document.getElementById('cartContents');
            
            cartContents.innerHTML = "";
            
            cartContents.innerHTML = message;
            //alertify.alert('Login failure', "Please verify your email or password");
        },
        error: function () {
            //alertify.alert('Login failure', "Please verify your email or password");
        }
    });
}


function addToCart(id) {
    id = id.replace("cart-item-", "");
    
    $.ajax({
        type: "GET",
        url: 'AddItemToCart',
        data: {id: id},
        success: function (message) {
            
            if(message === "invalid")
            {
                alert("Invalid cart item.");
            }
            else
            {
                cartContents = document.getElementById('cart-value');

                cartContents.innerHTML = message;
                
                alert("Successfully Added item to cart");
            }
        },
        error: function () {
            alertify.alert('Login failure', "Please verify your email or password");
        }
    });
    
}