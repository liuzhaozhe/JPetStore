package com.petstore.servlet;

import com.petstore.dao.BillDao;
import com.petstore.dao.ItemDao;
import com.petstore.entity.Bill;
import com.petstore.entity.Item;
import com.petstore.entity.User;

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
@WebServlet(name = "ConfirmBuyServlet", value = "/confirmBuy")
public class ConfirmBuyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        Bill bill = (Bill) request.getSession().getAttribute("bill");
        List<Item> billItemList = (List<Item>) request.getSession().getAttribute("billItemList");
        String username = ((User)request.getSession().getAttribute("user")).getUsername();
        boolean result = BillDao.getInstance().add(bill, username);
        String msg;
        if (result){
            for (Item item : billItemList
                    ) {
                ItemDao.getInstance().addBillAndProduct(item, bill.getBillId());
            }
            response.sendRedirect("success.jsp");
        } else {
            msg = "操作失败";
            request.getRequestDispatcher("okBuy.jsp").forward(request, response);
        }
    }
}
