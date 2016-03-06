package com.petstore.dao;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class ProductInfoDao {

    private static ProductInfoDao instance = null;

    public static ProductInfoDao getInstance() {
        if(instance == null){
            instance = new ProductInfoDao();
        }
        return instance;
    }
}
