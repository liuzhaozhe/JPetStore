package com.petstore.servlet;

import com.petstore.dao.ProductDao;
import com.petstore.entity.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/21.
 */
@WebServlet(name = "AddBillByCarServlet",value = "/addBillByCar")
public class AddBillByCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        List<Object[]> buyList = new ArrayList<Object[]>();
        List<Object[]> itemList = (List<Object[]>) request.getSession().getAttribute("itemList");
        if(productId != null) {
            for (Object[] objectTemp : itemList
                 ) {
                Item itemTemp = (Item) objectTemp[0];
                if (itemTemp.getProductId().equals(productId)){
                    int stock = ProductDao.getInstance().getStock(productId);
                    objectTemp[1] = stock;
                    buyList.add(objectTemp);
                }
            }
        } else {
            // 购买购物车所有的商品
            buyList.addAll(itemList);
        }
        request.getSession().setAttribute("buyList", buyList);
        response.sendRedirect("buy.jsp");
    }
}