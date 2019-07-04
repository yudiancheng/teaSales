package com.yu.mapper;

import com.yu.pojo.IntegralGetRecord;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface IntegralGetRecordMapper {

    /**
     * 查询指定用户的积分获取记录
     */
    public List<IntegralGetRecord> selIntegralGetRecordByUid(int uid);

    /**
     * 插入指定用户的积分获取记录
     */
    @Insert("insert into integral_get_record values(default,#{userid},#{orderId},#{integral},#{time})")
    public int insIntegralGetRecordByUid(IntegralGetRecord getRecord);
}
