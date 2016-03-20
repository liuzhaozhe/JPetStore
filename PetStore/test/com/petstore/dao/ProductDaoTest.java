package com.petstore.dao;

import com.petstore.entity.Product;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by hezhujun on 2016/3/19.
 */
public class ProductDaoTest {

    @Test
    public void testGetProduct() throws Exception {
        Object[] o = ProductDao.getInstance().getProduct("CA-MX-01");
        Product product = (Product) o[0];
        String category = (String) o[1];
        System.out.println(product.getProductName());
        System.out.println(category);
    }

    @Test
    public void testGetProdutInfo() throws Exception {
        List<String[]> productList = ProductDao.getInstance().getProdutInfo("DG-DM");
        for (String[] product : productList
             ) {
            for (String temp : product
                 ) {
                System.out.printf(temp + "  ");
            }
            System.out.println();
        }
    }

    @Test
    public void testUpdate() throws Exception {
        boolean result = ProductDao.getInstance().update("BD-FC-01", 10, 2);
        System.out.println(result);
    }
}