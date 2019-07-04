package com.yu.controller;

import com.yu.pojo.User;
import com.yu.pojo.UserComment;
import com.yu.service.UserCommentService;
import com.yu.util.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CommentController {
    @Resource
    UserCommentService userCommentServiceImpl;
    /**
     * 插入新的评论
     */
    @ResponseBody
    @RequestMapping("insComment")
    public String insComment(HttpServletRequest req, HttpSession session) {
        Object u = session.getAttribute("user");
        User user = null;
        String content = req.getParameter("content");
        int level = Integer.parseInt(req.getParameter("level"));
        int productId = Integer.parseInt(req.getParameter("productId"));
        System.out.println(content + "," + level);
        if(u != null) {
            user = (User)u;
            UserComment comment = new UserComment();
            comment.setContent(content);
            comment.setProductId(productId);
            comment.setLevel(level);
            comment.setUserId(user.getId());
            int res = userCommentServiceImpl.insProCommentForUser(comment);
            if(res > 0) {
                return  "success";
            }
        }
        return "error";
    }

    /**
     *全部评论数据查询
     */
    @ResponseBody
    @RequestMapping("selAll")
    public PageInfo selAll(String pid, String pageNumber, String pageSize) {
        int id = 0,number = 1, size = 2;
        if(pid != null){
            id = Integer.parseInt(pid);
        }
        if(pageNumber != null) {
            number = Integer.parseInt(pageNumber);
            if(number <=0) {
                number = 1;
            }
        }
        if(pageSize != null) {
            size = Integer.parseInt(pageSize);
        }
        //查询全部评论
        PageInfo allComments = userCommentServiceImpl.selCommentByPid(number,size,id);
        return allComments;
    }

    /**
     * 好评数据查询
     */
    @ResponseBody
    @RequestMapping("selGood")
    public PageInfo selGood(String pid, String pageNumber, String pageSize) {
        int id = 0,number = 1, size = 2;
        if(pid != null){
            id = Integer.parseInt(pid);
        }
        if(pageNumber != null) {
            number = Integer.parseInt(pageNumber);
            if(number <= 0) {
                number = 1;
            }
        }
        if(pageSize != null) {
            size = Integer.parseInt(pageSize);
        }
        //查询好评
        //查询好评评论
        PageInfo goodComments = userCommentServiceImpl.selGoodUserComment(number, size, id);
        return goodComments;
    }

    /**
     * 中评数据查询
     */
    @ResponseBody
    @RequestMapping("selNormal")
    public PageInfo selNormal(String pid, String pageNumber, String pageSize) {
        int id = 0,number = 1, size = 2;
        if(pid != null){
            id = Integer.parseInt(pid);
        }
        if(pageNumber != null) {
            number = Integer.parseInt(pageNumber);
            if(number <= 0) {
                number = 1;
            }
        }
        if(pageSize != null) {
            size = Integer.parseInt(pageSize);
        }
        //查询中评
        PageInfo normalComments = userCommentServiceImpl.selNormalUserComment(number,size,id);
        return normalComments;
    }

    /**
     * 差评数据查询
     */
    @ResponseBody
    @RequestMapping("selBad")
    public PageInfo selBad(String pid, String pageNumber, String pageSize) {
        int id = 0,number = 1, size = 2;
        if(pid != null){
            id = Integer.parseInt(pid);
        }
        if(pageNumber != null) {
            number = Integer.parseInt(pageNumber);
        }
        if(pageSize != null) {
            size = Integer.parseInt(pageSize);
        }
        //查询差评
        PageInfo badComments = userCommentServiceImpl.selBadUserComment(number,size,id);
        return badComments;
    }

    /**
     * 评论点赞
     */
    @ResponseBody
    @RequestMapping("giveSupport")
    public String giveSupport(String cid,String current,HttpSession session) {
        Object user = session.getAttribute("user");
        if(user == null) {
            return "login";
        }
        int id = 0;
        int curr = 0;
        if(cid != null) {
            id = Integer.parseInt(cid);
        }
        if(current != null) {
            curr = Integer.parseInt(current);
        }
        curr++;
        //数据库更新赞数
        int res = userCommentServiceImpl.updateSupport(id, curr);
        if(res > 0) {
            return "success";
        }
        return "error";
    }
}
