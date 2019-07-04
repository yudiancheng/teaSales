package com.yu.service;

import com.yu.pojo.Order;

public interface OrderService {
    /**
     * 插入订单商品映射
     */
    public int insNewProductForOrder(int orderId,int productId);

    /**
     * 插入新订单
     */
    public int insNewOrderForUser(Order order);
}
