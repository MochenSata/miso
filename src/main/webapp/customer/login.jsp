<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="../css/customer/login.css">

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="web">
    <div class="clearfix">
        <div class="left">
            <div class="login-title">登录账号</div>
            <span class="msg"></span>
            <form action="" method="post">
                <input type="text"  placeholder="您的手机号" class="usertelno" name="">
                <span class="tip usertelnoTip"></span>
                <input type="password" placeholder="您的密码" class="userpwd" name="">
                <span class="tip userpwdTip"></span>

                <a href="signup.html">去注册</a>
                <input type="button" id="login"  value="登录">

            </form>
        </div>

        <div class="right">
            <span class="words">你好,Friend!</span>
            <span class="tips">登录以享受您的旅途</span>

        </div>
    </div>
</div>




<script src="../js/customer/login.js"></script>
<script>
    $("#login").click(function (){
        $.ajax({
            type:"post",
            url:"http://localhost:8080/miso/customer/login",
            data:{
                custTelno:$(".usertelno").val(),
                custPassword:$(".userpwd").val()
            },
            success:function (result){
                console.log("result:" + result);
                console.log("json result:" + JSON.stringify(result));
                //保存信息到本地，里面都 token
                var token = JSON.stringify(result.data);
                console.log("token:" + token);
                localStorage.setItem("token",token);
                 window.location.href = "../index.jsp";
            }
        })
    })
</script>
</body>
</html>
