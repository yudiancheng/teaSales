package com.yu.pojo;

public class ProductPromotion {
    private int id;
    private int productId;
    private Product product;

    public ProductPromotion() {
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "ProductPromotion{" +
                "id=" + id +
                ", productId=" + productId +
                ", product=" + product +
                '}';
    }
}
