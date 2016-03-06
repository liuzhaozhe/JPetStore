package com.petstore.entity;

import java.math.BigDecimal;

/**
 * Created by zhujun on 2016/3/6.
 * 账单或购物车的商品条目表
 */
public class Orderitem {
    private int id;                             // 编号
    private String productId;                   // 商品ID
    private String productName;                 // 商品名称
    private BigDecimal productPrice;            // 商品单价
    private int amount;                         // 商品数量
    private Integer orderId;                    // 账单ID，连接账单
    private Integer customerId;                 // 用户ID，连接购物车，与orderId只能有一个属性，另一个为null

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    /**
     * 比较对象
     * @param o
     * @return
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orderitem orderitem = (Orderitem) o;

        if (id != orderitem.id) return false;
        if (amount != orderitem.amount) return false;
        if (productId != null ? !productId.equals(orderitem.productId) : orderitem.productId != null) return false;
        if (productName != null ? !productName.equals(orderitem.productName) : orderitem.productName != null)
            return false;
        if (productPrice != null ? !productPrice.equals(orderitem.productPrice) : orderitem.productPrice != null)
            return false;
        if (orderId != null ? !orderId.equals(orderitem.orderId) : orderitem.orderId != null) return false;
        if (customerId != null ? !customerId.equals(orderitem.customerId) : orderitem.customerId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (productId != null ? productId.hashCode() : 0);
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (productPrice != null ? productPrice.hashCode() : 0);
        result = 31 * result + amount;
        result = 31 * result + (orderId != null ? orderId.hashCode() : 0);
        result = 31 * result + (customerId != null ? customerId.hashCode() : 0);
        return result;
    }
}
