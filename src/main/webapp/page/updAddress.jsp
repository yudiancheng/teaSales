<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="threelinkage/linkage.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/receiveAddress.js" type="text/javascript"></script>
    <script src="js/shopCar.js" type="text/javascript"></script>
    <title>用户地址修改</title>
</head>
<body>
<!--用户中心(地址管理界面)-->
<div class="user_style clearfix" id="user">
    <div class="clearfix user">
        <script src="threelinkage/kit.js"></script>
        <!--[if IE]>
        <script src="threelinkage/ieFix.js"></script>
        <![endif]-->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-30210234-1']);
            _gaq.push(['_trackPageview']);
            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
        </script>
        <script src="threelinkage/dom.js"></script>
        <script src="threelinkage/event.js"></script>
        <script src="threelinkage/math.js"></script>
        <script src="threelinkage/TreeDict.js"></script>
        <script src="threelinkage/form.js"></script>
        <script src="threelinkage/combobox.js"></script>
        <script src="threelinkage/suggestselect.js"></script>
        <script src="threelinkage/list.js"></script>
        <!--json data-->
        <script src="threelinkage/json-data.js" charset="utf-8"></script>
        <!--右侧内容样式-->
        <div class="r_user_style">
            <div class="user_Borders">
                <div class="title_name">
                    <span class="name">地址修改</span>
                </div>
                <div class="about_user_info">
                    <form id="form1">
                        <input type="hidden" name="hidden"/>
                        <div class="user_layout">
                            <ul>
                                <li class="li"><label class="user_title_name">收件人姓名：</label><input name="realName"
                                                                                                   type="text"
                                                                                                   class="add_text"><i
                                        id="realNameMess">*</i></li>
                                <li class="li">
                                    <div class="select">
                                        <span class="select_adderss"><label> 省份 </label><select
                                                class="kitjs-form-suggestselect " required="required"
                                                name="province"></select></span>
                                        <span class="select_adderss"><label> 市/县 </label><select
                                                class="kitjs-form-suggestselect " required="required"
                                                name="city"></select></span>

                                        <i>*</i>
                                    </div>
                                </li>
                                <li class="li"><label class="user_title_name">收货地址：</label><input name="address"
                                                                                                  type="text"
                                                                                                  class="add_text"><i
                                        id="addressMess">*</i></li>
                                <li class="li"><label class="user_title_name">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</label><input
                                        name="postNumber" type="text" class="add_text"><i id="numberMess">*</i></li>
                                <li class="li"><label class="user_title_name">手&nbsp;机&nbsp;号：</label><input
                                        name="phone" type="text" class="add_text"><i id="phoneMess">*</i></li>
                            </ul>
                            <div class="operating_btn"><input name="submitChange" type="button" value="确认" class="submit—btn" onclick="beforeSubmit()">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    var a = $kit.els8cls($kit.ui.Form.ComboBox.Select.defaultConfig.transformCls), a1 = [];
    for (var i = 0; i < a.length; i++) {
        a1.push(a[i])
    }
    a = a1;
    var b1 = new $kit.ui.Form.ComboBox.Select({
        el: a[0],
        data: (function () {
            var provTreeDict = new TreeDict();
            for (var prov in chinaJSON) {
                provTreeDict.ad(prov, prov);
            }
            return provTreeDict;
        })()
    });
    b1.transform();
    b1.ev({
        ev: 'change',
        fn: function () {
            var prov = chinaJSON[b1.inputEl.value];
            if (prov == null) {
                return;
            }
            var cityTree = new TreeDict();
            for (var city in prov) {
                cityTree.ad(city, city);
            }
            b2.inputEl.value = '';
            b2.formEl.value = '';
            b2.config.data = cityTree;
            b2.list.buildList(cityTree.search(''));
        }
    });
    var b2 = new $kit.ui.Form.ComboBox.Select({
        el: a[1],
        data: undefined
    });
    b2.transform();
    b2.ev({
        ev: 'change',
        fn: function () {
            var city = chinaJSON[b1.inputEl.value][b2.inputEl.value];
            if (city == null) {
                return;
            }
            var districtTree = new TreeDict();
            for (var district in city) {
                districtTree.ad(district, city[district]);
            }
            b3.inputEl.value = '';
            b3.formEl.value = '';
            b3.config.data = districtTree;
            b3.list.buildList(districtTree.search(''));
        }
    });

</script>

<script type="text/javascript">
    //拆分url地址
    var url = window.location.href;
    url = decodeURI(url);
    var start = url.indexOf("?");
    url = url.substring(start+1);
    var newString = {};
    var t = 0;
    var i = 0;
    var j =  0;
    while(i < url.length && j < url.length) {
        while(i < url.length && url[i] != '=') {
            i++;
        }
        while(j < url.length && url[j] != '&') {
            j++;
        }
        if(i<url.length && j<url.length) {
            newString[t++] = url.substring(i + 1, j);
            i += 1;
            j += 1
        }
    }
    newString[t] = url.substring(i+1);
    //把各个input填充值
    $("input[name=hidden]").val(newString[0]);
    $("input[name=realName]").val(newString[1]);
    $("input[name=postNumber]").val(newString[2]);
    $("input[name=phone]").val(newString[3]);
    $("input[name=address]").val(newString[4]);

    function beforeSubmit() {
        if(checkReceiveName() && checkReceiveAddress() && checkPostNumber() && checkPhone()) {
            var options = $("#district option:selected");
           submitChange();
        }
    }
    function submitChange() {
            $.ajax({
                url: "updUserAddress",
                type: "post",
                dataType: "text",
                data: $("#form1").serialize(),
                success: function (data) {
                        if (data == "成功") {
                            alert("修改地址成功！");
                            window.close();
                            self.opener.location.reload();
                        } else {
                            alert("修改地址失败了！");
                    }
                }
            });
    }
</script>
