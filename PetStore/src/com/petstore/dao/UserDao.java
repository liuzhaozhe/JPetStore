package com.petstore.dao;

import com.petstore.db.JDBCUtil;
import com.petstore.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by hezhujun on 2016/3/18.
 */
public class UserDao {
    public static UserDao instance = null;

    public static UserDao getInstance() {
        if(instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    public boolean add(User user) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "INSERT INTO user(username,password,address,email,phone) VALUES (?,?,?,?,?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getAddress());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPhone());
            int i = statement.executeUpdate();
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
     * 获取用户
     * @param username
     * @return
     */
    public User getUser(String username, String password) {
        User user = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            if (resultSet.next()){
                user = new User();
                user.setUsername(resultSet.getString(1));
                user.setPassword(resultSet.getString(2));
                user.setAddress(resultSet.getString(3));
                user.setEmail(resultSet.getString(4));
                user.setPhone(resultSet.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return user;
    }

    /**
     * 判断用户是否存在
     * @param username
     * @return false:exist true:not exist
     */
    public boolean checkUsername(String username) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "SELECT username FROM user WHERE username = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            if (resultSet.next()){
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return result;
    }

    /**
     * 更新信息
     * @param user
     * @return
     */
    public boolean update(User user) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "UPDATE user SET password = ?, address = ?, email = ?, phone = ? WHERE username = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getPassword());
            statement.setString(2, user.getAddress());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getUsername());
            int i = statement.executeUpdate();
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
