package com.petstore.dao;

import com.petstore.entity.User;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by hezhujun on 2016/3/19.
 */
public class UserDaoTest {

    @Test
    public void testAdd() throws Exception {
        User user = new User();
        user.setUsername("123");
        user.setPassword("123");
        user.setAddress("铁道");
        user.setEmail("123456@qq.com");
        user.setPhone("12345678911");
        boolean result = UserDao.getInstance().add(user);
        System.out.println(result);
    }

    @Test
    public void testGetUser() throws Exception {
        User user = UserDao.getInstance().getUser("123", "123");
        System.out.println(user.getEmail());
    }

    @Test
    public void testCheckUsername() throws Exception {
        boolean result = UserDao.getInstance().checkUsername("123");
        System.out.println(result);
        result = UserDao.getInstance().checkUsername("456");
        System.out.println(result);
    }

    @Test
    public void testUpdate() throws Exception {
        User user = UserDao.getInstance().getUser("123", "123");
        user.setAddress("123456789");
        boolean result = UserDao.getInstance().update(user);
        System.out.println(result);
    }
}