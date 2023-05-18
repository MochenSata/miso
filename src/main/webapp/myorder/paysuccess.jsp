<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/16
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>支付成功</title>

</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myorder/paysuccess.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<body>
<!--导航栏nav-->
<div class="foundation">
    <div class="layui-container">
        <div class="layui-row nav">
            <div class="layui-col-xs2 logo">
                <img src="${pageContext.request.contextPath}/img/logo.png"  class="logopic">
                <span class="slogn">让旅行更有味道</span>
            </div>
            <div class="layui-col-xs7">

            </div>
            <div class="layui-col-xs1 hiddenable"></div>
            <div class="layui-col-xs1 hiddenable"></div>

            <div class="layui-col-xs1 hiddenable1"><span class="custName"></span></div>
            <div class="layui-col-xs1">
            </div>



        </div>
    </div>
</div>
<div class="rongqi">
    <div class="title">支付成功</div>
    <div class="main">
        <div class="l">
            <div class="pic"><img src="${myorder.houseMainpicture}" alt=""></div>
            <div class="housename">${myorder.houseName}</div>
        </div>
        <div class="r">

            <div><span>订单编号：</span>${payment.myorderNum}</div>
            <div><span>流水交易号：</span>${payment.payNum}</div>

            <div><span>订单创建时间：</span>${myorder.myorderCreateTime}</div>
            <div><span>流水创建时间：</span>${payment.payCreatetime}</div>
            <div><span>支付时间：</span>${payment.payTime}</div>
            <div><span>支付金额：</span>${payment.payAmount}</div>


            <a href="javaScript:void(0)" class="topersonal" id="myLink">点击跳转</a>
        </div>
    </div>
</div>
<script>
    var custId ;
    getCurrentLoginCustomerInfo();
    //获得当前登录用户信息
    function getCurrentLoginCustomerInfo() {
        var tokenStr = localStorage.getItem("token");
        var token = JSON.parse(tokenStr);
        console.log("从localStorage 中获得的token是：" + token);
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/customer/currentCustomer",
            headers: {'token': token},
            success: function (result) {
                console.log(result);
                custId = result.data.custId;
                var custName = result.data.custName;
                console.log("custId:" + custId);
                console.log("custName:" + custName);
                $("#custId").text(custId)


            }
        });
    }
        document.getElementById("myLink").addEventListener("click", function() {
        window.location.href = "${pageContext.request.contextPath}/myorder/customer/"+custId;
    });

</script>
</body>
</html>

