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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <base href="<%=basePath%>>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/common.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="js/shopCar.js" type="text/javascript"></script>
    <title>茶叶商城首页</title>
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
            免费咨询热线:<span class="telephone">400-3404-000</span>
        </div>
    </div>
    <div class="Search">
        <p><input name="" type="text"  class="text"/><input name="" type="submit" value=""  class="Search_btn"/></p>
        <p class="Words"><a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a href="#">橙子</a><a href="#">苹果</a></p>
    </div>
</div>
<!--菜单栏样式-->
<!--导航栏样式-->
<div id="Menu" class="clearfix">
<div class="Menu_style">
    <div id="allSortOuterbox">
        <div class="Category"><a href="#" class="Menu_img"><em></em></a></div>
        <div class="hd_allsort_out_box_new">
            <!--左侧栏目开始-->
            <div class="Menu_list">
                <div class="menu_title">茶叶品种</div>
                <a href="Product_List.html">贡茗茶</a>
                <a href="Product_List.html">冠茗茶</a>
                <a href="Product_List.html">佳茗茶</a>
                <a href="Product_List.html">珍茗茶</a>
                <a href="Product_List.html">绿茶</a>
                <a href="Product_List.html">毛尖茶</a>
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
    <!--菜单栏-->
    <div class="Navigation" id="Navigation">
        <ul class="Navigation_name">
            <li><a class="nav_on" id="mynav1"  href="index.html"><span>首页</span></a></li>
            <li><a class="nav_on" id="mynav2"  href="Product_List.html"><span>巴山雀舌</span></a></li>
            <li><a class="nav_on" id="mynav3"  href="#"><span>贡茗</span></a></li>
            <li><a class="nav_on" id="mynav4"  href="#"><span>冠茗</span></a></li>
            <li><a class="nav_on" id="mynav5"  href="#"><span>臧芝堂</span></a></li>
            <li><a class="nav_on" id="mynav6"  href="#"><span>大巴山茶</span></a></li>
            <li><a class="nav_on" id="mynav7"  href="#"><span>达州（茶）</span></a></li>
            <li><a class="nav_on" id="mynav8"  href="Group_buy.htm"><span>今日团购</span></a></li>
            <li><a class="nav_on" id="mynav8"  href="#"><span>联系我们</span></a></li>
        </ul>
    </div>
    <script>$("#Navigation").slide({titCell:".Navigation_name li"});</script>
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
<!--幻灯片样式-->
<div class="Plates"  id="mian">
    <div class="bottom_style clearfix">
        <div class="image_display">
            <!--幻灯片样式-->
            <div class="slider">
                <div id="slideBox" class="slideBox">
                    <div class="hd">
                        <ul></ul>
                    </div>
                    <div class="bd">
                        <ul>
                            <li><a href="#" target="_blank"><img src="images/ad-1.png" /></a></li>
                            <li><a href="#" target="_blank"><img src="images/ad-3.jpg" /></a></li>
                        </ul>
                    </div>
                    <a class="prev" href="javascript:void(0)"></a>
                    <a class="next" href="javascript:void(0)"></a>
                </div>
                <script type="text/javascript">
                    jQuery(".slideBox").slide({titCell:".hd ul",mainCell:".bd ul",autoPlay:true,autoPage:true,interTime:9000});
                </script>
            </div>
        </div>
    </div>
    <!--内容样式-->
    <div class="Selling_list">
        <div id="slideBox_list" class="slideBox_list">
            <div class="hd">
                <span class="arrow"><a class="next"></a><a class="prev"></a></span>
                <ul><li><a href="#">热销产品</a></li><li><a href="#">新品推荐</a></li><li><a href="#">限时促销</a></li></ul>
            </div>
            <div class="bd">
                <ul>
                    <c:forEach items="${hotProducts}" var="hot">
                    <li class="s_Products hot" onclick="hotLink(${hot.id})" style="cursor: pointer">
                        <div class="Products_list_name">
                            <div class="img center"><img src="products/${hot.image}" style="width:235px;height: 186px"/></div>
                            <div class="title_name">${hot.name}</div>
                            <div class="s_Price clearfix">
                                <span class="Current_price">商城价<em>￥${hot.ourPrice}</em></span>
                                <span class="Original_Price">原价&nbsp;<em>${hot.marketPrice}</em></span>
                            </div>
                            <div class="p_comment">已有${hot.commentCount}人评论</div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <ul>
                    <c:forEach items="${timeProducts}" var="time">
                    <li class="s_Products" onclick="hotLink(${time.id})" style="cursor: pointer">
                        <em class="icon_new"></em>
                        <div class="Products_list_name">
                            <div class="img center"><img src="products/${time.image}" style="width:235px;height: 186px" /></div>
                            <div class="title_name">${time.name}</div>
                            <div class="s_Price clearfix">
                                <span class="Current_price">商城价<em>￥${time.ourPrice}</em></span>
                                <span class="Original_Price">原价&nbsp;<em>${time.marketPrice}</em></span>
                            </div>
                            <div class="p_comment">已有${time.commentCount}人评论</div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <ul>
                    <input type="hidden" value="${time}&${targetTime}" id="remainTime"/>
                    <c:forEach items="${promotions}" var="promotion">
                    <li class="s_Products" onclick="hotLink(${promotion.product.id})" style="cursor: pointer">
                        <div class="Products_list_name">
                            <div class="img center"><img src="products/${promotion.product.image}" style="width:235px;height: 186px" /></div>
                            <div class="title_name">${promotion.product.name}</div>
                            <div class="s_Price clearfix">
                                <span class="Current_price">商城价<em>￥${promotion.product.ourPrice}</em></span>
                                <span class="Original_Price">原价&nbsp;<em>${promotion.product.marketPrice}</em></span>
                            </div>
                            <div class="time">剩余时间：<i class="joind"></i>天<i class="joinh">5</i>时<i class="joinm">30</i>分<i class="joins">34</i>秒</div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <script type="text/javascript">jQuery(".slideBox_list").slide();</script>
    </div>
    <!--产品系列样式表-->
    <div class="Area">
        <div class="Area_title">
            <div class="name"><em class="icon_title"></em>巴山雀舌系列</div>
            <div class="right">
                <span class="p_link"><a href="#">贡茶</a><a href="#">毛尖茶</a><a href="#">佳茗茶</a><a href="#">贡茶</a></span>
                <span class="more"><a href="#">更多《</a></span>
            </div>
        </div>
        <div class="Area_list clearfix">
            <div class="Area_ad">
                <a href="#"><img src="images/AD-04.jpg" /></a>
                <a href="#"><img src="images/AD-03.jpg" /></a>
            </div>
            <div class="Area_p_list">
                <ul>
                    <c:forEach items="${products}" var="product">
                    <li class="s_Products" onclick="hotLink(${product.id})" style="cursor: pointer">
                        <div class="Area_product_c">
                            <div class="img center"><img src="products/${product.image}"  style="width:235px;height: 186px"/></div>
                            <div class="title_name">${product.name}</div>
                            <div class="s_Price clearfix">
                                <span class="Current_price">商城价<em>￥${product.ourPrice}</em></span>
                                <span class="Original_Price">原价&nbsp;<em>${product.marketPrice}</em></span>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <!--产品版块-->
    <div class="Area">
        <div class="Area_title">
            <div class="name"><em class="icon_title"></em>茶具系列</div>
            <div class="right">
                <span class="p_link"><a href="#">贡茶</a><a href="#">毛尖茶</a><a href="#">佳茗茶</a><a href="#">贡茶</a></span>
                <span class="more"><a href="#">更多《</a></span>
            </div>
        </div>
        <div class="Area_list clearfix">
            <div class="Area_ad">
                <a href="#"><img src="images/AD-05.jpg" /></a>
                <a href="#"><img src="images/AD-06.jpg" /></a>
            </div>
            <div class="Area_p_list">
                <ul>
                    <c:forEach items="${tools}" var="tools">
                    <li class="s_Products" onclick="hotLink(${tools.id})" style="cursor: pointer">
                        <div class="Area_product_c">
                            <div class="img center"><img src="products/${tools.image}"  style="width:235px;height: 186px"/></div>
                            <div class="title_name">${tools.name}</div>
                            <div class="s_Price clearfix">
                                <span class="Current_price">商城价<em>￥${tools.ourPrice}</em></span>
                                <span class="Original_Price">原价&nbsp;<em>${tools.marketPrice}</em></span>
                            </div>
                        </div>
                    </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>
    <!--信息内容样式-->
    <div class="bs_info_area clearfix">
        <!--百科知识-->
        <div class="know_how left">
            <div class="title_name"><em class="title_icon"></em>茶叶百科  <a href="">更多》</a></div>
            <div class="info_content">
                <uL>
                    <li><em class="info_icon"></em><a href="#">乌龙茶的功效与作用</a></li>
                    <li><em class="info_icon"></em><a href="#">大红袍属于什么茶</a></li>
                    <li><em class="info_icon"></em><a href="#">普洱茶的功效与作用</a></li>
                    <li><em class="info_icon"></em><a href="#">乌龙茶的功效与作用</a></li>
                    <li><em class="info_icon"></em><a href="#">绿茶的功效与作用</a></li>
                    <li><em class="info_icon"></em><a href="#">乌龙茶的功效与作用</a></li>
                    <li><em class="info_icon"></em><a href="#">铁观音属于什么茶</a></li>
                    <li><em class="info_icon"></em><a href="#">铁观音属于什么茶</a></li>
                </uL>
            </div>
        </div>
        <!--巴山雀舌信息-->
        <div class="info_about left">
            <div class="title_name"><em class="title_icon"></em>巴山介绍 <a href="#">查看详细》</a></div>
            <div class="info_content bs_about">
                <img src="images/logo_img_03.png" />
                巴山雀舌，品种：绿茶，产于四川省万源市，境内环境优美，土壤、气候特别适宜茶树生长，茶叶自然品质好，并天然富硒。巴山雀舌系采用其茶树的 高档原料精心制作而成，其品质特征外形扁平匀直，绿润带毫。经水冲泡叶底嫩绿明亮，香气鲜嫩持久，滋味醇爽回甘，汤色嫩绿明亮。<br />
                茶叶以富含硒而出名，抗氧化能力强，能清除水中污染毒素，故具有延缓衰老，防癌抗癌，抗高血压，防止色素堆积，增强机体活力，防辐射等作用。
                巴山雀舌”先后获得国家省部级以上奖项达60余次,产品曾先后获得“中国文化名茶”、“四川省十大名茶”、“四川省名牌产品”...
            </div>
        </div>
        <!--新闻中心-->
        <div class="mews right">
            <div class="title_name"><em class="title_icon"></em>文化底蕴<a href="#">更多》</a></div>
            <div class="info_content news">
                <ul>
                    <li class="Headlines_news">
                        <a href="#" class="news_img"><img src="images/news_img.jpg" /></a>
                        <a href="#">1991年“七·五”星火科技成果巴山雀舌获金奖江总书记视...</a>
                        <p class="news_Profile">星火科技成果巴山雀舌获金奖江总书记视察巴山雀舌展台</p>
                    </li>
                    <li><a href="#">006年11月巴山雀舌获“四川省十大名茶”</a></li>
                    <li><a href="#">2007年十月中国食品协会授予万源市“中国富硒...</a></li>
                    <li><a href="#">张爱萍将军为巴山雀舌提字</a></li>
                    <li><a href="#">巴山雀舌茶历史可追溯到西周年代</a></li>
                </ul>
            </div>
        </div>
    </div>
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
                <p class="Numbers">400-0000-000</p>
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
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var setTimer = null;
        //执行函数部分
        var curr = $("#remainTime").val().split("&")[0];
        var target = $("#remainTime").val().split("&")[1];
        var chazhi = target - curr;
        alert(chazhi);
        countFunc(chazhi);
        setTimer = setInterval(function() {
            chazhi = chazhi - 1000;
            countFunc(chazhi);
        }, 1000);
        function countFunc(leftTime) {
            if(leftTime >= 0) {
                var days = parseInt(leftTime / 1000 / 60 / 60 / 24, 10); //计算剩余的天数
                var hours = parseInt(leftTime / 1000 / 60 / 60 % 24, 10); //计算剩余的小时
                var minutes = parseInt(leftTime / 1000 / 60 % 60, 10); //计算剩余的分钟
                var seconds = parseInt(leftTime / 1000 % 60, 10); //计算剩余的秒数
                days = checkTime(days);
                hours = checkTime(hours);
                minutes = checkTime(minutes);
                seconds = checkTime(seconds);
                $(".joind").html(days);
                $(".joinh").html(hours);
                $(".joinm").html(minutes);
                $(".joins").html(seconds);
            } else {
                clearInterval(setTimer);
                $(".joind").html("00");
                $(".joinh").html("00");
                $(".joinm").html("00");
                $(".joins").html("00");
            }
        }
        function checkTime(i) { //将0-9的数字前面加上0，例1变为01
            if(i < 10) {
                i = "0" + i;
            }
            return i;
        }
    });

    function hotLink(id) {
        window.location.href = "detailed?pid=" + id;
    }
</script>
</body>
</html>
