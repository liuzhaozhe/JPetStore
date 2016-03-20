package com.petstore.servlet;


import com.petstore.dao.CategoryDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by liuzheng on 2016/3/12.
 */
@WebServlet(name = "CategoryServlet", value = "/getCategory")
public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String category = request.getParameter("category");
        Map<String, String> category2 = CategoryDao.getInstance().getCategory2(category);
        request.getSession().setAttribute("category2", category2);
        response.sendRedirect("categoryList.jsp");
    }
}
