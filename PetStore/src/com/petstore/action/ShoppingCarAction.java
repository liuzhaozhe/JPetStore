package com.petstore.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.petstore.dao.ItemDao;
import com.petstore.entity.Item;
import com.petstore.entity.User;

import java.util.List;

/**
 * Created by hezhujun on 2016/4/3.
 */
public class ShoppingCarAction extends ActionSupport {

    @Override
    public String execute() throws Exception {
        // 获取用户名
        User user = (User) ActionContext.getContext().getSession().get("user");
        String username = user.getUsername();
        // 获取购物车信息
        List<Item> items = ItemDao.getInstance().getCarItemList(username);
        ActionContext.getContext().getSession().put("itemList", items);
        return SUCCESS;
    }
}
