<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>订单详情</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myorder/miso_order_detail.css">
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
<%--      <div class="layui-col-xs7">--%>
<%--        <div class="search-area">--%>
<%--          <!-- <form action="">--%>
<%--            <input type="text" placeholder="请输入目的地">--%>
<%--            <input type="button" value="搜索">--%>
<%--          </form> -->--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="layui-col-xs1"><a href=""><span class="login">登录</span></a></div>--%>
<%--      <div class="layui-col-xs1"><a href=""><span class="signup">注册</span></a></div>--%>
<%--      <!-- <div class="layui-col-xs1"><div class="headshort"><img src="" alt=""></div> </div> -->--%>
<%--      <div class="layui-col-xs1"><a href="" class="personal-btn">--%>
<%--        <div class="headshort"><img src="" alt=""></div>--%>
<%--        <span class="personal"> 个人中心</span>--%>
<%--      </a></div>--%>
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
            <a href="${pageContext.request.contextPath}/myorder/customer/${detail.data.custId}"><button class="userLBtn orderDetail">
              <img src="${pageContext.request.contextPath}/img/myorder/order.GIF" class="userL_li_pic">
              <span class="userL_li_text">订单管理</span>
            </button></a>
          </li>
          <li class="userL_li">
            <a href="${pageContext.request.contextPath}/customer/custInfo/${detail.data.custId}"><button class="userLBtn userInfo">
              <img src="${pageContext.request.contextPath}/img/myorder/person.GIF" class="userL_li_pic">
              <span class="userL_li_text">个人信息</span>
            </button></a>
          </li>
          <li class="userL_li">
            <a href="${pageContext.request.contextPath}/coupon/miso_coupon.jsp"><button class="userLBtn">
              <img src="${pageContext.request.contextPath}/img/myorder/coupon.GIF" class="userL_li_pic">
              <span class="userL_li_text">我的优惠券</span></button></a>
          </li>
<%--          <li class="userL_li">--%>
<%--            <a href="../customer/miso_message.html"><button class="userLBtn">--%>
<%--              <img src="${pageContext.request.contextPath}/img/myorder/message.GIF" class="userL_li_pic">--%>
<%--              <span class="userL_li_text">消息提醒</span></button></a>--%>
<%--          </li>--%>
          <li class="userL_li">
            <a href="${pageContext.request.contextPath}/myInvitation/${detail.data.custId}"><button class="userLBtn">
              <img src="${pageContext.request.contextPath}/img/myorder/invite.gif" class="userL_li_pic">
              <span class="userL_li_text">邀请码</span></button></a>
          </li>
        </ul>
      </div>
      <div class="userR">
        <div class="uinfoT">
          <h4>订单详情</h4>
        </div>
        <form action="">
          <table>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  订单编号：
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  ${detail.data.myorderNum}
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  房间：
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  <a href="${pageContext.request.contextPath}/house/${detail.data.houseId}"><span>${detail.data.houseName}</span></a>
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  预定时间：
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  <span>${detail.data.myorderCreateTime}</span>
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  状态：
                </div>
              </td>
              <td class="tR">
                <c:if test="${detail.data.myorderStatus==0}">
                  <div class="tR_r">
                    未付款
                  </div>
                </c:if>
                <c:if test="${detail.data.myorderStatus==1}">
                  <div class="tR_r">
                    已付款
                  </div>
                </c:if>
                <c:if test="${detail.data.myorderStatus==2}">
                  <div class="tR_r">
                    已完成
                  </div>
                </c:if>
                <c:if test="${detail.data.myorderStatus==3}">
                  <div class="tR_r">
                    已完成
                  </div>
                </c:if>
                <c:if test="${detail.data.myorderStatus==4}">
                  <div class="tR_r">
                    已取消
                  </div>
                </c:if>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  退款规则：
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  <p>1、入住前7天12:00前如申请退款，订金全额退</p>
                  <p>2、入住前7天12:00之后至入住当天12:00之前，如申请退款，扣除50%订金</p>
                  <p>3、入住后如提前退房，扣除已入住天数房款总额，再扣除未入住天数房款总额的50%</p>
                  <p>4、中午12:00之后默认当天已经入住，申请退款和提前退房时间以系统记录的时间为准。</p>
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  入住时间
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  ${detail.data.myorderIntime}
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  离开时间
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  ${detail.data.myorderOutime}
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  总房款：
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  ￥${detail.data.housePrice}
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  优惠券金额：
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  ￥${detail.data.couPrice}
                </div>
              </td>
            </tr>
            <tr>
              <td class="tL">
                <div class="tL-l">
                  实付：
                </div>
              </td>
              <td class="tR">
                <div class="tR_r">
                  ￥${detail.data.myorderPrice}
                </div>
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
<script src="../layui/layui.js"></script>



</html>
