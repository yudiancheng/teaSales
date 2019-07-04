//验证码生成
function createYzm() {
    var i;
    var datas=('1234567890qwertyuioplkjhgfdsazxcvbnmQAZWSXEDCRFVTGBYHNUJMIKOLP');
    var res="";
    for(i=0;i<4;i++){
        var index = parseInt(Math.random()*datas.length);
        var num = datas[index];
        res = (res+num)+"";
        $("#yzm")[0].innerText=res;
    }
}
//判断用户使用的是哪种注册方式
function whichButton(ys) {
    var content = ys.innerText;
    //给div追加按钮内容属性
    $(".hd").attr("button-name",content);
}
//数据提交前的验证
function formValidate() {
    //判断用户使用的是哪种注册方式
    var $fs = $(".hd").attr("button-name");
    if($fs == '普通注册'){
        //获取表单内容
        var $isAgree = $("#readme").is(":checked");
        //表单验证
        if(nameValidate() && passValidate() && emailValidate() && checkSame() && checkValidate && $isAgree) {
            //发送数据到后台
            normalSubmit();
        }
    } else {
        //获取表单内容
        var $isAgree = $("#isAgree").is(":checked");
        //表单验证
        if(phoneValidate() && $isAgree) {
            //发送数据到后台
            fastSubmit();
        }
    }
}
//快速注册数据提交
function fastSubmit() {
    $.ajax({
        url:"register",
        type:"post",
        dataType:"text",
        data:$("#form1").serialize(),
        success:function(data){
            if(data == "成功") {
                alert("注册成功，赶紧去登录吧！");
            } else {
                alert("手机号已存在！");
            }
        }
    });
}
//普通注册数据提交
function normalSubmit() {
    $.ajax({
        url:"register",
        type:"post",
        dataType:"text",
        data:$("#form2").serialize(),
        success:function(data){
            if(data == "成功") {
                alert("注册成功，赶紧去登录吧！");
            } else {
                alert("用户名已存在！");
            }
        }
    });
}
//用户名校验
function nameValidate() {
    var $username = $("input[name=username]").val();
    var namePatt = /^[a-zA-Z0-9]{5,20}$/;
    if(!namePatt.test($username) || $username == '') {
        $("#nameMessage").text("用户名不能包含特殊字符！长度在5-20之间");
        return false;
    }
    $("#nameMessage").text("*");
    return true;
}
//密码校验
function  passValidate() {
    var $password = $("input[name=password]").val();
    var passPatt = /^[a-zA-Z0-9]{6,20}$/;
    if(!passPatt.test($password) || $password == '') {
        $("#passMessage").text("密码不能包含特殊字符！长度在6-20之间");
        return false;
    }
    $("#passMessage").text("*");
    return true;
}
//邮箱校验
function  emailValidate() {
    var $email = $("input[name=email]").val();
    var emailPatt = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
    if(!emailPatt.test($email) || $email == '') {
        $("#emailMessage").text("电子邮箱不符合规则！");
        return false;
    }
    $("#emailMessage").text("*");
    return true;
}
//判断确认密码和密码是否一致
function checkSame() {
    var $password = $("input[name=password]").val();
    var $repass = $("input[name=repass]").val();
    if($password != $repass || $repass == '') {
        $("#repassMess").text("两次输入密码不一致！");
        return false;
    }
    $("#repassMess").text("*");
    return true;
}
//验证码校验
function  checkValidate() {
    var $code = $("input[name=validateCode]").val();
    var $recode = $("#yzm").text();
    $code = $code.toLowerCase();
    $recode = $recode.toLowerCase();
    //判断验证码是否正确
    if($code != $recode || $code == '') {
        $("#codeMess").text("验证码不正确！");
        return false;
    }
    $("#codeMess").text("");
    return true;
}
//校验手机号
function phoneValidate() {
    var $phone = $("input[name=phone]").val();
    var $phonePatt = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
    if($phonePatt.test($phone)) {
        return true;
    }
    return false;
}

/********************密码强度***********************/
$(document).ready(
    function () {
        //获取密码长度
        var $less = $(".r");
        var $mid = $(".z");
        var $strong = $(".q");
        $("input[name=password]").keyup(function () {
           var $passInput = $("input[name=password]");
           var $password = $passInput.val();
           if($password.length <= 6) {
               $less.css("visibility","visible");
               $mid.css("visibility","hidden");
               $strong.css("visibility","hidden");
           } else if($password.length >6 && $password.length <=12) {
               $mid.css("visibility","visible");
               $less.css("visibility","visible");
               $strong.css("visibility","hidden");
           } else {
               $strong.css("visibility","visible");
               $less.css("visibility","visible");
               $mid.css("visibility","visible");
           }
        });
    }
);

/**************事件绑定************************/
