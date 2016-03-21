package com.petstore.dao;

import com.petstore.entity.Item;
import org.junit.Test;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import static org.junit.Assert.*;

/**
 * Created by hezhujun on 2016/3/19.
 */
public class ItemDaoTest {

    @Test
    public void testGetBillItemList() throws Exception {
        List<Item> item = ItemDao.getInstance().getBillItemList("1234567891234567");
        Item ite = item.get(0);
        System.out.print(ite.getProductName());
    }

    @Test
    public void testGetCarItem() throws Exception {
        List<Item> item = ItemDao.getInstance().getCarItemList("123");
        Item ite = item.get(0);
        System.out.print(ite.getProductName());
    }

    @Test
    public void testUpdate() throws Exception {
        List<Item> item = ItemDao.getInstance().getCarItemList("123");
        Item ite = item.get(0);
        ite.setAmount(3);
        ite.setTotalPrice(150);
        boolean result = ItemDao.getInstance().update(ite, "123");
        System.out.print(ite.getAmount());
        System.out.print(ite.getTotalPrice());
    }

    @Test
    public void testDelete() throws Exception {
        boolean b = ItemDao.getInstance().delete("123","BD-PO-01");
        System.out.print(b);
    }

    @Test
    public void testAddShoppingCar() throws Exception {
        Item item = new Item();
        item.setPrice(60);
        item.setTotalPrice(120);
        item.setAmount(2);
        item.setProductName("鹦鹉-01");
        item.setProductId("BD-PO-01");
        boolean b = ItemDao.getInstance().addShoppingCar(item,"123");
        System.out.print(b);
    }

    @Test
    public void testAddBillAndProduct() throws Exception {
        Item item = new Item();
        item.setPrice(60);
        item.setTotalPrice(120);
        item.setAmount(2);
        item.setProductName("鹦鹉-01");
        item.setProductId("BD-PO-01");
        boolean b = ItemDao.getInstance().addBillAndProduct(item,"1234567891234567");
        System.out.print(b);
    }
}