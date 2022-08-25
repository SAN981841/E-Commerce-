<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entity.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entity.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "Invalid User!! Login First ");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin !! do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">

            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>


            <div class="row mt-3">
                <!--first column-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/team.png" alt="">
                            </div>


                            <h1>100</h1>
                            <h1 class="text-uppercase text-muted">User</h1>
                        </div>
                    </div>



                </div>
                <!--second column-->
                <div class="col-md-4">
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/list.png" alt="">
                            </div>
                            <h1>200</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>


                </div>
                <!--third column-->

                <div class="col-md-4">
                    <!--third box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="">
                            </div>  
                            <h1>4000</h1>
                            <h1 class="text-uppercase text-muted">Product</h1>
                        </div>
                    </div>  

                </div>
            </div>

            <!--second row-->
            <div class="row mt-3">
                <!--second row first column--> 
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-categories">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/keys.png" alt="">
                            </div>  
                            <p class="mt-2">Click here to add new Categories </p>
                            <h1 class="text-uppercase text-muted">Add Categories</h1>
                        </div>
                    </div>  


                </div>
                <!--second row second column-->

                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="">
                            </div>  
                            <p class="mt-2">Click here to add new  Products </p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>  


                </div>

            </div>


        </div>

        <!--add category model-->
        <!-- Button trigger modal -->   
        <!-- Modal -->
        <div class="modal fade" id="add-categories" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Categories Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Categories title" required/>



                            </div>
                            <div class="form-group">
                                <textarea style="height: 200px;" class="form-control" placeholder="Enter Categories Description"name="catDes" required></textarea>
                            </div>


                            <div class="container text-center">
                                <button class="btn btn-outline-success" >Add categories</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>



        <!--end category model-->


        <!--product model--> 

        <!-- Button trigger modal -->    

        <!-- Modal -->
        <div class="modal fade" id="add-product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details!!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                     <!--form-->
                     <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                          <input type="hidden" name="operation" value="addproduct">
                        <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Products title" required/> 
                        </div>
                         <div class="form-group">
                                <textarea style="height: 200px;" class="form-control" placeholder="Enter Products Description" name="pDesc" required></textarea>
                            </div>
                         
                         <!--products prize-->
                         
                         <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Products Prize" required/> 
                        </div>
                         
                         <!--product discount-->
                         
                           <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Products Discount" required/> 
                        </div>
                         
                         
                         <!--product Quantity-->
                          <div class="form-group">
                                <input type="number" class="form-control" name="pQuantoty" placeholder="Enter Products Quantity" required/> 
                        </div>
                         
                         
                         <%
                        CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                      List<Category> list=cdao.getCategories();   
                         %>
                         
                         
                         <!--product Category-->
                         <div class="form-group">
                             <select name="catId"  class="form-control" id="" >
                                 <%
                                     for(Category c:list){
                                 %>
                                 
                                 <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                 <%
                                  }%>
                                 
                             </select>
                         </div>
                         <!--product Category-->
                         
                         <div class="form-group">
                             <label for="pPic">Select Picture of Products</label>
                             <br>
                             <input type="file" id="pPic" name="pPic" required/>
  
                         </div>
                         
                         <!--submit button-->
                         
                         <div class="container text-center">
                             <button class="btn btn-outline-success">Add Products</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                             
                         </div>

                     </form>
                     
                     
                     <!--end form-->
    
                    </div>
                   
                </div>
            </div>
        </div>

        <!--end product model-->




    </body>
</html>
