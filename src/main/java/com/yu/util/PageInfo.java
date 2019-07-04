package com.yu.util;

import java.util.List;

public class PageInfo {
    private int pageSize;//单页数据个数
    private int pageNumber;//页面数据在数据库中的开始下标
    private List<?> pageData;//页面数据
    private int total;//总数据条数
    private int page;//页数
    private int productId;//商品id
    private int currentPage;//当前是第几页

    public PageInfo() {
    }

    public PageInfo(int pageSize, int pageNumber, int productId) {
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
        this.productId = productId;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public List<?> getPageData() {
        return pageData;
    }

    public void setPageData(List<?> pageData) {
        this.pageData = pageData;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    @Override
    public String toString() {
        return "PageInfo{" +
                "pageSize=" + pageSize +
                ", pageNumber=" + pageNumber +
                ", pageData=" + pageData +
                ", total=" + total +
                ", page=" + page +
                ", productId=" + productId +
                '}';
    }
}
