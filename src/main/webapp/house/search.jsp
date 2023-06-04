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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/house/search.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<!--导航栏nav-->
<div class="foundation">
    <div class="layui-container">
        <div class="layui-row nav">
            <div class="layui-col-xs2 logo">
                <a href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath}/img/logo.png"  class="logopic">
                </a>
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
            <div class="layui-col-xs1"><a href="${pageContext.request.contextPath}/customer/login.jsp" ><span class="login">登录</span></a></div>
            <div class="layui-col-xs1"><a href="${pageContext.request.contextPath}/customer/signup.jsp" ><span class="signup">注册</span></a></div>

            <div class="layui-col-xs1">
                <div class="layui-btn-container">
                    <button class="layui-btn layui-btn-primary demo1 personcenter">
                        <div href="" class="personal-btn">
                            <div class="headshort"><img src="../img/customer/headshort.svg" alt=""></div>
                            <div class="personal">
                                <img src="${pageContext.request.contextPath}/img/customer/hengxian.svg" class="hengxian">
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
        <button type="button" class="kindbtn" value="船屋"><span>船屋</span></button>
        <button type="button" class="kindbtn" value="海景房"><span>海景房</span></button>
        <button type="button" class="kindbtn" value="露营"><span>露营</span></button>
        <button type="button" class="kindbtn" value="木屋"><span>木屋</span></button>
        <button type="button" class="kindbtn" value="农家乐"><span>农家乐</span></button>
        <button type="button" class="kindbtn" value="日式"><span>日式</span></button>
        <button type="button" class="kindbtn" value="树屋"><span>树屋</span></button>
    </div>
    <div class="houseprice">
        <span class="kindtitle">价格区间</span>
        <button type="button" class="pricebtn" value="0~500"><span>0~500</span></button>
        <button type="button" class="pricebtn" value="500~1000"><span>500~1000</span></button>
        <button type="button" class="pricebtn" value="1000~1500"><span>1000~1500</span></button>
        <button type="button" class="pricebtn" value="1500~2000"><span>1500~2000</span></button>
        <button type="button" class="pricebtn" value="2000~2500"><span>2000~2500</span></button>
        <button type="button" class="pricebtn" value="2500~3000"><span>2500~3000</span></button>
        <button type="button" class="pricebtn" value="3000~4000"><span>3000~4000</span></button>
    </div>
    <div class="housesize">
        <span class="kindtitle">卧室数量</span>
        <button type="button" class="sizebtn" value="1"><span>1间</span></button>
        <button type="button" class="sizebtn" value="2"><span>2间</span></button>
        <button type="button" class="sizebtn" value="3"><span>3间</span></button>
        <button type="button" class="sizebtn" value="4"><span>4间</span></button>
    </div>

</div>
<!--民宿列表homelist-->
<div class="homelist">
    <ul>
        <c:forEach var="SearchHouse" items="${searchHouseList}">
        <a href="${pageContext.request.contextPath}/house/${SearchHouse.houseId}"><li class="home">
            <img src="${SearchHouse.houseMainpicture}" >
            <div class="line1">
                <span class="homekind">类型:${SearchHouse.houseKind}</span>

                <img src="${pageContext.request.contextPath}/img/index/pingfen.png" class="pingfenico">
                <span class="score">${SearchHouse.houseScore}</span>

            </div>
            <div class="line2"><b>${SearchHouse.houseName}</b></div>
            <div class="line3"><b>￥</b><span class="price">${SearchHouse.housePrice}</span><span class="houzhui">/晚</span></div>
        </li></a>
        </c:forEach>
    </ul>

</div>



<script src="${pageContext.request.contextPath}/js/house/search.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
<script>
/*    $(".condition").on("click", "button", function(event) {
        // 存放各个条件选择的值
        var filterData = {
            houseKind: undefined,
            lowPrice: undefined,
            highPrice: undefined,
            roomNum: undefined
        };

        // 深拷贝 filterData 对象
        var filterDataClone = JSON.parse(JSON.stringify(filterData));

        var ele = $(event.target).closest("button");
        if (ele.length) {
            // 遍历各个条件按钮，获取用户选择的值
            $(".condition").children().each(function () {
                // 如果是类型查询，则获取按钮中的种类名称
                if (ele.parent().hasClass("housekind")) {
                    ele.addClass("selected").siblings().removeClass("selected");
                    filterDataClone.houseKind = ele.val();
                }
                // 如果是价格区间查询，则获取按钮中的价格区间名称
                else if (ele.parent().hasClass("houseprice")) {
                    ele.addClass("selected").siblings().removeClass("selected");
                    var housePrice = ele.val();
                    var priceRange = housePrice.split("~");
                    lowPrice = parseInt(priceRange[0].replace(/[^0-9]/ig, ""));
                    highPrice = parseInt(priceRange[1].replace(/[^0-9]/ig, ""));
                    filterDataClone.lowPrice = lowPrice;
                    filterDataClone.highPrice = highPrice;

                }
                // 如果是卧室数量查询，则获取按钮中的卧室数量
                else if (ele.parent().hasClass("housesize")) {
                    ele.addClass("selected").siblings().removeClass("selected");
                    roomNum = ele.val();
                    filterDataClone.roomNum = roomNum;
                }
            })
            console.log("被选中的类型：" + filterDataClone.houseKind);
            console.log("被选中的价格范围：" + filterDataClone.lowPrice + "~" + filterDataClone.highPrice);
            console.log("被选中的卧室数量：" + filterDataClone.roomNum);
        }
        // 判断是否有至少一个条件被选择,进行查询
        if (filterDataClone.houseKind !== undefined  ||
            filterDataClone.lowPrice !== undefined ||
            filterDataClone.highPrice !== undefined ||
            filterDataClone.roomNum !== undefined) {
            // 将克隆对象的值赋回 filterData 对象
            Object.assign(filterData, filterDataClone);
            $.ajax({
                url:"${pageContext.request.contextPath}/house/searchByType",
                type: "get",
                data: filterData,
                success: function (result) {
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
                        listhtml+=' <img src="${pageContext.request.contextPath}/img/index/pingfen.png" class="pingfenico">'
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
    })*/

   //点击条件按钮
var searchCondition={
    houseKind: undefined,
    lowPrice: undefined,
    highPrice: undefined,
    roomNum: undefined
};
$(".condition").on("click", "button", function(event) {
    var ele = $(event.target).closest("button");
    if (ele.length) {
        switch (true) {
            // 如果是类型查询，则获取按钮中的种类名称
            case ele.parent().hasClass("housekind"):
                ele.addClass("selected").siblings().removeClass("selected");
                var houseKind = ele.val();
                console.log("被选中的类型：" + houseKind);
                break;
            // 如果是价格区间查询，则获取按钮中的价格区间名称
            case ele.parent().hasClass("houseprice"):
                ele.addClass("selected").siblings().removeClass("selected");
                var housePrice = ele.val();
                var priceRange = housePrice.split("~");
                var lowPrice = parseInt(priceRange[0].replace(/[^0-9]/ig, ""));
                var highPrice = parseInt(priceRange[1].replace(/[^0-9]/ig, ""));
                console.log("被选中的价格范围：" + lowPrice + "~" + highPrice);
                break;
            // 如果是卧室数量查询，则获取按钮中的卧室数量
            case ele.parent().hasClass("housesize"):
                ele.addClass("selected").siblings().removeClass("selected");
                var roomNum = ele.val();
                console.log("被选中的卧室数量：" + roomNum);
                break;

                // 每次搜索条件的拼接
                var searchCondition = "";
                if (typeof houseKind !== "undefined") {
                    searchCondition += "房屋种类：" + houseKind + "; ";
                }
                if (typeof lowPrice !== "undefined" && typeof highPrice !== "undefined") {
                    searchCondition += "价格范围：" + lowPrice + "~" + highPrice + "; ";
                }
                if (typeof roomNum !== "undefined") {
                    searchCondition += "卧室数量：" + roomNum + "; ";
                }
                console.log("当前搜索条件：" + searchCondition);
        }

        var data = {houseKind: houseKind, lowPrice: lowPrice, highPrice: highPrice, roomNum: roomNum};
        $.ajax({
            url:"${pageContext.request.contextPath}/house/searchByType",
            type: "get",
            data: data,
            success: function (result) {
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
                    listhtml+=' <img src="${pageContext.request.contextPath}/img/index/pingfen.png" class="pingfenico">'
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
</script>
</body>
</html>
