package com.yu.mapper;

import org.apache.ibatis.annotations.Insert;

public interface OrderProductMapper {
    /**
     * 插入新的订单商品映射
     */
    @Insert("insert into order_product values(default,#{0},#{1})")
    public int insNewProductForOrder(int orderId,int productId);
}
