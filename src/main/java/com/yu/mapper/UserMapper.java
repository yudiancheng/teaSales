package com.yu.mapper;

import com.yu.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public interface UserMapper {
    /**
      * 根据用户名密码查询用户
     */
    public User selUserByPwd(@Param("username") String username, @Param("password") String password);

    /**
     * 根据会员积分查询对应的会员等级
     */
    @Select("select level from user_level where #{0} between low and high")
    public String selUserLevelByIntegral(int integral);

    /**
     * 根据用户名或手机号查询用户
     */
    public User selUserByNameOrPhone(@Param("username") String username,@Param("phone") String phone);

    /**
     * 根据id查询用户
     */
    @Select("select * from user where id=#{0}")
    public User selUserByUid(int uid);

    /**
     * 注册新用户
     */
    public int insUser(User u);

    /**
     * 设置用户的上一次访问时间
     */
    @Update("update user set lastVisit=#{1} where id=#{0}")
    public int updLastVisit(int id,String time);

    /**
     * 修正当前会员等级
     */
    @Update("update user set userlevel = #{1} where id=#{0}")
    public int updateUserLevel(int uid,String level);

    /**
     * 用户信息修改
     */
    public int updateUserInfo(HashMap<String,Object> map);

    /**
     * 用户头像修改
     */
    @Update("update user set headImg = #{1} where id=#{0}")
    public int updateHeadImg(int id,String headImg);

    /**
     * 用户密码修改
     */
    @Update("update user set password = #{1} where id=#{0}")
    public int updateUserPass(int id,String pass);
}
