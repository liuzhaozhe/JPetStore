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
import java.util.List;

/**
 * Created by hezhujun on 2016/3/22.
 */
@WebServlet(name = "SearchServlet",value = "/search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("search");
        List<String[]> productList = ProductDao.getInstance().getProdutInfoByName(search);
        if (productList == null || productList.size() != 1) {
            request.getSession().setAttribute("productList", productList);
            response.sendRedirect("./jsp/product/productList.jsp");
        } else {
            // 只有一个时直接到商品详细页
            Object[] o = ProductDao.getInstance().getProduct(productList.get(0)[0]);
            Product product = (Product) o[0];
            Category category = CategoryDao.getInstance().getCategory((String) o[1]);
            request.getSession().setAttribute("product", product);
            request.getSession().setAttribute("category", category);
            response.sendRedirect("./jsp/product/product.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
