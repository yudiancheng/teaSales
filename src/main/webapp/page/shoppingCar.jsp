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
    <base href="<%=basePath%>>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/common.css" rel="stylesheet" tyle="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="js/shopCar.js" type="text/javascript"></script>
    <script src="js/finalCar.js" type="text/javascript"></script>
    <!--[if IE 7]>
    <link rel="stylesheet" href="css/font-awesome-ie7.min.css">
    <![endif]-->
    <title>购物车</title>
</head>
<!--宽度1000的购物车样式-->
<body>
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
<div id="shop_cart">
    <div id="header">
        <div class="logo">
            <a href="/teaSales/"><img src="images/logo.png" /></a>
            <div class="phone">
                免费咨询热线:<span class="telephone">400-3454-343</span>
            </div>
        </div>
        <div class="Search">
            <p><input name="" type="text"  class="text"/><input name="" type="submit" value=""  class="Search_btn"/></p>
            <p class="Words"><a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a href="#">橙子</a><a href="#">苹果</a></p>
        </div>
    </div>
    <!--提示购物步骤-->

    <div class="prompt_step">
        <img src="images/cart_step_01.png" />
    </div>
    <!--购物车商品-->
    <div class="Shopping_list">
        <div class="title_name">
            <ul>
                <li class="checkbox">&nbsp;</li>
                <li class="name">商品名称</li>
                <li class="scj">市场价</li>
                <li class="bdj">本店价</li>
                <li class="sl">购买数量</li>
                <li class="xj">小计</li>
                <LI class="cz">操作</LI>
            </ul>
        </div>
        <div class="shopping">
            <form>
                <table class="table_list">
                    <c:forEach items="${shoppingCar.shoppingProducts}" var="product">
                    <tr class="tr">
                        <td class="checkbox"><input name="checkitems" type="checkbox" value="${product.product.name}" /></td>
                        <td class="name">
                            <div class="img"><a href="#"><img src="small/${product.product.productDetailed.smallImg}" /></a></div>
                            <div class="p_name"><a href="#">${product.product.name}</a></div>
                        </td>
                        <td class="scj sp">￥${product.product.marketPrice}</td>
                        <td class="bgj sp">￥${product.product.ourPrice}</td>
                        <td class="sl">
                            <div class="Numbers">
                                <a  class="jian">-</a>
                                <input id="number" name="number" type="text" value="1" class="number_text"/>
                                <a  class="jia">+</a>
                            </div>
                        </td>
                            <td class="xj">￥${product.product.ourPrice}</td>
                            <td class="cz">
                                <input type="hidden" name="pid" value="${product.productId}"/>
                                <p class="delButton"><a>删除</a></p>
                                <p><a href="javascript:submitCollect(${product.productId})">收藏该商品</a></p>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="sp_Operation">
                    <div class="select-all">
                        <div class="cart-checkbox"><input type="checkbox"   id="CheckedAll" name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart">全选</div>
                        <div class="operation"><a href="javascript:void(0);" id="send">删除选中的商品</a></div>
                    </div>

                    <!--结算-->
                    <div class="toolbar_right">
                        <div class="p_Total">
                            <span class="text">商品总价：</span><span class="price sumPrice">0</span>
                        </div>
                        <div class="Discount"><span class="text">已节省：</span><span class="price">0</span></div>
                        <div class="btn">
                            <a class="cartsubmit"></a>
                            <a class="continueFind" href="./"></a>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </div>
    <!--底部样式-->
    <div class="footer help-box  clearfix">
        <div class="right_footer clearfix">
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
        <div class="Copyright">
            <p><a href="#">关于我们</a> | <a href="#">隐私申明</a> | <a href="#">成为供应商</a> | <a href="#">茶叶</a> | <a href="#">博客</a> |<a href="#">友情链接</a> | <a href="#">网站地图</a></p>
            <p>Copyright 2010 - 2015 巴山雀舌 四川巴山雀舌茗茶实业有限公司 zuipin.cn All Rights Reserved </p>
            <p>川ICP备10200063号-1</p>
            <a href="#" class="return_img"></a>
        </div>
    </div>

    <!--结束-->
</div>
</body>

</html>
