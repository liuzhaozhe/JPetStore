package com.petstore.dao;

import com.petstore.db.JDBCUtil;
import com.petstore.entity.Productinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hezhujun on 2016/3/2.
 */
public class ProductInfoDao {

    private static ProductInfoDao instance = null;

    // 生成Dao，确保只有一个Dao对象生成
    public static ProductInfoDao getInstance() {
        if (instance == null) {
            instance = new ProductInfoDao();
        }
        return instance;
    }

    /**
     * 添加商品信息
     *
     * @param productinfo
     * @return
     */
    public boolean save(Productinfo productinfo) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            connection = DBConn.getConn();                           // 获取数据库连接
            connection = JDBCUtil.getConnection();
            String sql = "insert into productinfo(id, name, description, price, amount, sellCount," +
                    " uploadFile, category2, category)values(?,?,?,?,?,?,?,?,?)";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, productinfo.getId());                            // 加入参数
            statement.setString(2, productinfo.getName());
            statement.setString(3, productinfo.getDescription());
            statement.setBigDecimal(4, productinfo.getPrice());
            statement.setInt(5, productinfo.getAmount());
            statement.setInt(6, productinfo.getSellCount());
            statement.setString(7, productinfo.getUploadFile());
            statement.setString(8, productinfo.getCategory2());
            statement.setString(9, productinfo.getCategory());
            int i = statement.executeUpdate();                                      // 执行sql语句
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
     * 获取商品信息
     *
     * @param category2
     * @return
     */
    public List<Productinfo> findByCategory2(String category2) {
        List<Productinfo> productinfos = new ArrayList<Productinfo>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
//            Connection connection = DBConn.getConn();                                   // 获取数据看连接
            connection = JDBCUtil.getConnection();
            String sql = "select * from productinfo where category2 = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, category2);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Productinfo productinfo = new Productinfo();
                productinfo.setId(resultSet.getString("id"));
                productinfo.setName(resultSet.getString("name"));
                productinfo.setDescription(resultSet.getString("description"));
                productinfo.setPrice(resultSet.getBigDecimal("price"));
                productinfo.setAmount(resultSet.getInt("amount"));
                productinfo.setSellCount(resultSet.getInt("sellCount"));
                productinfo.setUploadFileId(resultSet.getString("uploadFile"));
                productinfo.setCategory2(resultSet.getString("category2"));
                productinfo.setCategory(resultSet.getString("category"));
                productinfos.add(productinfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(resultSet);
            JDBCUtil.close(statement);
            JDBCUtil.close(connection);
        }
        return productinfos;
    }

    /**
     * 更新商品的库存
     *
     * @param amount
     * @param sellCount
     * @param id
     * @return
     */
    public boolean update(int amount, int sellCount, String id) {
        boolean result = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
//            Connection connection = DBConn.getConn();
            connection = JDBCUtil.getConnection();
            String sql = "update productinfo set amount = ?, sellCount = ? where id = ?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setInt(1, amount);
            statement.setInt(2, sellCount);
            statement.setString(3, id);
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
