<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 sform: scale(0.5);">
    <title>订单详情</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/myorder/mypay_detail.css">
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../layui/layui.js"></script>
</head>

<body>
<!--导航栏nav-->
<div class="foundation">
    <div class="layui-container">
        <div class="layui-row nav">
            <div class="layui-col-xs2 logo">
                <img src="../img/logo.png" class="logopic">
                <span class="slogn">让旅行更有味道</span>
            </div>
            <div class="layui-col-xs7">
                <div class="search-area">
                    <form action="">
                        <input type="text" placeholder="请输入目的地">
                        <input type="button" value="搜索">
                    </form>
                </div>
            </div>
            <div class="layui-col-xs1"><a href=""><span class="login">登录</span></a></div>
            <div class="layui-col-xs1"><a href=""><span class="signup">注册</span></a></div>
            <div class="layui-col-xs1"><a href="../myorder/miso_order_all.html" class="personal-btn">
                <div class="headshort"><img src="" alt=""></div>
                <span class="personal"> 个人中心</span>
            </a></div>



        </div>
    </div>
</div>

<div class="main">
    <div class="biaoti">
        <div class="wenzi">
            <h1 class="ziti">订单详情</h1>
        </div>
    </div>
    <!--left-->
    <div class="left">
        <div class="number">
            <span class="number_n">订单编号:</span>
            <span class="order_number">8969698698</span>
        </div>
        <div class="order_time">
            <div class="in">
                <span class="in_type">入住</span>
                <span class="in_date">5月4日周五</span>
                <span class="in_time">下午2点</span>
            </div>
            <div class="out">
                <span class="in_type">退房</span>
                <span class="in_date">5月6日周日</span>
                <span class="in_time">下午12点</span>
            </div>
        </div>
        <div class="house">
            <a href="../house/house.html">
                <span class="house_n">你的房源</span>
                <span class="house_name">
                        苏州湾豪华海景房
                    </span>
            </a>
        </div>
        <div class="order_detail">
            <div class="detail_n">
                <span>预定详情</span>
            </div>

            <div class="live_in">
                <span class="check_in">入住人</span>
                <span class="live_name">钱锦程</span>
            </div>
            <div class="house_num">
                <span class="house_room">房间数量</span>
                <span class="house_room_num">5室</span>
            </div>
        </div>
        <div class="cancel">
            <span class="cancel_n">退款规则</span>
            <span class="cancel_detail">1、入住前7天12:00前如申请退款，订金全额退<br>
                    2、入住前7天12:00之后至入住当天12:00之前，如申请退款，扣除50%订金<br>
                    3、入住后如提前退房，扣除已入住天数房款总额，再扣除未入住天数房款总额的50%<br>
                    4、中午12:00之后默认当天已经入住，申请退款和提前退房时间以系统记录的时间为准。</span>
        </div>
        <div class="live">
            <span class="live_n">住宿须知</span>
            <span class="live_detail">
                    下午2:00 后可入住，下午12:00前退房<br>
                    不允许携带宠物<br>
                    不允许举办派对和活动<br>
                    允许吸烟<br>
                </span>
        </div>
        <div class="pay">
            <span class="pay_n">付款信息</span>
            <span class="pay_all">总费用</span>
            <span class="pay_price">￥2,909.05 CNY</span>
        </div>
    </div>

    <div class="bigright">
        <div class="right">
            <div class="r1">

                <div class="r2">
                    <img class="tupian" src="../img/house/chuanwu/chuanwu1/2.jpg">
                </div>

                <div class="r3">
                    <span class="biaoyu">促销!令人惊叹的6卧室,带健身房、按摩室和瑜伽厅</span>
                </div>
                <div>
                    <img class="pingfen" src="../img/myorder/pingfen.png">
                </div>
                <div>
                    <span class="pf">4.9</span>
                </div>
            </div>

            <div class="r4">

                <span class="r4_slogn">让旅行更有味道</span>

                <div class="r4kuang">
                    <span class="r4_wenzi">miso为你的订单提供保障</span>
                </div>


            </div>

            <div class="r5">
                <h2 class="r5ziti">价格详情</h2>
            </div>

            <div class="r6">
                <div class="r7">
                    <span class="fangfeidanjia">￥<span class="danjia">4201.75</span></span>
                    <span class="tianshu">x <span class="nights">1</span> 晚 </span>
                    <span class="zongji">￥<span class="subtotal">4201.75</span></span>
                </div>
                <div class="r8">
                    <span class="qingjiefei">优惠券</span>
                    <span class="qingjie">-￥<span class="youhui">200</span></span>
                </div>
                <div class="r9">
                    <span class="zongjia">总价</span>
                    <span class="zongjiaqian">￥<span class="total">4001.75</span></span>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


</body>


</html>