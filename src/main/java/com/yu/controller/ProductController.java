package com.yu.controller;

import com.yu.pojo.*;
import com.yu.service.ProductService;
import com.yu.service.ShoppingCarService;
import com.yu.service.UserCommentService;
import com.yu.service.UserService;
import com.yu.util.PageInfo;
import com.yu.util.ProductNum;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class ProductController {

    @Resource
    ProductService productServiceImpl;
    @Resource
    ShoppingCarService shoppingCarServiceImpl;
    @Resource
    UserCommentService userCommentServiceImpl;
    @Resource
    UserService userServiceImpl;

    /**
     * 准备主页数据
     */
    @RequestMapping("/")
    public String prepareIndex(HttpServletRequest request) {
        ServletContext context = request.getServletContext();
        //热销商品展示
        int rank = 5;//展示商品个数
        List<Product> hotPro = productServiceImpl.selProductByHot(rank);
        context.setAttribute("hotProducts", hotPro);
        //查询按时间排名前几名的商品
        List<Product> timePro = productServiceImpl.selProductByTime(rank);
        context.setAttribute("timeProducts", timePro);
        //查询促销商品
        List<ProductPromotion> productPromotions = productServiceImpl.selPromotion();
        context.setAttribute("promotions", productPromotions);
        //茶叶随机展示
        List<Product> products = productServiceImpl.selProductLimitNumber();
        context.setAttribute("products", products);
        //茶具随机展示
        List<Product> tools = productServiceImpl.selToolsLimitNumber();
        context.setAttribute("tools", tools);
        long current = System.currentTimeMillis();
        String target = "2019-09-01 0:0:0:0";
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = format.parse(target);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        context.setAttribute("time",current);
        context.setAttribute("targetTime",date.getTime());
        return "forward:index.jsp";
    }

    /**
     * 商品详情页跳转
     */
    @RequestMapping("detailed")
    public String detailed(String pageNumber, String pageSize, HttpServletRequest req,HttpSession session) {
        //分页数据
        int number = 1;
        int size = 4;
        if (pageNumber != null && pageNumber != "") {
            number = Integer.parseInt(pageNumber);
            System.out.println(number);
            if(number <= 0) {
                number = 1;
            }
        }
        if (pageSize != null && pageSize != "") {
            size = Integer.parseInt(pageSize);
        }
        //获取产品id
        String pid = req.getParameter("pid");
        int id = 1;
        if (pid != null) {
            id = Integer.parseInt(pid);
        }
        Object user = session.getAttribute("user");
        User u = null;
        if(user != null) {
            u = (User)user;
            //插入用户的浏览记录
            userServiceImpl.insScanRecord(u.getId(),id);
            //更新用户的浏览记录
            List<ScanRecord> scanRecordList = userServiceImpl.selListUserRecord(u.getId());
            req.setAttribute("scanRecordList",scanRecordList);
        }
        //查询商品细节信息
        ProductDetailed productDetailed = productServiceImpl.selDetailedByPid(id);
        //查询商品的评论
        PageInfo userComments = userCommentServiceImpl.selCommentByPid(number, size, id);
        //查询商品的收藏个数
        int collect = productServiceImpl.selCollectCountByPid(id);
        //查询商品评论条数
        int comment = userCommentServiceImpl.selCommentCountByPid(id);
        //查询商品的好评数
        int goodCount = userCommentServiceImpl.selGoodCommentCount(id);
        //查询商品的中评数
        int normalCount = userCommentServiceImpl.selNormalCommentCount(id);
        //查询商品的差评数
        int badCount = userCommentServiceImpl.selBadCommentCount(id);
        //计算商品的好评率
        double goodRate = 0.0d;
        DecimalFormat df = new DecimalFormat("#.0000");
        if (goodCount != 0) {
            goodRate = Double.parseDouble(df.format((double) goodCount / comment));
        }
        //计算商品的中评率
        double normalRate = 0.0d;
        if(normalCount != 0) {
            normalRate = Double.parseDouble(df.format((double) normalCount / comment));
        }
        //计算商品的差评率
        double badRate = 0.0d;
        if(badCount != 0) {
            badRate = Double.parseDouble(df.format((double) badCount / comment));
        }
        //计算页数
        int page = comment+3/4;
        userComments.setPage(page);
        //保存数据
        req.setAttribute("collectCount", collect);
        req.setAttribute("detailedProduct", productDetailed);
        req.setAttribute("commentCount", comment);
        req.setAttribute("goodCount", goodCount);
        req.setAttribute("normalCount",normalCount);
        req.setAttribute("badCount",badCount);
        req.setAttribute("goodRate", goodRate);
        req.setAttribute("normalRate", normalRate);
        req.setAttribute("badRate", badRate);
        req.setAttribute("userComments", userComments);
        return "productDetailed";
    }



    /**
     * 购物车删除商品
     */
    @RequestMapping("delProFromCar")
    @ResponseBody
    public String delProFromCar(int pid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        int uid = user.getId();
        int res = shoppingCarServiceImpl.delProFromCar(pid, uid);
        if (res > 0) {
            return "成功";
        }
        return "失败";
    }

    /**
     * 购物车添加商品
     */
    @ResponseBody
    @RequestMapping("insProToCar")
    public String insProToCar(int pid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        int res = 0;
        if (user != null) {
            //更新数据库
            res = shoppingCarServiceImpl.insProToCarForUser(user.getId(), pid);
        }
        if (res > 0) {
            return "成功";
        }
        return "失败";
    }

    /**
     * 更新购物车中商品的数目
     */
    @ResponseBody
    @RequestMapping("updShoppingTotal")
    public String updShoppingTotal(@RequestBody List<ProductNum> productNum, HttpSession session) {
        Object u = session.getAttribute("user");
        User user = null;
        if (u != null) {
            user = (User) u;
            int id = user.getId();
            for (ProductNum num : productNum) {
                System.out.println(num);
                shoppingCarServiceImpl.updateProductNum(id, num.getPid(), num.getNum());
            }

        }
        return "success";
    }

    /**
     * 商品收藏
     */
    @ResponseBody
    @RequestMapping("collect")
    public String collect(int pid, HttpSession session) {
        Object u = session.getAttribute("user");
        User user = null;
        if (u != null) {
            //插入数据
            user = (User) u;
            int uid = user.getId();
            int res = productServiceImpl.insProToMyCollect(uid, pid);
            if (res > 0) {
                return "success";
            } else {
                return "error";
            }
        }
        return "login";
    }

}
