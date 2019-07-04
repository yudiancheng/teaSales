package com.yu.pojo;

public class ScanRecord {
    private int id;
    private int userid;
    private int productId;
    private Product product;

    public ScanRecord() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "ScanRecord{" +
                "id=" + id +
                ", userid=" + userid +
                ", productId=" + productId +
                ", product=" + product +
                '}';
    }
}
