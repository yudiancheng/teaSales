package com.yu.service.impl;

import com.yu.mapper.UserVoucherMapper;
import com.yu.mapper.VoucerMapper;
import com.yu.mapper.VoucherUseRecordMapper;
import com.yu.pojo.UserVoucher;
import com.yu.pojo.Voucher;
import com.yu.pojo.VoucherUseRecord;
import com.yu.service.VoucherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VoucherServiceImpl implements VoucherService {

    @Resource
    VoucerMapper voucerMapper;
    @Resource
    UserVoucherMapper userVoucherMapper;
    @Resource
    VoucherUseRecordMapper voucherUseRecordMapper;

    /**
     * 加入指定金额和门槛的红包
     */
    @Override
    public int insVoucher(String vid, double amount,double limit) {
        //查询是否已经存在该红包
        Voucher voucher = voucerMapper.selVoucherByTotalAndLimit(amount, limit);
        if(voucher != null) {
            return 0;
        }
        return voucerMapper.insVoucher(vid,amount,limit);
    }


    /**
     * 给指定用户加入指定金额和门槛的红包
     */
    @Override
    public int insVoucherForUser(int uid, double amount, double limit) {
        //查询该用户是否已经拥有该红包
        UserVoucher userVoucher = userVoucherMapper.selVoucherByUidAndVoucher(uid, amount, limit);
        if(userVoucher != null) {
            return 0;
        }
        return userVoucherMapper.insUserVoucherForUser(uid,amount,limit);
    }

    /**
     * 查询指定用户拥有的红包
     */
    @Override
    public List<UserVoucher> selVoucherByUid(int uid) {
        return userVoucherMapper.selVoucherByUid(uid);
    }

    /**
     * 根据红包id查询红包是否可用
     */
    @Override
    public Voucher selVoucherByVid(String vid) {
        Voucher voucher = voucerMapper.selVoucherByVid(vid);
        if(voucher != null) {
            //检查优惠券是否被使用过
            VoucherUseRecord voucherUseRecord = voucherUseRecordMapper.selRecordByUidAndVid(vid);
            if(voucherUseRecord != null) {
                return null;
            }
        }
        return voucher;
    }

    /**
     *增加指定用户指定红包的使用记录
     */
    @Override
    public int insVoucherUseRecord(int uid, String vid, String useTime) {
        return voucherUseRecordMapper.insVoucherUseRecord(uid,vid,useTime);
    }
}
