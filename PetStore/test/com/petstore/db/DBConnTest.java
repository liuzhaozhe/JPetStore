package com.petstore.db;

import org.junit.Test;

import java.sql.Connection;

import static org.junit.Assert.*;

/**
 * Created by 12145 on 2016/3/2.
 */
public class DBConnTest {

    @Test
    public void testGetConn() throws Exception {
        Connection conn = DBConn.getConn();
        if(conn == null){
            System.out.println("数据库连接失败");
        } else {
            System.out.println("数据库连接成功");
        }
        DBConn.closeConn();
    }
}