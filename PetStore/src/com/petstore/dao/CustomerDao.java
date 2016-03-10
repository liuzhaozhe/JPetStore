package com.petstore.dao;

import com.petstore.db.JDBCUtil;
import com.petstore.entity.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class CustomerDao {

    private static CustomerDao instance = null;

    // 生成Dao，确保只有一个Dao对象生成
    public static CustomerDao getInstance() {
        if (instance == null) {
            instance = new CustomerDao();
        }
        return instance;
    }

    /**
     * 增
     *
     * @param customer
     * @return 执行结果
     */
    public boolean save(Customer customer) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            connection = DBConn.getConn();                  // 获取数据库连接
            connection = JDBCUtil.getConnection();
            // 添加用户语句
            String sql = "insert into customer(username, password, address, email, phone)values(?,?,?,?,?)";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, customer.getUsername());                     // 插入参数
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getAddress());
            statement.setString(4, customer.getEmail());
            statement.setString(5, customer.getPhone());
            int i = statement.executeUpdate();                              // 执行sql语句
            if (i == 1) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(statement);                                          // 关闭连接，释放资源
            JDBCUtil.close(connection);
        }
        return result;                                                      // 返回执行结果
    }

    /**
     * 通过用户名查找用户
     * 查找不到则返回null
     *
     * @param name 用户名
     * @return 用户对象
     * @throws SQLException
     */
    public Customer findByName(String name) throws SQLException {
        Customer customer = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
//            connection = DBConn.getConn();                  // 获取连接
            connection = JDBCUtil.getConnection();
            String sql = "select * from customer where username = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, name);
            resultSet = statement.executeQuery();
            // 通过数据生成用户对象
            while (resultSet.next()) {
                customer = new Customer();
                customer.setId(resultSet.getInt("id"));
                customer.setUsername(resultSet.getString("username"));
                customer.setPassword(resultSet.getString("password"));
                customer.setAddress(resultSet.getString("address"));
                customer.setEmail(resultSet.getString("email"));
                customer.setPhone(resultSet.getString("phone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);                                                  // 关闭资源
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return customer;    // 返回用户对象
    }

    /**
     * 更改用户信息
     *
     * @param customer
     * @return
     */
    public boolean update(Customer customer) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            connection = DBConn.getConn();                           // 获取数据库连接
            connection = JDBCUtil.getConnection();
            // 更新数据的sql语句
            String sql = "update customer set password = ?," +
                    "address = ?, email = ?, phone = ? where username = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, customer.getPassword());                     // 插入参数
            statement.setString(2, customer.getAddress());
            statement.setString(3, customer.getEmail());
            statement.setString(4, customer.getPhone());
            statement.setString(5, customer.getUsername());
            int i = statement.executeUpdate();                                  // 执行语句
            if (i == 1) {                                                        // 判断是否更新成功
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(statement);                                             // 释放资源
            JDBCUtil.close(connection);
        }
        return result;
    }

}
