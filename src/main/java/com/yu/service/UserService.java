package com.yu.service;

import com.yu.pojo.*;
import com.yu.util.PageInfo;

import java.util.HashMap;
import java.util.List;

public interface UserService {
    /**
     * 根据用户名密码查询用户
     */
    public User selUserByPwd(String username,String password);

    /**
     * 插入新用户
     */
    public int insUser(User u);

    /**
     * 更新用户的上一次登录时间
     */
    public int updLastVisit(int id,String time);

    /**
     * 更新用户等级
     */
    public int updUserLevel(int id,String level);

    /**
     * 根据积分查询用户相应等级
     */
    public String selUserLevelByIntegral(int integral);

    /**
     * 用户信息修改
     */
    public int updateUserInfo(HashMap<String,Object> map);

    /**
     * 用户头像修改
     */
    public int updateHeadImg(int id,String headImg);

    /**
     * 用户密码修改
     */
    public int updateUserPass(int id,String pass);

    /**
     * 查询用户的积分获取记录
     */
    public List<IntegralGetRecord> selIntegralGetRecordByUid(int uid);

    /**
     * 查询用户的积分使用记录
     */
    public List<IntegralUseRecord> selIntegralUseRecordByUid(int uid);

    /**
     * 查询用户收藏的商品（分页）
     */
    public PageInfo selUserCollectByUidLimitPage(int uid, int pageNumber, int pageSize);

    /**
     * 用户添加收获地址
     */
    public int insAddressForUser(UserAddress address);

    /**
     * 查询用户的收货地址
     */
    public List<UserAddress> selAddressByUid(int uid);

    /**
     * 修改用户收货地址
     */
    public int updUserAddress(UserAddress address);

    /**
     * 删除收货地址
     */
    public int delUserAddress(int id);

    /**
     * 根据userId查询评论
     */
    public List<UserComment>  selCommentByUid(int uid);

    /**
     * 删除指定用户指定商品的评论
     */
    public int delUserComment(int id);

    /**
     * 插入用户浏览记录
     */
    public int insScanRecord(int uid,int pid);

    /**
     * 查询用户的浏览记录
     */
    public List<ScanRecord> selListUserRecord(int uid);
}
