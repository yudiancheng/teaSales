package com.yu.mapper;

import com.yu.pojo.Order;

public interface OrderMapper {
    /**
     * 根据用户id查询订单
     */
    public Order selOrderByUid(int id);

    /**
     * 根据订单id查询订单
     */
    public Order selOrderById(int id);

    /**
     * 插入新订单
     */
    public int insOrderForUser(Order order);

}