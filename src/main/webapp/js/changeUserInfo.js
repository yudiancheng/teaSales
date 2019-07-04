/***********个人信息修改表单校验***************/
//校验用户名
function  checkUserName() {
    var $username = $("input[name=username]").val();
    var patt = /^[a-zA-Z0-9]{5,20}$/;
    if(!patt.test($username)) {
        $("#usernameMess").text("用户名不能包含特殊字符！长度在5-20之间");
        return false;
    }
    $("#usernameMess").text("*");
    return true;
}
//校验真实姓名
function checkRealName() {
    var $realName = $("input[name=realName]").val();
    var patt = /^[\u4e00-\u9fa5]{2,6}$/;
    if(!patt.test($realName)) {
        $("#realNameMess").text("真实姓名只能是中文！长度在2-6之间");
        return false;
    }
    $("#realNameMess").text("*");
    return true;
}
//校验手机号
function checkPhone() {
    var $phone =$("input[name=phone]").val();
    var patt = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
    if(!patt.test($phone)) {
        $("#phoneMess").text("手机号码格式错误");
        return false;
    }
    $("#phoneMess").text("*");
    return true;
}
//校验邮箱
function checkEmail() {
    var $email = $("input[name=email]").val();
    var patt = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
    if(!patt.test($email)) {
        $("#emailMess").text("邮箱格式错误");
        return false;
    }
    $("#emailMess").text("*");
    return true;
}

/****************数据提交前的校验***************/
function beforeSubmit() {
    if(checkUserName() && checkRealName() && checkPhone() && checkEmail()) {
        submitUpdate();
        return true;
    }
    return false;
}

/************ajax数据提交**********************/
function submitUpdate() {
    $.ajax({
        url:"updUserInfo",
        type:"post",
        dataType:"text",
        data:$("#form1").serialize(),
        success:function(data){
            if(data == "成功") {
                alert("个人信息修改成功！");
            } else {
                alert("注册失败！");
            }
        }
    });
}

/**************事件绑定*****************/
$(document).ready(function () {
    $("input[name=username]").blur(function () {
        checkUserName();
    });
    $("input[name=realName]").blur(function () {
        checkRealName();
    });
    $("input[name=phone]").blur(function () {
        checkPhone();
    });
    $("input[name=email]").blur(function () {
        checkEmail();
    });
    $("#submit").click(function () {
        beforeSubmit();
    });
});
