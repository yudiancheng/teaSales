package com.yu.pojo;

public class IntegralGetRecord {
    private int id;
    private int userid;
    private int orderId;
    private int integral;
    private String time;
    private Order order;

    public IntegralGetRecord() {
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

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getIntegral() {
        return integral;
    }

    public void setIntegral(int integral) {
        this.integral = integral;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "IntegralGetRecord{" +
                "id=" + id +
                ", userid=" + userid +
                ", orderId=" + orderId +
                ", integral=" + integral +
                ", time='" + time + '\'' +
                '}';
    }
}
