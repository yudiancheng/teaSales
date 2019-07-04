package com.yu.mapper;

import com.yu.pojo.Voucher;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface VoucerMapper {
    /**
     * 根据红包编号查询
     */
    @Select("select id,amount from voucher where id=#{0}")
    public Voucher selVoucherByVid(String vid);

    /**
     * 根据红包金额和门槛查询
     */
    @Select("select id,amount,limit from voucher where amount=#{0} and limit=#{1}")
    public Voucher selVoucherByTotalAndLimit(double amount,double limit);



    /**
     * 加入指定金额和指定门槛的红包
     */
    @Insert("insert into voucher values(#{0},#{1},#{2})")
    public int insVoucher(String vid,double amount, double limit);




}
