package com.yu.service;

import com.yu.pojo.Shopping;

public interface ShoppingCarService {

    /**
     * 根据用户id查询购物车
     */
    public Shopping selShoppingByUid(int uid);

    /**
     * 删除指定用户购物车中的指定商品
     */
    public int delProFromCar(int pid,int uid);

    /**
     * 往指定用户的购物车中添加商品
     */
    public int insProToCarForUser(int uid,int pid);

    /**
     * 给新用户分配购物车空间
     */
    public int insShoppingCarForUser(int uid);

    /**
     * 更新指定用户购物车中指定商品的数目
     */
    public int updateProductNum(int uid,int pid,int total);
}
