<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myorder/miso_order_all.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
</head>

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
                <div class="search-area">
                    <!-- <form action="">
                      <input type="text" placeholder="请输入目的地">
                      <input type="button" value="搜索">
                    </form> -->
                </div>
            </div>
            <div class="layui-col-xs1"><a href="../customer/login.html" ><span class="login"></span></a></div>
            <div class="layui-col-xs1"><a href="../customer/signup.html" ><span class="signup"></span></a></div>

            <div class="layui-col-xs1">
                <div class="layui-btn-container">
                    <button class="layui-btn layui-btn-primary demo1 personcenter">
                        <div href="" class="personal-btn">
                            <div class="headshort"><img src="${pageContext.request.contextPath}/img/customer/headshort.svg" alt=""></div>
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

<div class="main">
    <div class="miso_body">
        <div class="miso_main">
            <div class="userT">
                <a href="" class="aGray">首页</a>
                > 用户中心
            </div>
            <div class="userL">
                <ul>
                    <li class="userL_li">
                        <a href="${pageContext.request.contextPath}/myorder/miso_order_all.html"><button class="userLBtn orderDetail">
                            <img src="${pageContext.request.contextPath}/img/myorder/order.GIF" class="userL_li_pic">
                            <span class="userL_li_text">订单管理</span>
                        </button></a>
                    </li>
                    <li class="userL_li">
                        <a href="${pageContext.request.contextPath}/customer/miso_info.html"><button class="userLBtn">
                            <img src="${pageContext.request.contextPath}/img/myorder/person.GIF" class="userL_li_pic">
                            <span class="userL_li_text">个人信息</span>
                        </button></a>
                    </li>
                    <li class="userL_li">
                        <a href="${pageContext.request.contextPath}/coupon/miso_coupon.html"><button class="userLBtn">
                            <img src="${pageContext.request.contextPath}/img/myorder/coupon.GIF" class="userL_li_pic">
                            <span class="userL_li_text">我的优惠券</span></button></a>
                    </li>
                    <li class="userL_li">
                        <a href="${pageContext.request.contextPath}/customer/miso_message.html"><button class="userLBtn">
                            <img src="${pageContext.request.contextPath}/img/myorder/message.GIF" class="userL_li_pic">
                            <span class="userL_li_text">消息提醒</span></button></a>
                    </li>
                    <li class="userL_li">
                        <a href="${pageContext.request.contextPath}/customer/miso_invitation.html"><button class="userLBtn">
                            <img src="${pageContext.request.contextPath}/img/myorder/invite.gif" class="userL_li_pic">
                            <span class="userL_li_text">邀请码</span></button></a>
                    </li>
                </ul>
            </div>
            <div class="userR">
                <div class="order">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title">
                            <li class="layui-this order_li"><span class="order_status">全部订单</span></li>
                            <li class="order_li"><span class="order_status">已付款</span></li>
                            <li class="order_li"><span class="order_status">未付款</span></li>
                            <li class="order_li"><span class="order_status">已完成</span></li>
                            <li class="order_li"><span class="order_status">已取消</span></li>
                        </ul>
                        <!----------------------------------全部订单------------------------------------->
                        <div class="layui-tab-content" style="height: 100px;">
                            <div class="layui-tab-item layui-show">
                                <table>
                                    <tr>
                                        <td class="td_img_name">房间</td>
                                        <td class="td_num">订单编号</td>
                                        <td class="td_price">房款</td>
                                        <td class="td_time">时间</td>
                                        <td class="td_statu">状态</td>
                                        <td class="td_operate">操作</td>
                                    </tr>
                                    <c:forEach items="${result.data}" var="data">
                                        <tr>
                                            <td>
                                                <div>
                                                    <img src="${data.myorder.houseMainpicture}" class="house_pic">
                                                </div>
                                                <p class="house_name">${data.myorder.houseName}</p>
                                            </td>
                                            <td>${data.myorder.myorderNum}</td>
                                            <td>￥${data.myorder.myorderPrice}</td>
                                            <td>${data.myorder.myorderCreateTime}</td>
                                            <c:if test="${data.myorder.myorderStatus==0}">
                                                <td>未支付</td>
                                            </c:if>
                                            <c:if test="${data.myorder.myorderStatus==1}">
                                                <td>已付款</td>
                                            </c:if>
                                            <c:if test="${data.myorder.myorderStatus==2}">
                                                <td>已完成</td>
                                            </c:if>
                                            <c:if test="${data.myorder.myorderStatus==3}">
                                                <td>已完成</td>
                                            </c:if>
                                            <c:if test="${data.myorder.myorderStatus==4}">
                                                <td>已取消</td>
                                            </c:if>
                                            <td>
                                                <div id="layerDemo" style="margin-bottom: 0;">
                                                    <div class="layui-btn-container completed">
                                                        <c:if test="${data.myorder.myorderStatus==0}">
                                                            <a href=""><button class="layui-btn order_operate">去支付</button></a>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus==2}">
                                                        <a href="../customer/miso_comment.html"><button class="layui-btn order_operate">去评价</button></a>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus>0&&data.myorder.myorderStatus<5}">
                                                        <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.html" class="orderdetaila"><button
                                                                class="layui-btn order_operate"><span>订单详情</span></button></a>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus<6}">
                                                        <button data-method="offset" data-type="auto"
                                                                class="layui-btn layui-btn-normal order_operate">删除订单</button>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <!-----------------------------已付款--------------------------------------->
                            <div class="layui-tab-item">
                                <table>
                                    <tr>
                                        <td class="td_img_name">房间</td>
                                        <td class="td_num">订单编号</td>
                                        <td class="td_price">房款</td>
                                        <td class="td_time">时间</td>
                                        <td class="td_statu">状态</td>
                                        <td class="td_operate">操作</td>
                                    </tr>


                                    <c:forEach items="${result.data}" var="data">
                                        <c:if test="${data.myorder.myorderStatus==1}">
                                        <tr>
                                            <td>
                                                <div>
                                                    <img src="${data.myorder.houseMainpicture}" class="house_pic">
                                                </div>
                                                <p class="house_name">${data.myorder.houseName}</p>
                                            </td>
                                            <td>${data.myorder.myorderNum}</td>
                                            <td>￥${data.payment.payAmount}</td>
                                            <td>${data.myorder.myorderCreateTime}</td>
                                            <td>已付款</td>
                                            <td>
                                                <div id="layerDemo" style="margin-bottom: 0;">
                                                    <div class="layui-btn-container completed">
                                                        <c:if test="${data.myorder.myorderStatus==0}">
                                                            <a href=""><button class="layui-btn order_operate">去支付</button></a>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus==2}">
                                                            <a href="../customer/miso_comment.html"><button class="layui-btn order_operate">去评价</button></a>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus>0&&data.myorder.myorderStatus<5}">
                                                            <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.html" class="orderdetaila"><button
                                                                    class="layui-btn order_operate"><span>订单详情</span></button></a>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus<6}">
                                                            <button data-method="offset" data-type="auto"
                                                                    class="layui-btn layui-btn-normal order_operate">删除订单</button>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>

                                </table>
                            </div>
                            <!---------------------------未付款----------------------------------------------->
                            <div class="layui-tab-item">
                                <table>
                                    <tr>
                                        <td class="td_img_name">房间</td>
                                        <td class="td_num">订单编号</td>
                                        <td class="td_price">房款</td>
                                        <td class="td_time">时间</td>
                                        <td class="td_statu">状态</td>
                                        <td class="td_operate">操作</td>
                                    </tr>

                                        <c:forEach items="${result.data}" var="data">
                                            <c:if test="${data.myorder.myorderStatus==0}">
                                            <tr>
                                                <td>
                                                    <div>
                                                        <img src="${data.myorder.houseMainpicture}" class="house_pic">
                                                    </div>
                                                    <p class="house_name">${data.myorder.houseName}</p>
                                                </td>
                                                <td>${data.myorder.myorderNum}</td>
                                                <td>￥${data.payment.payAmount}</td>
                                                <td>${data.myorder.myorderCreateTime}</td>
                                                <td>未付款</td>
                                                <td>
                                                    <div id="layerDemo" style="margin-bottom: 0;">
                                                        <div class="layui-btn-container completed">
                                                            <c:if test="${data.myorder.myorderStatus==0}">
                                                                <a href=""><button class="layui-btn order_operate">去支付</button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus==2}">
                                                                <a href="../customer/miso_comment.html"><button class="layui-btn order_operate">去评价</button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus>0&&data.myorder.myorderStatus<5}">
                                                                <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.html" class="orderdetaila"><button
                                                                        class="layui-btn order_operate"><span>订单详情</span></button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus<6}">
                                                                <button data-method="offset" data-type="auto"
                                                                        class="layui-btn layui-btn-normal order_operate">删除订单</button>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </c:if>
                                        </c:forEach>

                                </table>
                            </div>
                            <!---------------------------------已完成----------------------------------------------------->
                            <div class="layui-tab-item">
                                <table>
                                    <tr>
                                        <td class="td_img_name">房间</td>
                                        <td class="td_num">订单编号</td>
                                        <td class="td_price">房款</td>
                                        <td class="td_time">时间</td>
                                        <td class="td_statu">状态</td>
                                        <td class="td_operate">操作</td>
                                    </tr>

                                        <c:forEach items="${result.data}" var="data">
                                            <c:if test="${data.myorder.myorderStatus==2}">
                                            <tr>
                                                <td>
                                                    <div>
                                                        <img src="${data.myorder.houseMainpicture}" class="house_pic">
                                                    </div>
                                                    <p class="house_name">${data.myorder.houseName}</p>
                                                </td>
                                                <td>${data.myorder.myorderNum}</td>
                                                <td>￥${data.payment.payAmount}</td>
                                                <td>${data.myorder.myorderCreateTime}</td>
                                                <td>已完成</td>
                                                <td>
                                                    <div id="layerDemo" style="margin-bottom: 0;">
                                                        <div class="layui-btn-container completed">
                                                            <c:if test="${data.myorder.myorderStatus==0}">
                                                                <a href=""><button class="layui-btn order_operate">去支付</button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus==2}">
                                                                <a href="../customer/miso_comment.html"><button class="layui-btn order_operate">去评价</button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus>0&&data.myorder.myorderStatus<5}">
                                                                <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.html" class="orderdetaila"><button
                                                                        class="layui-btn order_operate"><span>订单详情</span></button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus<6}">
                                                                <button data-method="offset" data-type="auto"
                                                                        class="layui-btn layui-btn-normal order_operate">删除订单</button>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                    </c:if>
                                        </c:forEach>

                                </table>
                            </div>
                            <!-----------------------------------已取消---------------------------------------------->
                            <div class="layui-tab-item">
                                <table>
                                    <tr>
                                        <td class="td_img_name">房间</td>
                                        <td class="td_num">订单编号</td>
                                        <td class="td_price">房款</td>
                                        <td class="td_time">时间</td>
                                        <td class="td_statu">状态</td>
                                        <td class="td_operate">操作</td>
                                    </tr>
                                    <c:forEach items="${result.data}" var="data">
                                        <c:if test="${data.myorder.myorderStatus==4}">
                                            <tr>
                                                <td>
                                                    <div>
                                                        <img src="${data.myorder.houseMainpicture}" class="house_pic">
                                                    </div>
                                                    <p class="house_name">${data.myorder.houseName}</p>
                                                </td>
                                                <td>${data.myorder.myorderNum}</td>
                                                <td>￥${data.payment.payAmount}</td>
                                                <td>${data.myorder.myorderCreateTime}</td>
                                                <td>已取消</td>
                                                <td>
                                                    <div id="layerDemo" style="margin-bottom: 0;">
                                                        <div class="layui-btn-container completed">
                                                            <c:if test="${data.myorder.myorderStatus==0}">
                                                                <a href=""><button class="layui-btn order_operate">去支付</button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus==2}">
                                                                <a href="../customer/miso_comment.html"><button class="layui-btn order_operate">去评价</button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus>0&&data.myorder.myorderStatus<5}">
                                                                <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.html" class="orderdetaila"><button
                                                                        class="layui-btn order_operate"><span>订单详情</span></button></a>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus<6}">
                                                                <button data-method="offset" data-type="auto"
                                                                        class="layui-btn layui-btn-normal order_operate">删除订单</button>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
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
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    //居中弹框
    layui.use('layer', function () { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            setTop: function () {
                var that = this;
            }


            , offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();

                layer.open({
                    type: 1
                    , offset: type
                    , id: 'layerDemo' + type //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + "您确定要删除吗" + '</div>'
                    , btn: ['确定','取消']
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            }
        };

        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
    //个人中心


    layui.use(['dropdown', 'util', 'layer', 'table'], function(){
        var dropdown = layui.dropdown
            ,util = layui.util
            ,layer = layui.layer
            ,table = layui.table
            ,$ = layui.jquery;

        //初演示
        dropdown.render({
            elem: '.demo1'
            ,data: [{
                title: '个人中心'
                ,href:"customer/login.html"
            },{
                title: '消息'
                ,href:"customer/login.html"
            },{
                title: '我的订单'
                ,href:"customer/login.html"
            }]
            ,click: function(obj){
                window.location.href = obj.href;
            }
        });

    });

</script>

</html>
