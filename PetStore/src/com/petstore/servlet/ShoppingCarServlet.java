package com.petstore.servlet;

import com.petstore.dao.CategoryDao;
import com.petstore.dao.ItemDao;
import com.petstore.dao.ProductDao;
import com.petstore.entity.Item;
import com.petstore.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by liuzheng on 2016/3/20.
 */
@WebServlet(name = "ShoppingCarServlet",value = "/getShoppingCar")
public class ShoppingCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = ((User)request.getSession().getAttribute("user")).getUsername();
        List<Item> items = ItemDao.getInstance().getCarItemList(username);
        // 加入商品库存
        List<Object[]> itemList = new ArrayList<Object[]>();
        for (Item temp : items
             ) {
            Object[] o = new Object[2];
            o[0] = temp;
            int stock = ProductDao.getInstance().getStock(temp.getProductId());
            o[1] = stock;
            itemList.add(o);
        }
        request.getSession().setAttribute("itemList", itemList);

        response.sendRedirect("shoppingCar.jsp");
    }
}
