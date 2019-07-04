package com.yu.util;

import com.yu.pojo.Product;

import java.util.Comparator;

/**
 * 商品热度比较器
 */
public class ProductHotCompare implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        if(o1.getSaleCount() < o2.getSaleCount()) {
            return 1;
        } else {
            return -1;
        }
    }
}
