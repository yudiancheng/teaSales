package com.yu.mapper;

import com.yu.pojo.BuyRecord;
import com.yu.pojo.UserComment;
import org.apache.ibatis.annotations.Select;

public interface BuyRecordMapper {
    /**
     * 根据用户id查询购买记录
     */
    public BuyRecord selRecordByUid(int uid);

    /**
     * 根据商品id查询销量
     */
    @Select("select count(id) from buy_record where productId=#{0}")
    public int selSaleCountByPid(int pid);

    /**
     * 查询指定用户是否购买过指定商品
     */
    @Select("select id from buy_record where userId=#{0} and productId=#{1}")
    public UserComment selUserCommentByPidAndUid(int userId,int productId);
}
