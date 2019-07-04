package com.yu.mapper;

import com.yu.pojo.UserComment;
import com.yu.util.PageInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserCommentMapper {

    /**
     * 根据userId查询评论
     */
    public List<UserComment> selCommentByUid(int uid);

    /**
     * 删除指定用户指定商品的评论
     */
    @Delete("delete from user_comment where id=#{0}")
    public int delUserComment(int id);

    /**
     *查询指定商品的评论条数
     */
    @Select("select count(id) from user_comment where productId = #{0}")
    public int selCommentCountByPid(int pid);

    /**
     *查询指定商品的好评数
     */
    @Select("select count(id) from user_comment where level>3 and productId=#{0}")
    public int selGoodCommentCount(int pid);

    /**
     * 查询指定商品的中评数
     */
    @Select("select count(id) from user_comment where productId = #{0} and level=3")
    public int selNormalCommentCount(int pid);

    /**
     * 查询指定商品的差评数
     */
    @Select("select count(id) from user_comment where productId=#{0} and level < 3")
    public int selBadCommentCount(int pid);

    /**
     * 查询商品的评论
     */
    public List<UserComment> selCommentByPid(PageInfo pageInfo);

    /**
     * 只查询好评评论
     */
    public List<UserComment> selGoodUserComment(PageInfo pageInfo);

    /**
     * 只查询中评评论
     */
    public List<UserComment> selNormalUserComment(PageInfo pageInfo);

    /**
     * 只查询差评评论
     */
    public List<UserComment> selBadUserComment(PageInfo pageInfo);

    /**
     * 加入指定用户商品的评论
     */
    @Insert("insert into user_comment values(default,#{userId},#{productId},#{content},#{support},#{level})")
    public int insProCommentForUser(UserComment userComment);

    /**
     *更新评论的赞数
     */
    @Update("update user_comment set support = #{1} where id=#{0}")
    public int updateSupport(int cid,int support);

}
