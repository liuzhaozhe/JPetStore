package com.petstore.servlet;

import com.petstore.entity.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/21.
 */
@WebServlet(name = "UpdateItemServlet", value = "/updateItem")
public class UpdateItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        int amount = Integer.parseInt(request.getParameter("amount"));
        List<Object[]> buyList = (List<Object[]>) request.getSession().getAttribute("buyList");
        for (Object[] temp : buyList
                ) {
            Item itemTemp = (Item) temp[0];
            if (itemTemp.getProductId().equals(productId)){
                itemTemp.setAmount(amount);
                itemTemp.setTotalPrice(amount * itemTemp.getPrice());
                break;
            }
        }
        request.getSession().setAttribute("buyList", buyList);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
