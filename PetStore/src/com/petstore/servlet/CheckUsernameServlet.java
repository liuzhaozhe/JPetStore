package com.petstore.servlet;

import com.petstore.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by hezhujun on 2016/3/20.
 */
@WebServlet(name = "CheckUsernameServlet", value = "/checkUsername")
public class CheckUsernameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        boolean isHas = UserDao.getInstance().checkUsername(username);
        PrintWriter out = response.getWriter();
        if (isHas){
            out.print("exist");
        } else {
            out.print("not exist");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
