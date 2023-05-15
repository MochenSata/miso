<%--
  Created by IntelliJ IDEA.
  User: 17894
  Date: 2023/5/11
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${serverResult.data.houseName}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/house/house.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript"
            src="https://api.map.baidu.com/api?v=1.0&&type=webgl&ak=NGfZONqozqFRCZ4fNZpEc0hODBQQ5gkS"></script>
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
            <!-- <div class="layui-col-xs1"><div class="headshort"><img src="" alt=""></div> </div> -->
            <div class="layui-col-xs1"><a href="" class="personal-btn">
                <div class="headshort"><img src="" alt=""></div>
                <span class="personal"> 个人中心</span>
            </a></div>
        </div>
    </div>
</div>

<!--图片-->
<div class="imgcontainer">
    <div class="left">
        <img  src="${serverResult.data.houseMainpicture}"alt="海景主图" class="left-img" >
    </div>

    <div class="right">
        <div class="top-left">
            <!-- 右半部分上半部分左边内容 -->
            <img src="${serverResult.data.housePicOne}" alt="海景主图" class="right-img">
        </div>
        <div class="top-right">
            <img src="${serverResult.data.housePicTwo}" alt="海景主图" class="right-img">
        </div>
        <div class="bottom-left">
            <img src="${serverResult.data.housePicThree}" alt="海景主图" class="right-img">
        </div>
        <div class="bottom-right">
            <img src="${serverResult.data.housePicFour}" alt="海景主图" class="right-img">
        </div>
    </div>
</div>

<!-----------------------------------详情------------------------------------>
<div class="wrapper">

    <!-- <ul class="layui-nav menu"> -->

    <div class="style-menu">
        <li class="meun-li"><a href="#section1" class="menufont">详情</a></li>
        <li class="meun-li"><a href="#section2" class="menufont">评价</a></li>
        <li class="meun-li"><a href="#section3" class="menufont">可订日期</a></li>
        <li class="meun-li"><a href="#section4" class="menufont">位置</a></li>
        <li class="meun-li"><a href="#section5" class="menufont">须知</a></li>
    </div>

    <!-- </ul> -->

    <div class="scrollable">
        <!--------------------------- 可下拉查看的内容(1) 房屋主要信息 --------------------------------->
        <div class="mainhousetext">
            <span class="minloc">苏州市-${serverResult.data.houseName}</span>
            <span class="maintitle">${serverResult.data.houseTheme}</span>


            <div class="houseinfor">
                <div class="perhouseinfor">
                    <img src="../img/house/jibenxinxi/woshi.png" class="mini-img">
                    <span class="datainfor">${serverResult.data.houseRoomNum}</span>
                    <span class="baseinfor">卧室</span>
                </div>
                <div class="perhouseinfor">
                    <img src="../img/house/jibenxinxi/chuang.png" class="mini-img">
                    <span class="datainfor">${serverResult.data.bedCount}</span>
                    <span class="baseinfor">张床</span>
                </div>
                <div class="perhouseinfor">
                    <img src="../img/house/jibenxinxi/toilet.png" class="mini-img">
                    <span class="datainfor">${serverResult.data.houseToiletcount}</span>
                    <span class="baseinfor">个卫生间</span>
                </div>
                <div class="perhouseinfor">
                    <img src="../img/house/jibenxinxi/renshu.png" class="mini-img">
                    <span class="datainfor">${serverResult.data.houseCustCount}</span>
                    <span class="baseinfor">人数</span>
                </div>
                <div class="lable-min">
                    <p class="condition-ab">评分: ${serverResult.data.houseScore}分</p>
                    <p class="condition-ab">${serverResult.data.houseKind}</p>
                    <p class="condition">免费停车</p>
                    <p class="condition">可做饭</p>
                    <p class="condition">有洗衣机</p>
                </div>
            </div>
        </div>

        <div class="promotion" id="section1">
            <span class="promotion-title">民宿详情介绍</span>
            <span class="con-promotion">
                ${serverResult.data.houseIntro}
        </span>
            <span class="con-promotion"> ${serverResult.data.houseFacility}</span>
        </div>


        <!-- /***************************基础设施*******************************/ -->
        <div class="infrastructure">
            <div class="infra-on">
                <div class="infra-on-1">
                    <span class="infra-on-2">整套房源</span>
                    <span class="infra-on-3">独享所有空间，无需与他人共用</span>
                </div>
                <div class="infra-on-1">
                    <span class="infra-on-2">入住/退房</span>
                    <span class="infra-on-4">入住时间 下午2:00 - 下午8:00、退房时间 上午12:00</span>
                </div>
            </div>
            <div class="infra-under">
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/wifi.png" class="under-combine-img">
                    <span class="under-combine-text">无线网络</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/kongtiao.png" class="under-combine-img">
                    <span class="under-combine-text">空调</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/chufang.png" class="under-combine-img">
                    <span class="under-combine-text">可做饭厨房</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/nuanqi.png" class="under-combine-img">
                    <span class="under-combine-text">暖气</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/shufang.png" class="under-combine-img">
                    <span class="under-combine-text">书房</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/tv.png" class="under-combine-img">
                    <span class="under-combine-text">电视</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/tingchewei.png" class="under-combine-img">
                    <span class="under-combine-text">停车位</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/yagaoyashua.png" class="under-combine-img">
                    <span class="under-combine-text">洗漱用品</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/yundou.png" class="under-combine-img">
                    <span class="under-combine-text">熨斗</span>
                </div>
                <div class="under-combine">
                    <img src="../img/house/jibenxinxi/youyongchi.png" class="under-combine-img">
                    <span class="under-combine-text">游泳池</span>
                </div>
            </div>
        </div>

        <!-- /***************************评价部分*******************************/ -->

        <div class="evaluation">
            <span class="promotion-title" id="section2">房客评价</span>
            <div id="test1"></div>
            <div class="evaluation-star">
            </div>
            <div class="evaluation-part">
            </div>
            <div class="pagepart">
            </div>
        </div>

        <script>
            $(document).ready(function() {
                getByPage(1, ${serverResult.data.houseId}); // 页面加载即执行查询
            });

            var currentPageNum; // 该变量的作用是为了删除成功后，继续分页查询本页的数据

            function getByPage(pageNum,id) {
                id=${serverResult.data.houseId};
                $(".evaluation-part").html(""); // 清空UL中的数据信息
                var pageInfo = ""; // 清空页码信息

                console.log("===========================================pageNum:" + pageNum);
                console.log("============pagenum type:" + typeof pageNum);

                // 页码的处理（第1页pageNum没有传值）
                if (typeof pageNum == "number")
                    var url = "${pageContext.request.contextPath}/comment/house/" + pageNum + "?id=" + id; // 将ID添加到URL中
                else {
                    var url = "${pageContext.request.contextPath}/comment/house?id="+id;
                    pageNum = 1;
                }
                currentPageNum = pageNum;
                console.log(pageNum);
                $.get(url, null, function(result) {
                    // ServerReponse json: data(pageInfo)
                    console.log(result);
                    console.log("分页查询的数据是JSON：" + JSON.stringify(result));

                    // 1. 渲染数据到 UL- LI
                    var commentArray = result.data.records;
                    console.log("char 数组：" + commentArray);

                    for (var i = 0; i < commentArray.length; i++) {
                        // 5 shop
                        var liEle =
                            '<div class="evaluation-part-1">' +
                            '<div class="evaluation-user">' +
                            '<img src="../img/house/jibenxinxi/headshort.svg" class="user-img">'+
                            '<div class="user-text">' +
                            '<span class="user-name">' +
                            commentArray[i].custName +
                            '</span> <br/>' +
                            '<span class="evaluation-time">' +
                            commentArray[i].comCreateTime +
                            '</span>' +
                            '</div>' +
                            '</div>' +
                            '<div class="evaluation-part-text">' +
                            '<span class="Text-content">' +
                            commentArray[i].comContent+
                            '</span>'+
                            '</div>'+
                            '</div>';
                        $(".evaluation-part").append(liEle);
                    }

                    // 2. 渲染页码信息
                    var total = result.data.total;
                    var pageNum = result.data.current;
                    var pages = result.data.pages;
                    var prePage = pageNum - 1;
                    var nextPage = pageNum + 1;
                    commentnum = ' 共有<span class="evaluation-num">' + total + '</span>条评价';
                    pageInfo += '<a href="javascript:getByPage(' + prePage + ')"> <div class="prepage">&lt;</div> </a> ';
                    pageInfo += '<div class="prepage"><span class="pagetext">' + pageNum + '</span></div>';
                    pageInfo += '<a href="javascript:getByPage(' + nextPage + ')"> <div class="prepage">></div> </a> ';

                    $(".pagepart").html(pageInfo);
                    $(".evaluation-star").html(commentnum);
                }, "json");
            }

        </script>

        <!-- /*----------------可订日期---------------------------*/ -->

        <!-- <div class="Available-dates" id="section3">
          <span class="promotion-title">可订日期</span>
          <div class="dates-text">
            <span class="Available-dates-text">请输入旅程日期来查看确切的价格和可订状态</span>
          </div>
          <div class="site-demo-laydate">
            <div class="layui-inline" id="test-n1"></div>
          </div>
        </div> -->

        <!-- /*----------------房源位置---------------------------*/ -->
        <div class="house-location">
            <span class="promotion-title" id="section4">房源位置</span>
            <div class="infra-on-2 duputy-loc">
                <img src="../img/house/jibenxinxi/dingwei.png" class="mini-img">
                <span>中国-江苏省-苏州市-苏州湾</span>
            </div>
            <div class="baiduAPI" id="map">
            </div>
        </div>

        <!-- /*----------------预定须知---------------------------*/ -->
        <div class="booknotice">
            <span class="promotion-title" id="section5">预定须知</span>
            <div class="concretenotice">
                <div class="notice-1">
                    <div class="notice-title">
                        <span>房屋守则</span>
                    </div>
                    <div class="notice-text">
                        <span>不允许携带宠物</span>
                        <span>不允许举办派对和活动</span>
                        <span>禁止吸烟</span>
                    </div>
                </div>
                <div class="notice-1">
                    <div class="notice-title">
                        <span>安全须知</span>
                    </div>
                    <div class="notice-text">
                        <span>附近的湖泊、河流、其他水体</span>
                        <span>已安装一氧化碳报警器</span>
                        <span>已安装烟雾报警器</span>
                    </div>
                </div>
                <div class="notice-1">
                    <div class="notice-title">
                        <span>安全预订</span>
                    </div>
                    <div class="notice-text">
                        <span> 为了保护您的账号隐私及付款安全，请勿妄信第三方预订代理提供的折扣</span>
                        <span> 或礼金券，也不要在Miso网站或App之外汇款或沟通。</span>
                    </div>
                </div>
            </div>
        </div>

    </div>



    <!-- /*----------------固定框---------------------------*/ -->
    <div class="style-fixed">
        <div class="fixed">
            <!-- 固定的内容的内容 -->
            <div class="perhousePrice">
                <span class="housePrice">￥${serverResult.data.housePrice}</span>

                <span class="perday">/晚</span>
            </div>
            <div class="fixedscore">
                <div id="test4">

                </div>
            </div>
            <form class="order-form" action="${pageContext.request.contextPath}/myorder/houseDetail" method="post">


                <div class="layui-form">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">日期</label>
                            <div class="layui-inline" id="test6">
                                <div class="layui-input-inline">
                                    <input type="text" autocomplete="off" id="test-startDate-1" class="layui-input" placeholder="入住日期" name="custStartDate">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline">
                                    <input type="text" autocomplete="off" id="test-endDate-1" class="layui-input" placeholder="退房日期" name="custEndDate">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <label class="formcounter">人数</label>
                <div class="counterpart">
                    <input class="form-counter" id="result" value="0" name="custNum">
                    <div class="counterbutton">
                        <button class="counter-button" href="javascript:void(0)" id="subtract">-</button>
                        <button class="counter-button" href="javascript:void(0)" id="add">+</button>
                    </div>
                    <input type="hidden" value="${serverResult.data.houseMainpicture}" name="houseMainpicture">
                    <input type="hidden" value="${serverResult.data.housePrice}" name="housePrice">
                    <input type="hidden" value="${serverResult.data.houseScore}" name="houseScore">
                    <input type="hidden" value="${serverResult.data.houseTheme}" name="houseTheme">
                    <input type="submit" class="formsubBtn" value="查看可预订状态">
                </div>
            </form>

        </div>
    </div>

</div>


<script src="../js/house/house.js"></script>


<!-- //地图 -->
<script type="text/javascript">
    var map = new BMapGL.Map("map");
    // 创建地图实例
    var point = new BMapGL.Point(120.596575, 31.149939);
    // 创建点坐标
    map.centerAndZoom(point, 15);
    // 初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放

    var marker = new BMapGL.Marker(point);
    map.addOverlay(marker);
    var navi3DCtrl = new BMapGL.NavigationControl3D();  // 添加3D控件
    map.addControl(navi3DCtrl);
</script>



<script>


    //计算人数
    // 获取元素
    const subtractBtn = document.getElementById("subtract");
    const addBtn = document.getElementById("add");
    const resultEl = document.getElementById("result");

    // 定义初始值
    let result = 0;
    let num = 0;
    // 减法按钮事件处理函数
    subtractBtn.addEventListener("click", function(event) {
        event.preventDefault();
        if (result > 0) {
            result--;
        }
        resultEl.val = result;
        num = result;
        $("#result").val(num);
        console.log("人数是：" + num); // 在事件处理函数中输出最新的num值
    });

    // 加法按钮事件处理函数
    addBtn.addEventListener("click", function(event) {
        event.preventDefault();
        if (result < 4) {
            result++;
        }
        resultEl.innerText = result;
        num = result;
        $("#result").val(num);
        console.log("人数是：" + num); // 在事件处理函数中输出最新的num值
    });









    // 预定日期
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        const rangeDate = laydate.render({
            elem: '#test6'
            , range: ['#test-startDate-1', '#test-endDate-1']
        });
        //直接嵌套显示
        const normalDate = laydate.render({
            elem: '#test-n1'
            , position: 'static'
            , range: ['#test-startDate-1', '#test-endDate-1']
        });
    });

    // 评分系统
    layui.use(['rate'], function () {
        var rate = layui.rate;

        rate.render({
            elem: '#test1'
            , value: ${serverResult.data.houseScore}
            , half: true
            , readonly: true
            , theme: '#008489'
        })

        rate.render({
            elem: '#test4'
            , value: ${serverResult.data.houseScore}
            , half: true
            , text: true
            , readonly: true
            , theme: '#008489'
        })
    });
</script>

</body>

</html>