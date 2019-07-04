/***************登录表单校验和数据提交*******************************************/
//用户名校验
function checkUserName() {
    var $username = $("input[name=username]").val();
    var namePatt = /^[a-zA-Z0-9]{5,20}$/;
    if (!namePatt.test($username) || $username == '') {
        $(".Prompt").text("帐号不能有特殊字符，长度在5-20之间");
        $(".Prompt").css("color", "red");
        return false;
    }
        $(".Prompt").text("用户名合法");
        $(".Prompt").css("color", "green");
    return true;
}

//密码校验
function checkPass() {
    var $password = $("input[name=password]").val();
    var passPatt = /^[a-zA-Z0-9]{6,20}$/;
    if (!passPatt.test($password) || $password == '') {
        $(".Prompt").text("密码不能有特殊字符，长度在6-20之间");
        $(".Prompt").css("color", "red");
        return false;
    }
    if(checkUserName()) {
        $(".Prompt").text("数据合法");
        $(".Prompt").css("color", "green");
    }
    return true;
}

//数据提交
function loginSubmit() {
    //先进行表单校验
    if (!checkUserName() || !checkPass()) {
        return false;
    }
    return true;
}

/***********************添加事件绑定**********************************/
$(document).ready(function () {
    $("input[name=username]").blur(
        function () {
            checkUserName();
        }
    );
    $("input[name=password]").keyup(
        function () {
            checkPass();
        }
    );
});