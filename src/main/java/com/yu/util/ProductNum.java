package com.yu.util;

public class ProductNum {
    private int pid;
    private int num;

    public ProductNum() {
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "ProductNum{" +
                "pid=" + pid +
                ", num=" + num +
                '}';
    }
}
