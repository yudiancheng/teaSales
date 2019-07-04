package com.yu.service.impl;

import com.yu.mapper.BuyRecordMapper;
import com.yu.mapper.IntegralGetRecordMapper;
import com.yu.mapper.UserCommentMapper;
import com.yu.pojo.IntegralGetRecord;
import com.yu.pojo.UserComment;
import com.yu.service.UserCommentService;
import com.yu.util.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserCommentServiceImpl implements UserCommentService {

    @Resource
    UserCommentMapper userCommentMapper;
    @Resource
    BuyRecordMapper buyRecordMapper;
    @Resource
    IntegralGetRecordMapper integralGetRecordMapper;

    /**
     * 插入新的商品评论
     */
    @Override
    public int insProCommentForUser(UserComment userComment) {
        //查询用户是否购买过此商品
        UserComment comment = buyRecordMapper.selUserCommentByPidAndUid(userComment.getUserId(), userComment.getProductId());
        if (comment != null) {
            int res = userCommentMapper.insProCommentForUser(userComment);
            if (res > 0) {
                //增加10积分
                IntegralGetRecord record = new IntegralGetRecord();
                record.setUserid(userComment.getUserId());
                record.setIntegral(10);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = new Date();
                String format = sdf.format(date);
                record.setTime(format);
                integralGetRecordMapper.insIntegralGetRecordByUid(record);
                return res;
            }
        }
        return 0;
    }

    /**
     * 查询指定商品的评论条数
     */
    @Override
    public int selCommentCountByPid(int pid) {
        return userCommentMapper.selCommentCountByPid(pid);
    }

    /**
     * 查询指定商品的好评数
     */
    @Override
    public int selGoodCommentCount(int pid) {
        return userCommentMapper.selGoodCommentCount(pid);
    }

    /**
     * 查询指定商品的中评数
     */
    @Override
    public int selNormalCommentCount(int pid) {
        return userCommentMapper.selNormalCommentCount(pid);
    }

    /**
     * 查询指定商品的差评数
     */
    @Override
    public int selBadCommentCount(int pid) {
        return userCommentMapper.selBadCommentCount(pid);
    }

    /**
     * 查询指定商品的评论
     */
    @Override
    public PageInfo selCommentByPid(int pageNumber, int pageSize, int pid) {
        //查询商品评论的条数
        int count = userCommentMapper.selCommentCountByPid(pid);
        //设置分页数据
        PageInfo pi = new PageInfo();
        pi.setProductId(pid);
        pi.setCurrentPage(pageNumber);
        pageNumber = (pageNumber - 1) * pageSize;
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        //查询分页数据
        List<UserComment> userComments = userCommentMapper.selCommentByPid(pi);
        pi.setPageData(userComments);
        //计算页数
        int page = (count+pageSize-1)/pageSize;
        pi.setPage(page);
        return pi;
    }

    /**
     * 只查询好评
     */
    @Override
    public PageInfo selGoodUserComment(int pageNumber, int pageSize, int pid) {
        PageInfo pi = new PageInfo();
        pi.setCurrentPage(pageNumber);
        pageNumber = (pageNumber - 1) * pageSize;
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setProductId(pid);
        List<UserComment> userComments = userCommentMapper.selGoodUserComment(pi);
        //查询商品的好评数
        int goodCount = userCommentMapper.selGoodCommentCount(pid);
        pi.setPageData(userComments);
        //计算页数
        int page = goodCount + pageSize - 1 / pageSize;
        pi.setPage(page);
        return pi;
    }

    /**
     * 只查询中评
     */
    @Override
    public PageInfo selNormalUserComment(int pageNumber, int pageSize, int pid) {
        //准备分页数据
        PageInfo pi = new PageInfo();
        pi.setCurrentPage(pageNumber);
        pageNumber = (pageNumber - 1) * pageSize;
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setProductId(pid);
        //查询分页数据
        List<UserComment> userComments = userCommentMapper.selNormalUserComment(pi);
        //查询商品的中评数
        int normalCount = userCommentMapper.selNormalCommentCount(pid);
        pi.setPageData(userComments);
        //计算页数
        int page = normalCount + pageSize - 1 / pageSize;
        pi.setPage(page);
        return pi;
    }

    /**
     * 只查询差评
     */
    @Override
    public PageInfo selBadUserComment(int pageNumber, int pageSize, int pid) {
        PageInfo pi = new PageInfo();
        pi.setCurrentPage(pageNumber);
        pageNumber = (pageNumber - 1) * pageSize;
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setProductId(pid);
        List<UserComment> userComments = userCommentMapper.selBadUserComment(pi);
        //查询商品的差评数
        int badCount = userCommentMapper.selBadCommentCount(pid);
        pi.setPageData(userComments);
        //计算页数
        int page = badCount + pageSize - 1 / pageSize;
        pi.setPage(page);
        return pi;
    }

    /**
     * 更新评论赞数
     */
    @Override
    public int updateSupport(int cid,int support) {
        return userCommentMapper.updateSupport(cid,support);
    }
}
