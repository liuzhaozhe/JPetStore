package com.petstore.dao;

import com.petstore.entity.Orderitem;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/6.
 */
public class OrderItemDaoTest {

    @Test
    public void testSave() throws Exception {
        Orderitem orderitem = new Orderitem();
        orderitem.setProductId("jj256336");
        orderitem.setProductName("橘子");
        orderitem.setProductPrice(new BigDecimal("2"));
        orderitem.setAmount(100);
        orderitem.setOrderId(12345);
        orderitem.setCustomerId(123);
        boolean result = OrderItemDao.getInstance().save(orderitem);
        System.out.println(result);
//        DBConn.closeConn();
    }

    @Test
    public void testDeleteByCustomerId() throws Exception {
        boolean result = OrderItemDao.getInstance().deleteByCustomerId(123);
        System.out.println(result);
//        DBConn.closeConn();
    }

    @Test
    public void testFindByOrderId() throws Exception {
        List<Orderitem> orderitems = OrderItemDao.getInstance().findByOrderId(12345);
        for (Orderitem orderitem : orderitems
             ) {
            System.out.println(orderitem.toString());
        }
//        DBConn.closeConn();
    }

    @Test
    public void testFindByCustomerId() throws Exception {
        List<Orderitem> orderitems = OrderItemDao.getInstance().findByCustomerId(123);
        for (Orderitem orderitem : orderitems
                ) {
            System.out.println(orderitem.toString());
        }
//        DBConn.closeConn();
    }

    @Test
    public void testUpdate() throws Exception {
        boolean result = OrderItemDao.getInstance().update(20, 3);
        System.out.println(result);
//        DBConn.closeConn();
    }
}