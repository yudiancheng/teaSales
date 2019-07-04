package com.yu.controller;

import com.yu.pojo.User;
import com.yu.pojo.UserAddress;
import com.yu.pojo.UserComment;
import com.yu.service.ShoppingCarService;
import com.yu.service.UserService;
import com.yu.util.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserCenterController {

    @Resource
    UserService userServiceImpl;
    @Resource
    ShoppingCarService shoppingCarServiceImpl;

    /**
     * 用户信息修改模块
     */
    @RequestMapping("updUserInfo")
    @ResponseBody
   public String updUserInfo(HttpServletRequest req) {
       //获取数据和准备数据
       User user = (User)req.getSession().getAttribute("user");
       String username = req.getParameter("username");
       String realName = req.getParameter("realName");
       String sex = req.getParameter("sex");
       String phone = req.getParameter("phone");
       String email = req.getParameter("email");
       HashMap<String, Object> info = new HashMap<>();
       info.put("id",user.getId());
       info.put("username", username);
       info.put("realName", realName);
       info.put("sex", sex);
       info.put("phone", phone);
       info.put("email", email);
       //调用业务层方法
       int res = userServiceImpl.updateUserInfo(info);
       if(res > 0) {
           return "成功";
       } else {
           return "失败";
       }
   }

    /**
     * 上传头像
     */
    @RequestMapping("headImgUpload")
    @ResponseBody
    public String headImgUpload(String image, HttpServletRequest req, HttpSession session)throws IOException {

        //设置上传头像
         User user = (User)session.getAttribute("user");
         String userName = user.getUsername();
        String dataPrix = "";
        String data = "";
        String suffix = "";
        String [] d = image.split("base64,");
        if(d != null && d.length == 2){
            dataPrix = d[0];
            data = d[1];
        }
        if("data:image/jpeg;".equalsIgnoreCase(dataPrix)){//data:image/jpeg;base64,base64编码的jpeg图片数据
            suffix = ".jpg";
        } else if("data:image/x-icon;".equalsIgnoreCase(dataPrix)){//data:image/x-icon;base64,base64编码的icon图片数据
            suffix = ".ico";
        } else if("data:image/gif;".equalsIgnoreCase(dataPrix)){//data:image/gif;base64,base64编码的gif图片数据
            suffix = ".gif";
        } else if("data:image/png;".equalsIgnoreCase(dataPrix)){//data:image/png;base64,base64编码的png图片数据
            suffix = ".png";
        }
        String fileName = "e:/headImg/"+userName+suffix;
        byte[] bytes = Base64Utils.decodeFromString(data);

        FileUtils.writeByteArrayToFile(new File(fileName),bytes);
        //调用业务层方法更新头像
        int res = userServiceImpl.updateHeadImg(user.getId(),userName + suffix);
        if(res > 0) {
            return "ok";
        } else {
            return "error";
        }
    }

    /**
     * 修改密码
     */
    @ResponseBody
    @RequestMapping("updatePass")
    public String updatePass(HttpServletRequest req,HttpSession session) {
        String password = req.getParameter("password");
        String repass = req.getParameter("repass");
        //判断用户输入的原密码是否和当前密码一致
        User user = (User) session.getAttribute("user");
        String current = user.getPassword();
        if(!password.equals(current)) {
            return "失败";
        }
        int res = userServiceImpl.updateUserPass(user.getId(), repass);
        if(res > 0) {
            return "成功";
        }
        return "失败";
    }


    /**
     * 用户收藏（分页）
     */
    @RequestMapping("userCollectByPage")
    public String userCollectByPage(String pageNumber,String pageSize,HttpSession session,HttpServletRequest req) {
        int size = 6;
        int number = 1;
        if(pageSize != null) {
            size = Integer.parseInt(pageSize);
        }
        if(pageNumber != null) {
            number = Integer.parseInt(pageNumber);
        }
        User user = (User) session.getAttribute("user");
        PageInfo pageInfo = userServiceImpl.selUserCollectByUidLimitPage(user.getId(), number, size);
        session.setAttribute("collectPageInfo",pageInfo);
        return "myCollect";
    }

    /**
     * 用户添加收货地址
     */
    @RequestMapping("insAddress")
    @ResponseBody
    public String insAddress(HttpServletRequest req,HttpSession session) throws UnsupportedEncodingException {
        //获取数据
        User user = (User)session.getAttribute("user");
        String realName = req.getParameter("realName");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String address = req.getParameter("address");
        String postNumber = req.getParameter("postNumber");
        String phone = req.getParameter("phone");
        //数据存放到对象里
        UserAddress userAddress = new UserAddress();
        userAddress.setUserId(user.getId());
        userAddress.setReceiverName(realName);
        userAddress.setLocation(province+city);
        userAddress.setDetailedAddress(address);
        userAddress.setPostalCode(postNumber);
        userAddress.setPhone(phone);
        //调用业务层方法插入数据
       int res = userServiceImpl.insAddressForUser(userAddress);
        if(res > 0) {
            return "成功";
        }
        return "失败";
    }

    /**
     * 查询用户收货地址
     */
    @RequestMapping("selUserAddress")
    public String selUserAddress(HttpSession session) {
        User user = (User)session.getAttribute("user");
        List<UserAddress> userAddresses = userServiceImpl.selAddressByUid(user.getId());
        if(userAddresses != null) {
            session.setAttribute("userAddress", userAddresses);
        }
        return "receiveAddress";
    }

    /**
     * 修改收获地址
     */
    @RequestMapping("updUserAddress")
    @ResponseBody
    public String updUserAddress(HttpServletRequest req,HttpSession session)throws UnsupportedEncodingException {
        //获取和准备数据
        User u = (User)session.getAttribute("user");
        String id = req.getParameter("hidden");
        int aid = Integer.parseInt(id);
        String name= req.getParameter("realName");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String address = req.getParameter("address");
        String postNumber = req.getParameter("postNumber");
        String phone = req.getParameter("phone");
        UserAddress userAddress = new UserAddress();
        userAddress.setId(aid);
        userAddress.setUserId(u.getId());
        userAddress.setReceiverName(name);
        userAddress.setLocation(province+city);
        userAddress.setDetailedAddress(address);
        userAddress.setPostalCode(postNumber);
        userAddress.setPhone(phone);
        //修改数据
        int res = userServiceImpl.updUserAddress(userAddress);
        if(res > 0) {
            return "成功";
        }
        return "失败";
    }

    /**
     * 删除收货地址
     */
    @RequestMapping("delAddress")
    @ResponseBody
    public String delAddress(HttpServletRequest req) {
        String hidden = req.getParameter("hidden");
        int id = 0;
        if(hidden != null) {
            id = Integer.parseInt(hidden);
        }
        int res = userServiceImpl.delUserAddress(id);
        if(res > 0) {
            return "成功";
        }
        return "失败";
    }

    /**
     * 用户评论
     */
    @RequestMapping("comment")
    public String comment(HttpSession session) {
        User u = (User)session.getAttribute("user");
        //查询用户的评论信息
        List<UserComment> userComments = userServiceImpl.selCommentByUid(u.getId());
        session.setAttribute("userComment",userComments);
        return "myComments";
    }

    /**
     * 删除评论
     */
    @RequestMapping("delComment")
    @ResponseBody
    public String delComment(HttpSession session,String id) {
        int pid = Integer.parseInt(id);
        int res = userServiceImpl.delUserComment(pid);
        if(res > 0) {
            return "成功";
        }
        return "失败";
    }


}
