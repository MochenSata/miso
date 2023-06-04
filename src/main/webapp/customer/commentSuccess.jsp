<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2023/6/3
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评论已提交成功！</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<a href="" id="go">
    评论已提交成功！
</a>

</body>
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
            url: "/miso/customer/currentCustomer",
            headers: {'token': token},
            success: function (result) {
                console.log(result);
                custId = result.data.custId;
                $('#go').attr('href', "${pageContext.request.contextPath}/myorder/customer/" + custId);
            }
        })
    }

</script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</html>
