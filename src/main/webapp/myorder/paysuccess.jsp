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
<script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
<body>
<div>
    支付成功
    <a href="">点击跳转</a>
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
</script>
</body>
</html>

