package com.petstore.dao;

import com.petstore.db.JDBCUtil;
import com.petstore.entity.Orderitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class OrderItemDao {

    private static OrderItemDao instance = null;

    // 生成Dao，确保只有一个Dao对象生成
    public static OrderItemDao getInstance() {
        if (instance == null) {
            instance = new OrderItemDao();
        }
        return instance;
    }

    /**
     * 保存数据
     *
     * @param orderitem
     * @return
     */
    public boolean save(Orderitem orderitem) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            connection = DBConn.getConn();                                   // 获取数据库连接
            connection = JDBCUtil.getConnection();
            // 保存商品清单的sql语句
            String sql = "insert into orderitem(productId, productName, productPrice, amount, orderId," +
                    " customerId)values(?,?,?,?,?,?)";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, orderitem.getProductId());                           // sql语句加入值
            statement.setString(2, orderitem.getProductName());
            statement.setBigDecimal(3, orderitem.getProductPrice());
            statement.setInt(4, orderitem.getAmount());
            statement.setInt(5, orderitem.getOrderId());
            statement.setInt(6, orderitem.getCustomerId());
            int i = statement.executeUpdate();                                          // 执行sql语句
            if (i == 1) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return result;
    }

    /**
     * 删除数据
     * 只有购物车的清单会删除
     * 所有只需要用户的ID
     *
     * @param customerId
     * @return
     */
    public boolean deleteByCustomerId(int customerId) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            connection = DBConn.getConn();                                   // 获取数据库连接
            connection = JDBCUtil.getConnection();
            String sql = "delete from orderitem where customerId = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setInt(1, customerId);                                            // 设置用户ID
            int i = statement.executeUpdate();                                          // 执行删除语句
            if (i == 1) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return result;
    }

    /**
     * 查找账单的商品清单
     *
     * @param orderId
     * @return
     */
    public List<Orderitem> findByOrderId(int orderId) {
        List<Orderitem> orderitems = new ArrayList<Orderitem>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
//            connection = DBConn.getConn();                                       // 获取数据库连接
            connection = JDBCUtil.getConnection();
            String sql = "select * from orderitem where OrderId = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {                                                      // 通过记录生成商品清单对象
                Orderitem orderitem = new Orderitem();
                orderitem.setId(resultSet.getInt("id"));
                orderitem.setProductId(resultSet.getString("productId"));
                orderitem.setProductName(resultSet.getString("productName"));
                orderitem.setProductPrice(resultSet.getBigDecimal("productPrice"));
                orderitem.setAmount(resultSet.getInt("amount"));
                orderitem.setOrderId(resultSet.getInt("orderId"));
                orderitem.setCustomerId(resultSet.getInt("customerId"));
                orderitems.add(orderitem);                                                      // 加入到队列中
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return orderitems;
    }

    /**
     * 查找购物车中的商品清单
     *
     * @param customerId
     * @return
     */
    public List<Orderitem> findByCustomerId(int customerId) {
        List<Orderitem> orderitems = new ArrayList<Orderitem>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
//            Connection connection = DBConn.getConn();                                           // 获得数据库的连接
            connection = JDBCUtil.getConnection();
            String sql = "select * from orderitem where customerId = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {                                                      // 通过记录生成商品清单对象
                Orderitem orderitem = new Orderitem();
                orderitem.setId(resultSet.getInt("id"));
                orderitem.setProductId(resultSet.getString("productId"));
                orderitem.setProductName(resultSet.getString("productName"));
                orderitem.setProductPrice(resultSet.getBigDecimal("productPrice"));
                orderitem.setAmount(resultSet.getInt("amount"));
                orderitem.setOrderId(resultSet.getInt("orderId"));
                orderitem.setCustomerId(resultSet.getInt("customerId"));
                orderitems.add(orderitem);                                                      // 把商品清单添加到队列中
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return orderitems;
    }

    /**
     * 更新数据
     * 只有购物车的清单会更改商品数量
     * 其他记录不会更改
     * 账单的商品清单不会改变
     *
     * @param amount
     * @param id
     * @return
     */
    public boolean update(int amount, int id) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            connection = DBConn.getConn();                                       // 获取数据库连接
            connection = JDBCUtil.getConnection();
            String sql = "update orderitem set amount = ? where id = ?";                // sql语句
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setInt(1, amount);                                                    // 加入参数
            statement.setInt(2, id);
            int i = statement.executeUpdate();                                              // 执行语句
            if (i == 1) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return result;
    }
}
