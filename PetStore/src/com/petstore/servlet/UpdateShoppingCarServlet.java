package com.petstore.servlet;

import com.petstore.dao.ItemDao;
import com.petstore.dao.ProductDao;
import com.petstore.entity.Item;
import com.petstore.entity.Product;
import com.petstore.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by liuzheng on 2016/3/20.
 */
@WebServlet(name = "UpdateShoppingCarServlet",value = "/updateShoppingCar")
public class UpdateShoppingCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String username = ((User)request.getSession().getAttribute("user")).getUsername();
        String productId = request.getParameter("productId");
        int amount = Integer.parseInt(request.getParameter("amount"));
        Item item = ItemDao.getInstance().getCarItem(productId, username);
        item.setAmount(amount);
        item.setTotalPrice(amount * item.getPrice());
        boolean result = ItemDao.getInstance().update(item, username);
        String msg;
        if (result) {
            msg = "success";
            List<Item> itemList = (List<Item>) request.getSession().getAttribute("itemList");
            for (Item temp : itemList
                 ) {
                if (temp.getProductId().equals(productId)){
                    temp.setAmount(item.getAmount());
                    temp.setTotalPrice(item.getTotalPrice());
                    break;
                }
            }
            request.getSession().setAttribute("itemList", itemList);
        } else{
            msg = "fail";
        }
        PrintWriter out = response.getWriter();
        out.print(msg);
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
