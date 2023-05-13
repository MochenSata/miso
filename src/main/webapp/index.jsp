<%--
  Created by IntelliJ IDEA.
  User: 12912
  Date: 2023/5/10
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Miso</title>
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.6.4.min.js"></script>
    <script src="layui/layui.js"></script>
    <style>
        .hiddenable1 {
            display: none;
        }
    </style>
</head>
<body>
<!--导航栏nav-->
<div class="foundation">
    <div class="layui-container">
        <div class="layui-row nav">
            <div class="layui-col-xs2 logo">
                <img src="img/logo.png"  class="logopic">
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
            <div class="layui-col-xs1 hiddenable"><a href="customer/login.jsp" ><span class="login">登录</span></a></div>
            <div class="layui-col-xs1 hiddenable"><a href="customer/signup.html" ><span class="signup">注册</span></a></div>
            <div class="layui-col-xs1 hiddenable1"><span class="login">欢迎</span></div>
            <div class="layui-col-xs1 hiddenable1"><span class="custName"></span></div>
            <div class="layui-col-xs1">
                <div class="layui-btn-container">
                    <button type="button" class="layui-btn layui-btn-primary demo1 personcenter">
                        <div href="" class="personal-btn">
                            <div class="headshort"><img src="img/customer/headshort.svg" alt=""></div>
                            <div class="personal">
                                <span id="custId" style="display: none"></span>
                                <img src="img/customer/hengxian.svg" class="hengxian">
                            </div>
                        </div>

                    </button>
                </div>
            </div>



        </div>
    </div>
</div>

<!-- <div class="layui-container"> -->

<!--热门推荐header-->

<div class="header-title">
    <span class="hotwords">热门推荐</span>
</div>
<div class="layui-row header">

    <div class="layui-col-xs10 hotarea">
        <div class="layui-carousel" id="test3" lay-filter="test4">
            <div carousel-item="" id="hothouses">

            </div>
        </div>
    </div>

</div>

<!--分类-->
<div class="classification">
    <ul>
        <li>
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius selectkindbtn" lay-anim="false">
                <img src="img/index/all.png" alt="" class="kindimg">
                <span class="kindword">全部</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/chuanwu.png" alt="" class="kindimg">
                <span class="kindword">船屋</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/haijingfang.png" alt="" class="kindimg">
                <span class="kindword">海景房</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/luying.png" alt="" class="kindimg">
                <span class="kindword">露营</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/muwu.png" alt="" class="kindimg">
                <span class="kindword">木屋</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/nongjia.png" alt="" class="kindimg">
                <span class="kindword">农家乐</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/rishilvguan.png" alt="" class="kindimg">
                <span class="kindword">日式</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/shuwu.png" alt="" class="kindimg">
                <span class="kindword">树屋</span>
            </button>
        </li>
    </ul>
</div>


<script>

    $(".classification").on("click", "button", function(event) {
        var ele = $(event.target).closest("button");
        if (ele.length) {
            var oldbtn = $(".selectkindbtn");
            oldbtn.removeClass("selectkindbtn").addClass("kindbtn");
            ele.addClass("selectkindbtn");
            var selectbtnValue = ele.find(".kindword").text();
            console.log("被选中的" + selectbtnValue);
            var url="${pageContext.request.contextPath}/house/list"
            $.ajax({
                url,
                type: "get",
                data: {type: selectbtnValue},
                success: function (result) {
                    var listhtml="";
                    // if (!result.data) {
                    //     console.log("数据为空");
                    //     return;
                    // }
                    var listhtml = "";
                    var proWriterArr = result.data;// 存放的查找到的数据集合

                    for (var i=0;i<proWriterArr.length;i++){
                        var houseId = proWriterArr[i].houseId;
                        var houseName = proWriterArr[i].houseName;
                        var houseKind = proWriterArr[i].houseKind;
                        var houseMainpicture = proWriterArr[i].houseMainpicture;
                        var houseScore = proWriterArr[i].houseScore;
                        var housePrice = proWriterArr[i].housePrice;
                        var houseIntro = proWriterArr[i].houseIntro;
                        console.log(houseName)
                        listhtml+='<a href="${pageContext.request.contextPath}/house/'+houseId+'"><li class="home">'
                        listhtml+='    <img src="'+houseMainpicture+'" >'
                        listhtml+='    <div class="line1">'
                        listhtml+='    <span class="homekind">类型:'+houseKind+'</span>'
                        listhtml+=' <img src="img/index/pingfen.png" class="pingfenico">'
                        listhtml+='    <span class="score">'+houseScore+'</span>'
                        listhtml+=' </div>'
                        listhtml+='<div class="line2"><b>'+houseName+'</b></div>'
                        listhtml+=' <div class="line3"><b>￥</b><span class="price">'+housePrice+'</span><span class="houzhui">/晚</span></div>'
                        listhtml+='</li></a>';
                    }
                    $(".homelist").html(listhtml);
                }
            })
        }
    });
        // $(".kindbtn").click(function (event){
        //     var type=$(this).data("type");
        //     console.log(type);
        //
        // })
                    // if (result && result.code == 0 && result.data && result.data.length) {

                            //将得到的数据渲染到页面中
                <%--            var LiEle=--%>
                <%--                '<a href="${pageContext.request.contextPath}/house/'+houseId+'"><li class="home">'+--%>
                <%--                '    <img src="'+houseMainpicture+'" >'+--%>
                <%--                '    <div class="line1">'+--%>
                <%--                '    <span class="homekind">类型:'+houseKind+'</span>'+--%>
                <%--                ' <img src="img/index/pingfen.png" class="pingfenico">'+--%>
                <%--                '    <span class="score">'+houseScore+'</span>'+--%>
                <%--                ' </div>'+--%>
                <%--                '<div class="line2"><b>'+houseName+'</b></div>'+--%>
                <%--                ' <div class="line3"><b>￥</b><span class="price">'+housePrice+'</span><span class="houzhui">/晚</span></div>'+--%>
                <%--                '</li></a>';--%>
                <%--            listhtml=listhtml+LiEle;--%>
                <%--            $(".homelist").html(listhtml);--%>
                <%--        }--%>
                <%--    } else {--%>
                <%--        console.error('返回的数据格式不正确');--%>
                <%--    }--%>
                <%--},--%>
                <%--error: function (xhr, status, error) {--%>
                <%--    console.error('AJAX请求失败：' + error);--%>
                <%--//},--%>
</script>

<script>
    //进入首页加载热门推荐数据
    var hotHtml="";
    loadHotHouses();
    function loadHotHouses(){
        var url = "${pageContext.request.contextPath}/house/hot";
        $.get(url
            ,null
            , function (result){
                //console.log(JSON.stringify(result));
                var hotList=result.data;//存放热门推荐房源的集合

                for(var i=0;i<hotList.length;i++){
                    var houseId=hotList[i].houseId;
                    var houseName=hotList[i].houseName;
                    var houseKind=hotList[i].houseKind;
                    var houseMainpicture=hotList[i].houseMainpicture;
                    var houseScore=hotList[i].houseScore;
                    var housePrice=hotList[i].housePrice;
                    var houseIntro=hotList[i].houseIntro;

                    console.log(houseName)

                    // 将得到的数据渲染到页面中

                    var LiEle=
                        '<div class="hot">'+
                        '        <img src="'+houseMainpicture+'" class="hotpic"></img>'+
                        '    <a href="${pageContext.request.contextPath}/house/'+houseId+'"><div class="hotdesc">'+
                        '     <span class="housename">'+houseName+'</span>'+
                        '    <span class="housekind">类型：<span>'+houseKind+'</span></span>'+
                        '     <span class="introduction">'+houseIntro+'</span>'+
                        '    <span class="houseprice">价格：￥<span><b>'+housePrice+'</b></span> 起</span>'+
                        '    <span class="clicktodesc">点击查看详情</span>'+
                        '    </div></a>'+
                        '     </div>'
                    hotHtml=hotHtml+LiEle;

                    // $("#hothouses").append(LiEle);

                    $("#hothouses").html(hotHtml);
                }
                //console.log(hotHtml);

            })
    }
</script>

<!--民宿列表homelist-->
<div class="homelist">

    <ul  class="homes">


    </ul>
</div>
<script>
    // 项目刚开启的时候要想后端的 controller 层进行请求，访问数据
    loadHouse();

    // 加载首页需要的商品数据，产生 ajax 请求
    function loadHouse(){
        console.log("abc");
        var url="${pageContext.request.contextPath}/house/hotlist";
        $.get(url
            ,null
            ,function (result){
                console.log(JSON.stringify(result));
                var proWriterArr=result.data;// 存放的查找到的数据集合
                for (var i=0;i<proWriterArr.length;i++) {
                    var houseId = proWriterArr[i].houseId;
                    var houseName = proWriterArr[i].houseName;
                    var houseKind = proWriterArr[i].houseKind;
                    var houseMainpicture = proWriterArr[i].houseMainpicture;
                    var housePrice = proWriterArr[i].housePrice;
                    var houseScore = proWriterArr[i].houseScore;
                    console.log(houseId);
                    // 将得到的数据渲染到页面中
                    var LiEle=
                        '<a href="${pageContext.request.contextPath}/house/'+houseId+'"><li class="home">'+
                    '    <img src="'+houseMainpicture+'" >'+
                    '    <div class="line1">'+
                    '    <span class="homekind">类型:'+houseKind+'</span>'+
                    ' <img src="img/index/pingfen.png" class="pingfenico">'+
                    '    <span class="score">'+houseScore+'</span>'+
                    ' </div>'+
                    '<div class="line2"><b>'+houseName+'</b></div>'+
                    ' <div class="line3"><b>￥</b><span class="price">'+housePrice+'</span><span class="houzhui">/晚</span></div>'+
                    '</li></a>';

                    //console.log(LiEle);
                    $(".homes").append(LiEle);
                }
            });
    }
</script>

<div class="pagearea">
    <a href="" class="pagebtn"><</a>
    <span class="currentpage">1</span>
    <a href="" class="pagebtn">></a>
</div>




<script defer src="js/index.js" charset="utf-8"></script>

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
            url: "customer/currentCustomer",
            headers: {'token': token},
            success: function (result) {
                console.log(result);
                custId = result.data.custId;
                var custName = result.data.custName;
                $(".hiddenable").hide();
                $(".hiddenable1").show();
                console.log("custId:" + custId);
                console.log("custName:" + custName);
                $("#custId").text(custId)
                $(".custName").text(custName)


                //个人中心
                setTimeout(function (){
                    layui.use(['dropdown', 'util', 'layer', 'table'], function(){
                        var dropdown = layui.dropdown
                            ,util = layui.util
                            ,layer = layui.layer
                            ,table = layui.table
                            ,$ = layui.jquery;
                        //右上角个人中心
                        var id=$("#custId").text();
                        dropdown.render({

                            elem: '.demo1'
                            ,data: [{
                                title: '个人中心'
                                ,href:"${pageContext.request.contextPath}/myorder/customer/"+id
                            },{
                                title: '退出登录'
                                ,href:""
                            }]
                            ,click: function(obj){
                                window.location.href = obj.href;
                            }
                        });

                    });
                },2000);
            }
        })
    }


</script>
</body>
</html>