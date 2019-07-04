package com.yu.mapper;

import com.yu.pojo.UserCollect;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;
import java.util.List;

public interface UserCollectMapper {

    /**
     * 查询某个商品有没有被收藏过
     */
    @Select("select userid,productId from user_collect where userid = #{0} and productId=#{1}")
    public UserCollect selCollectByUidAndPid(int uid,int pid);

    /**
     * 根据指定的用户id查询用户收藏的商品
     */
    public UserCollect selUserCollectByUid(int id);

    /**
     * 根据指定的用户id查询用户收藏的商品（分页）
     */
    public List<UserCollect> selUserCollectByUidLimitPage(HashMap<String,Object> map);

    /**
     * 查询指定用户收藏商品的总条数
     */
    @Select("select count(*) from user_collect where userid=#{0}")
    public int selProCollectCountByUid(int uid);

    /**
     * 查询某个商品被收藏的次数
     */
    @Select("select count(*) from user_collect where productId=#{0}")
    public int selCollectCountByPid(int pid);

    /**
     * 添加收藏的商品
     */
    @Insert("insert into user_collect values(default,#{0},#{1})")
    public int insProToMyCollect(int uid,int pid);
}
