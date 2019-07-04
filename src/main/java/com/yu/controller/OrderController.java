package com.yu.controller;

import com.yu.pojo.*;
import com.yu.service.*;
import com.yu.util.OrderJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Resource
    UserService userServiceImpl;
    @Resource
    ShoppingCarService shoppingCarServiceImpl;
    @Resource
    VoucherService voucherServiceImpl;
    @Resource
    InvoiceService invoiceServiceImpl;
    @Resource
    OrderService orderServiceImpl;

    /**
     * 跳转确认订单界面
     */
    @RequestMapping("jumpConfirmOrder")
    public String jumpConfirmOrder(HttpSession session) {
        Object u = session.getAttribute("user");
        User user = null;
        if (u != null) {
            user = (User) u;
            //查询用户的收货地址
            List<UserAddress> userAddresses = userServiceImpl.selAddressByUid(user.getId());
            session.setAttribute("userAddress", userAddresses);
            //刷新购物车
            Shopping shopping = shoppingCarServiceImpl.selShoppingByUid(user.getId());
            session.setAttribute("shoppingCar", shopping);
            //查询用户拥有的红包
            List<UserVoucher> userVouchers = voucherServiceImpl.selVoucherByUid(user.getId());
            session.setAttribute("userVouchers", userVouchers);
        }
        return "confirmOrder";
    }

    /**
     * 检查红包序列号
     */
    @ResponseBody
    @RequestMapping("voucherSerial")
    public Voucher voucherSerial(String vid) {
        Voucher voucher = voucherServiceImpl.selVoucherByVid(vid);
        if (voucher != null) {
            return voucher;
        }
        Voucher v = new Voucher();
        v.setAmount(0);
        return v;
    }

    /**
     * 增加红包使用记录
     */
    @ResponseBody
    @RequestMapping("insVoucherUseRecord")
    public String insVoucherUseRecord(String vid, HttpSession session) {
        Object u = session.getAttribute("user");
        User user = null;
        if (u != null) {
            user = (User) u;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String useTime = sdf.format(date.getTime());
            int res = voucherServiceImpl.insVoucherUseRecord(user.getId(), vid, useTime);
            if(res > 0) {
                return "成功";
            }
        }
        return "失败";
    }

    /**
     * 提交订单
     */
    @ResponseBody
    @RequestMapping("subOrder")
    public String subOrder(@RequestBody OrderJson orderInfo,HttpSession session) {
        /******获取订单信息*******/
        Object u = session.getAttribute("user");
        User user = null;
        if(u != null) {
            user = (User)u;
        }
        int uid = user.getId();
        int addressId = orderInfo.getAddressId();
        String express = orderInfo.getExpress();
        String payment = orderInfo.getPayment();
        int isInvoice = 0;
        if(orderInfo.getIsInvoice() == "true") {
            isInvoice = 1;
        }
        String invoiceType= null;
        String invoiceInfo = null;
        Invoice invoice = new Invoice();

        if(isInvoice == 1) {
            invoiceType = orderInfo.getInvoiceType();
            invoiceInfo = orderInfo.getInvoiceInfo();
            //  插入新的发票
            invoice.setUserid(uid);
            invoice.setType(invoiceType);
            invoice.setTitle(invoiceInfo);
            //插入新发票
            invoiceServiceImpl.insNewInvoiceForUser(invoice);
        }
        String message = orderInfo.getMessage();
        String voucherId = orderInfo.getVoucherId();
        int total = orderInfo.getTotal();
        int discount = orderInfo.getDiscount();
        int distributeFee = orderInfo.getDistributionFee();
        int actual = orderInfo.getActual();
        //插入新的订单
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String createTime = sdf.format(date);
        Order order = new Order(user.getId(),addressId,invoice.getId(),voucherId,express,payment,isInvoice,message,total,discount,distributeFee,actual,createTime,0);
        int res = orderServiceImpl.insNewOrderForUser(order);
        if(res > 0) {
            return "success";
        }
        return "failed";
    }
}
