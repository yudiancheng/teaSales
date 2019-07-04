package com.yu.service.impl;

import com.yu.mapper.ShoppingMapper;
import com.yu.pojo.Product;
import com.yu.pojo.Shopping;
import com.yu.pojo.ShoppingProduct;
import com.yu.service.ShoppingCarService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShoppingCarServiceImpl implements ShoppingCarService {

    @Resource
    ShoppingMapper shoppingMapper;

    /**
     *根据用户id查询购物车中的商品
     */
    @Override
    public Shopping selShoppingByUid(int uid) {
        Shopping shopping = shoppingMapper.selShoppingByUid(uid);
        //计算购物车中商品总价值
        int sum = 0;
        if(shopping.getShoppingProducts() != null) {
            List<ShoppingProduct> shoppingProducts = shopping.getShoppingProducts();
            for(ShoppingProduct sp:shoppingProducts) {
                Product product = sp.getProduct();
                sum += product.getOurPrice();
            }
            shopping.setTotalValue(sum);
        }
        return shopping;
    }

    /**
     * 删除指定用户购物车中的指定商品
     */
    @Override
    public int delProFromCar(int pid, int uid) {
        return shoppingMapper.delProFromCar(pid,uid);
    }

    /**
     * 往指定用户的购物车中添加商品
     */
    @Override
    public int insProToCarForUser(int uid, int pid) {
        //判断购物车中是否有该商品
        Shopping shopping = shoppingMapper.selShoppingByPidAndUid(uid, pid);
        System.out.println(shopping);
        if(shopping != null) {
            return 0;
        } else {
            return shoppingMapper.insProToCarForUser(uid,pid);
        }
    }

    /**
     * 给新用户分配购物车空间
     */
    @Override
    public int insShoppingCarForUser(int uid) {
        return shoppingMapper.insShoppingCarForUser(uid);
    }

    /**
     * 更新指定用户购物车中指定商品的数目
     */
    @Override
    public int updateProductNum(int uid, int pid, int total) {
        return shoppingMapper.updateProductNum(uid,pid,total);
    }
}



