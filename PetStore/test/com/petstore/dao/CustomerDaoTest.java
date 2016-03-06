package com.petstore.dao;

import com.petstore.db.DBConn;
import com.petstore.entity.Customer;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by 12145 on 2016/3/3.
 */
public class CustomerDaoTest {

    @Test
    public void testGetInstance() throws Exception {

    }

    @Test
    public void testSave() throws Exception {
        Customer customer = new Customer();
        customer.setUsername("俞志云");
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
            System.out.println(customer.getId());
            System.out.println(customer.getUsername());
            System.out.println(customer.getPassword());
            System.out.println(customer.getAddress());
            System.out.println(customer.getEmail());
            System.out.println(customer.getPhone());
        } else {
            System.out.println("Cannot find");
        }
        DBConn.closeConn();
    }
}