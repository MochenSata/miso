<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Miso评价</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <link rel="stylesheet" href="../css/customer/miso_comment.css">
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
          <form action="">
            <input type="text" placeholder="请输入目的地">
            <input type="button" value="搜索">
          </form>
        </div>
      </div>
      <div class="layui-col-xs1 hiddenable"><a href="${pageContext.request.contextPath}/customer/login.jsp" ><span class="login">登录</span></a></div>
      <div class="layui-col-xs1 hiddenable"><a href="${pageContext.request.contextPath}/customer/signup.html" ><span class="signup">注册</span></a></div>
      <div class="layui-col-xs1 hiddenable1" style="display: none"><span class="login">欢迎</span></div>
      <div class="layui-col-xs1 hiddenable1" style="display: none"><span class="custName"></span></div>

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
  <div class="head">
    <div class="container">
      <!-- 内容 -->
      <div class="left">

        <!-- 左边的房屋信息 -->
        <img class="houseimg" src="${result.data.houseMainpicture}">
        <div class="house-detail">
          <div class="line1">
            <span class="homekind">${result.data.houseKind}</span>
            <img src="../img/index/pingfen.png" class="pingfenico">
            <span class="score">${result.data.houseScore}</span>
          </div>
          <div class="house-name">
            <span>${result.data.houseName}</span>
          </div>
          <div class="house-info">
            <span>${result.data.houseTheme}</span>
          </div>
          <div class="line3">
            <div class="house-price">
              <b>￥</b>
              <span class="price">${result.data.housePrice}</span><span class="houzhui">/晚</span>
            </div>

          </div>
        </div>
      </div>


      <div class="right">
        <!-- 右边评论的星级和内容 -->
        <div class="comment-titleline">
          <span class="comment-title">期待您的评价</span>
        </div>
        <form action="${pageContext.request.contextPath}/goComment" method="post">
          <div class="comment-score">
            <span class="score-words">您的评分:</span>
            <div id="score-box"><div class="score-sc"></div></div>

          </div>

          <div class="comment-container">
            <div class="comment-ipnut">
              <!-- <span class="">您的评论内容</span> -->
              <div>
                <textarea class="textarea" placeholder="写下您的评价吧" name="comContent"></textarea>
              </div>
            </div>

            <div class="comment-submit">
              <!-- <span class="">提交区域</span>    -->
              <input type="hidden" name="custId" value="" id="custIdd">
              <input type="hidden" name="custName" value="" id="custNamee">
              <input type="hidden" name="comCreateTime" value="">
              <input type="hidden" name="houseId" value="${result.data.houseId}">
              <input type="hidden" name="myorderId" value="${myorderId}">
              <input type="hidden" name="comScore" id="comScore">
              <input type="submit" class="submit" value="提交">
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
<script src="../layui/layui.js"></script>
<script>
  layui.use(['rate'], function(){
    var rate = layui.rate;
    rate.render({
      elem: '.score-sc'
      ,value: 3.5   //初始值
      ,half: true   //开启半星
      ,text: true   //开启文本
      ,theme: '#ff385c'
      ,choose: function(value){
        console.log(value);
       $("#comScore").val( value);
      }
    });
  });



</script>
<script>
  var text = $('.textarea').val();

</script>


<script>
  var custId ;
  getCurrentLoginCustomerInfo();
  //获得当前登录用户信息
  function getCurrentLoginCustomerInfo() {
    var tokenStr = localStorage.getItem("token");
    var token = JSON.parse(tokenStr);
    // console.log("从localStorage 中获得的token是：" + token);
    $.ajax({
      type: "get",
      url: "../customer/currentCustomer",
      headers: {'token': token},
      success: function (result) {
        console.log(token);
        console.log(result);
        custId = result.data.custId;
        $("#custIdd").val(custId)
        console.log($("#custIdd").val())
        var custName = result.data.custName;
        $("#custNamee").val(custName)
        console.log($("#custNamee").val())
        $(".hiddenable").hide();
        $(".hiddenable1").show();
        console.log("custId:" + custId);
        console.log("custName:" + custName);
        $("#custId").text(custId)
        $(".custName").text(custName)

        //个人中心
        setTimeout(function (){
          layui.use(['dropdown', 'util', 'layer', 'table'], function(){
            var dropdown = layui.dropdown
                    ,util = layui.util
                    ,layer = layui.layer
                    ,table = layui.table
                    ,$ = layui.jquery;
            //右上角个人中心
            var id=$("#custId").text();
            dropdown.render({

              elem: '.demo1'
              ,data: [{
                title: '个人中心'
                ,href:"${pageContext.request.contextPath}/myorder/customer/"+id
              },{
                title: '退出登录'
                ,href:""
              }]
              ,click: function(obj){
                window.location.href = obj.href;
              }
            });

          });
        },2000);
      }
    })
  }

</script>
<script>

  document.addEventListener("DOMContentLoaded", function() {
    var form = document.getElementsByClassName("order-form")[0];
    form.addEventListener("submit", function(event) {
      event.preventDefault(); // 阻止表单的默认提交行为

      var tokenStr = localStorage.getItem("token");
      var token = JSON.parse(tokenStr);
      console.log(token);

      if (token) {
        // 已登录状态，直接执行表单的提交行为
        form.submit();
      } else {
        // 未登录状态，弹出提示框
        alert("你未登录");
      }
    });
  });
</script>

<script>
  $.ajax({
    url: "index.jsp",
    type: "GET",
    dataType: "json",
    success: function(data) {
      // 将房屋类型和价格保存到cookie中
      document.cookie = "houseKind=" + data.houseKind + "; path=/";
      document.cookie = "housePrice=" + data.housePrice + "; path=/";
      console.log(data.housePrice)
    }
  });
</script>




</html>
