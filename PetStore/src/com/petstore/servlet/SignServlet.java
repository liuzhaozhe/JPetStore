package com.petstore.servlet;

import com.petstore.dao.UserDao;
import com.petstore.entity.User;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liuzheng on 2016/3/12.
 */
@WebServlet(name = "SignServlet", value = "/sign")
public class SignServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html,charset=UTF-8");
        String name = request.getParameter("username");
        String pwd = request.getParameter("password");
        pwd = DigestUtils.md5Hex(pwd);
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        User user = new User();
        user.setUsername(name);
        user.setPassword(pwd);
        user.setAddress(address);
        user.setEmail(email);
        user.setPhone(phone);
        try {
            if (UserDao.getInstance().add(user)) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("index.jsp");
            } else {
                String msg = "注册失败";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("sign.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
