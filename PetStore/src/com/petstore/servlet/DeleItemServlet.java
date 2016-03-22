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
@WebServlet(name = "DeleItemServlet", value = "/deleteItem")
public class DeleItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        List<Object[]> buyList = (List<Object[]>) request.getSession().getAttribute("buyList");
        int index = -1;
        for (int i = 0; i < buyList.size(); i++){
            Item itemTemp = (Item) buyList.get(i)[0];
            if(itemTemp.getProductId().equals(productId)){
                index = i;
                break;
            }
        }
        buyList.remove(index);
        request.getSession().setAttribute("buyList", buyList);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
