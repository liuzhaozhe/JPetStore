package com.petstore.dao;

import com.petstore.entity.Bill;
import org.junit.Test;

import java.sql.Timestamp;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by hezhujun on 2016/3/19.
 */
public class BillDaoTest {

    @Test
    public void testAdd() throws Exception {
        Bill bill = new Bill();
        bill.setBillId("1234567891234567");
        bill.setConsignee("son");
        bill.setConsigneeAddress("china");
        bill.setConsigneePhone("123456789");
        bill.setCreateTime(new Timestamp(System.currentTimeMillis()));
        bill.setMoney(50);
        boolean result = BillDao.getInstance().add(bill, "123");
        System.out.println(result);
    }

    @Test
    public void testGetBillList() throws Exception {
        List<Bill> billList = BillDao.getInstance().getBillList("123");
        for (Bill bill : billList
             ) {
            System.out.println(bill.getBillId());
        }
    }

    @Test
    public void testGetBill() throws Exception {
        Bill bill = BillDao.getInstance().getBill("1234567891234567");
        System.out.println(bill.getCreateTime());
    }
}