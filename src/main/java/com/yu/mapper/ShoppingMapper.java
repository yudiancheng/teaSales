package com.yu.mapper;

import com.yu.pojo.Shopping;
import org.apache.ibatis.annotations.Insert;

public interface ShoppingMapper {

    /**
     * 根据userId查询用户购物车
     */
    public Shopping selShoppingByUid(int uid);

    /**
     * 根据商品id和userId查询购物车中是否存在该商品
     */
    public Shopping selShoppingByPidAndUid(int uid,int pid);

    /**
     * 在购物车里删除指定用户的指定商品
     */
    public int delProFromCar(int pid,int uid);

    /**
     * 往指定用户的购物车中添加商品
     */
    public int insProToCarForUser(int uid,int pid);

    /**
     * 给新用户分配购物车空间
     */
    @Insert("insert into shopping values(default,#{0})")
    public int insShoppingCarForUser(int uid);

    /**
     * 更新指定用户购物车中指定商品的数目
     */
    public int updateProductNum(int uid,int pid,int total);

}
