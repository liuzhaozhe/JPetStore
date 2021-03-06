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
import java.io.PrintWriter;

/**
 * Created by liuzheng on 2016/3/22.
 */
@WebServlet(name = "UpdateUserServlet", value = "/updateUser")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User user = (User) request.getSession().getAttribute("user");
        String pwd = request.getParameter("password");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        if (pwd != null && !pwd.equals("")) {
            user.setPassword(DigestUtils.md5Hex(pwd));
        }
        user.setAddress(address);
        user.setEmail(email);
        user.setPhone(phone);
        user.setName(name);
        boolean result = UserDao.getInstance().update(user);
        String msg;
        if (result) {
            request.getSession().setAttribute("user", user);
            msg = "修改资料成功";
        } else {
            msg = "修改资料失败";
        }
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("/jsp/user/user.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
