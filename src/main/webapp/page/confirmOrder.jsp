<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/common.css" rel="stylesheet" tyle="text/css"/>
    <link href="css/Orders.css" rel="stylesheet" type="text/css"/>
    <link href="threelinkage/linkage.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/jquery.sumoselect.min.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="js/jquery.reveal.js" type="text/javascript"></script>
    <script src="js/shopCar.js" type="text/javascript"></script>
    <title>确认订单界面</title>
    <style type="text/css">
        .Caddress {
            width: 1210px;
            margin: auto;
            position: relative;
            height: 160px;
        }

        .Caddress .add_mi {
            height: 106px;
            float: left;
            margin-right: 5px;
            background: url(images/mail.jpg) no-repeat;
            padding: 6px 17px;
        }

        .Caddress .add_mi p {
            font-size: 12px;
            line-height: 20px;
            margin-bottom: 5px;
            color: #666;
            width: 203px;
        }

        .masking {
            width: 100%;
            height: 100%;
            position: fixed;
            background: rgba(150, 150, 150, 0.8);
            display: none;
            top: 0;
            left: 0;
        }

        .layer {
            position: relative;
            width: 500px;
            height: 300px;
            background: #ccc;
            border: 3px solid #fff;
            left: 50%;
            margin-left: -250px;
            top: 50%;
            margin-top: -150px;
        }

        .close {
            position: absolute;
            right: 15px;
            top: 15px;
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
            <div class="Category"><a href="#" class="Menu_img model_close"><em></em></a></div>
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
</div>
<div id="Orders" class="Inside_pages  clearfix">
    <div class="Orders_style clearfix" style="padding-bottom: 0">
        <div class="address clearfix">
            <div class="adderss_list clearfix">
                <div class="title_name">选择收货地址 <c:if test="${fn:length(userAddress) > 4}"><a class="showMoreAddress">+更多地址</a></c:if><a
                        href="javascript:window.open('/teaSales/page/updAddress.jsp','_blank', 'resizable=no,top=300px,location=no');">+添加地址</a></div>
                <!--展示更多收货地址模态框-->
                <div class="masking moreAddress">
                    <div class="layer">
                        <a class="close">X</a>
                    </div>
                </div>
                <!--收货地址样式-->
                <div class="Caddress model_close" >
                    <c:forEach items="${userAddress}" var="address">
                        <div class="add_mi"  select="">
                            <input type="hidden" value="${address.id}"/>
                            <p style="border-bottom:1px dashed #ccc;line-height:28px;">${address.location}(${address.receiverName}收)</p>
                            <p>${address.detailedAddress}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>

    <form class="form" method="post">
        <fieldset>
            <!--快递选择-->
            <div class="express_delivery model_close" style="margin-top: 0">
                <div class="title_name">选择快递方式</div>
                <ul class="dowebok">
                    <li><input type="radio" name="postMethod" data-labelauty="圆通快递" checked_label="圆通快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                            <p><a href="#">点击查看是否在配送范围内</a></p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="中通快递" checked_label="中通快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="申通快递"  checked_label="申通快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="邮政EMS" checked_label="邮政EMS">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="城际快递" checked_label="城际快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：同城包邮</p>

                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="韵达快递" checked_label="韵达快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="国通快递" checked_label="国通快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="顺丰快递" checked_label="顺丰快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满88元包邮</p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="邮政小包" checked_label="邮政小包">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                        </div>
                    </li>
                    <li><input type="radio" name="postMethod" data-labelauty="天天快递"  checked_label="天天快递">
                        <div class="description">
                            <em class="arrow"></em>
                            <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                            <p>资费：15元</p>
                            <p class="Note">满68元包邮</p>
                        </div>
                    </li>
                </ul>

            </div>

            <!--付款方式-->
            <div class="payment">
                <div class="title_name">支付方式</div>
                <ul>
                    <li><input type="radio" name="payMethod" data-labelauty="余额支付"  checked_label="余额支付"></li>
                    <li><input type="radio" name="payMethod" data-labelauty="支付宝" checked_label="支付宝"></li>
                    <li><input type="radio" name="payMethod" data-labelauty="财付通" checked_label="财付通"></li>
                    <li><input type="radio" name="payMethod" data-labelauty="银联支付" checked_label="银联支付"></li>
                    <li><input type="radio" name="payMethod" data-labelauty="货到付款" checked_label="货到付款"></li>
                </ul>
            </div>
            <!--发票样式-->
            <div class="invoice_style model_close">
                <ul>
                    <li class="invoice_left"><input name="isInvoice" type="checkbox" value="" data-labelauty="是否开发票"/></li>
                    <li class="invoice_left"><select name="someInvoice" class="SlectBox">
                        <option  selected="selected" class="model_close">不开发票</option>
                        <option value="增值税专用发票">增值税专用发票</option>
                        <option value="普通发票">普通发票</option>
                        <option value="定额发票">定额发票</option>
                    </select>
                    </li>
                    <li class="invoice_left">发票抬头
                        <input name="invoiceInfo" type="text" class="text_info" placeholder="个人姓名或者单位名称"/></li>
                </ul>
            </div>
            <!--产品列表-->
            <div class="Product_List">
                <div class="envelopes model_close">
                    选择已有红包<select name="someVoucher" class="SlectBox">
                    <option  selected="selected">不使用红包</option>
                    <!--placeholder-->
                    <c:forEach items="${userVouchers}" var="vouchers">
                        <option value="${vouchers.voucher.limit}&${vouchers.voucherId}&${vouchers.voucher.amount}">${vouchers.voucher.amount}元红包&nbsp;&nbsp;&nbsp;&nbsp;满${vouchers.voucher.limit}元可用</option>
                    </c:forEach>
                    <c:if test="${empty userVouchers}">
                        <option>您当前暂无可使用的红包！</option>
                    </c:if>
                </select>
                    或者输入红包序列号<input name="" type="text" class="text_number"/><input type="button"
                                                                                    class="verification_btn"
                                                                                    value="验证序列号"/>
                </div>
                <table>
                    <thead>
                    <tr class="title">
                        <td class="name">商品名称</td>
                        <td class="price">商品价格</td>
                        <td class="Preferential">优惠价</td>
                        <td class="Quantity">购买数量</td>
                        <td class="Money">金额</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${shoppingCar.shoppingProducts}" var="products">
                    <tr>
                        <td class="Product_info">
                            <a href="#"><img src="small/${products.product.productDetailed.smallImg}" width="100px" height="100px"/></a>
                            <a href="#" class="product_name">${products.product.name}</a>
                        </td>
                        <td><i>￥</i>${products.product.marketPrice}</td>
                        <td><i>￥</i>${products.product.ourPrice}</td>
                        <td>${products.productTotal}</td>
                        <td class="Moneys"><i>￥</i>${products.product.ourPrice * products.productTotal}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="Pay_info">
                    <label>订单留言</label><input name="orderMessage" type="text" onkeyup="checkLength(this);" class="text_name "/>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span></span>
                </div>
                <!--价格-->
                <div class="price_style">
                    <div class="right_direction">
                        <ul>
                            <li><label>商品总价</label><i>￥</i><span id="totalPrice">0</span></li>
                            <li><label>优惠金额</label><i>￥</i><span id="discount">0</span></li>
                            <li><label>配&nbsp;&nbsp;送&nbsp;&nbsp;费</label><i>￥</i><span id="distribution">0</span></li>
                            <li class="shiji_price">
                                <label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span id="actualPay">0</span></li>
                        </ul>
                        <div class="btn"><input name="submit" type="button" value="提交订单" class="submit_btn"/> <input
                                name="" type="button" value="返回购物车" class="return_btn"/></div>
                        <div class="integral right">待订单确认后，你将获得<span id="integral">345</span>积分</div>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<!--友情链接-->
<div class="Links">
    <div class="link_title">友情链接</div>
    <div class="link_address"><a href="#">四川茶叶协会</a> <a href="#">链接地址</a> <a href="#">链接地址</a> <a href="#">链接地址 </a> <a
            href="#">链接地址</a> <a href="#">链接地址</a> <a href="#">链接地址</a></div>
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
        <p><a href="#">关于我们</a> | <a href="#">隐私申明</a> | <a href="#">成为供应商</a> | <a href="#">茶叶</a> | <a href="#">博客</a>
            |<a href="#">友情链接</a> | <a href="#">网站地图</a></p>
        <p>Copyright 2010 - 2015 巴山雀舌 四川巴山雀舌茗茶实业有限公司 zuipin.cn All Rights Reserved </p>
        <p>川ICP备10200063号-1</p>
        <a href="#" class="return_img"></a>
    </div>
</div>
<script type="text/javascript">
    //检测留言字个数
    function checkLength(which) {
        var maxChars = 50; //
        if (which.value.length > maxChars) {
            alert("您出入的字数超多限制!");
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    }
    //订单数据提交(除商品)
    function subOrder() {
        var addressId = $("div[select=selected]").children("input:first").val();
        var post = $("input[name=postMethod]:checked").attr("checked_label");
        var pay = $("input[name=payMethod]:checked").attr("checked_label");
        var isInvoice = $("input[name=isInvoice]").is(":checked");
        var invoiceType = $("select[name=someInvoice] option:selected").text();
        var invoiceInfo = $("input[name=invoiceInfo]").val();
        var message = $("input[name=orderMessage]").val();
        var voucherId = $("select[name=someVoucher] option:selected").val().split("&")[1];
        var total =  $("#totalPrice").text();
        var discount = parseFloat($("#discount").text().substring(1));
        var fee = $("#distribution").text();
        var acutal =  $("#actualPay").text();
        //验证数据是否合法
        if((typeof addressId) == "undefined") {
            alert("请选择地址！");
            return;
        }
        if((typeof post) == "undefined") {
            alert("请选择快递方式！");
            return;
        }
        if((typeof pay) == "undefined") {
            alert("请选择支付方式！");
            return;
        }
        if(isInvoice) {
            if(invoiceType == '不开发票') {
                alert("请选择发票类型！");
                return;
            }
            if(invoiceInfo == '') {
                alert("请填写发票抬头！");
                return;
            }
        }
        if(message.length > 50) {
            return;
        }
        //验证完毕 提交数据
        //数据打包成json对象
        var orderInfo = {};
        orderInfo.addressId = addressId;
        orderInfo.express = post;
        orderInfo.payment = pay;
        orderInfo.isInvoice = isInvoice;
        if(isInvoice) {
            if((typeof invoiceType) != "undefined") {
                orderInfo.invoiceType = invoiceType;
            }
            if(invoiceInfo != '') {
                orderInfo.invoiceInfo = invoiceInfo;
            }
        }
        if((typeof message) != "undefined") {
            orderInfo.message = message;
        }
        if((typeof voucherId) != "undefined") {
            orderInfo.voucherId = voucherId;
        }

        orderInfo.total = total;
        orderInfo.discount = discount;
        orderInfo.distributionFee = fee;
        orderInfo.actual = acutal;
        $.ajax({
            url:"subOrder",
            type:"post",
            dataType:"text",
            contentType:"application/json;charset=UTF-8",
            data:JSON.stringify(orderInfo),
            success:function (data) {
                if(data == "success") {
                    //转到付款页面
                } else {
                    alert("订单提交失败，等一会再提交吧！");
                }
            }
        });

        //var
    }

    $(function () {
        $('.showMoreAddress').click(function () {
            $('.moreAddress').fadeIn();
            $(".model_close").hide();
        });

        $('.close').click(function (event) {
            ;
            $('.masking').hide();
            $(".model_close").show();
        });

        $('.masking').click(function (event) {
            $(this).hide();
            $(".model_close").show();
        });
    })
    /*******************工具函数**************/
        //包邮常量
    var CONST = {};
    CONST.freeShipping = 90;
    CONST.distributionFee = 10;
    Object.freeze(CONST);

    //判断是否符合该优惠券的门槛
    function checkLimit(limit) {
        var currentTotal = parseFloat($("#totalPrice").text());
        if (currentTotal >= limit) {
            return true;
        }
        return false;
    }

    //指定金额修改商品总价
    function changeTotal(num) {
        $("#totalPrice").text(num);
    }
    //自动计算商品总价
    function changeTotalAuto() {
        var total = 0;
        $("td.Moneys").each(function () {
            var a = parseFloat($(this).text().substring(1));
            total += a;
        });
        $("#totalPrice").text(total);
    }

    //修改优惠金额
    function changeDiscount(num) {
        $("#discount").text("-" + num + "");
    }

    //修改配送费
    function changeDistribution() {
        var current = parseFloat($("#totalPrice").text());
        var discount = parseFloat($("#discount").text());
        current = current+discount;
        if (current >= CONST.freeShipping) {
            $("#distribution").text(0);
        } else {
            var count = 0;
            $("td.Moneys").each(function () {
                count++;
            });
            var fee = count * CONST.distributionFee;
            $("#distribution").text(fee);
        }
    }

    //修改实付款
    function changeActualPay() {
        var total = parseFloat($("#totalPrice").text());
        var discount = parseFloat($("#discount").text());
        var disFee = parseFloat($("#distribution").text());
        var actual = total - discount + disFee;
        $("#actualPay").text(actual);
    }

    //修改积分
    function changeIntegral() {
        $("#integral").text($("#actualPay").text());
    }
    //判断红包是否可用
    function checkUseVoucher() {
        //获取当前订单的实付款
        var actualPay = $("#actualPay").text();
        $("select[name=someVoucher] option").each(function (index) {
            if(index == 0) {
                return true;
            }
            var limit = $(this).val().split("&")[0];
            if(limit > actualPay) {
                $(this).attr("disabled","disabled");
            }
        });
    }
    $(document).ready(function () {
        changeTotalAuto();
        changeActualPay();
        changeDistribution();
        changeIntegral();
        checkUseVoucher();

        $('.add_mi').click(function () {
            $(this).css('background', 'url("images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("images/mail.jpg") no-repeat');
            $(this).attr("select","selected");
            var index = $(this).index();
            //清除非当前选择项的选中属性标记
            $(".add_mi").each(function (i) {
                if(i == index) {
                    return true;
                } else {
                    $(this).attr("select","");
                }
            });
        });
        
        $(".Caddress").css("height", $(".add_mi").height());

        window.asd = $('.SlectBox').SumoSelect({csvDispCount: 3});
        window.test = $('.testsel').SumoSelect({okCancelInMulti: true});

        /*********验证红包序列号*************/
        $(".verification_btn").click(function () {
            var serial = $(this).prev().val();
            //   alert(serial.length);
            var patt = /^[a-zA-Z0-9\-]{36}$/;
            if (!patt.test(serial)) {
                alert("优惠券序列号不正确！");
                return;
            }
            $.ajax({
                url: "voucherSerial",
                dataType: "json",
                type: "get",
                data: {"vid": serial},
                success: function (data) {
                    //  var jsonStr = JSON.stringify(data);
                    if (data.amount != 0) {
                        //判断是否符合该优惠券的门槛
                        if (checkLimit(data.limit)) {
                            alert("该优惠券可用！面值为" + data.amount);
                            var isAgree = confirm("您确定要使用该优惠券吗？");
                            if (isAgree) {
                                //使用当前优惠券
                                //获取当前商品总价
                                var current = parseFloat($("#totalPrice").text());
                                current = current - data.amount;
                                //修改商品总价
                                changeTotal(current);
                                //修改优惠金额
                                changeDiscount(data.amount);
                                //修改配送费
                                changeDistribution();
                                //修改实付款
                                changeActualPay();
                                //修改积分
                                changeIntegral();

                                /**********使用记录数据库持久化******/
                                $.ajax({
                                    url: "insVoucherUseRecord",
                                    dataType: "text",
                                    type: "get",
                                    data: {"vid": serial},
                                    success: function () {

                                    }
                                });
                            }
                        } else {
                            alert("您当前的消费不足以使用该优惠券，该优惠券的最低门槛是" + data.limit);
                        }

                    } else {
                        alert("该优惠券不可用！有可能已经被使用过");
                    }
                },
                error: function (data) {
                }
            });
        });
        
        $(".return_btn").click(function () {
            window.location.href = "page/shoppingCar.jsp";
        });
        
        $(".submit_btn").click(function () {
            subOrder();
        });

        $("select[name=someVoucher]").change(function () {
            //获取优惠券金额
           var amount =  $("select[name=someVoucher] option:selected").val().split("&")[2];
               if((typeof amount) != "undefined") {
               //修改优惠金额
               $("#discount").text("-"+amount+"");
           } else {
                   $("#discount").text("-"+0+"");
               }
            //配送费
            changeDistribution();
            //修改实付款
            changeActualPay();
        });
    });

    $(function () {
        $(':input').labelauty();
    });
</script>
</body>
</html>
