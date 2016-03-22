package com.petstore.servlet;

import com.petstore.dao.BillDao;
import com.petstore.dao.ItemDao;
import com.petstore.entity.Bill;
import com.petstore.entity.Item;

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
@WebServlet(name = "GetBillDetailServlet",value = "/getBillDetail")
public class GetBillDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billId = request.getParameter("billId");
        Bill bill = BillDao.getInstance().getBill(billId);
        List<Item> billItemList = ItemDao.getInstance().getBillItemList(billId);
        request.getSession().setAttribute("bill", bill);
        request.getSession().setAttribute("billItemList", billItemList);
        response.sendRedirect("billDetail.jsp");
    }
}
