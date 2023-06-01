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
                        <a href="${pageContext.request.contextPath}/customer/custInfo/${result.data[0].myorder.custId}"><button class="userLBtn">
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
                        <a href="${pageContext.request.contextPath}/myInvitation/${result.data[0].myorder.custId}"><button class="userLBtn">
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
                                                <input type="hidden" class="house_id" value="${data.myorder.houseId}">
                                                <input type="hidden" class="order_id" value="${data.myorder.myorderId}">
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
<%--                                                        <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.jsp" class="orderdetaila"><button--%>
<%--                                                                class="layui-btn order_operate"><span>订单详情</span></button></a>--%>
                                                            <button
                                                                    class="layui-btn order_operate deatil"><span>订单详情</span></button>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus<6}">
                                                        <button data-method="offset" data-type="auto"
                                                                class="layui-btn layui-btn-normal order_operate delete">删除订单</button>
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
                                                <input type="hidden" class="house_id" value="${data.myorder.houseId}">
                                                <input type="hidden" class="order_id" value="${data.myorder.myorderId}">
                                            </td>
                                            <td>${data.myorder.myorderNum}</td>
                                            <td>￥${data.myorder.myorderPrice}</td>
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
<%--                                                            <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.jsp" class="orderdetaila"><button--%>
<%--                                                                    class="layui-btn order_operate"><span>订单详情</span></button></a>--%>
                                                            <button
                                                                    class="layui-btn order_operate deatil"><span>订单详情</span></button>
                                                        </c:if>
                                                        <c:if test="${data.myorder.myorderStatus<6}">
                                                            <button data-method="offset" data-type="auto"
                                                                    class="layui-btn layui-btn-normal order_operate delete">删除订单</button>
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
                                                    <input type="hidden" class="house_id" value="${data.myorder.houseId}">
                                                    <input type="hidden" class="order_id" value="${data.myorder.myorderId}">
                                                </td>
                                                <td>${data.myorder.myorderNum}</td>
                                                <td>￥${data.myorder.myorderPrice}</td>
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
<%--                                                                <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.jsp" class="orderdetaila"><button--%>
<%--                                                                        class="layui-btn order_operate"><span>订单详情</span></button></a>--%>
                                                                <button
                                                                        class="layui-btn order_operate deatil"><span>订单详情</span></button>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus<6}">
                                                                <button data-method="offset" data-type="auto"
                                                                        class="layui-btn layui-btn-normal order_operate delete">删除订单</button>
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
                                                    <input type="hidden" class="house_id" value="${data.myorder.houseId}">
                                                    <input type="hidden" class="order_id" value="${data.myorder.myorderId}">
                                                </td>
                                                <td>${data.myorder.myorderNum}</td>
                                                <td>￥${data.myorder.myorderPrice}</td>
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
<%--                                                                <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.jsp" class="orderdetaila"><button--%>
<%--                                                                        class="layui-btn order_operate"><span>订单详情</span></button></a>--%>
                                                                <button
                                                                        class="layui-btn order_operate deatil"><span>订单详情</span></button>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus<6}">
                                                                <button data-method="offset" data-type="auto"
                                                                        class="layui-btn layui-btn-normal order_operate delete">删除订单</button>
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
                                    <c:forEach items="${result.data}" var="data" varStatus="status">
                                        <c:if test="${data.myorder.myorderStatus==4}">
                                            <tr data-index="${status.index}">
                                                <td>
                                                    <div>
                                                        <img src="${data.myorder.houseMainpicture}" class="house_pic">
                                                    </div>
                                                    <p class="house_name">${data.myorder.houseName}</p>
                                                    <input type="hidden" class="house_id" value="${data.myorder.houseId}">
                                                    <input type="hidden" class="order_id" value="${data.myorder.myorderId}">
                                                </td>
                                                <td>${data.myorder.myorderNum}</td>
                                                <td>￥${data.myorder.myorderPrice}</td>
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
<%--                                                                <a href="${pageContext.request.contextPath}/myorder/miso_order_detail.jsp" class="orderdetaila"><button--%>
<%--                                                                        class="layui-btn order_operate deatil"><span>订单详情</span></button></a>--%>
                                                                <button
                                                                        class="layui-btn order_operate deatil"><span>订单详情</span></button>
                                                            </c:if>
                                                            <c:if test="${data.myorder.myorderStatus<5}">
                                                                <button data-method="offset" data-type="auto"
                                                                        class="layui-btn layui-btn-normal order_operate delete">删除订单</button>
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



        $(document).ready(function() {
            // 监听删除按钮的点击事件
            $('.delete').click(function() {
                var orderId = $(this).parents('tr').find('.order_id').val(); // 获取订单 ID
                layer.confirm('确认删除该订单？', { // 弹出确认对话框
                    btn: ['确认', '取消']
                }, function() { // 点击确认按钮
                    $.ajax({
                        type: 'GET',
                        url: '/miso/myorder/delete/' + orderId, // 发送 GET 请求，删除订单
                        success: function(result) {
                            layer.msg('删除成功！'); // 删除成功，弹出提示消息
                            location.reload(); // 删除成功后刷新当前页面
                        },
                        error: function(xhr, status, error) {
                            layer.msg('删除失败：' + error); // 删除失败，弹出错误消息
                        }
                    });
                });
            });
                $('.deatil').click(function() {
                    var parameter = $(this).parents('tr').find('.order_id').val(); // 获取需要传递的参数

                    // 创建一个隐藏的表单，并设置属性
                    var form = $('<form></form>');
                    form.attr('method', 'GET'); // 使用POST请求
                    form.attr('action', '${pageContext.request.contextPath}/myorder/detail'); // 控制器层的方法URL

                    // 创建一个隐藏的输入字段，并设置值和名称
                    var input = $('<input />');
                    input.attr('type', 'hidden');
                    input.attr('name', 'orderId');
                    input.val(parameter);

                    // 将输入字段添加到表单中
                    form.append(input);

                    // 将表单添加到文档中并提交
                    $('body').append(form);
                    form.submit();
                });


            // $('.deatil').click(function() {
            //     var orderId = $(this).parents('tr').find('.order_id').val();
            //     console.log(orderId)// 获取订单 ID
            //     $.ajax({
            //         type: 'GET',
            //         url: '/miso/myorder/detail/' + orderId,   // 发送 GET 请求，查看订单详情
            //         async: false,
            //     })
            // })



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
