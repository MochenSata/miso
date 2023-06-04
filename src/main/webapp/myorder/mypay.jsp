<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 sform: scale(0.5)">
    <title>确认订单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myorder/mypay.css">
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
                <img src="${pageContext.request.contextPath}/img/logo.png" class="logopic">
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
    <div class="biaoti">
        <div class="return">
            <a href="">
                <img class="returnImg" src="${pageContext.request.contextPath}/img/myorder/fanhui.png">
            </a>
        </div>
        <div class="wenzi">
            <h1 class="ziti">确认并付款</h1>
        </div>
    </div>
    <!-- ============================body-left=========================== -->
    <div class="left">
        <div class="kuang1">
            <h2 class="xingcheng">您的行程</h2>
            <span class="ruzhucount">入住人数: <span class="renshunum">${orderCountAndDataVO.custNum}</span> 人</span>

        </div>
        <div class="kuang2">
            <h3 class="riqi">日期</h3>
            <!-- <div class="riqiwenzi"><span>5月27日至30日</span></div> -->
            <div class="editBtn">
                <button class="edit"></button>
            </div>
            <div class="riqiform">

                <div class="layui-form">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <!-- <label class="layui-form-label">日期范围</label> -->
                            <div class="layui-inline" id="test6">
                                <div class="layui-input-inline">
                                    <input type="text" autocomplete="off" id="test-startDate-1" class="layui-input"
                                           placeholder="开始日期" value="${orderCountAndDataVO.custStartDate}">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline">
                                    <input type="text" autocomplete="off" id="test-endDate-1" class="layui-input"
                                           placeholder="结束日期" value="${orderCountAndDataVO.custEndDate}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="renshu">

                <div class="zhukeziliao">
                    <span>住客资料</span><br>

                </div>

                <div class="fkrs">

                    <span class="fkxm">住客姓名</span><br>
                    <input type="text" class="zhukexingming" name="zhukexingming" placeholder="每间只需填1人">
                    <span class="msgTip custnameTip"></span>
                </div>

                <div class="identifer">
                    <span class="sfz">身份证</span><br>
                    <input type="text" class="shenfenzheng" name="shenfenzheng" placeholder="输入您的身份证">
                    <span class="msgTip custidcardTip"></span>
                </div>

                <div class="shoujihao">
                    <span>电话号码</span><br>
                    <input type="text" class="telno" name="telno" placeholder="输入您的电话号码">
                    <span class="msgTip custtelnoTip"></span>
                </div>

            </div>


        </div>
        <div class="kuang3">
            <h2 class="fkfs">付款方式:</h2>
        </div>

        <div class="kuang4">
            <!-- <select class="zf">
                        <option>支付宝</option>
                         <option class="wx">微信支付</option>
                        <option class="xyk">信用卡或借记卡</option>
                    </select> -->
            <!-- <div class="layui-btn-container">
                        <button class="layui-btn layui-btn-primary" id="demo5">
                            <div >
                                <img class="zfb" src="../img/myorder/支付宝.png"/>
                            </div>

                            <span class="zfb_s">支付宝</span>

                          <i class="layui-icon layui-icon-down layui-font-12"></i>
                          </button>
                      </div> -->
            <div class="tubiao">

                <img class="t3" src="${pageContext.request.contextPath}/img/myorder/zfb.png">
            </div>
            <input type="radio" value="zfb" name="zfb" class="zf" checked>

            <img class="zhifubao" src="${pageContext.request.contextPath}/img/myorder/zfb.png" />




        </div>

        <div class="kuang5">
            <div class="youhuiquan">
                <h2 class="coupun">优惠券:</h2>
            </div>


            <div class="dropdown">
                <button class="dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                    请选择优惠券
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" data-value="0">不使用优惠券</a>

                </div>
            </div>
        </div>

        <div class="kuang6">
            <div class="qx">
                <h2 class="qx1">取消政策</h2>
            </div>
            <span class="qx2">48小时内可免费取消预订!
                    4月22日下午3点前取消,退还房费的50%和全部清洁费,不退还服务费,4月22日下午3点-4月29日下午3点期间取消,退还全部清洁费,不退还房费和服务费</span>
        </div>


        <div class="kuang7">
            <div class="gz">
                <h2 class="gz1">基本规则</h2>
            </div>
            <div class="gz3"><span class="gz4">请每位房客留意遵守几个简单要求，做一名优秀的房⁠客。</span>

            </div>

            <li class="gz2">遵守入住须知</li>
            <li class="gz2">像对待自己的家一样对待房东的房⁠源</li>

        </div>


        <form id="myForm" action="${pageContext.request.contextPath}/myorder/save" method="post">
            <input type="hidden" value=""  name="custId" id="custIdd">
            <input type="hidden" value="" name="couNum" id="couNum">
            <input type="hidden" value="" name="couPrice" id="couPrice">
            <input type="hidden" value="" name="myorderPrice" id="myorderPrice">
            <input type="hidden" value="${orderCountAndDataVO.custNum}" name="orderCountAndDataVO.custNum" >
            <input type="hidden" value="" name="orderCountAndDataVO.custStartDate" id="custStartDate">
            <input type="hidden" value="" name="orderCountAndDataVO.custEndDate" id="custEndDate">
            <input type="hidden" value="${orderCountAndDataVO.houseId}" name="orderCountAndDataVO.houseId" >
            <input type="hidden" value="${orderCountAndDataVO.houseName}" name="orderCountAndDataVO.houseName" >
            <input type="hidden" value="${orderCountAndDataVO.houseMainpicture}" name="orderCountAndDataVO.houseMainpicture" >
            <input type="hidden" value="${orderCountAndDataVO.houseTheme}" name="orderCountAndDataVO.houseTheme" >
            <input type="hidden" value="${orderCountAndDataVO.houseScore}" name="orderCountAndDataVO.houseScore" >
            <input type="hidden" value="${orderCountAndDataVO.housePrice}" name="orderCountAndDataVO.housePrice" >
            <input type="hidden" value="" name="orderCountAndDataVO.occName" id="occName">
            <input type="hidden" value="" name="orderCountAndDataVO.occIdentity" id="occIdentity">
            <input type="hidden" value="" name="orderCountAndDataVO.occTelno" id="occTelno">
            <input type="hidden" name="token" class="repeattoken">
            <input class="fkBtn" type="submit" onclick="updateHiddenField(event)" value="确认订单">
        </form>
        <script>
            function updateHiddenField(event) {

                event.preventDefault(); // 阻止表单的默认提交行为

                // 获取输入框中的值
                var occName = $(".zhukexingming").val();
                var occIdentity = $(".shenfenzheng").val();
                var occTelno = $(".telno").val();

                // 将输入框的值设置到隐藏域中
                $("#occName").val(occName);
                $("#occIdentity").val(occIdentity);
                $("#occTelno").val(occTelno);

                // 检查必填项是否为空
                if (occName.trim() === "" || occIdentity.trim() === "" || occTelno.trim() === "") {
                    alert("请填写所有必填项");
                    return;
                }

                // 提交表单
                $("#myForm").submit();
            }
        </script>




    </div>

    <!-- ============================body-left结束=========================== -->






    <!-- ============================body-right=========================== -->
    <div class="bigright">
        <div class="right">
            <div class="r1">

                <div class="r2">
                    <img class="tupian" src="${orderCountAndDataVO.houseMainpicture}">
                </div>

                <div class="r3">
                    <span class="biaoyu">${orderCountAndDataVO.houseTheme}</span>
                </div>
                <div>
                    <img class="pingfen" src="../img/myorder/pingfen.png">
                </div>
                <div>
                    <span class="pf">${orderCountAndDataVO.houseScore}</span>
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
                    <span class="fangfeidanjia"><span class="danjia" style="display: none">${orderCountAndDataVO.housePrice}</span></span>
                    <span class="fangfeidanjia">总计金额:<span class="danjia" ></span></span>
<%--                    <span class="tianshu">x <span class="nights">0</span> 晚 </span>--%>
                    <span class="zongji">￥<span class="subtotal" id="result">0</span></span>
                </div>
                <div class="r8">
                    <span class="qingjiefei">优惠券</span>
                    <span class="qingjie">-￥<span class="youhui" id="resultSpan">0</span></span>
                </div>
                <div class="r9">
                    <span class="zongjia">总价</span>
                    <span class="zongjiaqian">￥<span class="total">0</span></span>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../js/myorder/mypay.js"></script>
<script>
    //进入界面自动选择日期
    var startdateEle =$("#test-startDate-1").val();
    var enddateEle =$("#test-endDate-1").val();
    var startDate1=new Date(startdateEle);
    var endDate1=new Date(enddateEle);
    $("#custEndDate").val(enddateEle);
    $("#custStartDate").val(startdateEle);
    autoSelectData();
    function autoSelectData(){
        var startDayOfWeek = startDate1.getDay();
        var endDayOfWeek = endDate1.getDay();
        var totalPrice = 0;
        var dayOfWeekText = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
        var holidayList = ['2023-01-01','2023-01-02', '2023-01-03', '2023-04-04','2023-04-05','2023-04-06',
            '2023-05-01',
            '2023-05-02',
            '2023-05-03',
            '2023-04-29',
            '2023-04-30',
            '2023-09-29',
            '2023-09-30',
            '2023-10-01',
            '2023-10-02',
            '2023-10-03',
            '2023-10-04',
            '2023-10-05',
            '2023-10-06',]; // 假期列表
        for (var d=startDate1;d<endDate1;d.setDate(d.getDate()+1)){
            var dayOfWeek=d.getDay();
            var isWeekend = (dayOfWeek === 6 || dayOfWeek === 0);
            var isHoliday =(holidayList.indexOf(d.toISOString().substr(0, 10)) !== -1) ;
            var originalPrice=document.querySelector(".danjia")
            var priceText =originalPrice.textContent.trim();
            if (/^\d+(\.\d+)?$/.test(priceText)){
                var price = parseFloat(priceText);
                var priceMultiplier = 1;
                if (isWeekend) {
                    if (dayOfWeek === 6) {
                        priceMultiplier = 1.5;
                    } else if (dayOfWeek === 0) {
                        priceMultiplier = 1.5;
                    }
                }
                if (isHoliday) {
                    priceMultiplier = 2;
                }
                var dynamicPrice = price * priceMultiplier;
                console.log(d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + dayOfWeekText[dayOfWeek] + ' 价格：' + dynamicPrice);
                console.log('星期' + dayOfWeek);
                totalPrice += dynamicPrice;
            } else {
                console.error('房价格式不正确：' + priceText);
            }
        }
        console.log('总价格：' + totalPrice);
        console.log(dynamicPrice);
        console.log(price);
        console.log('是否为周末：' + isWeekend);
        console.log('是否为假期：' + isHoliday);
        console.log("起始日期是"+dayOfWeekText[startDayOfWeek]);
        console.log("结束日期是"+dayOfWeekText[endDayOfWeek]);


        var resultElement =document.getElementById("result");
        resultElement.innerHTML=totalPrice;
        $('#myElement').zongjia();
    }



    //
    var notcheckdate = []
    var id='${orderCountAndDataVO.houseId}';
    getHouseDate(id);
    function getHouseDate(id){
        var url = "${pageContext.request.contextPath}/house/date/"+ id; // 将ID添加到URL

        $.get(url, null, function(result) {
            // ServerReponse json: data(pageInfo)
            console.log(result);
            notcheckdate = result.data;

            layui.use('laydate', function () {
                    var laydate = layui.laydate;
                    laydate.render({
                        elem: '#test6'
                        //设置开始日期、日期日期的 input 选择器
                        //数组格式为 2.6.6 开始新增，之前版本直接配置 true 或任意分割字符即可
                        , range: true,
                        done: function (value, date) {
                            console.log(date); // 输出date对象
                            console.log(typeof date); // 输出date对象的类型
                            // 获取选定的起始日期和结束日期数据
                            var start = value.split(' - ')[0];
                            var end = value.split(' - ')[1];
                            var startDate=new Date(start);
                            var endDate=new Date(end);

                            $("#custEndDate").val(end);
                            $("#custStartDate").val(start);

                            // 获取起始日期和结束日期的星期几
                            var startDayOfWeek = startDate.getDay();
                            var endDayOfWeek = endDate.getDay();
                            var totalPrice = 0;
                            var dayOfWeekText = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
                            var holidayList = ['2023-01-01','2023-01-02', '2023-01-03', '2023-04-04','2023-04-05','2023-04-06',
                                '2023-05-01',
                                '2023-05-02',
                                '2023-05-03',
                                '2023-04-29',
                                '2023-04-30',
                                '2023-09-29',
                                '2023-09-30',
                                '2023-10-01',
                                '2023-10-02',
                                '2023-10-03',
                                '2023-10-04',
                                '2023-10-05',
                                '2023-10-06',]; // 假期列表
                            for (var d=startDate;d<endDate;d.setDate(d.getDate()+1)){
                                var dayOfWeek=d.getDay();
                                var isWeekend = (dayOfWeek === 6 || dayOfWeek === 0);
                                var isHoliday =(holidayList.indexOf(d.toISOString().substr(0, 10)) !== -1) ;
                                var originalPrice=document.querySelector(".danjia")
                                var priceText =originalPrice.textContent.trim();
                                if (/^\d+(\.\d+)?$/.test(priceText)){
                                    var price = parseFloat(priceText);
                                    var priceMultiplier = 1;
                                    if (isWeekend) {
                                        if (dayOfWeek === 6) {
                                            priceMultiplier = 1.5;
                                        } else if (dayOfWeek === 0) {
                                            priceMultiplier = 1.5;
                                        }
                                    }
                                    if (isHoliday) {
                                        priceMultiplier = 2;
                                    }
                                    var dynamicPrice = price * priceMultiplier;
                                    console.log(d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + dayOfWeekText[dayOfWeek] + ' 价格：' + dynamicPrice);
                                    console.log('星期' + dayOfWeek);
                                    totalPrice += dynamicPrice;
                                } else {
                                    console.error('房价格式不正确：' + priceText);
                                }
                            }
                            console.log('总价格：' + totalPrice);
                            console.log(dynamicPrice);
                            console.log(price);
                            console.log('是否为周末：' + isWeekend);
                            console.log('是否为假期：' + isHoliday);
                            console.log("起始日期是"+dayOfWeekText[startDayOfWeek]);
                            console.log("结束日期是"+dayOfWeekText[endDayOfWeek]);
                            console.log(start);
                            console.log(end);

                            var resultElement =document.getElementById("result");
                            resultElement.innerHTML=totalPrice;
                            var days = Math.ceil((new Date(end).getTime() - new Date(start).getTime()) / (1000 * 60 * 60 * 24));
                            console.log("入住天数：" + days);
                            $(".nights").text(days);
                            $('#myElement').zongjia();


                        }, range: ['#test-startDate-1', '#test-endDate-1'],
                        ready: function(){
                            setdate1("laydate-main-list-0");
                            setdate1("laydate-main-list-1");
                        },change:function (){
                            setdate1("laydate-main-list-0");
                            setdate1("laydate-main-list-1");
                        },

                    });

                });

        }, "json");

    }

    function setdate1(id){

        var elem = $("."+id).find(".layui-laydate-content");//获取table对象
        layui.each(elem.find('tr'), function (trIndex, trElem) {//遍历tr
            layui.each($(trElem).find('td'), function (tdIndex, tdElem) {
                //遍历td
                var tdTemp = $(tdElem);
                if (tdTemp.hasClass('laydate-day-next') || tdTemp.hasClass('laydate-day-prev')) {
                    return;
                }
                var da=tdTemp.attr("lay-ymd");
                var das = da.split("-")
                var layymd = das[0]+"-"+(das[1].length==1?("0"+das[1]):das[1])+"-"+(das[2].length==1?("0"+das[2]):das[2]);
                console.log(layymd);
                if(notcheckdate.indexOf(layymd)>-1){//指定数组中的日期不可选
                    tdTemp.addClass('laydate-disabled');
                }
            });
        });
    }


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
                $("#custIdd").val(custId);

                var custName = result.data.custName;
                $(".hiddenable").hide();
                $(".hiddenable1").show();
                console.log("custId:" + custId);
                console.log("custName:" + custName);
                $("#custId").text(custId)
                $(".custName").text(custName)
                couponById();
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
                                ,href:"${pageContext.request.contextPath}/myorder/customer/"+custId
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
    function couponById() {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/coupon/" + custId,

            success: function (coupon) {
                //请求成功后的操作
                var couponlist = coupon.data;
                console.log(couponlist);
                for (var i=0;i<couponlist.length;i++) {
                    console.log(couponlist[i].coupon.couName);
                    var price = couponlist[i].coupon.couPrice;
                    var name = couponlist[i].coupon.couName;
                    var num = couponlist[i].couponReceive.couNum;
                    console.log(num);

                    var liEle =
                        '<a class="dropdown-item" data-value="'+price+'">'+
                        name+
                        '</a>'+
                    '<input type="hidden" value="'+num+'">' ;
                    $(".dropdown-menu").append(liEle);
                }
            },
            error: function () {
                //请求失败后的操作
                console.log("请求失败！");
                console.log("custId:"+custId)
            }
        });
    }


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

</body>


</html>