package com.yu.pojo;

public class BuyRecord {
    private int id;
    private int userid;
    private int productId;
    private int nums;
    private int status;
    private String time;
    private Product product;

    public BuyRecord() {
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

    public int getNums() {
        return nums;
    }

    public void setNums(int nums) {
        this.nums = nums;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "BuyRecord{" +
                "id=" + id +
                ", userid=" + userid +
                ", productId=" + productId +
                ", nums=" + nums +
                ", status=" + status +
                ", time='" + time + '\'' +
                ", product=" + product +
                '}';
    }
}
