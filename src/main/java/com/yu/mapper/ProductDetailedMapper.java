package com.yu.mapper;

import com.yu.pojo.ProductDetailed;

public interface ProductDetailedMapper {

    /**
     * 根据指定的商品id查询商品细节信息
     */
    public ProductDetailed selDetailedByPid(int pid);
}
