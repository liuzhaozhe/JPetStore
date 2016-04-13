package com.petstore.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.petstore.dao.BillDao;
import com.petstore.dao.ItemDao;
import com.petstore.dao.ProductDao;
import com.petstore.entity.Bill;
import com.petstore.entity.Item;
import com.petstore.entity.Product;
import com.petstore.entity.User;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Created by hezhujun on 2016/4/4.
 */
public class BillAction extends ActionSupport implements ModelDriven<Bill> {
    private Bill bill = new Bill();
    private Map<String, Object> session = ActionContext.getContext().getSession();
    private String billId = null;
    private String productId = null;
    private String amount = null;
    private String msg = null;

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }

    public String getBillId() {
        return billId;
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

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    /**
     * 获取账单信息
     *
     * @return
     */
    public String getBillList() {
        User user = (User) session.get("user");
        String username = user.getUsername();
        List<Bill> billList = BillDao.getInstance().getBillList(username);
        session.put("billList", billList);
        return SUCCESS;
    }

    /**
     * 获取账单详细系信息
     *
     * @return
     */
    public String getBillDetail() {
        Bill bill = BillDao.getInstance().getBill(billId);
        List<Item> billItemList = ItemDao.getInstance().getBillItemList(billId);
        session.put("bill", bill);
        session.put("billItemList", billItemList);
        return SUCCESS;
    }

    /**
     * 通过商品页购买
     *
     * @return
     */
    public String addBillByProduct() {
        // 生成Item对象保存购买商品信息
        Product product = (Product) session.get("product");
        Item item = new Item();
        item.setProductId(product.getProductId());
        item.setProductName(product.getProductName());
        item.setAmount(1);
        item.setPrice(product.getPrice());
        item.setTotalPrice(product.getPrice());
        // 页面以List方式接受商品信息
        List<Item> buyList = new ArrayList<Item>();
        buyList.add(item);
        session.put("buyList", buyList);
        return SUCCESS;
    }

    /**
     * 通过购物车购买
     *
     * @return
     */
    public String addBillByCar() {
        List<Item> buyList = new ArrayList<Item>();
        List<Item> itemList = (List<Item>) session.get("itemList");
        if (productId != null) {
            // 购买购物车某一商品
            for (Item item : itemList
                    ) {
                if (item.getProductId().equals(productId)) {
                    buyList.add(item);
                }
            }
        } else {
            // 购买购物车所有的商品
            buyList.addAll(itemList);
        }
        session.put("buyList", buyList);
        return SUCCESS;
    }

    /**
     * 删除某一项商品
     *
     * @return
     */
    public String deleteItem() {
        List<Object[]> buyList = (List<Object[]>) session.get("buyList");
        int index = -1;
        for (int i = 0; i < buyList.size(); i++) {
            Item itemTemp = (Item) buyList.get(i)[0];
            if (itemTemp.getProductId().equals(productId)) {
                index = i;
                break;
            }
        }
        buyList.remove(index);
        session.put("buyList", buyList);
        return SUCCESS;
    }

    /**
     * 更新要购买的信息
     *
     * @return
     */
    public String updateItem() {
        List<Item> buyList = (List<Item>) session.get("buyList");
        for (Item itemTemp : buyList
                ) {
            if (itemTemp.getProductId().equals(productId)) {
                int count = Integer.parseInt(amount);
                itemTemp.setAmount(count);
                itemTemp.setTotalPrice(count * itemTemp.getPrice());
                break;
            }
        }
        session.put("buyList", buyList);
        return SUCCESS;
    }

    /**
     * 生成账单
     * @return
     */
    public String createBill() {
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = formatter.format(currentTime);
        Random random = new Random();
        int temp = random.nextInt(90) + 10;
        bill.setBillId(dateString + temp);
        List<Item> buyList = (List<Item>) session.get("buyList");
        List<Item> billItemList = new ArrayList<Item>();
        // 计算总价格
        double totalPrice = 0;
        for (Item itemTemp : buyList
                ) {
            totalPrice += itemTemp.getPrice() * itemTemp.getAmount();
            itemTemp.setTotalPrice(itemTemp.getPrice() * itemTemp.getAmount());
            billItemList.add(itemTemp);
        }
        bill.setMoney(totalPrice);
        session.put("bill", bill);
        session.put("billItemList", billItemList);
        return SUCCESS;
    }

    /**
     * 确认购买
     *
     * @return
     */
    public String confirmBuy() {
        Bill bill = (Bill) session.get("bill");
        List<Item> billItemList = (List<Item>) session.get("billItemList");
        String username = ((User) session.get("user")).getUsername();
        boolean result = BillDao.getInstance().add(bill, username);
        String msg;
        if (result) {
            for (Item item : billItemList
                    ) {
                ItemDao.getInstance().addBillAndProduct(item, bill.getBillId());
                ProductDao.getInstance().update(item.getProductId(), item.getAmount());
            }
            return SUCCESS;
        } else {
            msg = "操作失败";
            return ERROR;
        }
    }

    @Override
    public Bill getModel() {
        return bill;
    }
}
