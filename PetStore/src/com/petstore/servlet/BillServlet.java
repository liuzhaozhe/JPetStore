package com.petstore.servlet;

import com.petstore.entity.Bill;
import com.petstore.entity.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by hezhujun on 2016/3/21.
 */
@WebServlet(name = "BillServlet", value = "/addBill")
public class BillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String consignee = request.getParameter("consignee");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Bill bill = new Bill();
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = formatter.format(currentTime);
        Random random = new Random();
        int temp = random.nextInt(90) + 10;
        bill.setBillId(dateString + temp);
        bill.setConsignee(consignee);
        bill.setCreateTime(currentTime);
        bill.setConsigneeAddress(address);
        bill.setConsigneePhone(phone);
        List<Object[]> buyList = (List<Object[]>) request.getSession().getAttribute("buyList");
        List<Item> billItemList = new ArrayList<Item>();
        double totalPrice = 0;
        for (Object[] buyTemp : buyList
             ) {
            Item itemTemp = (Item) buyTemp[0];
            totalPrice += itemTemp.getPrice() * itemTemp.getAmount();
            itemTemp.setTotalPrice(itemTemp.getPrice() * itemTemp.getAmount());
            billItemList.add(itemTemp);
        }
        bill.setMoney(totalPrice);
        request.getSession().setAttribute("bill", bill);
        request.getSession().setAttribute("billItemList", billItemList);
        response.sendRedirect("/jsp/bill/okBuy.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
