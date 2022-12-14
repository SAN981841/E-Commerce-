

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include file="components/message.jsp" %>
                    
                    <div class="card-body px-5">
                        <div class="card-header custom-bg text-white">
                            <h3>Sign up Here!!</h3>
                        </div>
                         <!--<h1 class="text-center">Sign up Here!!</h1>-->
                         <form action="RegisterServlet" method="post">

                    <div class="form-group">
                        <label for="name">User Name</label>
                        <input  name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                        
                    </div>
                    <div class="form-group">
                        <label for="email">User Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                            
                    </div>
                    <div class="form-group">
                        <label for="password">User Password</label>
                        <input  name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                        
                    </div>
                    <div class="form-group">
                        <label for="phone">User Phone</label>
                        <input  name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                        
                    </div>
                    <div class="form-group">
                        <label for="phone">User Address</label>
                        <textarea name="user_address" style="height: 150px"class="form-control" placeholder="Enter your Address"></textarea>
                        
                    </div>
                    
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-primary ">Register</button>
                        <button type="reset" class="btn btn-outline-warning">Reset</button>
                    </div>
                   
                    
                </form>

                        
                    </div>
                    
                </div>
                
            </div>
        </div>
            
        </div>
    </body>
</html>
