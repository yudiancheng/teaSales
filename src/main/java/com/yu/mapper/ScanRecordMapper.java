package com.yu.mapper;

import com.yu.pojo.ScanRecord;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ScanRecordMapper {

    /**
     * 根据用户id查询浏览历史
     */
    public ScanRecord selScanRecordByUid(int uid);

    /**
     * 插入用户浏览记录
     */
    @Insert("insert into scan_record values(default,#{0},#{1})")
    public int insScanRecord(int uid,int cid);

    /**
     * 根据用户id和商品id查询浏览记录中是否有此商品
     */
    @Select("select id,userid,productId from scan_record where userid=#{0} and productId=#{1}")
    public ScanRecord selScanRecordByUidAndPid(int uid,int pid);

    public List<ScanRecord> selListScanRecordByUid(int uid);
}
