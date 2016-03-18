package com.petstore.dao;

import com.petstore.db.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hezhujun on 2016/3/12.
 */
public class CategoryDao {

    public static CategoryDao instance = null;

    public static CategoryDao getInstance() {
        if(instance == null) {
            instance = new CategoryDao();
        }
        return instance;
    }

    private Map<String, String> category = null;
    private Map<String, String> category2 = null;

    CategoryDao(){
        category = getCategory();
        category2 = getCategory2();
    }

    /**
     * 获取二级类别名称
     *
     * @return
     */
    public Map<String, String> getCategory2() {
        Map<String, String> category2s = new HashMap<String, String>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
//            Connection connection = DBConn.getConn();
            connection = JDBCUtil.getConnection();
            String sql = "select distinct from category2";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                category2s.put(resultSet.getString(1), resultSet.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return category2s;
    }

    /**
     * 获取总类别
     *
     * @return
     */
    public Map<String, String> getCategory() {
        Map<String, String> categorys = new HashMap<String, String>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
//            Connection connection = DBConn.getConn();
            connection = JDBCUtil.getConnection();
            String sql = "select distinct from category1";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                categorys.put(resultSet.getString(1), resultSet.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return categorys;
    }

    /**
     * 获取指定id的类别名字
     * @param id
     * @return
     */
    public String getCategoryNameByID(String id) {
        return category.get(id);
    }

    /**
     * 获取指定id的二级类别名字
     * @param id
     * @return
     */
    public String getCategory2ByID(String id) {
        return category2.get(id);
    }

}
