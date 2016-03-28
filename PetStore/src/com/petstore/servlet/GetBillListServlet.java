package com.petstore.servlet;

import com.petstore.dao.BillDao;
import com.petstore.entity.Bill;
import com.petstore.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by liuzheng on 2016/3/21.
 */
@WebServlet(name = "GetBillListServlet", value = "/getBillList")
public class GetBillListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String username = user.getUsername();
        List<Bill> billList = BillDao.getInstance().getBillList(username);
        request.getSession().setAttribute("billList", billList);
        response.sendRedirect("/jsp/bill/billList.jsp");
    }
}
