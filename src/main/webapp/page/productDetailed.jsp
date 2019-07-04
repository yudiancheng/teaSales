<%@ page import="com.yu.pojo.Shopping" %>
<%@ page import="com.yu.pojo.User" %>
<%@ page import="com.yu.service.ShoppingCarService" %>
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
    if (user != null) {
        u = (User) user;
        Shopping shopping = shoppingCarService.selShoppingByUid(u.getId());
        session.setAttribute("shoppingCar", shopping);
    }
%>
<html>
<head>
    <base href="<%=basePath%>>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/common.css" rel="stylesheet" tyle="text/css"/>
    <link href="css/show.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="js/jqzoom.js" type="text/javascript"></script>
    <script src="js/shopCar.js" type="text/javascript"></script>
    <!--[if IE 7]>
    <link href="https://cdn.bootcss.com/font-awesome/3.2.1/css/font-awesome-ie7.min.css" rel="stylesheet">
    <![endif]-->
    <title>产品名称详细介绍购买</title>
    <style type="text/css">
        .bg1 {
            background: url(images/bg_star.png) no-repeat;
        }

        .bg2 {
            background: url(images/bg_star1.png) no-repeat;
        }

    </style>
</head>
<body>
<!--顶部样式-->
<div id="top">
    <div class="top">
        <div class="Collection"><em></em><a href="#">收藏我们</a></div>
        <div class="hd_top_manu clearfix">
            <ul class="clearfix">
                <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！<a <c:choose> <c:when
                        test="${empty user}">href="loginPage.jsp" </c:when><c:otherwise>href="page/myRecord.jsp"</c:otherwise></c:choose>
                        class="red"><c:out value="${user.realName}">[请登录]</c:out></a> 新用户<a href="registerPage.jsp"
                                                                                            class="red">[免费注册]</a></li>
                <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="page/myOrder.jsp">我的订单</a></li>
                <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="page/shoppingCar.jsp">购物车(<b><c:out
                        value="${fn:length(shoppingCar.shoppingProducts)}">0</c:out></b>)</a></li>
                <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="javascript:void(0);">联系我们</a></li>
                <li class="hd_menu_tit list_name" data-addclass="hd_menu_hover"><a href="javascript:void(0);"
                                                                                   class="hd_menu">客户服务</a>
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
<div id="header" class="header">
    <div class="logo">
        <a href="/teaSales/"><img src="images/logo.png"/></a>
        <div class="phone">
            免费咨询热线:<span class="telephone">400-3454-343</span>
        </div>
    </div>
    <div class="Search">
        <p><input name="" type="text" class="text"/><input name="" type="submit" value="" class="Search_btn"/></p>
        <p class="Words"><a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a href="#">橙子</a><a
                href="#">苹果</a></p>
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
                    <a href="#">贡茗茶</a><a href="#">冠茗茶</a><a href="#">佳茗茶</a><a href="#">珍茗茶</a><a href="#">绿茶</a><a
                        href="#">毛尖茶</a>
                </div>
                <div class="Menu_list">
                    <div class="menu_title">茶叶价格</div>
                    <a href="#">100以下</a><a href="#">100-200</a><a href="#">200-400</a><a href="#">400-600</a><a
                        href="#">600-900</a><a href="#">1000以上</a>
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
                <li><a class="nav_on" id="mynav1" href="index.html"><span>首页</span></a></li>
                <li><a class="nav_on" id="mynav2" href="#"><span>巴山雀舌</span></a></li>
                <li><a class="nav_on" id="mynav3" href="#"><span>贡茗</span></a></li>
                <li><a class="nav_on" id="mynav4" href="#"><span>冠茗</span></a></li>
                <li><a class="nav_on" id="mynav5" href="#"><span>臧芝堂（藏茶）</span></a></li>
                <li><a class="nav_on" id="mynav6" href="#"><span>大巴山（茗茶）</span></a></li>
                <li><a class="nav_on" id="mynav7" href="#"><span>达州（茶）</span></a></li>
                <li><a class="nav_on" id="mynav8" href="#"><span>活动</span></a></li>
                <li><a class="nav_on" id="mynav8" href="#"><span>联系我们</span></a></li>
            </ul>
        </div>
        <script>$("#Navigation").slide({titCell: ".Navigation_name li"});</script>
        <!--购物车-->
        <!--购物车-->
        <div class="hd_Shopping_list" id="Shopping_list">
            <div class="s_cart"><em></em><a href="#">我的购物车</a> <i class="ci-right">&gt;</i><i class="ci-count totalNum"
                                                                                              id="shopping-amount">￥<c:out
                    value="${shoppingCar.totalValue}">0</c:out></i></div>
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
                                <div class="content"><p><a href="#">产品名称</a></p>
                                    <p>${products.product.name}</p></div>
                                <div class="Operations">
                                    <p class="Price">￥${products.product.ourPrice}</p>
                                    <a class="delButton">删除</a></div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
                <div class="Shopping_style">
                    <div class="p-total">共<b class="proNum" id="proNum"><c:out
                            value="${fn:length(shoppingCar.shoppingProducts)}">0</c:out></b>件商品　共计<strong
                            class="totalNum">￥<c:out value="${shoppingCar.totalValue}">0</c:out> </strong></div>
                    <a href="page/shoppingCar.jsp" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--内页样式-->
<div class="Inside_pages">
    <!--面包屑-->
    <div class="Location_link">
        <em></em><a href="#">产品中心</a> &lt; <a href="#">巴山雀舌</a> &lt; <a href="#">贡茗产品介绍</a>
    </div>
    <!--产品购买介绍样式-->
    <div class="Detailed">
        <!--产品详细介绍-->
        <div class="Details_style clearfix" id="goodsInfo">
            <div class="mod_picfold clearfix">
                <div class="clearfix" id="detail_main_img">
                    <div class="layout_wrap preview">
                        <div id="vertical" class="bigImg">
                            <img src="big/${detailedProduct.bigList.get(0)}" width="" height="" alt="" id="bigView"/>
                            <div style="display:none;" id="winSelector"></div>
                        </div>
                        <div class="smallImg">
                            <div class="scrollbutton smallImgUp disabled">&lt;</div>
                            <div id="imageMenu">
                                <ul>
                                    <c:forEach items="${detailedProduct.smallList}" var="small">
                                        <li><img src="small/${small}" width="68" height="68" alt="图片"
                                                 onclick="bigView('${small}')"/></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="scrollbutton smallImgDown">&gt;</div>
                        </div><!--smallImg end-->
                    </div>

                </div>
                <div class="Sharing">
                    <div class="bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1441079683326"><a href="javascript:void(0);"
                                                                                                           class="bds_more"
                                                                                                           data-cmd="more">分享到：</a><a
                            href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#"
                                                                                               class="bds_tsina"
                                                                                               data-cmd="tsina"
                                                                                               title="分享到新浪微博"></a><a
                            href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren"
                                                                                           data-cmd="renren"
                                                                                           title="分享到人人网"></a><a
                            href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                    </div>

                    <script type="text/javascript">
                        window._bd_share_config = {
                            "common": {
                                "bdSnsKey": {},
                                "bdText": "",
                                "bdMini": "2",
                                "bdMiniList": false,
                                "bdPic": "",
                                "bdStyle": "0",
                                "bdSize": "16"
                            },
                            "share": {"bdSize": 16},
                            "image": {
                                "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"],
                                "viewText": "分享到：",
                                "viewSize": "16"
                            },
                            "selectShare": {
                                "bdContainerClass": null,
                                "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"]
                            }
                        };
                        with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
                    </script>
                    <!--收藏-->
                    <div class="Collect"><a href="javascript:subCollect();"><em class="ico1"></em>收藏商品( <span id="collectCount">${collectCount} </span>)</a>
                    </div>
                </div>
            </div>
            <!--信息样式-->
            <div class="textInfo">
                <form>
                    <input type="hidden" name="productId" value="${detailedProduct.product.id}"/>
                    <div class="title"><h1>${detailedProduct.product.name}</h1>
                        <p>${detailedProduct.keyword}</p></div>
                    <div class="mod_detailInfo_priceSales">
                        <div class="margins">
                            <div class="Price clearfix text_name"><label>价格</label><span class="Prices"><h4
                                    id="productPrice">¥${detailedProduct.product.ourPrice}</h4> <b>${detailedProduct.product.marketPrice}</b></span>
                            </div>
                            <div class="Activity clearfix text_name"><label>重量</label><span
                                    class="weight">${detailedProduct.product.netWeight}克</span></div>
                            <div class="Size clearfix text_name"><label>规格</label><a href="#">袋装</a><a
                                    href="#">礼盒装</a><a href="#">铁盒</a></div>
                            <div class="Sales_volume">
                                <div class="Sales_info"><h5>销量</h5><b><c:out
                                        value="${detailedProduct.product.saleCount}">0</c:out></b></div>
                            </div>
                        </div>
                        <div class="s_Review">
                            <a href="javascript:goDown();">好评率<b><c:out
                                    value="${goodRate*100}">0</c:out>%</b>[评论<b><c:out
                                    value="${commentCount}">0</c:out></b>条]</a>
                        </div>
                    </div>
                    <div class="buyinfo" id="detail_buyinfo">
                        <dl>
                            <dt>数量</dt>
                            <dd>
                                <div class="choose-amount left">
                                    <a class="btn-reduce" href="javascript:;" onclick="reduce()">-</a>
                                    <a class="btn-add" href="javascript:;" onclick="increase()">+</a>
                                    <input class="text" id="buy-num" value="1" onblur="directInput(this);"/>
                                </div>
                                <div class="P_Quantity">剩余：<span id="remain">${detailedProduct.remain}</span>件</div>
                            </dd>
                            <dd>
                                <div class="wrap_btn"><a id="addToCar" class="wrap_btn1" title="加入购物车"></a>
                                    <a href="javascript:addToCart(92)" class="wrap_btn2" title="立即购买"></a></div>
                            </dd>
                        </dl>
                    </div>
                    <div class="Guarantee clearfix">
                        <dl>
                            <dt>商城服务</dt>
                            <dd><em></em>正品保障</dd>
                            <dd><em></em>售后无忧</dd>
                            <dd><em></em>原产认证</dd>
                            <dd class="manner">
                                <div class="payment " id="payment">
                                    <a href="javascript:void(0);" class="paybtn">支付方式<span
                                            class="icon-angle-down"></span></a>
                                    <ul>
                                        <li>货到付款</li>
                                        <li>礼品卡支付</li>
                                        <li>网上支付</li>
                                        <li>银行转账</li>
                                    </ul>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!---->
    <div class="clearfix">
        <c:if test="${not empty user}">
            <div class="left_style">
                <div class="Records">
                    <div class="title_name">用户浏览记录</div>
                    <ul>
                        <c:forEach items="${scanRecordList}" var="scan">
                            <li>
                                <a href="#">
                                    <p><img src="products/${scan.product.image}" data-bd-imgshare-binded="1"></p>
                                    <p class="p_name">${scan.product.name}</p>
                                </a>
                                <p><span
                                        class="p_Price">￥${scan.product.ourPrice}</span><b>${scan.product.marketPrice}</b>
                                </p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:if>
        <div class="right_style">
            <div class="inDetail_boxOut ">
                <div class="inDetail_box">
                    <div class="fixed_out ">
                        <ul class="inLeft_btn fixed_bar">
                            <li><a id="property-id" href="#shangpsx" class="current">商品属性</a></li>
                            <li><a id="detail-id" href="#shangpjs">规格与包装</a></li>
                            <li><a id="shot-id" href="#miqsp">售后服务</a></li>
                            <li><a id="coms1-id" href="javascript:goDown();">买家评论</a></li>
                        </ul>
                    </div>
                    <!---->
                    <div class="product_details">
                        <div id="shangpsx">
                            <div class="title"><img src="images/title_name_03.png"/></div>
                            <ul class="shangpsx_info">
                                <li><label>生产许可证编号</label><span>${detailedProduct.product.licenseId}</span></li>
                                <li><label>产品标准号</label><span>${detailedProduct.product.standardId}</span></li>
                                <li><label>生产日期</label><span>${detailedProduct.product.dateOfProduction}</span></li>
                                <li><label>有效期</label><span>${detailedProduct.product.qualityTime}</span></li>
                                <li><label id="productName">产品名称</label><span>${detailedProduct.product.name}</span>
                                </li>
                                <li><label>净含量</label><span>${detailedProduct.product.netWeight}</span></li>
                                <li><label>包装</label><span>${detailedProduct.product.packaging}</span></li>
                                <li><label>品牌</label><span>${detailedProduct.product.brand}</span></li>
                                <li><label>食品工艺</label><span>${detailedProduct.product.foodTech}</span></li>
                                <li><label>级别</label><span>${detailedProduct.product.level}</span></li>
                                <li><label>产地</label><span>${detailedProduct.product.placeOrigin}</span></li>
                                <li>
                                    <label>价格</label><span>${detailedProduct.product.ourPrice}-${detailedProduct.product.marketPrice}</span>
                                </li>
                            </ul>
                        </div>
                        <div id="shangpjs">
                            <img src="detailedImg/${detailedProduct.detailedImg}"/>
                        </div>
                        <div id="coms1">
                            <div class="productContent" id="status2">
                                <div class=""></div>
                                <div class="iComment clearfix">
                                    <div class="rate"><strong id="goodRate"
                                                              style="font-size: xx-large">${goodRate*100}<span>%</span></strong><br>
                                        <span>好评度</span></div>
                                    <div class="percent" id="percentRate">
                                        <dl>
                                            <dt>好评<span>(${goodRate*100}%)</span></dt>
                                            <dd>
                                                <div style="width:${goodRate*100};"></div>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>中评<span>(${normalRate*100}%)</span></dt>
                                            <dd class="d1">
                                                <div style="width:${normalRate*100};"></div>
                                            </dd>
                                        </dl>
                                        <dl>
                                           <dt>差评 <span>(${badRate*100}%)</span></dt>
                                            <dd class="d1">
                                                <div style="width:${badRate*100};"></div>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="actor">
                                        <dl>
                                            <dt>发表评价即可获得10积分，精华评论更有 <font color="red">额外奖励</font> 积分；<br>
                                                还有7个多倍积分名额哦，赶紧抢占吧！<br>
                                                只有购买过该商品的用户才能进行评价。
                                            </dt>
                                        </dl>
                                    </div>
                                </div>
                                <div class="commentBox" style="display: block;">
                                    <h3>商品评分</h3>
                                    <p class="tip">请直接点击相应的星级进行评分</p>
                                    <div id="star">
                                        <ul>
                                            <li class="level" select=""><span class="bg1"></span>
                                                <p>1分</p>
                                                <p>非常不满意</p>
                                            </li>
                                            <li class="level" select=""><span class="bg1"></span>
                                                <p>2分</p>
                                                <p>不满意</p>
                                            </li>
                                            <li class="level" select=""><span class="bg1"></span>
                                                <p>3分</p>
                                                <p>一般</p>
                                            </li>
                                            <li class="level" select=""><span class="bg1"></span>
                                                <p>4分</p>
                                                <p>满意</p>
                                            </li>
                                            <li class="level" select=""><span class="bg1"></span>
                                                <p>5分</p>
                                                <p>非常满意</p>
                                            </li>
                                        </ul>
                                        <input type="hidden" name="rank" id="rank" value="1">
                                        <input type="hidden" name="cmt_type" value="">
                                        <input type="hidden" name="id" value="78">
                                        <input type="hidden" name="email" id="email" value="null@mial.com">
                                    </div>
                                    <h4>评论内容</h4>
                                    <div class="bd">
                                        <textarea name="content" id="content" class="textarea_long"></textarea>
                                        <p class="g">
                                            <label>&nbsp; </label>
                                            <input type="button" value="发表" class="btn_common"/>
                                            <span class="word"><b id="sy">0</b>/1000</span></p>
                                    </div>
                                </div>
                                <div id="ECS_COMMENT">
                                    <div class="Comment">
                                                <div class="CommentTab">
                                                    <ul>
                                                        <li class="active" id="all">全部评论(${commentCount})</li>
                                                        <li id="good">好评(${goodCount})</li>
                                                        <li id="normal">中评(${normalCount})</li>
                                                        <li id="bad">差评(${badCount})</li>
                                            </ul>
                                        </div>
                                        <div id="goodsdetail_comments_list" style="display:block">
                                            <ul id="comments">
                                                <c:forEach items="${userComments.pageData}" var="comments">
                                                    <li class="supportContent">
                                                        <input type="hidden" value="${comments.id}" name="cid"/>
                                                        <span style="color: green">${comments.user.username}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comments.content}
                                                        <span style="color: red;cursor:pointer" class="support">赞(${comments.support})</span>
                                                        <hr/>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <ul style="display: none" id="goodComments">
                                            </ul>
                                            <ul style="display: none" id="normalComments">
                                            </ul>
                                            <ul style="display: none" id="badComments">
                                            </ul>
                                            <div class="discuss_Paging">
                                                <div class="discuss" id="allPaging">
                                                    <span class="f_l f6"
                                                          style="margin-right:10px;">共 <b>${commentCount}</b> 条评论</span>
                                                    <p>
                                                        <a href="javascript:allCommentsAjax('first');">首页</a>
                                                        <a class="prev" href="javascript:allCommentsAjax('up');">上一页</a>
                                                        <a class="next"
                                                           href="javascript:allCommentsAjax('down');">下一页</a>
                                                        <a class="last" href="javascript:allCommentsAjax('last');">尾页</a>
                                                    </p>
                                                </div>

                                                <div class="discuss" id="goodPaging" style="display: none">
                                                    <span class="f_l f6"
                                                          style="margin-right:10px;">共 <b>${goodCount}</b> 条评论</span>
                                                    <p>
                                                        <a href="javascript:goodCommentsAjax('first');">首页</a>
                                                        <a class="prev" href="javascript:goodCommentsAjax('up');">上一页</a>
                                                        <a class="next"
                                                           href="javascript:goodCommentsAjax('down');">下一页</a>
                                                        <a class="last"
                                                           href="javascript:goodCommentsAjax('last');">尾页</a>
                                                    </p>
                                                </div>

                                                <div class="discuss" style="display: none" id="normalPaging">
                                                    <span class="f_l f6"
                                                          style="margin-right:10px;">共 <b>${normalCount}</b> 条评论</span>
                                                    <p>
                                                        <a href="javascript:normalCommentsAjax('first');">首页</a>
                                                        <a class="prev"
                                                           href="javascript:normalCommentsAjax('up');">上一页</a>
                                                        <a class="next"
                                                           href="javascript:normalCommentsAjax('down');">下一页</a>
                                                        <a class="last"
                                                           href="javascript:normalCommentsAjax('last');">尾页</a>
                                                    </p>
                                                </div>

                                                <div class="discuss" style="display: none;" id="badPaging">
                                                    <span class="f_l f6"
                                                          style="margin-right:10px;">共 <b>${badCount}</b> 条评论</span>
                                                    <p id="commentPager_4">
                                                        <a href="javascript:badCommentsAjax('first');">首页</a>
                                                        <a class="prev"
                                                           href="javascript:badCommentsAjax('up');">上一页</a>
                                                        <a class="next"
                                                           href="javascript:badCommentsAjax('down');">下一页</a>
                                                        <a class="last"
                                                           href="javascript:badCommentsAjax('last');">尾页</a>
                                                    </p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        $('.CommentTab ul').find('li').click(function () {
                                            $('.CommentTab ul').find('li').removeClass('active');
                                            $('.CommentText').css({display: 'none'});
                                            $(this).addClass('active');
                                            $('.CommentText').eq($(this).index()).css({display: 'block'});
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!--友情链接-->
        <div class="Links">
            <div class="link_title">友情链接</div>
            <div class="link_address"><a href="#">四川茶叶协会</a> <a href="#">链接地址</a> <a href="#">链接地址</a> <a
                    href="#">链接地址 </a>
                <a href="#">链接地址</a> <a href="#">链接地址</a> <a href="#">链接地址</a></div>
        </div>
    </div>
    <!--底部样式-->
    <div class="footer">
        <div class="streak"></div>
        <div class="footerbox clearfix">
            <div class="left_footer">
                <div class="img"><img src="images/img_33.png"/></div>
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
            <p><a href="#">关于我们</a> | <a href="#">隐私申明</a> | <a href="#">成为供应商</a> | <a href="#">茶叶</a> | <a
                    href="#">博客</a>
                |<a href="#">友情链接</a> | <a href="#">网站地图</a></p>
            <p>Copyright 2010 - 2015 巴山雀舌 四川巴山雀舌茗茶实业有限公司 zuipin.cn All Rights Reserved </p>
            <p>川ICP备10200063号-1</p>
            <a href="#" class="return_img"></a>
        </div>
    </div>
    <!--右侧菜单栏购物车样式-->
    <div class="fixedBox">
        <ul class="fixedBoxList">
            <li class="fixeBoxLi user"><a href="#"> <span class="fixeBoxSpan"></span> <strong>用户</strong></a></li>
            <li class="fixeBoxLi Service "><span class="fixeBoxSpan"></span> <strong>客服</strong>
                <div class="ServiceBox">
                    <div class="bjfffs"></div>
                    <dl onclick="javascript:;">
                        <dt><img src="images/Service1.png"></dt>
                        <dd><strong>QQ客服1</strong>
                            <p class="p1">9:00-22:00</p>
                            <p class="p2"><a
                                    href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a>
                            </p>
                        </dd>
                    </dl>
                    <dl onclick="javascript:;">
                        <dt><img src="images/Service1.png"></dt>
                        <dd><strong>QQ客服1</strong>
                            <p class="p1">9:00-22:00</p>
                            <p class="p2"><a
                                    href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a>
                            </p>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="fixeBoxLi code cart_bd " style="display:block;" id="cartboxs">
                <span class="fixeBoxSpan"></span> <strong>微信</strong>
                <div class="cartBox">
                    <div class="bjfff"></div>
                    <div class="QR_code">
                        <p><img src="images/erweim.jpg" width="150px" height="150px" style=" margin-top:10px;"/></p>
                        <p>微信扫一扫，关注我们</p>
                    </div>
                </div>
            </li>

            <li class="fixeBoxLi Home"><a href="./"> <span class="fixeBoxSpan"></span> <strong>收藏</strong> </a></li>
            <li class="fixeBoxLi BackToTop"><span class="fixeBoxSpan"></span> <strong>返回顶部</strong></li>
        </ul>
    </div>
    <script type="text/javascript">
        //显示对应大图
        function bigView(name) {
            var newName = 'b' + name.substring(1);
            $("#bigView").attr("src", "big/" + newName);
        }

        //转到评论区
        function goDown() {
            var $body = $("body");
            $body.animate({scrollTop: $('#coms1').offset().top}, 1000);
        }

        //增加数量
        function increase() {
            var num = parseInt($("#buy-num").val());
            num++;
            if (num >= 1 && num <= $("#remain").text())
                $("#buy-num").val(num);
        }

        //减少数量
        function reduce() {
            var num = parseInt($("#buy-num").val());
            num--;
            if (num >= 1)
                $("#buy-num").val(num);
        }

        //直接输入
        function directInput() {
            var remain = $("#remain").text();
            var num = $("#buy-num").val();
            if (num < 1) {
                $("#buy-num").val(1);
            } else if ($("#buy-num").val() > remain) {
                $("#buy-num").val(remain);
            }
        }

        //展示全部评论
        $("#all").click(function () {
            $("#comments").css("display", "block");
            $("div#goodsdetail_comments_list ul").each(function (i) {
                if (i == 0) {
                    return true;
                }
                $(this).css("display", "none");
            });

            $("#allPaging").css("display", "block");
            $("#goodPaging").css("display", "none");
            $("#normalPaging").css("display", "none");
            $("#badPaging").css("display", "none");
            allCommentsAjax('first');
        });

        var allPageInfo = {};
        allPageInfo.number = 1;
        allPageInfo.size = 4;

        //全部评论数据查询
        function allCommentsAjax(order) {

            //获取数据总条数并计算页数
            var dataTotal = $("#allPaging").children("span").children("b").text();
            var currentLast = parseInt(dataTotal);
            allPageInfo.last = parseInt((currentLast + 3) / 4);

            //判断是哪个指令
            if (order == 'up') {
                allPageInfo.number = allPageInfo.number - 1;
            } else if (order == 'down') {
                allPageInfo.number = allPageInfo.number + 1;
            } else if (order == 'first') {
                allPageInfo.number = 1;
            } else {
                allPageInfo.number = allPageInfo.last;
            }

            //判断是否到达最后页 和 是否到达最前页
            if (allPageInfo.number >= allPageInfo.last) {
                $("#allPaging").children("p").children("a.next").attr("href", "javascript:void(0);");
            } else {
                $("#allPaging").children("p").children("a.next").attr("href", "javascript:allCommentsAjax('down');");
            }
            if(allPageInfo.number <= 1) {
                $("#allPaging").children("p").children("a.prev").attr("href", "javascript:void(0);");
            } else {
                $("#allPaging").children("p").children("a.prev").attr("href", "javascript:allCommentsAjax('up');");
            }
            //获取商品id和分页数据
            var pid = $("input[name=productId]").val();
            var pageNumber = allPageInfo.number;
            var pageSize = allPageInfo.size;
            //发送请求参数
            $.ajax({
                url: "selAll",
                type: "get",
                dataType: "json",
                data: {"pid": pid, "pageNumber": pageNumber, "pageSize": pageSize},
                success: function (data) {
                    //如果请求成功的话把分页数据展示到页面上
                    var contents = new Array();
                    var commentsString = "";
                    for (var i = 0; i < data.pageData.length; i++) {
                        contents[i] = "<li class='supportContent'><input type='hidden' value='"+data.pageData[i].id+"'/><span style='color: green'>" + data.pageData[i].user.username + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.pageData[i].content + "&nbsp;&nbsp;&nbsp;<span style='color: red;cursor:pointer' class='support'>赞(" + data.pageData[i].support + ")</span></li><hr/>";
                    }
                    for (var i = 0; i < contents.length; i++) {
                        commentsString += contents[i];
                    }
                    $("#comments").html(commentsString);
                    //更新分页数据
                    allPageInfo.number = data.currentPage;
                    allPageInfo.size = data.pageSize;
                    allPageInfo.last = data.page;
                }
            });
        }


        //展示好评
        $("#good").click(function () {
            $("div#goodsdetail_comments_list ul").each(function (i) {
                if (i == 1) {
                    return true;
                }
                $(this).css("display", "none");
            });
            $("#allPaging").css("display", "none");
            $("#goodPaging").css("display", "block");
            $("#normalPaging").css("display", "none");
            $("#badPaging").css("display", "none");
            $("#goodComments").css("display", "block");
            goodCommentsAjax('first');
        });

        var goodPageInfo = {};
        goodPageInfo.number = 1;
        goodPageInfo.size = 4;
        //好评数据查询
        function goodCommentsAjax(order) {
            //获取数据总条数并计算页数
            var dataTotal = $("#goodPaging").children("span").children("b").text();
            var currentLast = parseInt(dataTotal);
            goodPageInfo.last = parseInt((currentLast + 3) / 4);

            //判断是哪个指令
            if (order == 'up') {
                goodPageInfo.number = goodPageInfo.number - 1;
            } else if (order == 'down') {
                goodPageInfo.number = goodPageInfo.number + 1;
            } else if (order == 'first') {
                goodPageInfo.number = 1;
            } else {
                goodPageInfo.number = goodPageInfo.last;
            }


            //判断是否到达最后页 和 是否到达最前页
            if (goodPageInfo.number >= goodPageInfo.last) {
                $("#goodPaging").children("p").children("a.next").attr("href",
                    "javascript:void(0);");
            } else {
                $("#goodPaging").children("p").children("a.next").attr("href",
                    "javascript:allCommentsAjax('down');");
            }
            if(goodPageInfo.number <= 1) {
                $("#goodPaging").children("p").children("a.prev").attr("href",
                    "javascript:void(0);");
            } else {
                $("#goodPaging").children("p").children("a.prev").attr("href",
                    "javascript:allCommentsAjax('up');");
            }

            //获取商品id和分页数据
            var pid = $("input[name=productId]").val();
            var pageNumber = allPageInfo.number;
            var pageSize = allPageInfo.size;

            //发送请求参数
            $.ajax({
                url: "selGood",
                type: "get",
                dataType: "json",
                data: {"pid": pid, "pageNumber": pageNumber, "pageSize": pageSize},
                success: function (data) {
                    var contents = new Array();
                    var commentsString = "";
                    for (var i = 0; i < data.pageData.length; i++) {
                        contents[i] = "<li class='supportContent'><input type='hidden' value='"+data.pageData[i].id+"'/><span style='color: green'>" + data.pageData[i].user.username + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.pageData[i].content + "&nbsp;&nbsp;&nbsp;<span style='color: red;cursor:pointer' class='support'>赞(" + data.pageData[i].support + ")</span></li><hr/>";
                    }
                    for (var i = 0; i < contents.length; i++) {
                        commentsString += contents[i];
                    }
                    $("#goodComments").html(commentsString);
                    goodPageInfo.number = data.currentPage;
                    goodPageInfo.size = data.pageSize;
                    goodPageInfo.last = data.page;
                }
            });
        }

        //展示中评
        $("#normal").click(function () {
            $("div#goodsdetail_comments_list ul").each(function (i) {
                if (i == 2) {
                    return true;
                }
                $(this).css("display", "none");
            });
            $("#allPaging").css("display", "none");
            $("#goodPaging").css("display", "none");
            $("#normalPaging").css("display", "block");
            $("#badPaging").css("display", "none");

            $("#normalComments").css("display", "block");
            normalCommentsAjax('first');
        });

        var normalPageInfo = {};
        normalPageInfo.number = 1;
        normalPageInfo.size = 4;
        //中评数据查询
        function normalCommentsAjax(order) {

            //获取数据总条数并计算页数
            var dataTotal = $("#normalPaging").children("span").children("b").text();
            var currentLast = parseInt(dataTotal);
            normalPageInfo.last = parseInt((currentLast + 3) / 4);

            //判断是哪个指令
            if (order == 'up') {
                normalPageInfo.number = normalPageInfo.number - 1;
            } else if (order == 'down') {
                normalPageInfo.number = normalPageInfo.number + 1;
            } else if (order == 'first') {
                normalPageInfo.number = 1;
            } else {
                normalPageInfo.number = normalPageInfo.last;
            }

            //判断是否到达最后页 和 是否到达最前页
            if (normalPageInfo.number >= normalPageInfo.last) {
                $("#normalPaging").children("p").children("a.next").attr("href",
                    "javascript:void(0);");
            } else {
                $("#normalPaging").children("p").children("a.next").attr("href",
                    "javascript:allCommentsAjax('down');");
            }
            if(allPageInfo.number <= 1) {
                $("#normalPaging").children("p").children("a.prev").attr("href",
                    "javascript:void(0);");
            } else {
                $("#normalPaging").children("p").children("a.prev").attr("href",
                    "javascript:allCommentsAjax('up');");
            }

            //获取商品id和分页数据
            var pid = $("input[name=productId]").val();
            var pageNumber = normalPageInfo.number;
            var pageSize = normalPageInfo.size;

            $.ajax({
                url: "selNormal",
                type: "get",
                dataType: "json",
                data: {"pid": pid, "pageNumber": pageNumber, "pageSize": pageSize},
                success: function (data) {
                    var contents = new Array();
                    var commentsString = "";
                    for (var i = 0; i < data.pageData.length; i++) {
                        contents[i] = "<li class='supportContent'><input type='hidden' value='"+data.pageData[i].id+"'/><span style='color: green'>" + data.pageData[i].user.username + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.pageData[i].content + "&nbsp;&nbsp;&nbsp;<span style='color: red;cursor:pointer' class='support'>赞(" + data.pageData[i].support + ")</span></li><hr/>";

                    }
                    for (var i = 0; i < contents.length; i++) {
                        commentsString += contents[i];
                    }
                    $("#normalComments").html(commentsString);

                    //更新分页数据
                    normalPageInfo.number = data.currentPage;
                    normalPageInfo.size = data.pageSize;
                    normalPageInfo.last = data.page;
                }
            });
        }


        //展示差评
        $("#bad").click(function () {
            $("div#goodsdetail_comments_list ul").each(function (i) {
                if (i == 3) {
                    return true;
                }
                $(this).css("display", "none");
            });

            $("#allPaging").css("display", "none");
            $("#goodPaging").css("display", "none");
            $("#normalPaging").css("display", "none");
            $("#badPaging").css("display", "block");

            $("#badComments").css("display", "block");
            badCommentsAjax('first');
        });

        var badPageInfo = {};
        badPageInfo.number = 1;
        badPageInfo.size = 4;
        //差评数据查询
        function badCommentsAjax(order) {
            //获取数据总条数并计算页数
            var dataTotal = $("#badPaging").children("span").children("b").text();
            var currentLast = parseInt(dataTotal);
            badPageInfo.last = parseInt((currentLast + 3) / 4);
            var pid = $("input[name=productId]").val();

            //判断是哪个指令
            if (order == 'up') {
                badPageInfo.number = badPageInfo.number - 1;
            } else if (order == 'down') {
                badPageInfo.number = badPageInfo.number + 1;
            } else if (order == 'first') {
                badPageInfo.number = 1;
            } else {
                badPageInfo.number = badPageInfo.last;
            }

            //判断是否到达最后页 和 是否到达最前页
            if (badPageInfo.number >=  badPageInfo.last) {
                $("#badPaging").children("p").children("a.next").attr("href",
                    "javascript:void(0);");
            } else {
                $("#badPaging").children("p").children("a.next").attr("href",
                    "javascript:allCommentsAjax('down');");
            }
            if(badPageInfo.number <= 1) {
                $("#badPaging").children("p").children("a.prev").attr("href",
                    "javascript:void(0);");
            } else {
                $("#badPaging").children("p").children("a.prev").attr("href",
                    "javascript:allCommentsAjax('up');");
            }

            //获取商品id和分页数据
            var pid = $("input[name=productId]").val();
            var pageNumber = badPageInfo.number;
            var pageSize = badPageInfo.size;

            $.ajax({
                url: "selBad",
                type: "get",
                dataType: "json",
                data: {"pid": pid, "pageNumber": pageNumber, "pageSize": pageSize},
                success: function (data) {
                    var contents = new Array();
                    var commentsString = "";
                    for (var i = 0; i < data.pageData.length; i++) {
                        contents[i] = "<li class='supportContent'><input type='hidden' value='"+data.pageData[i].id+"'/><span style='color: green'>" + data.pageData[i].user.username + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.pageData[i].content + "&nbsp;&nbsp;&nbsp;<span style='color: red;cursor:pointer'class='support'>赞(" + data.pageData[i].support + ")</span></li><hr/>";
                    }
                    for (var i = 0; i < contents.length; i++) {
                        commentsString += contents[i];
                    }
                    $("#badComments").html(commentsString);

                    //更新分页数据
                    badPageInfo.number = data.currentPage;
                    badPageInfo.size = data.pageSize;
                    badPageInfo.last = data.page;
                }
            });
        }

        $("#content").keyup(function () {
            var length = $("#content").val().length;
            if (length > 1000) {
                alert("评论内容超长！");
            }
            $("#sy").text(length);
        });

        $(".btn_common").click(function () {
            var level = $("li[select=true]").children("p:first").text().charAt(0);
            if (level == "") {
                alert("请选择商品评级！");
                return;
            }
            subContent();
        });

        $(".level").click(function () {
            var index = $(this).index();
            $(this).attr("select", "true");
            $(this).removeClass("bg1");
            $(this).addClass("bg2");
            $("li.level").each(function () {
                if ($(this).index() == index) {
                    return true;
                } else {
                    $(this).removeClass("bg2");
                    $(this).attr("select", "false");
                }
            });
        });

        /************评论内容数据库持久化**********/
        function subContent() {
            var content = $("#content").val();
            var level = $("li[select=true]").children("p:first").text().charAt(0);
            var productId = $("input[name=productId]").val();
            $.ajax({
                url: "insComment",
                dataType: "text",
                type: "post",
                contentType: "application/x-www-form-urlencoded",
                data: {"content": content, "level": level, "productId": productId},
                success: function (data) {
                    if (data == "success") {
                        $("#goodsdetail_comments_list").children("ul").append("<li style='display:block'>" + content + "</li>");
                        var commentCount = parseInt($(".f6").children("b").text());
                        var allCount = parseInt($("li.active").text().substring(5, $("li.active").text().length - 1));
                        commentCount++;
                        allCount++;
                        $(".f6").children("b").text(commentCount);
                        $("li.active").text("全部评论(" + allCount + ")");
                    } else {
                        alert("您还没有购买过此商品，请先购买体验再来评论吧！");
                    }
                }
            });
        }

        /*  var wait = 30;
          function time() {
              if (wait == 0) {
                  $("btn_common").attr("disabled",false);
                  wait = 30;
              } else {
                  $("btn_common").attr("disabled", true);
                  wait--;
                  setTimeout(time,1000);
              }

          }*/

/************收藏商品提交***********/
function subCollect() {
    var productId = $("input[name=productId]").val();
    var current = parseInt($("#collectCount").text());
    $.ajax({
        url:"collect",
        type:"get",
        dataType:"text",
        data:{"pid":productId},
        success:function (data) {
            if(data == 'success') {
                alert("收藏商品成功！");
                $("#collectCount").text(current+1);
            } else if(data == 'error'){
                alert("您已经收藏过该商品了！");
            } else if(data == 'login'){
                alert("请客官登录后再操作！");
            }
        }

    });
}

/*****点赞数据提交*******/
$(document).on("click",".support",function () {
    var cid = $(this).parent("li").children("input:first").val();
    var current = $(this).text().substring(2,3);
    var currYs = $(this);
    $.ajax({
         url:"giveSupport",
         type:"get",
         dataType:"text",
         data:{"cid":cid,"current":current},
         success:function(data) {
             if(data == "success") {
                 var res = parseInt(current)+1;
                 currYs.text("赞("+ res + ")");
                 alert("点赞成功！");
             } else if(data == "login") {
                 alert("请客官登录后再点赞吧！");
             }
         }
     });
});
    </script>
</body>
</html>
