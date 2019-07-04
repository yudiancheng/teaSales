package com.yu.mapper;

import com.yu.pojo.Product;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProductMapper {
    /**
     * 根据商品id查询商品信息(使用普通resultMap)
     */
    public Product selProductById(int id);

    /**
     * 根据商品id查询商品信息(不适用resultMap)
     */
    public Product selProductByIdNoMap(int id);

    /**
     * 根据商品id查询商品信息(只使用查询商品详细信息的resultMap)
     */
    public Product selProductByIdDeteailed(int id);
    /**
     * 根据热度前几名查询商品
     */
    public List<Product> selAllProduct();

    /**
     * 根据时间前几名查询商品
     */
    public List<Product> selProductByTime(int rank);

    /**
     * 查询指定区间个数茶叶
     */
    @Select("select * from product where foodTech != '喝茶工具' limit #{0},#{1}")
    public List<Product> selProductLimitNumber(int left,int count);

    /**
     * 查询指定区间喝茶工具
     */
    @Select("select * from product where foodTech = '喝茶工具' limit #{0},#{1}")
    public List<Product> selToolsLimitNumber(int left,int count);

    /**
     * 查询茶叶总数
     */
    @Select("select count(*) from product where foodTech != '喝茶工具'")
    public int selCountTea();

    /**
     * 查询工具总数
     */
    @Select("select count(*) from product where foodTech = '喝茶工具'")
    public int selCountTools();

}
