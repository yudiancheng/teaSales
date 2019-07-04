package com.yu.pojo;

public class UserComment {
    private int id;
    private int userId;
    private int productId;
    private String content;
    private int support;
    private int level;
    private Product product;
    private User user;

    public UserComment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getSupport() {
        return support;
    }

    public void setSupport(int support) {
        this.support = support;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "UserComment{" +
                "id=" + id +
                ", userId=" + userId +
                ", productId=" + productId +
                ", content='" + content + '\'' +
                ", support=" + support +
                ", level=" + level +
                ", product=" + product +
                ", user=" + user +
                '}';
    }
}
