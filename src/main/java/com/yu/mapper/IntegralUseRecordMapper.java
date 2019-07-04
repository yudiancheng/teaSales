package com.yu.mapper;

import com.yu.pojo.IntegralUseRecord;

import java.util.List;

public interface IntegralUseRecordMapper {

    /**
     * 根据用户id查询积分使用记录
     */
    public List<IntegralUseRecord> selIntegralUseRecordByUid(int uid);
}
