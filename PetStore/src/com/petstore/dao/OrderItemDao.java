package com.petstore.dao;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class OrderItemDao {

    private static OrderItemDao instance = null;

    public static OrderItemDao getInstance() {
        if(instance == null){
            instance = new OrderItemDao();
        }
        return instance;
    }
}
