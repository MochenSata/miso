<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>确认订单并付款</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myorder/mypay_detail.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
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
                    <!-- <form action="">
                      <input type="text" placeholder="请输入目的地">
                      <input type="button" value="搜索">
                    </form> -->
                </div>
            </div>
            <div class="layui-col-xs1"><a href="../customer/login.html" ><span class="login"></span></a></div>
            <div class="layui-col-xs1"><a href="../customer/signup.html" ><span class="signup"></span></a></div>

            <div class="layui-col-xs1">
<%--                <div class="layui-btn-container">--%>
<%--                    <button class="layui-btn layui-btn-primary demo1 personcenter">--%>
<%--                        <div href="" class="personal-btn">--%>
<%--                            <div class="headshort"><img src="${pageContext.request.contextPath}/img/customer/headshort.svg" alt=""></div>--%>
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
    <div class="l">
        <div class="title">确认订单</div>
        <div class="order">
            <div class="order_title">订单编号:</div>
            <span class="ordernum">${myorderDetailVO.getMyorderNum()}</span>
        </div>
        <div class="time">
            <div class="timeleft">
                <div class="timetitle">入住时间</div>
                <div class="timewords"><span>${myorderDetailVO.orderCountAndDataVO.custStartDate}</span></div>
            </div>
            <div class="timeright">
                <div class="timetitle">退宿时间</div>
                <div class="timewords"><span>${myorderDetailVO.orderCountAndDataVO.custEndDate}</span></div>
            </div>
        </div>
        <div class="ordertetailtitle">预定详情：<span class="house">${myorderDetailVO.orderCountAndDataVO.houseName}</span></div>
        <div class="orderdetail">
            <span class="detailline">住客姓名：<span class="name">${myorderDetailVO.getOrderCountAndDataVO().getOccName()}</span></span>
            <span class="detailline">住客电话：<span class="telno">${myorderDetailVO.getOrderCountAndDataVO().getOccTelno()}</span></span>
            <span class="detailline">住客身份证：<span class="shenfenzheng">${myorderDetailVO.getOrderCountAndDataVO().getOccIdentity()}</span></span>
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
                    <img class="tupian" src="${myorderDetailVO.orderCountAndDataVO.houseMainpicture}">
                </div>

                <div class="r3">
                    <span class="biaoyu">${myorderDetailVO.orderCountAndDataVO.houseTheme}</span>
                </div>
                <div>
                    <img class="pingfen" src="../img/myorder/pingfen.png">
                </div>
                <div>
                    <span class="pf">${myorderDetailVO.orderCountAndDataVO.houseScore}</span>
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

                <div class="r9">
                    <span class="zongjia">总价</span>
                    <span class="zongjiaqian">￥<span class="total">${myorderDetailVO.myorderPrice}</span></span>
                </div>
                <div class="form">
                    <form action="${pageContext.request.contextPath}/pay/alipay" method="post">
                        <input type="hidden" value="${myorderDetailVO.custId}" name="custId">
                        <input type="hidden" id="myorderId" value="" name="myorderId">
                        <input type="hidden" value="${myorderDetailVO.orderCountAndDataVO.houseId}" name="houseId">
                        <input type="hidden" value="${myorderDetailVO.orderCountAndDataVO.houseName}" name="houseName">
                        <input type="hidden" id="myorderNum" value="${myorderDetailVO.getMyorderNum()}" name="myorderNum">
                        <input type="hidden" value="${myorderDetailVO.myorderPrice}" name="myorderPrice">
                        <input type="submit" value="支付" class="quzhifu">
                    </form>
                </div>
            </div>
        </div>



    </div>
</div>
<input type="hidden" value="${myorderDetailVO.custId}" id="clientID">
<script>
    createIdempodentToken();
    function createIdempodentToken() {
        $.ajax({
            type: "get",
            url: "../getIdempodentToken",
            success: function (result) {
                console.log("防止表单重复提交的token："+result)
                $(".repeattoken").val(result)
            }
        })
    }
</script>

<script>
    MyorderByOrderNum();
    function MyorderByOrderNum() {
        var myorderNum = $('#myorderNum').val();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/myorder/" + myorderNum,

            success: function (result) {
                if (result.code === 200) {
                    console.log(result.code);
                    $('#myorderId').val(result.data.myorderId);
                }else {
                    console.log(result.data);
                    window.location.href = "fail.jsp";
                }
            },
            error: function (result) {

            }
        });
    }
</script>

<div id="toast"></div>

<script>
    $(document).ready(function() {
        $("#showToast").click(function() {
            var toast = $("#toast");
            toast.css("display", "block");
            toast.text("This is a toast notification.");

            setTimeout(function() {
                toast.css("opacity", "0");
                setTimeout(function() {
                    toast.css("display", "none");
                    toast.css("opacity", "1");
                }, 500);
            }, 5000);
        });
    });
</script>
<!--websocket-->
<script type="text/javascript">
    $(function(){
        var ws;
        //检测浏览器是否支持webSocket
        if("WebSocket" in window){
            console.log("您的浏览器支持webSocket!");
            //模拟产生clientID
            let clientID =$("#clientID").val();

            //创建 WebSocket 对象,注意请求路径！！！！
            ws = new WebSocket("ws://localhost:8080/miso/testWebSocket/"+clientID);

            //与服务端建立连接时触发
            ws.onopen = function(){
               console.log("<p>与服务端建立连接建立成功！您的客户端ID="+clientID+"</p>");

                //模拟发送数据到服务器
                ws.send("你好服务端！我是客户端 "+clientID);
            }

            //接收到服务端消息时触发
            ws.onmessage = function (evt) {
                let received_msg = evt.data;
                var toast = $("#toast");
                toast.css("display", "block");
                toast.text(received_msg);

                setTimeout(function() {
                    toast.css("opacity", "0");
                    setTimeout(function() {
                        toast.css("display", "none");
                        toast.css("opacity", "1");
                    }, 500);
                }, 5000);
            };


            //服务端关闭连接时触发
            ws.onclose = function() {
                console.error("连接已经关闭.....")
            };
        }else{
            console.log("您的浏览器不支持webSocket！");
        }
    })
</script>
</body>
</html>