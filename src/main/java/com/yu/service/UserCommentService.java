package com.yu.service;

import com.yu.pojo.UserComment;
import com.yu.util.PageInfo;

public interface UserCommentService {

    /**
     * 插入新的商品评论
     */
    public int insProCommentForUser(UserComment userComment);

    /**
     * 查询指定商品的评论条数
     */
    public int selCommentCountByPid(int pid);

    /**
     * 查询指定商品的好评数
     */
    public int selGoodCommentCount(int pid);

    /**
     * 查询指定商品的中评数
     */
    public int selNormalCommentCount(int pid);

    /**
     * 查询指定商品的差评数
     */
    public int selBadCommentCount(int pid);

    /**
     * 查询指定商品的评论
     */
    public PageInfo selCommentByPid(int pageNumber, int pageSize, int pid);

    /**
     * 只查询好评评论
     */
    public  PageInfo selGoodUserComment(int pageNumber,int pageSize,int pid);

    /**
     * 只查询中评评论
     */
    public  PageInfo selNormalUserComment(int pageNumber,int pageSize,int pid);

    /**
     * 只查询差评评论
     */
    public PageInfo selBadUserComment(int pageNumber,int pageSize,int pid);

    /**
     * 更新评论赞数
     */
    public int updateSupport(int cid,int support);

}
