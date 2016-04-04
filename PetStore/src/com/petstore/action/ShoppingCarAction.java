package com.petstore.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.petstore.dao.ItemDao;
import com.petstore.entity.Item;
import com.petstore.entity.Product;
import com.petstore.entity.User;
import org.apache.commons.lang3.ObjectUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by hezhujun on 2016/4/3.
 */
public class ShoppingCarAction extends ActionSupport {
    private String msg = null;
    private String productId = null;
    private String amount = null;

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductId() {
        return productId;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getAmount() {
        return amount;
    }

    /**
     * 查看购物车
     */
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

    /**
     * 添加到购物车
     *
     * @return
     */
    public String addShoppingCar() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        User user = (User) session.get("user");
        Product product = (Product) session.get("product");
        // 判断是否已经添加到购物车
        boolean result = ItemDao.getInstance().checkCarItem(product.getProductId(), user.getUsername());
        if (!result) {
            Item item = new Item();
            item.setAmount(1);
            item.setPrice(product.getPrice());
            item.setProductId(product.getProductId());
            item.setProductName(product.getProductName());
            item.setTotalPrice(item.getPrice());
            boolean b = ItemDao.getInstance().addShoppingCar(item, user.getUsername());
            if (b == true) {
                msg = "成功添加到购物车";
            } else {
                msg = "添加到购物车失败";
            }
        } else {
            msg = "已经添加到购物车";
        }
        return SUCCESS;
    }

    /**
     * 删除购物车商品
     *
     * @return
     */
    public String deleteShoppingCar() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        User user = (User) session.get("user");
        boolean b = ItemDao.getInstance().delete(user.getUsername(), productId);
        if (b == true) {
            // 更新session的购物车内容
            msg = "success";
            List<Item> itemList = (List<Item>) session.get("itemList");
            int index = -1;
            for (int i = 0; i < itemList.size(); i++) {
                Item itemTemp = itemList.get(i);
                if (itemTemp.getProductId().equals(productId)) {
                    index = i;
                    break;
                }
            }
            itemList.remove(index);
            session.put("itemList", itemList);
        } else {
            msg = "fail";
        }
        return SUCCESS;
    }

    /**
     * 更新购物车信息
     * @return
     */
    public String updateShoppingCar() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        User user = (User) session.get("user");
        // 先获取数据库中的内容
        Item item = ItemDao.getInstance().getCarItem(productId, user.getUsername());
        int count = Integer.parseInt(amount);
        item.setAmount(count);
        item.setTotalPrice(count * item.getPrice());
        // 修改内容
        boolean result = ItemDao.getInstance().update(item, user.getUsername());
        if (result) {
            msg = "success";
            // 更新session中的内容
            List<Item> itemList = (List<Item>) session.get("itemList");
            for (Item temp : itemList
                    ) {
                if (temp.getProductId().equals(productId)){
                    temp.setAmount(item.getAmount());
                    temp.setTotalPrice(item.getTotalPrice());
                    break;
                }
            }
            session.put("itemList", itemList);
        } else{
            msg = "fail";
        }
        return SUCCESS;
    }
}
