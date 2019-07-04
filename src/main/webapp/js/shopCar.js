$(document).ready(function () {
    $("#Shopping_list").mouseover(function () {
        checkRemain();
    });



    /**********加入购物车*********/
$("#addToCar").click(function () {
    var pid = parseInt($("input[name=productId]").val());
    //判断购物车中是否存在该商品
    if(checkSame(pid)) {
        alert("您的购物车中已经有这个东西了！");
        return ;
    }
    //获取商品属性
    var img = $("#imageMenu ul li:first").children(":first").attr("src");
    var index = img.indexOf("/");
    img = img.substring(index+1);
    var price = parseInt($("#productPrice").text().substring(1));
    var name = $("#productName").text();
    var currentPrice = parseInt($("#shopping-amount").text().substring(1));
    var currentNum = parseInt($("#proNum").text());
    currentPrice += price;
    currentNum += 1;
    //加入html标签
    $(".p_s_list").append("<li class=''>" +
        " <input type='hidden' name='car-pid'value='"+pid+"'/>\n" +
        " <div class='img'><img src='small/"+img+"'></div>\n" +
        " <div class='content'><p><a href='#'>产品名称</a></p><p>"+name+"</p></div>\n" +
        " <div class='Operations'>\n" +
        " <p class='Price'>￥"+price+"</p>\n" +
        " <a class='delButton'>删除</a></div>\n" +
        " </li>");
    //隐藏空提示
    if($(".nogoods").html().length > 0) {
        $(".nogoods").hide();
    }
    $(".proNum").text(currentNum);
    $(".totalNum").text("￥"+currentPrice+"");
    //数据库持久化
    subDel('insProToCar',pid);
    //保存cookie供其他页面访问
   /* var pk = "pid" + pid + "";
    var ik = "img" + img + "";
    var nk = "proName" + name + "";
    var prick = "price" + price+ "";
   setCookies(pk,pid);
   setCookies(ik,img);
   setCookies(nk,name);
   setCookies(prick,price);*/
});

    /****删除购物车中的商品***********/
    $(".p_s_list").on("click","li a.delButton" ,function () {
        var res = confirm("确定要从购物车中删除？");
        if (res) {
            //删除li元素
            var price = parseInt($(this).prev().text().substring(1));
            var originPrice = parseInt($("#shopping-amount").text().substring(1));
            var parent = $(this).parent("div");
            var liParent = parent.parent("li");
            var pid = parseInt(liParent.children("input:first").val());
            liParent.attr("class", "isDel");
            $(".isDel").remove();
            //减少购物车商品数量和价值
            //减少数量
            var num = parseInt($("#proNum").text());
            num--;
            $(".proNum").text(num);
            //判断购物车中是否还有商品
            checkRemain();
            //减少价值
            var current = originPrice - price + "";
            $(".totalNum").text("￥" + current+"");
            //数据库持久化
            subDel('delProFromCar',pid);
            //删除cookie
            //delCookie("pid");
          //  delCookie("")
        }
    });

});

/***********辅助函数**************/
//检查购物车中的商品是否为空 如果为空的话那么就显示信息
function checkRemain() {
    var li = $(".p_s_list").children("li");
    if(li.length <= 0) {
        $(".nogoods").show();
    } else {
        $(".nogoods").hide();
    }
}

//判断购物车当中是否已经存在该商品
var isSame;
function checkSame(pid) {
    $(".p_s_list li").each(function () {
        var id = $(this).children("input:first").val();
        if(pid == id) {
            isSame = true;
            return false;
        }
    });
   if(isSame) {
       return true;
   } else{
       return false;
   }
}

//设置cookie
function setCookies(key,value,day) {
    var date = new Date();
    date.setTime(date.getTime()+(day*24*60*60*1000));
    var expires = "expires=" + date.toUTCString();
    document.cookie = key + "=" + value + ";" + expires;
}

//删除cookie
function delCookie(key) {
    document.cookie = "username=;expires=Thu, 01 Jan 1970 00:00:00 UTC";
}
/*********提交修改**********/
function subDel(url,pid) {
    $.ajax({
        url:url,
        type:"get",
        dataType:"text",
        data:{"pid":pid},
        success:function () {

        }
    });
}

//收藏商品提交数据
function submitCollect(pid) {
    pid = parseInt(pid);
    $.ajax({
        url:"collect",
        type:"get",
        dataType:"text",
        data:{"pid":pid},
        success:function (data) {
            if(data == '成功') {
                alert("收藏成功!");
            } else {
                alert("您已收藏该商品!");
            }
        }
    });
}




