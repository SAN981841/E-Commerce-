<%-- 
    Document   : index
    Created on : 10 Aug, 2022, 11:50:45 PM
    Author     : SANTOSH
--%>

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entity.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entity.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title>

        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>



        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%                String cat = request.getParameter("category");
    //               out.println(cat);

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();

                %>

                <!--show category-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>  



                    </div>
                    <% for (Category category : clist) {%>

                    <a href="index.jsp?category=<%= category.getCategoryId()%>" class="list-group-item list-group-item-action"> <%=category.getCategoryTitle()%></a>
                    <%
                        }

                    %>


                </div>
                <!--show product-->

                <div class="col-md-10">
                    <div class="row mt-4">
                        <div class="col-md-12">

                            <div class="card-columns">

                                <%                                for (Product product : list) {
                                %>

                                <!--product card-->
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img class="card-img-top m-2" style="max-height: 200px;max-width: 100%; width: auto;"src="img/product/<%=product.getpPhoto()%>" alt="Card image cap">
                                    </div>


                                    <div class="card-body">

                                        <h5 class="card-title"><%=product.getpName()%></h5>
                                        <p class="card-text"><%=Helper.get10Words(product.getpDesc())%> </p>
                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%=product.getpId()%>, '<%=product.getpName()%>',<%=product.getPriceAfterDiscount()%>)">Add To Cart</button>
                                        <button class="btn btn-outline-primary  "> &#8377;<%=product.getPriceAfterDiscount()%>/-<span class="text-secondary discount-label"> &#8377;<%=product.getpPrice()%>,<%=product.getpDiscount()%>% off</span></button>
                                    </div>

                                </div>

                                <%  }
                                    if (list.size() == 0) {
                                        out.println("<h2>No Item This Category</h2>");
                                    }


                                %>

                            </div>

                        </div>

                    </div>
                </div>
            </div>


            <%@include file="components/common_model.jsp" %>
    </body>
</html>
