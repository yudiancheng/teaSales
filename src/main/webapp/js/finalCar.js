//数字增加
$(document).ready(function () {

    //全选
    $("#CheckedAll").click(function () {
        if (this.checked) {                 //如果当前点击的多选框被选中
            $('input[type=checkbox][name=checkitems]').attr("checked", true);
        } else {
            $('input[type=checkbox][name=checkitems]').attr("checked", false);
        }
    });
    $('input[type=checkbox][name=checkitems]').click(function () {
        var flag = true;
        $('input[type=checkbox][name=checkitems]').each(function () {
            if (!this.checked) {
                flag = false;
            }
        });

        if (flag) {
            $('#CheckedAll').attr('checked', true);
        } else {
            $('#CheckedAll').attr('checked', false);
        }
    });
    //输出值
    $("#send").click(function () {
        if ($("input[type='checkbox'][name='checkitems']:checked").attr("checked")) {
            var agree = confirm("确定要删除该商品？");
            if(agree) {
                $("tr").each(function () {
                    var checked = $(this).children(":first").children("input").is(":checked");
                    if (checked) {
                       var pid=  parseInt($(this).children("td.cz").children(":first").val());
                        subDel('delProFromCar', pid);
                        $(this).remove();
                    }
                });
                updatePrice();
            }
        } else {
            var str = "你未选中任何商品，请选择后在操作！";
            alert(str);
        }
    });
    /****************价格计算*********************/

    //减按钮事件绑定
    $(".jian").click(
        function () {
            var num = $(this).next("input").val();
            num--;
            if (num <= 1) {
                num = 1;
            }
            $(this).next("input").val(num);
            //计算小计
            var parent = $(this).parent().parent();
            var price = parseFloat(parent.prev().text().substring(1));
            var total = num * price;
            parent.next().text("￥" + total + "");
            updatePrice();
        }
    );
    //加按钮事件绑定
    $(".jia").click(
        function () {
            var num = $(this).prev("input").val();
            num++;
            $(this).prev("input").val(num);
            //计算小计
            var parent = $(this).parent().parent();
            var price = parseFloat(parent.prev().text().substring(1));
            var total = num * price;
            parent.next().text("￥" + total + "");
            updatePrice();
        }
    );

    //商品删除
    $(".delButton").click(function () {
        var isAgree = confirm("确定要删除宝贝吗？");
        if (isAgree) {
            var pid = parseFloat($("input[name=pid]").val());
            var ys = $(this).parent().parent();
            ys.remove();
            subDel('delProFromCar', pid);
            updatePrice();
        }

    });

    updatePrice();

    /**********提交购物车中商品的数量***************/
    $(".cartsubmit").click(function () {
        var productNum = new Array();
        $("tr.tr").each(function () {
            var jsonString = {};
            var num = $(this).children("td.sl").children("div.Numbers").children("input.number_text").val();
            var pid = $(this).children("td.cz").children("input:first").val();
            jsonString.pid = pid;
            jsonString.num = num;
            productNum.push(jsonString);
        });
       // alert(JSON.stringify(productNum));
        $.ajax({
            url:"updShoppingTotal",
            type:"post",
            dataType:"text",
            contentType:"application/json",
            data:JSON.stringify(productNum),
            success:function (data) {
                if(data == "success") {
                    window.location.href = "jumpConfirmOrder";
                }
            }

        });
    });

});

/************辅助函数*************/

//计算商品总价和省的钱
function updatePrice() {
    //计算商品原来总价
    var originTotal = 0;
    //计算商城内总价
    var totalPrice = 0;
    var num = 1;//商品数量
    $("td.scj").each(function () {
        num = parseFloat($(this).next().next().children().children("input").val());
        originTotal += (parseFloat($(this).text().substring(1))*num);
    });
    $("td.xj").each(function () {
        totalPrice += parseFloat($(this).text().substring(1));
    });
    //节省的差价
    var saveMoney = originTotal - totalPrice;
    $(".sumPrice").text("" + totalPrice + "元");
    $(".Discount").children("span.price").text("" + saveMoney + "元");
}



