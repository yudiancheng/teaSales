package com.yu.service.impl;

import com.yu.mapper.OrderMapper;
import com.yu.mapper.OrderProductMapper;
import com.yu.mapper.UserVoucherMapper;
import com.yu.pojo.Order;
import com.yu.pojo.UserVoucher;
import com.yu.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    OrderProductMapper orderProductMapper;
    @Resource
    OrderMapper orderMapper;
    @Resource
    UserVoucherMapper userVoucherMapper;
    /**
     * 插入订单商品映射
     */
    @Override
    public int insNewProductForOrder(int orderId,int productId) {
        return  orderProductMapper.insNewProductForOrder(orderId,productId);
    }

    /**
     * 插入新订单
     */
    @Override
    public int insNewOrderForUser(Order order) {
        int res = orderMapper.insOrderForUser(order);
        if(res > 0) {
            //判断是否使用了优惠券如果使用了优惠券 优惠券张数-1
            String voucherId = order.getVoucherId();
            if(voucherId != null && voucherId != "") {
                //查询优惠券本来的张数
                int total = userVoucherMapper.selUserVoucherTotal(order.getUserid(), order.getVoucherId());
                total -= 1;
                //更新优惠券张数
                UserVoucher userVoucher = new UserVoucher();
                userVoucher.setUserid(order.getUserid());
                userVoucher.setVoucherId(order.getVoucherId());
                userVoucher.setTotal(total);
                userVoucherMapper.updateUserVoucherTotal(userVoucher);
            }
            return res;
        }
        return res;
    }
}
