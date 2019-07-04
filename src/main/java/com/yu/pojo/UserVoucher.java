package com.yu.pojo;

public class UserVoucher {
    private int id;
    private int userid;
    private int total;//持有数量
    private String voucherId;
    private Voucher voucher;

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

    public String getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(String voucherId) {
        this.voucherId = voucherId;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public void setVoucher(Voucher voucher) {
        this.voucher = voucher;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "UserVoucher{" +
                "id=" + id +
                ", userid=" + userid +
                ", total=" + total +
                ", voucherId='" + voucherId + '\'' +
                ", voucher=" + voucher +
                '}';
    }
}
