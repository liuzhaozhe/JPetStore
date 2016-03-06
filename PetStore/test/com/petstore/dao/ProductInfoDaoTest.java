package com.petstore.dao;

import com.petstore.entity.Productinfo;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by hezhujun on 2016/3/6.
 */
public class ProductInfoDaoTest {

    @Test
    public void testSave() throws Exception {
        Productinfo productinfo = new Productinfo();
        productinfo.setId("jjk123456");
        productinfo.setName("小猫");
        productinfo.setDescription("童叟无欺");
        productinfo.setPrice(new BigDecimal("10.6"));
        productinfo.setAmount(100);
        productinfo.setSellCount(0);
        productinfo.setUploadFileId("");
        productinfo.setCategory2("花猫");
        productinfo.setCategory("猫");

        System.out.println(ProductInfoDao.getInstance().save(productinfo));
        productinfo.setId("jk12345");
        productinfo.setCategory2("白猫");
        System.out.println(ProductInfoDao.getInstance().save(productinfo));
        productinfo.setId("kd12345");
        productinfo.setCategory("狗");
        System.out.println(ProductInfoDao.getInstance().save(productinfo));

    }

    @Test
    public void testFindByCategory2() throws Exception {
        List<Productinfo> productinfos = ProductInfoDao.getInstance().findByCategory2("白猫");
        for (Productinfo productinfo : productinfos
             ) {
            System.out.println(productinfo);
        }
    }

    @Test
    public void testGetCategory2ByCategory() throws Exception {
        List<String> category2s = ProductInfoDao.getInstance().getCategory2ByCategory("猫");
        for (String category2 : category2s
             ) {
            System.out.println(category2);
        }
    }

    @Test
    public void testGetCategory() throws Exception {
        List<String> categorys = ProductInfoDao.getInstance().getCategory();
        for (String category : categorys
             ) {
            System.out.println(category);
        }
    }

    @Test
    public void testUpdate() throws Exception {
        boolean result = ProductInfoDao.getInstance().update(99, 1, "jk12345");
        System.out.println(result);
    }
}