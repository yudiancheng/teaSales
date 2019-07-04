package com.yu.service;

import com.yu.pojo.UserVoucher;
import com.yu.pojo.Voucher;

import java.util.List;

public interface VoucherService {

    /**
     * 加入指定金额和门槛的红包
     */
    public int insVoucher(String vid,double amount,double limit);

    /**
     * 给指定用户加入指定金额和门槛的红包
     */
    public int insVoucherForUser(int uid,double amount,double limit);

    /**
     * 查询指定用户拥有的红包
     */
    public List<UserVoucher> selVoucherByUid(int uid);

    /**
     * 根据红包id查询红包是否可用
     */
    public Voucher selVoucherByVid(String vid);

    /**
     *增加指定用户指定红包的使用记录
     */
    public int insVoucherUseRecord(int uid,String vid,String useTime);
}
