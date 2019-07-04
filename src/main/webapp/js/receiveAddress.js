/*****************数据校验*******************/
//校验收件人姓名
function checkReceiveName() {
    var $realName = $("input[name=realName]").val();
    var patt = /^[\u4e00-\u9fa5]{2,6}$/;
    if(!patt.test($realName)) {
        $("#realNameMess").text("真实姓名只能是中文！长度在2-6之间");
        return false;
    }
    $("#realNameMess").text("*");
    return true;
}

//校验收获地址
function  checkReceiveAddress() {
    var $address = $("input[name=address]").val();
    var patt = /[\u4e00-\u9fa5+#]{4,50}/;
    if(!patt.test($address)) {
        $("#addressMess").text("请填写正确收获地址！");
        return false;
    }
    $("#addressMess").text("*");
    return true;
}

//校验邮编
function checkPostNumber() {
    var $number = $("input[name=postNumber]").val();
    var patt = /^[1-9]\d{5}$/;
    if(!patt.test($number)) {
        $("#numberMess").text("请输入正确的邮政编码！");
        return false;
    }
    $("#numberMess").text("*");
    return true;
}

//校验手机号
function checkPhone() {
    var $phone = $("input[name=phone]").val();
    var patt = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
    if(!patt.test($phone)) {
        $("#phoneMess").text("请输入正确的手机号码！");
        return false;
    }
    $("#phoneMess").text("*");
    return true;
}

/***********事件绑定****************/
$(document).ready(function () {
    $("input[name=realName]").keyup(function () {
        checkReceiveName();
    });

    $("input[name=address]").keyup(function () {
        checkReceiveAddress();
    });

    $("input[name=postNumber]").keyup(
        function () {
            checkPostNumber();
        }
    );

    $("input[name=phone]").keyup(function () {
        checkPhone();
    });
    
    $("input[name=submit]").click(function () {
        beforeSubmit();
    });
});

/**********数据提交和确认***********/
//数据提交前的校验
function beforeSubmit() {
    if(checkReceiveName() && checkReceiveAddress() && checkPostNumber() && checkPhone()) {
        submitData();
    }
}
//数据提交
function submitData() {
    $.ajax({
        url:"insAddress",
        type:"post",
        dataType:"text",
        data:$("#form1").serialize(),
        success:function(data){
            if(data == "成功") {
                alert("添加地址成功！");
                window.location.reload(true);
            } else {
                alert("添加地址失败了！");
            }
        }
    });
}

//删除指定地址
function delAddress() {
    var id = $("input[name=hidden]").val();
    $.ajax({
        url:"delAddress",
        type:"get",
        dataType:"text",
        data:{hidden:id},
        success:function(data){
            if(data == '成功') {
                alert("删除地址成功！");
                window.location.reload(true);
            } else {
                alert("删除地址失败了！");
            }
        }
    });
}
