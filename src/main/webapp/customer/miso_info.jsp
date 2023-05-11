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
    <title>个人信息</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/customer/miso_info.css">
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
                        <a href="../customer/miso_message.html"><button class="userLBtn userInfo">
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
                <div class="uinfoT">
                    <h4>完善个人信息</h4>
                </div>
                <form action="">
                    <table>
                        <tr>
                            <td class="tL">
                                <div class="tL-l">
                                    <span class="star">*</span>
                                    昵称：
                                </div>
                            </td>
                            <td class="tR">
                                <div class="tR_r">
                                    <input type="text" class="form_info username">
                                    <span class="msgTip usernameTip"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tL">
                                <div class="tL-l">
                                    手机号码：
                                </div>
                            </td>
                            <td class="tR">
                                <div class="tR_r">
                                    <span>13511676978</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tL">
                                <div class="tL-l">
                                    <span class="star">*</span>
                                    性别：
                                </div>
                            </td>
                            <td class="tR">
                                <div class="tR_r">
                                    <input type="radio" value="M" name="sex" checked>男
                                    <input type="radio" value="F" name="sex">女
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tL">
                                <div class="tL-l">
                                    邮箱地址：
                                </div>
                            </td>
                            <td class="tR">
                                <div class="tR_r">
                                    <input type="text" class="form_info useremail">
                                    <span class="msgTip useremailTip"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tL">
                                <div class="tL-l">
                                    个人介绍:
                                </div>
                            </td>
                            <td class="tR">
                                <div class="tR_r">
                                    <textarea></textarea>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
                <div class="save">
                    <div id="layerDemo" style="margin-bottom: 0;">
                        <div class="layui-btn-container">
                            <button data-method="offset" data-type="auto"
                                    class="layui-btn layui-btn-normal info-save">保存信息</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../js/customer/miso_info.js"></script>
<script src="../layui/layui.js"></script>
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
                    , offset: type //具体配置参考：http://doc/modules/layer.html#offset
                    , id: 'layerDemo' + type //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + text + '</div>'
                    , btn: '确定'
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

</script>


</html>
