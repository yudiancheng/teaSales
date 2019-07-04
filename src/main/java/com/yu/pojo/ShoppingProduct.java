package com.yu.pojo;

public class ShoppingProduct {
    private int id;
    private int productId;
    private Product product;
    private int productTotal;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getProductTotal() {
        return productTotal;
    }

    public void setProductTotal(int productTotal) {
        this.productTotal = productTotal;
    }

    @Override
    public String toString() {
        return "ShoppingProduct{" +
                "id=" + id +
                ", productId=" + productId +
                ", product=" + product +
                ", productTotal=" + productTotal +
                '}';
    }
}
