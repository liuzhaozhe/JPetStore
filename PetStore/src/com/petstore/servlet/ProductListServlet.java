package com.petstore.servlet;

import com.petstore.dao.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by liuzheng on 2016/3/12.
 */
@WebServlet(name = "ProductListServlet",value = "/getProductList")
public class ProductListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category2Id = request.getParameter("category2");
        List<String[]> productList = ProductDao.getInstance().getProdutInfo(category2Id);
        request.getSession().setAttribute("productList", productList);
        response.sendRedirect("/jsp/product/productList.jsp");
    }
}
