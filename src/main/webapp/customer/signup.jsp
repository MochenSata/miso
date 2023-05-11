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
    <link rel="stylesheet" href="../css/customer/signup.css">
</head>
<body>
<div class="web">
    <div class="clearfix">
        <div class="left">
            <div class="signup-title">注册账号</div>
            <span class="msg"></span>
            <form action="../index.html">
                <input type="text" placeholder="您的手机号" class="usertelno">
                <span class="tip usertelnoTip"></span>
                <input type="text" placeholder="验证码" id="verification">
                <button class="send-verification">发送验证码</button>
                <span class="tip verificationTip"></span>


                <input type="submit" id="signup" value="注册">
            </form>
        </div>

        <div class="right">
            <span class="words">你好,Friend!</span>
            <span class="tips">欢迎注册Miso</span>

        </div>
    </div>

    <script src="../js/customer/signup.js"></script>
</div>
</body>
</html>
