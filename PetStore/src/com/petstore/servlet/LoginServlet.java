package com.petstore.servlet;

import com.petstore.dao.UserDao;
import com.petstore.entity.User;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by liuzheng on 2016/3/12.
 */
@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取登录网页中的用户名的字符串
        String name = request.getParameter("username");
        //获取用户登录的密码字符串
        String pwd = request.getParameter("password");
        pwd = DigestUtils.md5Hex(pwd);
        //根据用户名查找数据库中的信息并提取
        User user = UserDao.getInstance().getUser(name, pwd);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("index.jsp");
        } else {
            String msg = "用户名或密码输入错误请重新登录";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
