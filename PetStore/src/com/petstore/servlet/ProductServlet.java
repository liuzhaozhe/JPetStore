package com.petstore.servlet;

import com.petstore.dao.CategoryDao;
import com.petstore.dao.ProductDao;
import com.petstore.entity.Category;
import com.petstore.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by hezhujun on 2016/3/20.
 */
@WebServlet(name = "ProductServlet", value = "/getProduct")
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        Object[] o = ProductDao.getInstance().getProduct(productId);
        Product product = (Product) o[0];
        Category category = CategoryDao.getInstance().getCategory((String) o[1]);
        request.getSession().setAttribute("product", product);
        request.getSession().setAttribute("category", category);
        response.sendRedirect("product.jsp");
    }
}
