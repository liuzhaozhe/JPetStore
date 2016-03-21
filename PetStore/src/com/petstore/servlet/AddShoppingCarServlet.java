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
import java.io.PrintWriter;
import java.io.StreamCorruptedException;

/**
 * Created by liuzheng on 2016/3/20.
 */
@WebServlet(name = "AddShoppingCarServlet", value = "/addShoppingCar")
public class AddShoppingCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        Product product = (Product) request.getSession().getAttribute("product");
        String username = ((User) request.getSession().getAttribute("user")).getUsername();
        boolean result = ItemDao.getInstance().checkCarItem(product.getProductId(), username);
        String msg;
        if (!result) {
            Item item = new Item();
            item.setAmount(1);
            item.setPrice(product.getPrice());
            item.setProductId(product.getProductId());
            item.setProductName(product.getProductName());
            item.setTotalPrice(item.getPrice());
            boolean b = ItemDao.getInstance().addShoppingCar(item, username);
            if (b == true) {
                msg = "成功添加到购物车";
            } else {
                msg = "添加到购物车失败";
            }
        } else {
            msg = "已经添加到购物车";
        }
        PrintWriter out = response.getWriter();
        out.print(msg);
        out.flush();
        out.close();
    }
}
