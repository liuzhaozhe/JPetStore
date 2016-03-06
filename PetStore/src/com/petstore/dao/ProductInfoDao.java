package com.petstore.dao;

import com.mysql.jdbc.PreparedStatement;
import com.petstore.db.DBConn;
import com.petstore.entity.Productinfo;

import java.sql.Connection;
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
        try {
            Connection connection = DBConn.getConn();                           // 获取数据库连接
            String sql = "insert into productinfo(id, name, description, price, amount, sellCount," +
                    " uploadFile, category2, category)values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
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
        try {
            Connection connection = DBConn.getConn();                                   // 获取数据看连接
            String sql = "select * from productinfo where category2 = ?";
            PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, category2);
            ResultSet resultSet = statement.executeQuery();
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
        }
        return productinfos;
    }

    /**
     * 获取二级类别名称
     *
     * @param category
     * @return
     */
    public List<String> getCategory2ByCategory(String category) {
        List<String> category2s = new ArrayList<String>();
        try {
            Connection connection = DBConn.getConn();
            String sql = "select distinct category2 from productinfo where category = ?";
            PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, category);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String category2 = resultSet.getString("category2");
                category2s.add(category2);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category2s;
    }

    /**
     * 获取总类别
     *
     * @return
     */
    public List<String> getCategory() {
        List<String> categorys = new ArrayList<String>();
        try {
            Connection connection = DBConn.getConn();
            String sql = "select distinct category from productinfo";
            PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String category = resultSet.getString("category");
                categorys.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categorys;
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
        try {
            Connection connection = DBConn.getConn();
            String sql = "update productinfo set amount = ?, sellCount = ? where id = ?";
            PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setInt(1, amount);
            statement.setInt(2, sellCount);
            statement.setString(3, id);
            int i = statement.executeUpdate();
            if (i == 1) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
