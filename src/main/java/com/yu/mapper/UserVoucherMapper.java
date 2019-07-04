package com.yu.mapper;

import com.yu.pojo.UserVoucher;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserVoucherMapper {

    /**
     * 查询指定用户拥有的红包
     */
    public List<UserVoucher> selVoucherByUid(int uid);

    /**
     * 给指定用户加入指定金额和门槛的红包
     */
    public int insUserVoucherForUser(int uid,double amount,double limit);

    /**
     * 查询用户是否已经拥有指定金额和门槛的红包
     */
    public UserVoucher selVoucherByUidAndVoucher(int uid,double amount,double limit);

    /**
     * 更新指定用户的指定优惠券的张数
     */
    @Update("update user_voucher set total = #{total} where userid=#{userid} and voucherId=#{voucherId} ")
    public int updateUserVoucherTotal(UserVoucher userVoucher);

    /**
     * 查询指定用户指定优惠券的张数
     */
    @Select("select total from user_voucher where userid=#{0} and voucherId=#{1}")
    public int selUserVoucherTotal(int uid,String vid);
}
