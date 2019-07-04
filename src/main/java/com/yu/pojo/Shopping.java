package com.yu.pojo;

import java.util.List;

public class Shopping {
    private int id;
    private int userid;
    private int totalValue;
    private List<ShoppingProduct> shoppingProducts;

    public Shopping() {
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

    public int getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(int totalValue) {
        this.totalValue = totalValue;
    }

    public List<ShoppingProduct> getShoppingProducts() {
        return shoppingProducts;
    }

    public void setShoppingProducts(List<ShoppingProduct> shoppingProducts) {
        this.shoppingProducts = shoppingProducts;
    }

    @Override
    public String toString() {
        return "Shopping{" +
                "id=" + id +
                ", userid=" + userid +
                ", totalValue=" + totalValue +
                ", shoppingProducts=" + shoppingProducts +
                '}';
    }
}
