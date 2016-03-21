package com.petstore.servlet;

import com.petstore.dao.ItemDao;
import com.petstore.entity.Item;
import com.petstore.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by liuzheng on 2016/3/20.
 */
@WebServlet(name = "DeleteShoppingCarServlet", value = "/deleteShoppingCar")
public class DeleteShoppingCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = ((User)request.getSession().getAttribute("user")).getUsername();
        String productId = request.getParameter("productId");
        boolean b = ItemDao.getInstance().delete(username,productId);
        String msg;
        if(b == true){
            msg = "success";
            List<Object[]> itemList = (List<Object[]>) request.getSession().getAttribute("itemList");
            int index = -1;
            for (int i = 0; i < itemList.size(); i++){
                Item itemTemp = (Item) itemList.get(i)[0];
                if(itemTemp.getProductId().equals(productId)){
                    index = i;
                    break;
                }
            }
            itemList.remove(index);
            request.getSession().setAttribute("itemList", itemList);
        }else{
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
