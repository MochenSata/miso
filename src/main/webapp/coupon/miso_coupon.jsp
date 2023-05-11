<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的优惠券</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/coupon/miso_coupon.css">
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
                        <a href=""><button class="userLBtn coupon">
                            <img src="../img/myorder/coupon.GIF" class="userL_li_pic">
                            <span class="userL_li_text">我的优惠券</span></button></a>
                    </li>
                    <li class="userL_li">
                        <a href="../customer/miso_message.html"><button class="userLBtn">
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
                <div class="upasswordT">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title">
                            <li class="layui-this user_cou">领取优惠券</li>
                            <li class="user_cou">可用优惠券</li>
                            <li class="user_cou">已用优惠券</li>
                            <li class="user_cou">过期优惠券</li>
                        </ul>
                        <div class="layui-tab-content" style="height: 100px;">
                            <div class="layui-tab-item layui-show">
                                <div class="spec-coupon">
                                    <h2>新人券_50元 </h2>
                                    <p class="category">新人券</p>
                                    <p class="price"><span>￥50</span></p>
                                    <p class="validity">开始日期：<span>2023年5月1日</span></p>
                                    <p class="validity">截止日期：<span>2023年6月1日</span></p>
                                    <p class="validity">使用该新人优惠券可抵50元！</p>
                                    <button class="btn">立即领取</button>
                                </div>

                                <div class="spec-coupon">
                                    <h2>满减券_60元 </h2>
                                    <p class="category">满减券</p>
                                    <p class="price"><span>￥60元</span></p>
                                    <p class="validity">开始日期：<span>2023年5月1日</span></p>
                                    <p class="validity">截止日期：<span>2023年6月1日</span></p>
                                    <p class="validity">使用该满减优惠券满200元可抵60元！</p>
                                    <button class="btn">立即领取</button>
                                </div>
                                <div class="spec-coupon">
                                    <h2>假日券_40元</h2>
                                    <p class="category">假日券</p>
                                    <p class="price"><span>￥40</span></p>
                                    <p class="validity">开始日期：<span>2023年5月1日</span></p>
                                    <p class="validity">截止日期：<span>2023年6月1日</span></p>
                                    <p class="validity">在周末及法定节假日使用该优惠券可抵40元！</p>
                                    <button class="btn">立即领取</button>
                                </div>
                                <div class="spec-coupon">
                                    <h2>分享券_20元 </h2>
                                    <p class="category">分享券</p>
                                    <p class="price"><span>￥20</span></p>
                                    <p class="validity">开始日期：<span>2023年5月1日</span></p>
                                    <p class="validity">截止日期：<span>2023年6月1日</span></p>
                                    <p class="validity">邀请好友得到此优惠券，使用该优惠券可抵20元！</p>
                                    <button class="btn">立即领取</button>
                                </div>

                            </div>
                            <div class="layui-tab-item">
                                <table>
                                    <tr>
                                        <td class="cou_id">序号</td>
                                        <td class="cou_name">优惠券名称</td>
                                        <td class="cou_type">优惠券类别</td>
                                        <td class="cou_price">优惠券价格</td>
                                        <td class="cou_get">领取时间</td>
                                        <td class="cou_over">截至日期</td>
                                    </tr>
                                    <tr>
                                        <td>4001</td>
                                        <td>新人券_10元</td>
                                        <td>新人券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4002</td>
                                        <td>满减券_10元</td>
                                        <td>满减券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4003</td>
                                        <td>假日券_10元</td>
                                        <td>假日券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4004</td>
                                        <td>分享券_10元</td>
                                        <td>分享券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4005</td>
                                        <td>满减券_50元</td>
                                        <td>满减券</td>
                                        <td>￥50元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="layui-tab-item">
                                <table>
                                    <tr>
                                        <td class="cou_id">序号</td>
                                        <td class="cou_name">优惠券名称</td>
                                        <td class="cou_type">优惠券类别</td>
                                        <td class="cou_price">优惠券价格</td>
                                        <td class="cou_get">领取时间</td>
                                        <td class="cou_use">使用日期</td>
                                    </tr>
                                    <tr>
                                        <td>4001</td>
                                        <td>新人券_10元</td>
                                        <td>新人券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4002</td>
                                        <td>满减券_10元</td>
                                        <td>满减券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4003</td>
                                        <td>假日券_10元</td>
                                        <td>假日券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4004</td>
                                        <td>分享券_10元</td>
                                        <td>分享券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4005</td>
                                        <td>满减券_50元</td>
                                        <td>满减券</td>
                                        <td>￥50元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="layui-tab-item">
                                <table>
                                    <tr>
                                        <td class="cou_id">序号</td>
                                        <td class="cou_name">优惠券名称</td>
                                        <td class="cou_type">优惠券类别</td>
                                        <td class="cou_price">优惠券价格</td>
                                        <td class="cou_get">领取时间</td>
                                        <td class="cou_over">截至日期</td>
                                    </tr>
                                    <tr>
                                        <td>4001</td>
                                        <td>新人券_10元</td>
                                        <td>新人券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4002</td>
                                        <td>满减券_10元</td>
                                        <td>满减券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4003</td>
                                        <td>假日券_10元</td>
                                        <td>假日券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4004</td>
                                        <td>分享券_10元</td>
                                        <td>分享券</td>
                                        <td>￥10元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
                                    </tr>
                                    <tr>
                                        <td>4005</td>
                                        <td>满减券_50元</td>
                                        <td>满减券</td>
                                        <td>￥50元</td>
                                        <td>2023-01-01 00:00:00</td>
                                        <td>2023-12-31 23:59:59</td>
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
    $(document).ready(function () {
        $(".btn").click(function () {
            $(this).attr("disabled", true);
            $(this).addClass("disabled");
            $(this).text("已领取");
        });
    });
    f
</script>
<script src="../layui/layui.js"></script>


</html>