package com.yu.controller;

import com.yu.pojo.*;
import com.yu.service.ShoppingCarService;
import com.yu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@Controller
public class LoginRegisterController {
    @Resource
    UserService userServiceImpl;
    @Resource
    ShoppingCarService shoppingCarServiceImpl;

    /**
     * 登录模块
     */
    @RequestMapping("login")
    public String login(String username, String password, HttpSession session,HttpServletRequest req) {
        //调用业务层方法
        User user = userServiceImpl.selUserByPwd(username, password);
        if (user != null) {
            //shoppingCarServiceImpl.delProFromCar(3,1);
            int id = user.getId();
            /************设置用户上一次访问时间****************/
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar instance = Calendar.getInstance();
            String now = sdf.format(instance.getTime());
            //获取用户的上一次访问时间
            String time = user.getLastVisit();
            //当前时间更新到数据库
           userServiceImpl.updLastVisit(id, now);
            if (time == null) {
                //如果上一次访问时间为空的话 把当前时间设置到User
                user.setLastVisit(now);
            }
            /************账户积分**************/
            int getCount = 0;
            int useCount = 0;
            //调用业务层方法查询积分获取记录
            List<IntegralGetRecord> integralGetRecords = userServiceImpl.selIntegralGetRecordByUid(user.getId());
            List<IntegralUseRecord> integralUseRecords = userServiceImpl.selIntegralUseRecordByUid(user.getId());
                if(integralGetRecords != null) {
                    session.setAttribute("integralGetRecords", integralGetRecords);
                    System.out.println(integralGetRecords);
                    //计算已经获得的总积分
                    for(IntegralGetRecord getRecord:integralGetRecords) {
                        int num = getRecord.getIntegral();
                        getCount += num;
                    }
                    session.setAttribute("getCount",getCount);
            }
            if(integralUseRecords != null) {
                session.setAttribute("integralUseRecords", integralUseRecords);
                //计算已经使用的总积分
                for(IntegralUseRecord useRecord:integralUseRecords) {
                    Order order = useRecord.getOrder();
                    useCount += order.getTotal();
                }
                session.setAttribute("useCount",useCount);
            }


            /************会员等级****************/
            //根据当前积分查询对应会员等级
            String level = userServiceImpl.selUserLevelByIntegral(getCount);
            //判断积分对应等级是否与当前等级相符，如果不相符的话就更新，相符的话就不更新
            if (!level.equals(user.getUserLevel())) {
                //更新会员等级
                user.setUserLevel(level);
                userServiceImpl.updUserLevel(id, level);
            }
            /*************初始化购物车************/
            //查询本用户的购物车
            Shopping shopping = shoppingCarServiceImpl.selShoppingByUid(user.getId());
            //保存用户信息
            session.setAttribute("user", user);
            List<BuyRecord> buyRecordList = user.getBuyRecords();
            List<ScanRecord> scanRecordList = user.getScanRecords();
            session.setAttribute("buyRecords",buyRecordList);
            session.setAttribute("scanRecords",scanRecordList);
            session.setAttribute("shoppingCar",shopping);
            return "forward:/";
        }
        return "redirect:/loginPage.jsp";
    }

    /**
     * 注册模块
     */
    @ResponseBody
    @RequestMapping("register")
    public String register(HttpServletRequest req){
        //获取用户数据
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        //准备数据
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setPhone(phone);
        u.setEmail(email);
        u.setHeadImg("images/people.png");
        //调用业务层方法
        int res = userServiceImpl.insUser(u);
        if (res > 0) {
            //初始化用户购物车
            System.out.println(u.getId());
            shoppingCarServiceImpl.insShoppingCarForUser(u.getId());
            return "成功";
        } else {
            return "失败";
        }
    }


}
