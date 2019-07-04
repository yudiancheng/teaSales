package com.yu.mapper;

import com.yu.pojo.ProductPromotion;

import java.util.List;

public interface ProductPromotionMapper {

    /**
     * 查询正在促销的商品
     */
    public List<ProductPromotion> selPromotion();
}
