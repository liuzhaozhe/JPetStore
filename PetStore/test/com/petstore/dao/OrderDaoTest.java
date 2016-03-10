package com.petstore.dao;

import com.petstore.entity.Order;
import org.junit.Test;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/6.
 */
public class OrderDaoTest {

    @Test
    public void testSave() throws Exception {
        OrderDao orderDao = OrderDao.getInstance();

        Order order = new Order();
        order.setName("fe125364");
        order.setConsignee("225");
        order.setAddress("铁道522");
        order.setPhone("12345678911");
        order.setTotalPrice(new BigDecimal("10.3"));
        order.setCreateTime(new Timestamp(System.currentTimeMillis()));
        order.setPaymentWay("支付宝");
        order.setCustomerId(123);

        System.out.println(orderDao.save(order));

        order.setConsignee("何柱君");
        System.out.println(orderDao.save(order));
//        DBConn.closeConn();
    }

    @Test
    public void testFindByCustomerId() throws Exception {
        OrderDao orderDao = OrderDao.getInstance();
        List<Order> orders = orderDao.findByCustomerId(123);
        for (Order order : orders
                ) {
            System.out.println(order.toString());
        }
//        DBConn.closeConn();
    }
}