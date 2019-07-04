package com.yu.pojo;

public class Order {
    private int id;
    private int userid;
    private int addressId;
    private int invoiceId;
    private String voucherId;
    private String express;
    private String payment;
    private int isInvoice;
    private String message;
    private int total;
    private int discount;
    private int delivery;
    private int actualPay;
    private String createTime;
    private int status;

    public Order() {
    }

    public Order(int userid, int addressId, int invoiceId, String voucherId, String express, String payment, int isInvoice, String message, int total, int discount, int delivery, int actualPay, String createTime, int status) {
        this.userid = userid;
        this.addressId = addressId;
        this.invoiceId = invoiceId;
        this.voucherId = voucherId;
        this.express = express;
        this.payment = payment;
        this.isInvoice = isInvoice;
        this.message = message;
        this.total = total;
        this.discount = discount;
        this.delivery = delivery;
        this.actualPay = actualPay;
        this.createTime = createTime;
        this.status = status;
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

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(String voucherId) {
        this.voucherId = voucherId;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(int isInvoice) {
        this.isInvoice = isInvoice;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getDelivery() {
        return delivery;
    }

    public void setDelivery(int delivery) {
        this.delivery = delivery;
    }

    public int getActualPay() {
        return actualPay;
    }

    public void setActualPay(int actualPay) {
        this.actualPay = actualPay;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userid=" + userid +
                ", addressId=" + addressId +
                ", invoiceId=" + invoiceId +
                ", voucherId=" + voucherId +
                ", express='" + express + '\'' +
                ", payment='" + payment + '\'' +
                ", isInvoice=" + isInvoice +
                ", message='" + message + '\'' +
                ", total=" + total +
                ", discount=" + discount +
                ", delivery=" + delivery +
                ", actualPay=" + actualPay +
                ", createTime='" + createTime + '\'' +
                ", status=" + status +
                '}';
    }
}
