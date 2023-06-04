<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Miso后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/coupon/coupon_manage.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/moment.js"></script>
</head>

<body>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">Miso后台管理</div>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    Miso管理员
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">Miso</a></dd>

                </dl>
            </li>
            <!-- <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                  <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                  </a>
                </li> -->
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- <li class="layui-nav-item layui-nav-itemed">
                      <a class="" href="javascript:;">menu group 1</a>
                      <dl class="layui-nav-child">
                        <dd><a href="javascript:;">menu 1</a></dd>
                      </dl>
                    </li> -->

                <li class="layui-nav-item"><a href="javascript:;">优惠券管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="coupon-title">优惠券管理</div>
        <div class="coupon-header">
            <div class="headl">
                <button type="button" class="layui-btn coubtn" id="addcou">发布优惠券</button>
            </div>
            <div class="headr">
                <form action="">
                    <input type="text" placeholder="请输入优惠券名称" class="layui-input couinput">
                    <input type="text" placeholder="请输入优惠券价格" class="layui-input couinput">
                    <input type="button" class="layui-btn coubtn " value="查询">
                    <input type="button" class="layui-btn coubtn" value="重置">
                </form>
            </div>
        </div>
        <!--新增优惠券弹出层-->
        <form class="layui-form" id="test" style="display:none">
            <div class="layui-form-item">
                <label class="layui-form-label">优惠券类别</label>
                <div class="layui-input-block" style="width:200px">
                    <select name="couCategory" lay-search >
                        <option value="">请选择</option>
                        <option>满减券</option>
                        <option>新人券</option>
                        <option>假日券</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">优惠券名称</label>
                <div class="layui-input-block">
                    <input type="text" name="couName" placeholder="请输入名称" class="layui-input"  style="width:200px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">优惠券金额</label>
                <div class="layui-input-block">
                    <input type="text" name="couPrice" placeholder="请输入金额"  class="layui-input"  style="width:200px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">优惠券数量</label>
                <div class="layui-input-block">
                    <input type="text" name="couCount" placeholder="请输入数量"  class="layui-input"  style="width:200px">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">发布时间</label>
                <div class="layui-input-block">
                    <div class="layui-inline" id="test6">
                        <div class="layui-input-inline">
                            <input type="text" name="couValidTime" autocomplete="off" id="test-startDate-1" class="layui-input" placeholder="开始日期" >
                        </div>
                        <div class="layui-form-mid">-</div>
                        <div class="layui-input-inline">
                            <input type="text" name="couInvalidTime" autocomplete="off" id="test-endDate-1" class="layui-input" placeholder="结束日期" >
                        </div>
                    </div>

                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">优惠券介绍</label>
                <div class="layui-input-block">
                    <textarea lay-verify="required"  name="couIntroduction" placeholder="请输入内容" class="layui-textarea" style="width:350px;height:150px;resize: none;"></textarea>
                </div>
            </div>
            <input name="couStatus" type="hidden" value="0">
        </form>


        <!--列表-->
        <table class="coulist">
            <tr>
                <th class="list-th">优惠券id</th>
                <th class="list-th">优惠券类别</th>
                <th class="list-th">优惠券名称</th>
                <th class="list-th">优惠券金额</th>
                <th class="list-th">发布时间</th>
                <th class="list-th">失效时间</th>
                <th class="list-th">操作</th>
            </tr>


        </table>

        <!--page-->
        <div class="pagearea">
            <a href="" class="pagebtn"><</a>
            <span class="currentpage">1</span>
            <a href="" class="pagebtn">></a>
        </div>

        <!--编辑优惠券弹出层-->
        <form class="layui-form" id="test2" style="display:none">
            <div class="layui-form-item">
                <label class="layui-form-label">优惠券类别</label>
                <div class="layui-input-block" style="width:200px">
                    <select name="quiz" lay-search>
                        <option value="">请选择</option>
                        <option>满减券</option>
                        <option>新人券</option>
                        <option>假日券</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">优惠券名称</label>
                <div class="layui-input-block">
                    <input type="text"  placeholder="请输入名称" class="layui-input"  style="width:200px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">优惠券金额</label>
                <div class="layui-input-block">
                    <input type="text"  placeholder="请输入金额"  class="layui-input"  style="width:200px">
                </div>
            </div>



            <div class="layui-form-item">
                <label class="layui-form-label">发布时间</label>
                <div class="layui-input-block">
                    <div class="layui-inline" id="test6">
                        <div class="layui-input-inline">
                            <input type="text" autocomplete="off" id="test-startDate-1" class="layui-input" placeholder="开始日期">
                        </div>
                        <div class="layui-form-mid">-</div>
                        <div class="layui-input-inline">
                            <input type="text" autocomplete="off" id="test-endDate-1" class="layui-input" placeholder="结束日期">
                        </div>
                    </div>

                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">优惠券介绍</label>
                <div class="layui-input-block">
                    <textarea lay-verify="required" name="desc" placeholder="请输入内容" class="layui-textarea" style="width:350px;height:150px;resize: none;"></textarea>
                </div>
            </div>
        </form>

    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->

    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    // Function to convert date to local datetime format
    function toLocalDateTime(date) {
        var year = date.getFullYear();
        var month = addLeadingZero(date.getMonth() + 1);
        var day = addLeadingZero(date.getDate());
        var hours = addLeadingZero(date.getHours());
        var minutes = addLeadingZero(date.getMinutes());
        var seconds = addLeadingZero(date.getSeconds());

        var dateString = year + '-' + month + '-' + day + ' ' + '00' + ':' + '00' + ':' + '00';
        var localDateTime = moment(dateString, 'YYYY-MM-DD HH:mm:ss').local();
        return dateString;
    }

    // Function to add leading zero to single-digit numbers
    function addLeadingZero(number) {
        return (number < 10 ? '0' : '') + number;
    }
    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', { icon: 0 });
            }
            , menuRight: function () {
                layer.open({
                    type: 1
                    , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });

    });

    //新增弹出层
    $("#addcou").click(function () {
        layer.open({
            type: 1,
            area: ['550px', '600px'],
            title: '新增优惠券',
            content: $("#test"),
            shade: 0,
            btn: ['提交', '重置'],
            btn1: function (index, layero) {

                // 获取表单数据
                var formData = {
                    couCategory: $("select[name='couCategory']").val(),
                    couName: $("input[name='couName']").val(),
                    couPrice: $("input[name='couPrice']").val(),
                    couCount: $("input[name='couCount']").val(),
                    couValidTime: new Date($("#test-startDate-1").val()),
                    couInvalidTime: new Date($("#test-endDate-1").val()),
                    couIntroduction: $("textarea[name='couIntroduction']").val(),
                    couStatus: $("input[name='couStatus']").val()
                };


                formData.couValidTime = toLocalDateTime(formData.couValidTime);
                formData.couInvalidTime = toLocalDateTime(formData.couInvalidTime);
                // Convert formData to JSON
                var jsonData = JSON.stringify(formData);
                console.log(jsonData);
                // 发送表单数据到服务器
                $.ajax({
                    url: "/miso/coupon/save",
                    type: "POST",
                    data: formData,
                    success: function ( ) {
                        // 处理提交成功的逻辑
                        alert("新增优惠券成功");
                        layer.close(index); // 关闭弹出层
                        showCouponList();
                    },
                    error: function (xhr, status, error) {
                        // 处理提交失败的逻辑
                        alert("表单提交失败");
                    }
                });
            },
            btn2: function (index, layero) {
                // 重置表单逻辑
                $("#test")[0].reset();
                return false;
            },
            cancel: function (layero, index) {
                layer.closeAll();
            }
        });
    });
    //编辑弹出层
    setTimeout(function (){
        $(".editbtn").click(function () {
            layer.open({
                type: 1,
                area: ['550px', '600px'],
                title: '编辑优惠券'
                , content: $("#test2"),
                shade: 0,
                btn: ['提交', '重置']
                , btn1: function (index, layero) {
                    var kk = $("#username").val();
                    alert(kk);
                },
                btn2: function (index, layero) {
                    alert("2222");
                    return false;
                },
                cancel: function (layero, index) {
                    layer.closeAll();
                }

            });
        })
    },2000);

    //删除弹出层
    setTimeout(function (){
        $('.coulist').on('click','.deletebtn',function (){
            var couId = $(this).parents('tr').find('.couId').text();//获取 优惠券Id
            console.log(couId);
            $.ajax({
                type:'GET',
                url:'delete/' + couId,     // 发送 GET 请求，删除订单
                success:function (result){
                    layer.msg('删除成功！');   //删除成功，弹出提示框
                    location.reload();       //删除成功后刷新页面
                },
                error: function(xhr, status, error) {
                    layer.msg('删除失败：' + error); // 删除失败，弹出错误消息
                }
            })
        })

    },2000);

    //日期范围
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test6'
            //设置开始日期、日期日期的 input 选择器
            //数组格式为 2.6.6 开始新增，之前版本直接配置 true 或任意分割字符即可
            , range: ['#test-startDate-1', '#test-endDate-1']
        });
    })

    showCouponList();
    //进入页面、添加删除后渲染优惠券数据
    function showCouponList() {
        $(document).ready(function () {
            $.ajax({
                url: 'list',
                type: 'GET',
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    var data = result.data;
                    $('.coulist').find('tbody').html(
                        '<tr>'+
                        '<th class="list-th">优惠券id</th>'+
                        '<th class="list-th">优惠券类别</th>'+
                        '<th class="list-th">优惠券名称</th>'+
                        '<th class="list-th">优惠券金额</th>'+
                        ' <th class="list-th">发布时间</th>'+
                        '<th class="list-th">失效时间</th>'+
                        '<th class="list-th">操作</th>'+
                        '</tr>'
                    );
                    var tr="";
                    $.each(data, function (index, coupon) { // 遍历每个优惠券数据
                        console.log(data)

                        tr = '<tr>' +
                            '<td class="couId">' + coupon.couId + '</td>' +
                            '<td>' + coupon.couCategory + '</td>' +
                            '<td>' + coupon.couName + '</td>' +
                            '<td>' + coupon.couPrice + '</td>' +
                            '<td>' + coupon.couValidTime + '</td>' +
                            '<td>' + coupon.couInvalidTime + '</td>' +
                            '<td>' +
                            '<button type="button" class="layui-btn layui-btn-sm editbtn">编辑</button>' +
                            '<button type="button" class="layui-btn layui-btn-sm deletebtn">删除</button>' +
                            '</td>' +
                            '</tr>';
                        $('.coulist').find('tbody').append(tr); // 将每个优惠券数据添加到表格中
                    });
                }
            })
        });
    }


</script>
</body>
</body>

</html>
