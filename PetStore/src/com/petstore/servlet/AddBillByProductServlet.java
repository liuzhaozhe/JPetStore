package com.petstore.servlet;

import com.petstore.dao.BillDao;
import com.petstore.dao.ProductDao;
import com.petstore.entity.Bill;
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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

/**
 * Created by liuzheng on 2016/3/21.
 */
@WebServlet(name = "AddBillByProductServlet", value = "/addBillByProduct")
public class AddBillByProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// 生成Item对象保存购买商品信息
        Product product = (Product) request.getSession().getAttribute("product");
        Item item = new Item();
        item.setProductId(product.getProductId());
        item.setProductName(product.getProductName());
        item.setAmount(1);
        item.setPrice(product.getPrice());
        item.setTotalPrice(product.getPrice());
        // 页面以List方式接受商品信息
        List<Object[]> buyList = new ArrayList<Object[]>();
        Object o[] = new Object[2];
        o[0] = item;
        o[1] = product.getAmount();
        buyList.add(o);
        request.getSession().setAttribute("buyList", buyList);
        response.sendRedirect("/jsp/bill/buy.jsp");
    }
}
