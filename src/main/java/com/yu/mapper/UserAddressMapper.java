package com.yu.mapper;

import com.yu.pojo.UserAddress;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserAddressMapper {

    /**
     * 给指定用户添加地址
     */
    @Insert("insert into user_address values(default,#{userId},#{receiverName},#{location},#{detailedAddress},#{postalCode},#{phone})")
    public int insAddressForUser(UserAddress address);

    /**
     * 查询指定用户的收获地址
     */
    @Select("select * from user_address where userId = #{0}")
    public List<UserAddress> selAddressByUid(int uid);

    /**
     * 修改用户的收货地址
     */
    public int updUserAddress(UserAddress address);

    /**
     * 删除收货地址
     */
    @Delete("delete from user_address where id = #{0}")
    public int delUserAddress(int id);
}
