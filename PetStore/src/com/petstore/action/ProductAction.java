package com.petstore.action;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.petstore.dao.CategoryDao;
import com.petstore.dao.ProductDao;
import com.petstore.entity.Category;
import com.petstore.entity.Product;

import java.util.List;
import java.util.Map;

/**
 * Created by hezhujun on 2016/4/4.
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product> {
    private Product product = new Product();
    private String category = null;
    private String category2 = null;
    private String search = null;
    private String msg = null;

    public void setProduct(Product product) {
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }

    public String getCategory2() {
        return category2;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getSearch() {
        return search;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    /**
     * 获取类别列表
     *
     * @return
     */
    public String getCategoryList() {
        Map<String, String> category2 = CategoryDao.getInstance().getCategory2(category);
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.put("category2", category2);
        session.put("categoryName", category);
        return SUCCESS;
    }

    /**
     * 获取商品列表
     *
     * @return
     */
    public String getProductList() {
        List<String[]> productList = ProductDao.getInstance().getProdutInfo(category2);
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.put("productList", productList);
        return SUCCESS;
    }

    /**
     * 获取商品详细信息
     *
     * @return
     */
    public String getProductDetail() {
        Object[] o = ProductDao.getInstance().getProduct(product.getProductId());
        product = (Product) o[0];
        Category category = CategoryDao.getInstance().getCategory((String) o[1]);
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.put("product", product);
        session.put("category", category);
        return SUCCESS;
    }

    /**
     * 搜索的自动补全
     *
     * @return
     */
    public String matchName() {
        List<String> productInfo = ProductDao.getInstance().getProductNameList(search);
        JsonArray array = new JsonArray();
        for (String name : productInfo
                ) {
            JsonObject temp = new JsonObject();
            temp.addProperty("value", name);
            array.add(temp);
        }
        msg = array.toString();
        return SUCCESS;
    }

    /**
     * 搜索商品
     * @return
     */
    public String search() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        List<String[]> productList = ProductDao.getInstance().getProdutInfoByName(search);
        if (productList == null || productList.size() != 1) {
            session.put("productList", productList);
            return "many";
        } else {
            // 只有一个时直接到商品详细页
            Object[] o = ProductDao.getInstance().getProduct(productList.get(0)[0]);
            Product product = (Product) o[0];
            Category category = CategoryDao.getInstance().getCategory((String) o[1]);
            session.put("product", product);
            session.put("category", category);
            return "one";
        }
    }

    @Override
    public Product getModel() {
        return product;
    }
}
