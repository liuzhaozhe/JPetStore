package com.petstore.dao;

import com.petstore.entity.Category;
import org.junit.Test;

import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by hezhujun on 2016/3/19.
 */
public class CategoryDaoTest {

    @Test
    public void testGetCategory2() throws Exception {
        Map<String,String> category2 = CategoryDao.getInstance().getCategory2("DG");
        for (String temp : category2.keySet()
             ) {
            System.out.println(temp + "  " + category2.get(temp));
        }
    }

    @Test
    public void testGetCategory() throws Exception {
        Category category = CategoryDao.getInstance().getCategory("DG-DM");
        System.out.println(category.getCategoryName());
    }
}