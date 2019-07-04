package com.yu.service.impl;

import com.yu.mapper.*;
import com.yu.pojo.*;
import com.yu.service.UserService;
import com.yu.util.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    UserMapper userMapper;
    @Resource
    IntegralGetRecordMapper integralGetRecordMapper;
    @Resource
    IntegralUseRecordMapper integralUseRecordMapper;
    @Resource
    UserCollectMapper userCollectMapper;
    @Resource
    UserAddressMapper userAddressMapper;
    @Resource
    UserCommentMapper userCommentMapper;
    @Resource
    ScanRecordMapper scanRecordMapper;

    /**
     * 根据用户名密码查询用户
     */
    @Override
    public User selUserByPwd(String username, String password) {
        User user = userMapper.selUserByPwd(username, password);
        if (user != null) {
            /************订单操作****************/
            int success = 0;
            int unfinished = 0;
            //获取用户订单
            List<Order> orders = user.getOrders();
            //判断已完成订单和未完成订单
            for (Order order : orders) {
                if (order.getStatus() == 1) {
                    success++;
                } else {
                    unfinished++;
                }
            }
            user.setSuccessOrder(success);
            user.setUnfinishedOrder(unfinished);
        }
        return user;
    }

    /**
     * 插入新用户
     */
    @Override
    public int insUser(User u) {
        String name = u.getUsername();
        String phoneNumber = u.getPhone();
        //查询用户名或者手机号是否已存在
        User user = userMapper.selUserByNameOrPhone(name, phoneNumber);
        if(user != null) {
            return 0;
        }
        return userMapper.insUser(u);
    }

    /**
     * 更新用户的上一次登录时间
     */
    @Override
    public int updLastVisit(int id, String time) {
        return  userMapper.updLastVisit(id, time);
    }

    /**
     * 更新用户的会员等级
     */
    @Override
    public int updUserLevel(int id, String level) {
        return userMapper.updateUserLevel(id,level);
    }

    /**
     * 根据积分查询用户相应等级
     */
    @Override
    public String selUserLevelByIntegral(int integral) {
       return userMapper.selUserLevelByIntegral(integral);
    }

    /**
     * 用户信息修改
     */
    @Override
    public int updateUserInfo(HashMap<String, Object> map) {
        return userMapper.updateUserInfo(map);
    }

    /**
     * 用户头像修改
     */
    @Override
    public int updateHeadImg(int id,String headImg) {
        return userMapper.updateHeadImg(id,headImg);
    }

    /**
     * 用户密码修改
     */
    @Override
    public int updateUserPass(int id, String pass){
        return userMapper.updateUserPass(id,pass);
    }

    /**
     * 查询用户的积分获取记录
     */
    @Override
    public List<IntegralGetRecord> selIntegralGetRecordByUid(int uid) {
        return integralGetRecordMapper.selIntegralGetRecordByUid(uid);
    }

    /**
     * 查询用户的积分使用记录
     */
    @Override
    public List<IntegralUseRecord> selIntegralUseRecordByUid(int uid) {
       return integralUseRecordMapper.selIntegralUseRecordByUid(uid);
    }

    /**
     * 查询用户收藏的商品（分页）
     */
    @Override
    public PageInfo selUserCollectByUidLimitPage(int uid, int pageNumber, int pageSize) {
        PageInfo pi = new PageInfo();
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        HashMap<String,Object> map = new HashMap<>();
        pageNumber = (pageNumber-1)*pageSize;
        map.put("pageNumber",pageNumber);
        map.put("pageSize",pageSize);
        map.put("userid",uid);
        //调用数据访问层方法查询分页数据
        List<UserCollect> userCollectList = userCollectMapper.selUserCollectByUidLimitPage(map);
        //查询用户收藏的总条数
        int count = userCollectMapper.selProCollectCountByUid(uid);
        pi.setTotal(count);
        pi.setPageData(userCollectList);
        //计算总页数
        int total = (count+pageSize-1)/pageSize;
        pi.setPage(total);
        return pi;
    }

    /**
     * 用户添加收获地址
     */
    @Override
    public int insAddressForUser(UserAddress address) {
        return userAddressMapper.insAddressForUser(address);
    }

    /**
     * 查询用户的收获地址
     */
    @Override
    public List<UserAddress> selAddressByUid(int uid) {
        return userAddressMapper.selAddressByUid(uid);
    }

    /**
     * 修改用户的收获地址
     */
    @Override
    public int updUserAddress(UserAddress address) {
        return userAddressMapper.updUserAddress(address);
    }

    /**
     * 删除收货地址
     */
    @Override
    public int delUserAddress(int id) {
        return userAddressMapper.delUserAddress(id);
    }

    /**
     * 根据userId查询评论
     */
    @Override
    public List<UserComment> selCommentByUid(int uid) {
        return userCommentMapper.selCommentByUid(uid);
    }

    /**
     * 删除指定用户指定商品的评论
     */
    public int delUserComment(int id){
        return  userCommentMapper.delUserComment(id);
    }

    /**
     * 插入用户浏览记录
     */
    @Override
    public int insScanRecord(int uid, int pid) {
        //查询用户的浏览记录中是否有此商品
        ScanRecord scanRecord = scanRecordMapper.selScanRecordByUidAndPid(uid, pid);
        if(scanRecord != null) {
            return 0;
        }
        return scanRecordMapper.insScanRecord(uid,pid);
    }

    /**
     * 查询用户的浏览记录
     */
    @Override
    public List<ScanRecord> selListUserRecord(int uid) {
        return scanRecordMapper.selListScanRecordByUid(uid);
    }
}
