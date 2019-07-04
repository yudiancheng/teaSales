package com.yu.service;

import com.yu.pojo.Product;
import com.yu.pojo.ProductDetailed;
import com.yu.pojo.ProductPromotion;

import java.util.List;

public interface ProductService {

    /**
     * 查询热销商品
     */
    public List<Product> selProductByHot(int rank);

    /**
     * 查询按时间排名 前几名的商品
     */
    public List<Product> selProductByTime(int rank);

    /**
     * 查询促销商品
     */
    public List<ProductPromotion> selPromotion();

    /**
     * 查询指定区间个数茶叶
     */
    public List<Product> selProductLimitNumber();

    /**
     * 查询指定区间喝茶工具
     */
    public List<Product> selToolsLimitNumber();

    /**
     * 根据商品id查询商品
     */
    public Product selProductById(int id);

    /**
     * 查询某个商品被收藏的次数
     */
    public int selCollectCountByPid(int pid);

    /**
     * 查询商品细节信息
     */
    public ProductDetailed selDetailedByPid(int pid);


    /**
     * 商品收藏
     */
    public int insProToMyCollect(int uid,int pid);
}
