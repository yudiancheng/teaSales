package com.yu.pojo;

import java.util.List;

public class User {
    private int id;
    private String headImg;
    private String username;
    private String realName;
    private String sex;
    private String phone;
    private String email;
    private String password;
    private String lastVisit;
    private int balance;
    private String userLevel;
    private List<BuyRecord> buyRecords;
    private List<Order> orders;
    private List<ScanRecord> scanRecords;
    private List<UserCollect> userCollects;
    private int successOrder;
    private int unfinishedOrder;
    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastVisit() {
        return lastVisit;
    }

    public void setLastVisit(String lastVisit) {
        this.lastVisit = lastVisit;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public String getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(String userLevel) {
        this.userLevel = userLevel;
    }


    public List<BuyRecord> getBuyRecords() {
        return buyRecords;
    }

    public void setBuyRecords(List<BuyRecord> buyRecords) {
        this.buyRecords = buyRecords;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public int getSuccessOrder() {
        return successOrder;
    }

    public void setSuccessOrder(int successOrder) {
        this.successOrder = successOrder;
    }

    public int getUnfinishedOrder() {
        return unfinishedOrder;
    }

    public void setUnfinishedOrder(int unfinishedOrder) {
        this.unfinishedOrder = unfinishedOrder;
    }

    public List<ScanRecord> getScanRecords() {
        return scanRecords;
    }

    public void setScanRecords(List<ScanRecord> scanRecords) {
        this.scanRecords = scanRecords;
    }

    public List<UserCollect> getUserCollects() {
        return userCollects;
    }

    public void setUserCollects(List<UserCollect> userCollects) {
        this.userCollects = userCollects;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", headImg='" + headImg + '\'' +
                ", username='" + username + '\'' +
                ", realName='" + realName + '\'' +
                ", sex='" + sex + '\'' +
                ", phone=" + phone +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", lastVisit='" + lastVisit + '\'' +
                ", balance=" + balance +
                ", userLevel='" + userLevel + '\'' +
                ", buyRecords=" + buyRecords +
                ", orders=" + orders +
                ", successOrder=" + successOrder +
                ", unfinishedOrder=" + unfinishedOrder +
                '}';
    }
}
