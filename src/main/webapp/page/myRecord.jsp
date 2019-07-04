<%@ page import="com.yu.pojo.Shopping" %>
<%@ page import="com.yu.pojo.User" %>
<%@ page import="com.yu.service.ShoppingCarService" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="java.util.List"%>
<%@ page import="com.yu.mapper.ShoppingMapper" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ServletContext sc = pageContext.getServletContext();
    ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);
    ShoppingCarService shoppingCarService = (ShoppingCarService) ac.getBean("shoppingCarServiceImpl");
    Object user = session.getAttribute("user");
    User u = null;
    if(user != null) {
        u = (User)user;
        Shopping shopping = shoppingCarService.selShoppingByUid(u.getId());
        session.setAttribute("shoppingCar",shopping);
    }
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/common.css" rel="stylesheet" tyle="text/css" />
    <script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="js/shopCar.js" type="text/javascript"></script>
    <title>用户中心</title>
</head>
<body>
<!--顶部样式-->
<div id="top">
    <div class="top">
        <div class="Collection"><em></em><a href="#">收藏我们</a></div>
        <div class="hd_top_manu clearfix">
            <ul class="clearfix">
                <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！<a <c:choose> <c:when test="${empty user}">href="loginPage.jsp" </c:when><c:otherwise>href="page/myRecord.jsp"</c:otherwise></c:choose> class="red"><c:out value="${user.realName}">[请登录]</c:out></a> 新用户<a href="registerPage.jsp" class="red">[免费注册]</a></li>
                <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="page/myOrder.jsp">我的订单</a></li>
                <li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="page/shoppingCar.jsp">购物车(<b><c:out value="${fn:length(shoppingCar.shoppingProducts)}">0</c:out></b>)</a> </li>
                <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="javascript:void(0);">联系我们</a></li>
                <li class="hd_menu_tit list_name" data-addclass="hd_menu_hover"><a href="javascript:void(0);" class="hd_menu">客户服务</a>
                    <div class="hd_menu_list">
                        <ul>
                            <li><a href="#">常见问题</a></li>
                            <li><a href="#">在线退换货</a></li>
                            <li><a href="#">在线投诉</a></li>
                            <li><a href="#">配送范围</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!--logo和搜索样式-->
<div id="header"  class="header">
    <div class="logo">
        <a href="#"><img src="images/logo.png" /></a>
        <div class="phone">
            免费咨询热线:<span class="telephone">400-3454-343</span>
        </div>
    </div>
    <div class="Search">
        <p><input name="" type="text"  class="text"/><input name="" type="submit" value=""  class="Search_btn"/></p>
        <p class="Words"><a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a href="#">橙子</a><a href="#">苹果</a></p>
    </div>
</div>
<!--导航栏样式-->
<div id="Menu" class="clearfix">
    <div class="Menu_style">
        <div id="allSortOuterbox" class="display">
            <div class="Category"><a href="#" class="Menu_img"><em></em></a></div>
            <div class="hd_allsort_out_box_new">
                <!--左侧栏目开始-->
                <div class="Menu_list">
                    <div class="menu_title">茶叶品种</div>
                    <a href="#">贡茗茶</a><a href="#">冠茗茶</a><a href="#">佳茗茶</a><a href="#">珍茗茶</a><a href="#">绿茶</a><a href="#">毛尖茶</a>
                </div>
                <div class="Menu_list">
                    <div class="menu_title">茶叶价格</div>
                    <a href="#">100以下</a><a href="#">100-200</a><a href="#">200-400</a><a href="#">400-600</a><a href="#">600-900</a><a href="#">1000以上</a>
                </div>
                <div class="Menu_list">
                    <div class="menu_title">推荐茶叶</div>
                    <ul class="recommend">
                        <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
                        <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
                        <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
                        <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
                        <li><a href="#" title="[2015年新茶]巴山雀舌毛尖茶新茶，含硒">[2015年新茶]巴山雀舌...</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="Navigation" id="Navigation">
            <ul class="Navigation_name">
                <li><a class="nav_on" id="mynav1"  href="index.html"><span>首页</span></a></li>
                <li><a class="nav_on" id="mynav2"  href="#"><span>巴山雀舌</span></a></li>
                <li><a class="nav_on" id="mynav3"  href="#"><span>贡茗</span></a></li>
                <li><a class="nav_on" id="mynav4"  href="#"><span>冠茗</span></a></li>
                <li><a class="nav_on" id="mynav5"  href="#"><span>臧芝堂（藏茶）</span></a></li>
                <li><a class="nav_on" id="mynav6"  href="#"><span>大巴山（茗茶）</span></a></li>
                <li><a class="nav_on" id="mynav7"  href="#"><span>达州（茶）</span></a></li>
                <li><a class="nav_on" id="mynav8"  href="#"><span>活动</span></a></li>
                <li><a class="nav_on" id="mynav8"  href="#"><span>联系我们</span></a></li>
            </ul>
        </div>
        <script>$("#Navigation").slide({titCell:".Navigation_name li"});</script>
        <!--购物车-->
        <!--购物车-->
        <div class="hd_Shopping_list" id="Shopping_list">
            <div class="s_cart"><em></em><a href="#">我的购物车</a> <i class="ci-right">&gt;</i><i class="ci-count totalNum" id="shopping-amount">￥<c:out value="${shoppingCar.totalValue}">0</c:out></i></div>
            <div class="dorpdown-layer">
                <div class="spacer"></div>
                <ul class="p_s_list">
                    <div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>
                    <!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
                    <c:if test="${not empty shoppingCar.shoppingProducts}">
                        <c:forEach items="${shoppingCar.shoppingProducts}" var="products">
                            <li class="">
                                <input type="hidden" name="car-pid" value="${products.productId}"/>
                                <div class="img"><img src="small/${products.product.productDetailed.smallImg}"></div>
                                <div class="content"><p><a href="#">产品名称</a></p><p>${products.product.name}</p></div>
                                <div class="Operations">
                                    <p class="Price">￥${products.product.ourPrice}</p>
                                    <a class="delButton">删除</a></div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
                <div class="Shopping_style">
                    <div class="p-total">共<b class="proNum" id="proNum"><c:out value="${fn:length(shoppingCar.shoppingProducts)}">0</c:out></b>件商品　共计<strong class="totalNum">￥<c:out value="${shoppingCar.totalValue}">0</c:out> </strong></div>
                    <a href="page/shoppingCar.jsp" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--内页样式-->
<div class="user_style clearfix" id="user">
    <div class="user_title"><em></em>用户中心</div>
    <!--用户中心布局样式-->
    <!--栏目名称-->
    <div class="user_left">
        <div class="user_info">
            <div class="Head_portrait"><img src="e:/headImg/${user.headImg}" width="80px" height="80px"/><!--头像区域--></div>
            <div class="user_name">用户蜜甘草<a href="page/userInfo.jsp">[个人资料]</a></div>
        </div>
        <ul class="Section">
            <li><a href="page/myRecord.jsp"><em></em><span>我的特色馆</span></a></li>
            <li><a href="page/userInfo.jsp"><em></em><span>个人信息</span></a></li>
            <li><a href="page/changePwd.jsp"><em></em><span>修改密码</span></a></li>
            <li><a href="page/myOrder.jsp"><em></em><span>我的订单</span></a></li>
            <li><a href="comment"><em></em><span>我的评论</span></a></li>
            <li><a href="page/userIntegral.jsp"><em></em><span>我的积分</span></a></li>
            <li><a href="userCollectByPage"><em></em><span>我的收藏</span></a></li>
            <li><a href="selUserAddress"><em></em><span>收货地址管理</span></a></li>
        </ul>
    </div>
    <!--右侧内容展示-->
    <div class="right_style r_user_style">
        <div class="Notice"><span>系统最新公告:</span>为了更好地服务于【每日鲜】的会员朋友及读者 发表意见。</div>
        <!--用户基本信息-->
        <div class="clearfix">
            <div class="user_info clearfix">
                <div class="user_name_info">
                    <ul>
                        <li class="us_one">
                            <div class="name left">用户名:<b>${user.username}</b>,  欢迎你 [<a href="page/changePwd.jsp">修改密码</a>]  </div>
                            <div class="right time"> <span>上次访问时间：${user.lastVisit}</span></div>
                        </li>
                        <li class="us_two">
                            <dl><dt class="left">账户余额：</dt><dd>￥<b>${user.balance}</b>元</dd></dl>
                            <dl><dt class="left">账户积分：</dt><dd><b>${getCount}</b>分 &nbsp;<a href="#">[积分商城]</a></dd></dl>
                            <dl><dt class="left">用户等级：</dt><dd><b>${user.userLevel}</b></dd></dl>
                        </li>
                        <li class="us_Order">
                            <dl><dt class="left">完成订单：</dt><dd><a href="#">${user.successOrder}</a></dd></dl>
                            <dl><dt class="left">未完成订单：</dt><dd><a href="#">${user.unfinishedOrder}</a></dd></dl>
                        </li>
                        <li class="us_four">
                            <div class="Address"><em></em><a href="#">地址管理&gt;</a></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--订单-->
        <div class="user_info_p_s clearfix">
            <div class="left_user_cont">
                <div class="us_Orders left clearfix">
                    <div class="Orders_name">
                        <div class="title_name">
                            <div class="Records">购买记录</div>
                            <div class="right select">
                                只记录你最近30天的购买记录   </div>
                        </div>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <th>产品名称</th>
                            <th>数量</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${user.buyRecords}" var="records">
                        <tr>
                            <td class="img">
                                <a href="#"><span class="left"><img src="products/${records.product.image}"></span>
                                    <span class="left">${records.product.name}</span></a>
                            </td>
                            <td>${records.nums}</td>
                            <td><c:choose>
                                <c:when test="${records.status == 1}">已完成</c:when>
                                <c:when test="${records.status == 2}">待收货</c:when>
                                <c:when test="${records.status == 3}">待发货</c:when>
                                <c:when test="${records.status == 4}">正在退款</c:when>
                            </c:choose></td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="us_jls">共<c:out value="${fn:length(sessionScope.get('buyRecords'))}">0</c:out>条记录</div>
                </div>
            </div>
            <!--右侧记录样式-->
            <div class="right_user_recording">
                <div class="us_Record">
                    <div id="Record_p" class="Record_p">
                        <div class="title_name">
                            <span class="name left">浏览历史</span>
                            <span class="pageState right"><span>1</span>/${fn:length(sessionScope.get('scanRecords'))}</span>		</div>

                        <div class="hd">
                            <a class="next">&lt;</a>
                            <a class="prev">&gt;</a>						</div>
                        <div class="bd">
                            <ul >
                                <c:forEach items="${user.scanRecords}" var="scanRecords">
                                <li class="clone">
                                    <div class="p_width">
                                        <div class="pic"><a href=""><img src="products/${scanRecords.product.image}"></a></div>
                                        <div class="title"><a href="#">${scanRecords.product.name}</a></div>
                                        <div class="Purchase_info"><span class="p_Price">${scanRecords.product.ourPrice}</span> <a href="#" class="Purchase">立即购买</a></div>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul></div>

                    </div>
                    <script type="text/javascript">jQuery("#Record_p").slide({ mainCell:".bd ul",effect:"leftLoop",vis:1,autoPlay:false });</script>
                </div>
            </div>
        </div>
        <!--收藏商品-->
        <div class="Collections_p">
            <div class="title_name">收藏的商品</div>
            <div id="Collect_Products" class="Collect_Products">
                <div class="hd">
                    <a class="next">&lt;</a>
                    <a class="prev">&gt;</a>
                </div>
                <div class="bd">
                    <ul>
                        <c:forEach items="${user.userCollects}" var="collects">
                        <li class="clone" style="float: left; width: 160px;">
                            <div class="pic"><a href=""><img src="products/${collects.product.image}"></a></div>
                            <div class="title"><a href="#">${collects.product.name}</a></div>
                            <div class="p_Price">${collects.product.ourPrice}</div>
                        </li>
                        </c:forEach>
                       </ul></div>
            </div>

            <script type="text/javascript">jQuery("#Collect_Products").slide({ mainCell:".bd ul",effect:"leftLoop",vis:5,autoPlay:false });</script>
        </div>
        <!--结束-->
    </div>
</div>
<div class="footerbox">
    <!--友情链接-->
    <div class="Links">
        <div class="link_title">友情链接</div>
        <div class="link_address"><a href="#">四川茶叶协会</a>  <a href="#">链接地址</a>  <a href="#">链接地址</a>  <a href="#">链接地址 </a>   <a href="#">链接地址</a> <a href="#">链接地址</a> <a href="#">链接地址</a></div>
    </div>
</div>
<!--底部样式-->
<div class="footer">
    <div class="streak"></div>
    <div class="footerbox clearfix">
        <div class="left_footer">
            <div class="img"><img src="images/img_33.png" /></div>
            <div class="phone">
                <h2>服务咨询电话</h2>
                <p class="Numbers">400-3455-334</p>
            </div>
        </div>
        <div class="right_footer">
            <dl>
                <dt><em class="icon_img"></em>购物指南</dt>
                <dd><a href="#">怎样购物</a></dd>
                <dd><a href="#">积分政策</a></dd>
                <dd><a href="#">会员优惠</a></dd>
                <dd><a href="#">订单状态</a></dd>
                <dd><a href="#">产品信息</a></dd>
                <dd><a href="#">怎样购物</a></dd>
            </dl>
            <dl>
                <dt><em class="icon_img"></em>配送方式</dt>
                <dd><a href="#">快递资费及送达时间</a></dd>
                <dd><a href="#">快递覆盖地区查询</a></dd>
                <dd><a href="#">验货与签收</a></dd>
                <dd><a href="#">订单状态</a></dd>
                <dd><a href="#">产品信息</a></dd>
                <dd><a href="#">怎样购物</a></dd>
            </dl>
            <dl>
                <dt><em class="icon_img"></em>配送方式</dt>
                <dd><a href="#">货到付款</a></dd>
                <dd><a href="#">支付宝</a></dd>
                <dd><a href="#">财付通</a></dd>
                <dd><a href="#">网银支付</a></dd>
                <dd><a href="#">银联支付</a></dd>
            </dl>
            <dl>
                <dt><em class="icon_img"></em>售后服务</dt>
                <dd><a href="#">退换货原则</a></dd>
                <dd><a href="#">退换货要求与运费规则</a></dd>
                <dd><a href="#">退换货流程</a></dd>
            </dl>
            <dl>
                <dt><em class="icon_img"></em>关于我们</dt>
                <dd><a href="#">关于我们</a></dd>
                <dd><a href="#">友情链接</a></dd>
                <dd><a href="#">媒体报道</a></dd>
                <dd><a href="#">新闻动态</a></dd>
                <dd><a href="#">企业文化</a></dd>

            </dl>
        </div>
    </div>
    <div class="slogen">
        <div class="footerbox clearfix ">
            <ul class="wrap">
                <li>
                    <a href="#"><img src="images/icon_img_02.png" data-bd-imgshare-binded="1"></a>
                    <b>正品保证</b>
                    <span>正品行货 放心选购</span>
                </li>
                <li><a href="#"><img src="images/icon_img_03.png" data-bd-imgshare-binded="2"></a>
                    <b>满68元包邮</b>
                    <span>购物满68元，免费快递</span>
                </li>
                <li>
                    <a href="#"><img src="images/icon_img_04.png" data-bd-imgshare-binded="3"></a>
                    <b>厂家直供</b>
                    <span>价格更低，质量更可靠</span>
                </li>
                <li>
                    <a href="#"><img src="images/icon_img_05.png" data-bd-imgshare-binded="4"></a>
                    <b>权威认证</b>
                    <span>政府扶持单位，安全保证</span>
                </li>
            </ul>
        </div>
    </div>
    <div class="footerbox Copyright">
        <p><a href="#">关于我们</a> | <a href="#">隐私申明</a> | <a href="#">成为供应商</a> | <a href="#">茶叶</a> | <a href="#">博客</a> |<a href="#">友情链接</a> | <a href="#">网站地图</a></p>
        <p>Copyright 2010 - 2015 巴山雀舌 四川巴山雀舌茗茶实业有限公司 zuipin.cn All Rights Reserved </p>
        <p>川ICP备10200063号-1</p>
        <a href="#" class="return_img"></a>
    </div>
</div>
<!--右侧菜单栏购物车样式-->
<div class="fixedBox">
    <ul class="fixedBoxList">
        <li class="fixeBoxLi user"><a href="#"> <span class="fixeBoxSpan"></span> <strong>用户</strong></a> </li>
        <li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs">
            <p class="good_cart">0</p>
            <span class="fixeBoxSpan"></span> <strong>购物车</strong>
            <div class="cartBox">
                <div class="bjfff"></div><div class="message">购物车内暂无商品，赶紧选购吧</div>    </div></li>
        <li class="fixeBoxLi Service "> <span class="fixeBoxSpan"></span> <strong>客服</strong>
            <div class="ServiceBox">
                <div class="bjfffs"></div>
                <dl onclick="javascript:;">
                    <dt><img src="images/Service1.png"></dt>
                    <dd><strong>QQ客服1</strong>
                        <p class="p1">9:00-22:00</p>
                        <p class="p2"><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a></p>
                    </dd>
                </dl>
                <dl onclick="javascript:;">
                    <dt><img src="images/Service1.png"></dt>
                    <dd> <strong>QQ客服1</strong>
                        <p class="p1">9:00-22:00</p>
                        <p class="p2"><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a></p>
                    </dd>
                </dl>
            </div>
        </li>
        <li class="fixeBoxLi code cart_bd " style="display:block;" id="cartboxs">
            <span class="fixeBoxSpan"></span> <strong>微信</strong>
            <div class="cartBox">
                <div class="bjfff"></div>
                <div class="QR_code">
                    <p><img src="images/erweim.jpg" width="150px" height="150px" style=" margin-top:10px;" /></p>
                    <p>微信扫一扫，关注我们</p>
                </div>
            </div>
        </li>

        <li class="fixeBoxLi Home"> <a href="./"> <span class="fixeBoxSpan"></span> <strong>收藏</strong> </a> </li>
        <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
    </ul>
</div>

</body>
</html>
