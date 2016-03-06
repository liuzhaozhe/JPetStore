package com.petstore.dao;

import com.mysql.jdbc.PreparedStatement;
import com.petstore.db.DBConn;
import com.petstore.entity.Customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class CustomerDao {

    private static CustomerDao instance = null;

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
        try {
            connection = DBConn.getConn();
            String sql = "insert into customer(username, password, address, email, phone)values(?,?,?,?,?)";
            PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
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
        }
        return result;                                                      // 返回执行结果
    }

    public Customer findByName(String name) throws SQLException {
        Customer customer = null;
        Connection connection = null;
        try {
            connection = DBConn.getConn();
            String sql = "select * from customer where username = ?";
            PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet  resultSet = statement.executeQuery();
            while (resultSet.next()){
                customer = new Customer();
                customer.setId(resultSet.getInt("id"));
                customer.setUsername(resultSet.getString("username"));
                customer.setPassword(resultSet.getString("password"));
                customer.setAddress(resultSet.getString("address"));
                customer.setEmail(resultSet.getString("email"));
                customer.setPhone(resultSet.getString("phone"));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return customer;
    }

}
