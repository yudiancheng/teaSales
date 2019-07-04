package com.yu.mapper;

import com.yu.pojo.VoucherUseRecord;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface VoucherUseRecordMapper {

    /**
     * 根据优惠券id查询
     */
    @Select("select id,userid,voucherId,useTime from voucher_use_record where voucherId=#{0}")
    public VoucherUseRecord selRecordByUidAndVid(String vid);

    /**
     * 增加指定用户指定红包的使用记录
     */
    @Insert("insert into voucher_use_record values(default,#{0},#{1},#{2})")
    public int insVoucherUseRecord(int uid,String vid,String useTime);
}
