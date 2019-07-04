package com.yu.pojo;

public class VoucherUseRecord {
    private  int id;
    private int userid;
    private String voucherId;
    private String useTime;

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

    public String getUseTime() {
        return useTime;
    }

    public void setUseTime(String useTime) {
        this.useTime = useTime;
    }

    @Override
    public String toString() {
        return "VoucherUseRecord{" +
                "id=" + id +
                ", userid=" + userid +
                ", voucherId=" + voucherId +
                ", useTime='" + useTime + '\'' +
                '}';
    }
}
