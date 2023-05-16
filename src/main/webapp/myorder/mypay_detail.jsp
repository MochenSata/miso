<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myorder/mypay_detail.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
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
    <div class="l">
        <div class="title">确认订单</div>
        <div class="order">
            <div class="order_title">订单编号:</div>
            <span class="ordernum">12345678</span>
        </div>
        <div class="time">
            <div class="timeleft">
                <div class="timetitle">入住时间</div>
                <div class="timewords"><span>2023-05-01 12:00:00</span></div>
            </div>
            <div class="timeright">
                <div class="timetitle">退宿时间</div>
                <div class="timewords"><span>2023-05-01 12:00:00</span></div>
            </div>
        </div>
        <div class="ordertetailtitle">预定详情</div>
        <div class="orderdetail">
            <span class="detailline">住客姓名：<span class="name">蔡徐坤</span></span>
            <span class="detailline">住客电话：<span class="telno">18018888888</span></span>
            <span class="detailline">住客身份证：<span class="shenfenzheng">320000000000000000</span></span>
        </div>
        <div class="tuikuantitle">退款规则</div>
        <div class="tuikuanwords">
            1、入住前7天12:00前如申请退款,订金全额退。<br>
            2、入住前7天12:00之后至入住当天12:00之前,如申请退款,扣除50%订金。<br>
            3、入住后如提前退房,扣除未入住天数房款总额的50%。<br>
            4、申请退款和提前退房时间以系统记录的时间为准。
        </div>
    </div>
    <div class="r">
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

        <div class="form">
            <form action="${pageContext.request.contextPath}/pay/alipay" method="post">
                <input type="hidden" value="1" name="custId">
                <input type="hidden" value="5003" name="myorderId">
                <input type="hidden" value="9849513261" name="myorderNum">
                <input type="hidden" value="648" name="payAmount">
                <input type="submit" value="支付" class="quzhifu">
            </form>
        </div>

    </div>
</div>
</body>
</html>