package com.petstore.entity;

import java.math.BigDecimal;

/**
 * Created by zhujun on 2016/3/6.
 * 商品信息
 */
public class Productinfo {
    private String id;                      //商品编号，如：ss-ss-0001
    private String name;                    // 商品名称
    private String description;             // 商品描述
    private BigDecimal price;               // 商品价格
    private int amount;                     // 商品库存
    private int sellCount;                  // 商品销售量
    private String uploadFile;               // 商品的图片地址
    private String category2;               // 商品的类别名称
    private String category;                // 商品的总类别名称

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSellCount() {
        return sellCount;
    }

    public void setSellCount(int sellCount) {
        this.sellCount = sellCount;
    }

    public String getUploadFile() {
        return uploadFile;
    }

    public void setUploadFileId(String uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * 比较对象
     *
     * @param o
     * @return
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Productinfo that = (Productinfo) o;

        if (amount != that.amount) return false;
        if (sellCount != that.sellCount) return false;
        if (uploadFile != null ? !uploadFile.equals(that.uploadFile) : that.uploadFile != null) return false;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (category2 != null ? !category2.equals(that.category2) : that.category2 != null) return false;
        if (category != null ? !category.equals(that.category) : that.category != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + amount;
        result = 31 * result + sellCount;
        result = 31 * result + (uploadFile != null ? uploadFile.hashCode() : 0);;
        result = 31 * result + (category2 != null ? category2.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        String str = "";
        str += "商品编号：\t" + id + "\n";
        str += "商品名称：\t" + name + "\n";
        str += "商品描述：\t" + description + "\n";
        str += "商品单价：\t" + price + "\n";
        str += "总库存：\t" + amount + "\n";
        str += "销售量：\t" + sellCount + "\n";
        str += "图片地址：\t" + uploadFile + "\n";
        str += "父类别：\t" + category2 + "\n";
        str += "总类别：\t" + category;
        return str;
    }
}
