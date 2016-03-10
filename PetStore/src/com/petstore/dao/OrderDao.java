package com.petstore.dao;

import com.mysql.jdbc.PreparedStatement;
import com.petstore.db.DBConn;
import com.petstore.db.JDBCUtil;
import com.petstore.entity.Order;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class OrderDao {

    private static OrderDao instance = null;

    // 生成Dao，确保只有一个Dao对象生成
    public static OrderDao getInstance() {
        if (instance == null) {
            instance = new OrderDao();
        }
        return instance;
    }

    /**
     * 增
     *
     * @param order
     * @return
     */
    public boolean save(Order order) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            Connection connection = DBConn.getConn();                               // 获取数据库连接
            connection = JDBCUtil.getConnection();
            // 插入数据sql语句
            String sql = "insert into `order`(`name`, consignee, address, phone, totalPrice," +
                    " createTime, paymentWay, customerId)values(?,?,?,?,?,?,?,?)";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, order.getName());                                // 设置参数
            statement.setString(2, order.getConsignee());
            statement.setString(3, order.getAddress());
            statement.setString(4, order.getPhone());
            statement.setBigDecimal(5, order.getTotalPrice());
            statement.setTimestamp(6, order.getCreateTime());
            statement.setString(7, order.getPaymentWay());
            statement.setInt(8, order.getCustomerId());
            int i = statement.executeUpdate();                                      // 执行语句
            if (i == 1) {                                                           // 判断是否保存数据成功
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(statement);                                                  // 释放资源
            JDBCUtil.close(connection);
        }
        return result;
    }

    /**
     * 获取用户的所有账单
     *
     * @param customerId
     * @return
     */
    public List<Order> findByCustomerId(int customerId) {
        List<Order> orders = new ArrayList<Order>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBConn.getConn();
            String sql = "select * from `order` where customerId = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.setId(resultSet.getInt("id"));
                order.setName(resultSet.getString("name"));
                order.setConsignee(resultSet.getString("consignee"));
                order.setAddress(resultSet.getString("address"));
                order.setPhone(resultSet.getString("phone"));
                order.setTotalPrice(resultSet.getBigDecimal("totalPrice"));
                order.setCreateTime(resultSet.getTimestamp("createTime"));
                order.setPaymentWay(resultSet.getString("paymentWay"));
                order.setCustomerId(resultSet.getInt("customerId"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);                                  // 释放资源
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return orders;
    }
}
