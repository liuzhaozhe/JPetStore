package com.petstore.dao;

import com.petstore.db.DBConn;
import com.petstore.entity.Customer;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by hezhujun on 2016/3/3.
 */
public class CustomerDaoTest {

    @Test
    public void testGetInstance() throws Exception {

    }

    @Test
    public void testSave() throws Exception {
        Customer customer = new Customer();
        customer.setUsername("1111");
        customer.setPassword("123");
        customer.setAddress("1");
        customer.setEmail("1214444@qq.com");
        customer.setPhone("12345678911");
        boolean result = CustomerDao.getInstance().save(customer);
        System.out.println(result);
        DBConn.closeConn();
    }

    @Test
    public void testFindByName() throws Exception {
        Customer customer = CustomerDao.getInstance().findByName("俞志云");
        if(customer != null) {
            System.out.println(customer.toString());
        } else {
            System.out.println("Cannot find");
        }
//        DBConn.closeConn();
    }

    @Test
    public void testUpdate() throws Exception {
        Customer customer = CustomerDao.getInstance().findByName("1111");
        customer.setAddress("铁道1舍522");
        customer.setEmail("2723364262@qq.com");
        boolean result = CustomerDao.getInstance().update(customer);
        System.out.println("result:" + result);
        DBConn.closeConn();
    }

}