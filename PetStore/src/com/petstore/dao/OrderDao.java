package com.petstore.dao;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class OrderDao {

    private static OrderDao instance = null;

    public static OrderDao getInstance() {
        if (instance == null) {
            instance = new OrderDao();
        }
        return instance;
    }
}
