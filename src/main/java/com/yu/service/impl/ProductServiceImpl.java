package com.yu.service.impl;

import com.yu.mapper.*;
import com.yu.pojo.Product;
import com.yu.pojo.ProductDetailed;
import com.yu.pojo.ProductPromotion;
import com.yu.pojo.UserCollect;
import com.yu.service.ProductService;
import com.yu.util.ProductHotCompare;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    ProductMapper productMapper;
    @Resource
    ProductPromotionMapper productPromotionMapper;
    @Resource
    UserCollectMapper userCollectMapper;
    @Resource
    ProductDetailedMapper productDetailedMapper;

    /**
     * 查询热销商品
     */
    @Override
    public List<Product> selProductByHot(int rank) {
        List<Product> products = productMapper.selAllProduct();
        Collections.sort(products,new ProductHotCompare());
        return products.subList(0,rank);
    }

    /**
     * 排名按时间排名前几名的商品
     */
    @Override
    public List<Product> selProductByTime(int rank) {
        return productMapper.selProductByTime(rank-1);
    }

    /**
     * 查询促销商品
     */
    @Override
    public List<ProductPromotion> selPromotion() {
        return productPromotionMapper.selPromotion();
    }

    /**
     * 查询指定区间个数茶叶
     */
    @Override
    public List<Product> selProductLimitNumber() {
        //查询茶叶总数
        int teaCount = productMapper.selCountTea();
        int count = 8;//巴山雀舌展示商品数
        int start = 0;
        if(teaCount - count >= 0) {
            start = (int) (Math.random() * (teaCount - count+1));//上界
        }
        return productMapper.selProductLimitNumber(start,count);
    }

    /**
     * 查询指定区间喝茶工具
     */
    @Override
    public List<Product> selToolsLimitNumber() {
        //查询茶具总数
        int toolCount = productMapper.selCountTools();
        int count = 8;//巴山雀舌展示商品数
        int start = 0;
        if(toolCount - count >= 0) {
            start = (int) (Math.random() * (toolCount - count+1));//上界
        }
        return productMapper.selToolsLimitNumber(start,count);
    }

    /**
     * 根据商品id查询商品
     */
    @Override
    public Product selProductById(int id) {
        return productMapper.selProductById(id);
    }

    /**
     * 查询某个商品被收藏的次数
     */
    @Override
    public int selCollectCountByPid(int pid) {
        return userCollectMapper.selCollectCountByPid(pid);
    }


    /**
     * 查询商品细节信息
     */
    @Override
    public ProductDetailed selDetailedByPid(int pid) {
        ProductDetailed detailed = productDetailedMapper.selDetailedByPid(pid);
        //大图片和小图片解析
        String bigImg = detailed.getBigImg();
        String smallImg = detailed.getSmallImg();
        String bafter[] = bigImg.split(";");
        String safter[] = smallImg.split(";");
        List<String> bigList = new ArrayList<>();
        List<String> smallList = new ArrayList<>();
        for(String str:bafter) {
            bigList.add(str);
        }
        for(String str:safter) {
            smallList.add(str);
        }
        detailed.setBigList(bigList);
        detailed.setSmallList(smallList);
        return detailed;
    }

    /**
     *商品收藏
     */
    public int insProToMyCollect(int uid,int pid){
        //检查商品有没有被收藏过
        UserCollect userCollect = userCollectMapper.selCollectByUidAndPid(uid, pid);
        if(userCollect != null) {
            return 0;
        }
        return userCollectMapper.insProToMyCollect(uid,pid);
    }
}
