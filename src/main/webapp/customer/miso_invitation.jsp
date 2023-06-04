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
  <title>邀请码</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customer/miso_invitation.css">
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
            <a href="${pageContext.request.contextPath}/myorder/customer/${result.data.custId}"><button class="userLBtn">
              <img src="${pageContext.request.contextPath}/img/myorder/order.GIF" class="userL_li_pic">
              <span class="userL_li_text">订单管理</span>
            </button></a>
          </li>
          <li class="userL_li">
            <a href="${pageContext.request.contextPath}/customer/custInfo/${result.data.custId}"><button class="userLBtn">
              <img src="../img/myorder/person.GIF" class="userL_li_pic">
              <span class="userL_li_text">个人信息</span>
            </button></a>
          </li>
          <li class="userL_li">
            <a href="../coupon/miso_coupon.jsp"><button class="userLBtn">
              <img src="../img/myorder/coupon.GIF" class="userL_li_pic">
              <span class="userL_li_text">我的优惠券</span></button></a>
          </li>
<%--          <li class="userL_li">--%>
<%--            <a href="../customer/miso_message.html"><button class="userLBtn">--%>
<%--              <img src="../img/myorder/message.GIF" class="userL_li_pic">--%>
<%--              <span class="userL_li_text">消息提醒</span></button></a>--%>
<%--          </li>--%>
          <li class="userL_li">
            <a href="${pageContext.request.contextPath}/myInvitation/${result.data.custId}"><button class="userLBtn invitation">
              <img src="../img/myorder/invite.gif" class="userL_li_pic">
              <span class="userL_li_text">邀请码</span></button></a>
          </li>
        </ul>
      </div>
      <div class="userR">
        <div class="uinfoT">
          <h4>邀请码</h4>
        </div>
        <form>
          <div class="user_invitation">
            <div class="myinv">
              <span class="myinvitation">我的邀请码:</span>
              <input type="hidden" name="custId" value="${result.data.custId}" class="id">
              <input type="hidden" name="custId2" value="${couponResult.data.custId}" class="id2">
              <span class="invitation_num">${result.data.custInviteNum}</span>
            </div>
            <div class="inv">
              <span class="myinvitation">好友邀请码:</span>
              <input type="text" class="i">
              <span class="msg">*</span>
            </div>
            <div class="illustrate">
              <span class="illustrate_word">兑换成功优惠券，双方均可获得分享券</span>
            </div>
            <div class="save">
              <input type="button" class="save-submit" value="确认兑换">
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div id="invitationMsg"></div>
</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/customer/miso_invitation.js"></script>
<script>
  $(".save-submit").click(function (){
    var invitationNum = $(".i").val(); // 获取邀请码输入框的值
    var custId = $(".id").val();
    $.ajax({
      type:"get",
      url:"http://localhost:8080/miso/invitation",
      data:{
        invitationNum:invitationNum,
        custId:custId
      },
      success:function (couponResult){
        $.ajax({
          type: "post",
          url: "http://localhost:8080/miso/saveCoupon",
          data: {
            custId:custId,
            custId2:couponResult.data.custId
          },
          success:function (couponReceive1){
            console.log("成功添加分享券")
          },
          error: function() {
            alert("该邀请码不可用");
          }
        })
      },
      error: function() {
        alert("该邀请码不可用");
      }
    })
  })
</script>
<script type="text/javascript">
  $(function(){
    var ws;
    //检测浏览器是否支持webSocket
    if("WebSocket" in window){
      console.log("您的浏览器支持webSocket!");
      //模拟产生clientID
      let clientID =$(".id").val();
console.log(clientID)
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
        var invitationMsg = $("#invitationMsg");
        invitationMsg.css("display", "block");
        invitationMsg.text(received_msg);

        setTimeout(function() {
          invitationMsg.css("opacity", "0");
          setTimeout(function() {
            invitationMsg.css("display", "none");
            invitationMsg.css("opacity", "1");
          }, 500);
        }, 5000);
      };

      //服务端关闭连接时触发
      ws.onclose = function() {
        console.error("连接已经关闭.....")
      };
    }else{
      $("#invitationMsg").html("您的浏览器不支持webSocket！");
    }
  })
</script>
</html>