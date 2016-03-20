package com.petstore.dao;

import com.petstore.db.JDBCUtil;
import com.petstore.entity.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/18.
 */
public class ItemDao {
    public static ItemDao instance = null;

    public static ItemDao getInstance() {
        if (instance == null) {
            instance = new ItemDao();
        }
        return instance;
    }

    /**
     * 获取账单的商品信息
     * @param billId
     * @return
     */
    public List<Item> getBillItemList(String billId) {
        List<Item> billList = new ArrayList<Item>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "SELECT item.productId, p.productName,p.price, item.amount,item.price FROM bill_product AS item,product AS p WHERE item.billId = ? AND item.productId = p.productId";
            statement = connection.prepareStatement(sql);
            statement.setString(1, billId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                item.setProductId(resultSet.getString(1));
                item.setProductName(resultSet.getString(2));
                item.setPrice(resultSet.getDouble(3));
                item.setAmount(resultSet.getInt(4));
                item.setTotalPrice(resultSet.getDouble(5));
                billList.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return billList;
    }

    /**
     * 获取用户购物车商品信息
     * @param username
     * @return
     */
    public List<Item> getCarItem(String username) {
        List<Item> billList = new ArrayList<Item>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "SELECT item.productId, p.productName,p.price, item.amount,item.price FROM shoppingcar AS item,product AS p WHERE item.username = ? AND item.productId = p.productId";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                item.setProductId(resultSet.getString(1));
                item.setProductName(resultSet.getString(2));
                item.setPrice(resultSet.getDouble(3));
                item.setAmount(resultSet.getInt(4));
                item.setTotalPrice(resultSet.getDouble(5));
                billList.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return billList;
    }

    /**
     * 更新购物车商品数量信息
     * @param item
     * @param username
     * @return
     */
    public boolean update(Item item, String username) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "UPDATE shoppingcar SET amount = ?, price = ? WHERE username = ? AND productId = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, item.getAmount());
            statement.setDouble(2, item.getTotalPrice());
            statement.setString(3, username);
            statement.setString(4, item.getProductId());
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
     * 删除购物车中某一项商品
     * @param username
     * @param productId
     * @return
     */
    public boolean delete(String username, String productId) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "DELETE FROM shoppingcar WHERE username = ? AND productId = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, productId);
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
     * 添加用户购物车商品信息
     * @param item
     * @param username
     * @return
     */
    public boolean addShoppingCar(Item item, String username) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "INSERT INTO shoppingcar VALUES (?,?,?,?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, item.getProductId());
            statement.setInt(3, item.getAmount());
            statement.setDouble(4, item.getTotalPrice());
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
     * 添加账单的商品信息
     * @param item
     * @param billId
     * @return
     */
    public boolean addBillAndProduct(Item item, String billId) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JDBCUtil.getConnection();
            String sql = "INSERT INTO bill_product VALUES (?,?,?,?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, billId);
            statement.setString(2, item.getProductId());
            statement.setInt(3, item.getAmount());
            statement.setDouble(4, item.getTotalPrice());
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
