<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/customer/miso_message.css">
    <script src="../js/jquery-3.6.4.min.js"></script>

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
                        <a href="../myorder/miso_order_all.html"><button class="userLBtn">
                            <img src="../img/myorder/order.GIF" class="userL_li_pic">
                            <span class="userL_li_text">订单管理</span>
                        </button></a>
                    </li>
                    <li class="userL_li">
                        <a href="../customer/miso_info.html"><button class="userLBtn">
                            <img src="../img/myorder/person.GIF" class="userL_li_pic">
                            <span class="userL_li_text">个人信息</span>
                        </button></a>
                    </li>
                    <li class="userL_li">
                        <a href="../coupon/miso_coupon.html"><button class="userLBtn">
                            <img src="../img/myorder/coupon.GIF" class="userL_li_pic">
                            <span class="userL_li_text">我的优惠券</span></button></a>
                    </li>
                    <li class="userL_li">
                        <a href="../customer/miso_message.html"><button class="userLBtn message">
                            <img src="../img/myorder/message.GIF" class="userL_li_pic">
                            <span class="userL_li_text">消息提醒</span></button></a>
                    </li>
                    <li class="userL_li">
                        <a href="../customer/miso_invitation.html"><button class="userLBtn">
                            <img src="../img/myorder/invite.gif" class="userL_li_pic">
                            <span class="userL_li_text">邀请码</span></button></a>
                    </li>
                </ul>
            </div>
            <div class="userR">
                <div class="message-box">
                    <div class="message-titleline1">
                        <span class="message-title">消息提醒</span>
                    </div>
                    <div class="message-detail">
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快<a href="miso_comment.html">去评价</a>来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>
                        <div class="message-card">
                            <div class="message-top">
                                <span class="theme">您有新的订单未评价</span>
                                <span class="time">2023年4月27日</span>
                            </div>
                            <div class="message-bottom">
                                <span class="content">亲爱的用户，你还有订单未评价，赶快去评价来让更多人了解您喜欢的民宿吧！</span>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script src="../layui/layui.js"></script>
<script src="../js/customer/miso_pwd.js"></script>


</html>