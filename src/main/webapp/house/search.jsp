<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>搜索</title>
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/house/search.css">
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../layui/layui.js"></script>
</head>
<body>
<!--导航栏nav-->
<div class="foundation">
    <div class="layui-container">
        <div class="layui-row nav">
            <div class="layui-col-xs2 logo">
                <img src="../img/logo.png"  class="logopic">
                <span class="slogn">让旅行更有味道</span>
            </div>
            <div class="layui-col-xs7">
                <div class="search-area">
                    <form action="${pageContext.request.contextPath}/house/search">
                        <input type="text" placeholder="请输入目的地" name="search">
                        <input type="submit" value="搜索">
                    </form>
                </div>
            </div>
            <div class="layui-col-xs1"><a href="../customer/login.html" ><span class="login">登录</span></a></div>
            <div class="layui-col-xs1"><a href="../customer/signup.html" ><span class="signup">注册</span></a></div>

            <div class="layui-col-xs1">
                <div class="layui-btn-container">
                    <button class="layui-btn layui-btn-primary demo1 personcenter">
                        <div href="" class="personal-btn">
                            <div class="headshort"><img src="../img/customer/headshort.svg" alt=""></div>
                            <div class="personal">
                                <img src="../img/customer/hengxian.svg" class="hengxian">
                            </div>
                        </div>

                    </button>
                </div>
            </div>



        </div>
    </div>
</div>

<!--条件查询-->
<div class="condition">
    <div class="housekind">
        <span class="kindtitle">类型</span>
        <a href="" class="kindbtn">船屋</a>
        <a href="" class="kindbtn">海景房</a>
        <a href="" class="kindbtn">露营</a>
        <a href="" class="kindbtn">木屋</a>
        <a href="" class="kindbtn">农家乐</a>
        <a href="" class="kindbtn">日式 </a>
        <a href="" class="kindbtn">树屋</a>
    </div>
    <div class="houseprice">
        <span class="kindtitle">价格区间</span>
        <a href="" class="pricebtn">500以下</a>
        <a href="" class="pricebtn">500~1k</a>
        <a href="" class="pricebtn">1k~1.5k</a>
        <a href="" class="pricebtn">1.5k~2k</a>
        <a href="" class="pricebtn">2k~2.5k</a>
        <a href="" class="pricebtn">2.5k~3k</a>
        <a href="" class="pricebtn">3k以上</a>
    </div>
    <div class="housesize">
        <span class="kindtitle">卧室数量</span>
        <a href="" class="sizebtn">1间</a>
        <a href="" class="sizebtn">2间</a>
        <a href="" class="sizebtn">3间</a>
        <a href="" class="sizebtn">4间</a>

    </div>

</div>

<!--民宿列表homelist-->
<div class="homelist">
    <ul>
        <c:if test="${serverResult.code == 200}">
        <c:forEach var="house" items="${serverResult.data}">
        <a href="${pageContext.request.contextPath}/house/${house.houseId}"><li class="home">
            <img src="${house.houseMainpicture}" >
            <div class="line1">
                <span class="homekind">类型:${house.houseKind}</span>

                <img src="../img/index/pingfen.png" class="pingfenico">
                <span class="score">${house.houseScore}</span>

            </div>
            <div class="line2"><b>${house.houseName}</b></div>
            <div class="line3"><b>￥</b><span class="price">${house.housePrice}</span><span class="houzhui">/晚</span></div>
        </li></a>
        </c:forEach>
        </c:if>

    </ul>

</div>



<script src="../js/house/search.js"></script>
</body>
</html>
