<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customer/signup.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
</head>
<body>
<div class="web">
    <div class="clearfix">
        <div class="left">
            <div class="signup-title">注册账号</div>
            <span class="msg"></span>
            <form>
                <input type="text" placeholder="您的手机号" class="usertelno">
                <span class="tip usertelnoTip"></span>

                <input type="text" placeholder="验证码" id="verification">
                <button class="send-verification">发送验证码</button>
                <span class="tip verificationTip"></span>

                <input type="text" placeholder="设置密码" class="userpwd">
                <span class="tip userpwdTip"></span>

                <input type="submit" id="signup" value="注册">
            </form>
        </div>

        <div class="right">
            <span class="words">你好,Friend!</span>
            <span class="tips">欢迎注册Miso</span>

        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/customer/signup.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
    <script>
        //注册
        $("#signup").click(function(event) {
            event.preventDefault(); // 阻止默认提交行为
            var input_usertelno = $(".usertelno").val();
            var input_userpwd = $(".userpwd").val();
            var input_verification = $("#verification").val();

            // ajax提交用户名+密码到后台程序
            $.ajax({
                url: "${pageContext.request.contextPath}/customer/register",
                type: "POST",
                data: {
                    usertelno: input_usertelno,
                    userpwd: input_userpwd,
                    verification:input_verification
                },
                success:function(rows) {
                    console.log(rows)
                    // 后台响应成功则跳转到登录页面
                    if(rows.code===200) {
                        alert("注册成功，点击确认返回到首页！");
                        window.location.href = "${pageContext.request.contextPath}/index.jsp";
                    }
                    else {
                        alert("手机号已注册，请更换手机号！");
                    }
                }
            });
        });

        //发送验证码
        var obj = $(".send-verification");
        obj.click(function () {
            var telno=$(".usertelno").val();
            console.log(telno);

            alert('验证码已发送，请注意查收！');
            // 显示倒计时和重新发送按钮等相关操作
            var countdown = 60;
            setTime(obj);

            function setTime() {
                if (countdown === 0) {
                    obj.prop('disabled', false).text('重新发送验证码');
                } else {
                    obj.prop('disabled', true).text( countdown + '秒'+'重新发送' );
                    countdown--;
                    setTimeout(setTime, 1000);
                }
            }
            setTime();

            // 发送 ajax 请求，请求成功后修改按钮状态和显示倒计时
            $.ajax({
                url: '/miso/send/'+telno, // 发送验证码的API接口地址
                type: 'POST',
                dataType: 'json',
                data: {
                    usertelno: telno// 填入手机号等相关参数
                }

            })
        });
    </script>
</div>
</body>
</html>
