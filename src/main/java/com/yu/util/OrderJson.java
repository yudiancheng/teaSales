package com.yu.util;

public class OrderJson {
    private int addressId;
    private String express;
    private String payment;
    private String isInvoice;
    private String invoiceType;
    private String invoiceInfo;
    private String message;
    private String  voucherId;
    private int total;
    private int discount;
    private int distributionFee;
    private int actual;

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
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

    public String getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(String isInvoice) {
        this.isInvoice = isInvoice;
    }

    public String getInvoiceInfo() {
        return invoiceInfo;
    }

    public void setInvoiceInfo(String invoiceInfo) {
        this.invoiceInfo = invoiceInfo;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(String voucherId) {
        this.voucherId = voucherId;
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

    public int getDistributionFee() {
        return distributionFee;
    }

    public void setDistributionFee(int distributionFee) {
        this.distributionFee = distributionFee;
    }

    public int getActual() {
        return actual;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    @Override
    public String toString() {
        return "OrderJson{" +
                "addressId=" + addressId +
                ", express='" + express + '\'' +
                ", payment='" + payment + '\'' +
                ", isInvoice='" + isInvoice + '\'' +
                ", invoiceType='" + invoiceType + '\'' +
                ", invoiceInfo='" + invoiceInfo + '\'' +
                ", message='" + message + '\'' +
                ", voucherId=" + voucherId +
                ", total=" + total +
                ", discount=" + discount +
                ", distributionFee=" + distributionFee +
                ", actual=" + actual +
                '}';
    }
}
