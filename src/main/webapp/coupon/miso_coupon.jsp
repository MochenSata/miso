<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的优惠券</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/coupon/miso_coupon.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>

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
                    <!-- <form action="">
                      <input type="text" placeholder="请输入目的地">
                      <input type="button" value="搜索">
                    </form> -->
                </div>
            </div>
            <div class="layui-col-xs1">
                <span class="login"></span>
            </div>
            <div class="layui-col-xs1">
                <span class="signup"></span>
            </div>

            <div class="layui-col-xs1">
<%--                <div class="layui-btn-container">--%>
<%--                    <button class="layui-btn layui-btn-primary demo1 personcenter">--%>
<%--                        <div href="" class="personal-btn">--%>
<%--                            <div class="headshort"><img src="../img/customer/headshort.svg" alt=""></div>--%>
<%--                            <div class="personal">--%>
<%--                                <img src="${pageContext.request.contextPath}/img/customer/hengxian.svg" class="hengxian">--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </button>--%>
<%--                </div>--%>
            </div>



        </div>
    </div>
</div>
<div class="main">
    <div class="miso_body">
        <div class="miso_main">
            <div class="userT">
                <a href="${pageContext.request.contextPath}" class="aGray">首页</a>
                > 用户中心
            </div>
            <div class="userL">
                <ul>
                    <li class="userL_li">
                        <a href="" id="myorderall"><button class="userLBtn">
                            <img src="../img/myorder/order.GIF" class="userL_li_pic">
                            <span class="userL_li_text">订单管理</span>
                        </button></a>
                    </li>
                    <li class="userL_li">
                        <a href="" id="info"><button class="userLBtn">
                            <img src="../img/myorder/person.GIF" class="userL_li_pic">
                            <span class="userL_li_text">个人信息</span>
                        </button></a>
                    </li>
                    <li class="userL_li">
                        <a href="${pageContext.request.contextPath}/coupon/miso_coupon.jsp"><button class="userLBtn coupon">
                            <img src="../img/myorder/coupon.GIF" class="userL_li_pic">
                            <span class="userL_li_text">我的优惠券</span></button></a>
                    </li>
<%--                    <li class="userL_li">--%>
<%--                        <a href="../customer/miso_message.html"><button class="userLBtn">--%>
<%--                            <img src="../img/myorder/message.GIF" class="userL_li_pic">--%>
<%--                            <span class="userL_li_text">消息提醒</span></button></a>--%>
<%--                    </li>--%>
                    <li class="userL_li">
                        <a href="" id="invite-link"><button class="userLBtn">
                            <img src="../img/myorder/invite.gif" class="userL_li_pic">
                            <span class="userL_li_text">邀请码</span></button></a>
                    </li>
                </ul>
            </div>
            <div class="userR">
                <div class="upasswordT">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title">
                            <li class="layui-this user_cou">领取优惠券</li>
                            <li class="user_cou">可用优惠券</li>
                            <li class="user_cou">已用优惠券</li>
                            <li class="user_cou">过期优惠券</li>
                        </ul>
                        <div class="layui-tab-content" style="height: 100px;">
                            <!----------------------------------领取优惠券------------------------------------->
                            <div class="layui-tab-item layui-show" id="validCouList">

                            </div>
                            <!----------------------------------可用优惠券------------------------------------->
                            <div class="layui-tab-item">
                                <table class="usable">
                                    <tr>
                                        <td class="cou_id">序号</td>
                                        <td class="cou_name">优惠券名称</td>
                                        <td class="cou_type">优惠券类别</td>
                                        <td class="cou_price">优惠券价格</td>
                                        <td class="cou_get">领取时间</td>
                                        <td class="cou_over">截至日期</td>
                                    </tr>

                                </table>
                            </div>
                            <!----------------------------------已用优惠券------------------------------------->
                            <div class="layui-tab-item">
                                <table class="used">
                                    <tr>
                                        <td class="cou_id">序号</td>
                                        <td class="cou_name">优惠券名称</td>
                                        <td class="cou_type">优惠券类别</td>
                                        <td class="cou_price">优惠券价格</td>
                                        <td class="cou_get">领取时间</td>
                                        <td class="cou_use">使用日期</td>
                                    </tr>

                                </table>
                            </div>
                            <!----------------------------------过期优惠券------------------------------------->
                            <div class="layui-tab-item">
                                <table class="expired">
                                    <tr>
                                        <td class="cou_id">序号</td>
                                        <td class="cou_name">优惠券名称</td>
                                        <td class="cou_type">优惠券类别</td>
                                        <td class="cou_price">优惠券价格</td>
                                        <td class="cou_get">领取时间</td>
                                        <td class="cou_over">截至日期</td>
                                    </tr>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    var custId ;
    // DOM渲染完成之后执行

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
                // 更新邀请码超链接的URL
                $('#invite-link').attr('href', "${pageContext.request.contextPath}/myInvitation/" + custId);
                // 更新个人信息超链接的URL
                $('#info').attr('href', "${pageContext.request.contextPath}/customer/custInfo/" + custId);
                // 更新全部订单超链接的URL
                $('#myorderall').attr('href', "${pageContext.request.contextPath}/myorder/customer/" + custId);
                //加载全部优惠券
                loadAllReceivedCoupons();
            }
        })
    }





    setTimeout(function (){
    $(document).ready(function () {
        $(".btn").click(function () {
            var couponId=$(this).next().val();
            console.log("couponId:"+couponId);
            claimCoupon(couponId,custId);
        });
    });
    },2000);


    function claimCoupon(couponId,custId) {

        var url = "${pageContext.request.contextPath}/coupon/receive";
        var data = {
            couponId: couponId,
            custId: custId

        };
        console.log("----------------------[")
            console.log(couponId)
        console.log(custId)
        $.post(url, data, function(result) {
            console.log(result);

            // Check the result and perform any necessary actions
            if (result.code===200) {
                // Coupon claimed successfully
                alert("领取优惠券成功");
            } else {
                // Failed to claim the coupon
                alert(result.msg);
            }

    });
    }

    //进入页面自动加载优惠券
    var couHtml="";
    loadCoupons();
    function loadCoupons(){
        var url = "${pageContext.request.contextPath}/coupon/all";
        $.get(url
            ,null
            , function (result){
            console.log(result);
                console.log(JSON.stringify(result));
                 var couList=result.data;//存放优惠券的集合

                 for(var i=0;i<couList.length;i++){
                    var couId=couList[i].couId;
                    var couName=couList[i].couName;
                    var couCategory=couList[i].couCategory;
                    var couPrice=couList[i].couPrice;
                    var couValidTime=couList[i].couValidTime;
                    var couInvalidTime=couList[i].couInvalidTime;
                    var couStatus=couList[i].couStatus;
                    var couIntroduction=couList[i].couIntroduction;



                    // 将得到的数据渲染到页面中
                     var Ele='<div class="spec-coupon">'+
                         ' <h2>'+couName+' </h2>'+
                     ' <p class="category">'+couCategory+'</p>'+
                     ' <p class="price"><span>￥'+couPrice+'元</span></p>'+
                     ' <p class="validity">开始日期：<span>'+couValidTime+'</span></p>'+
                     ' <p class="validity">截止日期：<span>'+couInvalidTime+'</span></p>'+
                     '  <p class="validity">'+couIntroduction+'</p>'+
                     ' <button class="btn">立即领取</button>'+
                     '<input type="hidden" class="couId" value="'+couId+'"/>'+
                     '</div>';

                     couHtml=couHtml+Ele;

                }
                //console.log(hotHtml);

                $("#validCouList").html(couHtml);
            })
    }

    //查询用户拥有的所有优惠券
    function loadAllReceivedCoupons(){
        var url = "${pageContext.request.contextPath}/coupon/receivedall/"+custId;
        var counn1="";
        var counn2="";
        var counn3="";
        $.get(url
            ,null
            , function (result){
                console.log(result);
                console.log(JSON.stringify(result));
                var receicedallcouList=result.data;//存放优惠券的集合
                console.log(receicedallcouList)

                for(var i=0;i<receicedallcouList.length;i++){
                    var couId=receicedallcouList[i].couponReceive.couDetailId;
                    console.log(couId)
                    var couName=receicedallcouList[i].coupon.couName;
                    console.log(couName)
                    var couCategory=receicedallcouList[i].coupon.couCategory;
                    var couPrice=receicedallcouList[i].coupon.couPrice;
                    var couReceivedTime=receicedallcouList[i].couponReceive.couReceiveTime;//领取时间
                    var couUseTime=receicedallcouList[i].couponReceive.couUseTime;//使用时间
                    var couEndTime=receicedallcouList[i].couponReceive.couEndTime;//截至时间
                    var couUsageStatus=receicedallcouList[i].couponReceive.couUsageStatus;//优惠券使用状态
                    console.log(couUsageStatus)

                    if (couUsageStatus === 0){//可使用优惠券
                        var couHtml1 =
                            '<tr>'+
                            '<td>' + couId + '</td>'+
                            '<td>' + couName + '</td>'+
                            '<td>' + couCategory + '</td>'+
                            '<td>' + '￥' + couPrice + '</td>'+
                            '<td>' + couReceivedTime + '</td>'+
                            '<td>' + couEndTime + '</td>'+
                            '</tr>';
                        counn1=counn1+couHtml1;
                        // $('.usable').find('tbody').append(tr);// 将查询到的每个优惠券数据添加到表格中
                    }

                    if (couUsageStatus === 1){//已使用优惠券
                        var couHtml2 =
                            '<tr>'+
                            '<td>' + couId + '</td>'+
                            '<td>' + couName + '</td>'+
                            '<td>' + couCategory + '</td>'+
                            '<td>' + '￥' + couPrice + '</td>'+
                            '<td>' + couReceivedTime + '</td>'+
                            '<td>' + couUseTime + '</td>'+
                            '</tr>';
                        counn2=counn2+couHtml2;
                        // $('.used').find('tbody').append(tr);// 将查询到的每个优惠券数据添加到表格中
                    }

                    if (couUsageStatus === 2){//已过期优惠券
                        var couHtml3=
                            '<tr>'+
                            '<td>' + couId + '</td>'+
                            '<td>' + couName + '</td>'+
                            '<td>' + couCategory + '</td>'+
                            '<td>' + '￥' + couPrice + '</td>'+
                            '<td>' + couReceivedTime + '</td>'+
                            '<td>' + couEndTime + '</td>'+
                            '</tr>';
                        // $('.expired').find('tbody').append(tr);// 将查询到的每个优惠券数据添加到表格中
                        counn3=counn3+couHtml3;
                    }
                }

                $(".usable").append(counn1)
                $(".used").append(counn2)
                $(".expired").append(counn3)
            }
        )
    }

</script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>


</html>