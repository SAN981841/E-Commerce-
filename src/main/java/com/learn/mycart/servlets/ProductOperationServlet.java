/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entity.Category;
import com.learn.mycart.entity.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            servlet:2
//                    addCategory
//                    addProduct
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {

//                add category
                // fetch category data 
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDes");
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                // category save in databse :
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
//                out.println("Category Save ");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added SuccessFully!!" + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addproduct")) {

                //add product
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantoty = Integer.parseInt(request.getParameter("pQuantoty"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantoty(pQuantoty);
                p.setpPhoto(part.getSubmittedFileName());

                //get category by id 
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);

                //product save
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                
                //pic upload
                //find out the path upload photo 
                
                String path =request.getRealPath("img")+File.separator + "product" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                // image u[pload code 
                try {
                     FileOutputStream fos = new FileOutputStream(path);
                InputStream is =part.getInputStream();
                
                //reading data 
                
                byte [] data =new byte[is.available()];
                is.read(data);
                
                //Write data 
                
                fos.write(data);
                fos.close();
                
                } catch (Exception e) {
                    e.printStackTrace(); 
                }
                
                
                
                out.println("Product Save Successfully !!");

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product added SuccessFully!!");
                response.sendRedirect("admin.jsp");
                return;
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
