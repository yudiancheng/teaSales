package com.yu.pojo;

import java.util.List;

public class ProductDetailed {
    private int id;
    private int productId;
    private String bigImg;
    private String smallImg;
    private String detailedImg;
    private String keyword;
    private Product product;
    private int remain;
    List<String> bigList;
    List<String> smallList;

    public ProductDetailed() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getBigImg() {
        return bigImg;
    }

    public void setBigImg(String bigImg) {
        this.bigImg = bigImg;
    }

    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }

    public String getDetailedImg() {
        return detailedImg;
    }

    public void setDetailedImg(String detailedImg) {
        this.detailedImg = detailedImg;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<String> getBigList() {
        return bigList;
    }

    public void setBigList(List<String> bigList) {
        this.bigList = bigList;
    }

    public List<String> getSmallList() {
        return smallList;
    }

    public void setSmallList(List<String> smallList) {
        this.smallList = smallList;
    }


    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    @Override
    public String toString() {
        return "ProductDetailed{" +
                "id=" + id +
                ", productId=" + productId +
                ", bigImg='" + bigImg + '\'' +
                ", smallImg='" + smallImg + '\'' +
                ", detailedImg='" + detailedImg + '\'' +
                ", keyword='" + keyword + '\'' +
                ", product=" + product +
                ", remain=" + remain +
                ", bigList=" + bigList +
                ", smallList=" + smallList +
                '}';
    }
}
