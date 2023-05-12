<%--
  Created by IntelliJ IDEA.
  User: 12912
  Date: 2023/5/10
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Miso</title>
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.6.4.min.js"></script>
    <script src="layui/layui.js"></script>


</head>
<body>
<!--导航栏nav-->
<div class="foundation">
    <div class="layui-container">
        <div class="layui-row nav">
            <div class="layui-col-xs2 logo">
                <img src="img/logo.png"  class="logopic">
                <span class="slogn">让旅行更有味道</span>
            </div>
            <div class="layui-col-xs7">
                <div class="search-area">
                    <form action="house/search.html">
                        <input type="text" placeholder="请输入目的地">
                        <input type="submit" value="搜索">
                    </form>
                </div>
            </div>
            <div class="layui-col-xs1"><a href="customer/login.html" ><span class="login">登录</span></a></div>
            <div class="layui-col-xs1"><a href="customer/signup.html" ><span class="signup">注册</span></a></div>

            <div class="layui-col-xs1">
                <div class="layui-btn-container">
                    <button type="button" class="layui-btn layui-btn-primary demo1 personcenter">
                        <div href="" class="personal-btn">
                            <div class="headshort"><img src="img/customer/headshort.svg" alt=""></div>
                            <div class="personal">
                                <img src="img/customer/hengxian.svg" class="hengxian">
                            </div>
                        </div>

                    </button>
                </div>
            </div>



        </div>
    </div>
</div>

<!-- <div class="layui-container"> -->

<!--热门推荐header-->

<div class="header-title">
    <span class="hotwords">热门推荐</span>
</div>
<div class="layui-row header">

    <div class="layui-col-xs10 hotarea">
        <div class="layui-carousel" id="test3" lay-filter="test4">
            <div carousel-item="" id="hothouses">

            </div>
        </div>
    </div>

</div>

<!--分类-->
<div class="classification">
    <ul>
        <li>
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius selectkindbtn" lay-anim="false">
                <img src="img/index/all.png" alt="" class="kindimg">
                <span class="kindword">全部</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/chuanwu.png" alt="" class="kindimg">
                <span class="kindword">船屋</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/haijingfang.png" alt="" class="kindimg">
                <span class="kindword">海景房</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/luying.png" alt="" class="kindimg">
                <span class="kindword">露营</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/muwu.png" alt="" class="kindimg">
                <span class="kindword">木屋</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/nongjia.png" alt="" class="kindimg">
                <span class="kindword">农家乐</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/rishilvguan.png" alt="" class="kindimg">
                <span class="kindword">日式</span>
            </button>
        </li>
        <li >
            <button type="button" class="layui-btn layui-btn-primary layui-btn-radius kindbtn" lay-anim="false">
                <img src="img/index/shuwu.png" alt="" class="kindimg">
                <span class="kindword">树屋</span>
            </button>
        </li>
    </ul>
</div>


<!--民宿列表homelist-->
<div class="homelist">

    <ul >
        <a href="house/house.html"><li class="home">
            <img src="img/house/chuanwu/chuanwu1/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>

        <a href=""><li class="home">
            <img src="img/house/haijingfang/haijingfang1/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>

        <a href=""><li class="home">
            <img src="img/house/haijingfang/haijingfang2/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>

        <a href=""><li class="home">
            <img src="img/house/luying/luying1/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>

        <a href=""><li class="home">
            <img src="img/house/muwu/muwu1/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>

        <a href=""><li class="home">
            <img src="img/house/muwu/muwu2/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>

        <a href=""><li class="home">
            <img src="img/house/rishilvguan/rishilvguan1/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>

        <a href=""><li class="home">
            <img src="img/house/haijingfang/haijingfang2/main.jpg" >
            <div class="line1">
                <span class="homekind">类型:海景房</span>

                <img src="img/index/pingfen.png" class="pingfenico">
                <span class="score">4.5</span>

            </div>
            <div class="line2"><b>苏州湾特色海景房</b></div>
            <div class="line3"><b>￥</b><span class="price">2599</span><span class="houzhui">/晚</span></div>
        </li></a>
    </ul>
</div>

<div class="pagearea">
    <a href="" class="pagebtn"><</a>
    <span class="currentpage">1</span>
    <a href="" class="pagebtn">></a>
</div>




<script src="js/index.js" charset="utf-8"></script>

<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
            ,width:'1070px'
            ,height:'498px'
        });

        //事件
        carousel.on('change(test4)', function(res){
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });

    //进入首页加载热门推荐数据
    loadHotHouses();
    function loadHotHouses(){
        var url = "${pageContext.request.contextPath}/house/hot";
        $.get(url
            ,null
            , function (result){
                //console.log(JSON.stringify(result));
                var hotList=result.data;//存放热门推荐房源的集合
                for(var i=0;i<hotList.length;i++){
                    var houseId=hotList[i].houseId;
                    var houseName=hotList[i].houseName;
                    var houseKind=hotList[i].houseKind;
                    var houseMainpicture=hotList[i].houseMainpicture;
                    var houseScore=hotList[i].houseScore;
                    var housePrice=hotList[i].housePrice;
                    var houseIntro=hotList[i].houseIntro;

                    console.log(houseName)

                    // 将得到的数据渲染到页面中
                    var LiEle=
                        '<div class="hot">'+
                        '        <img src="'+houseMainpicture+'" class="hotpic"></img>'+
                        '    <a href="${pageContext.request.contextPath}/house/'+houseId+'"><div class="hotdesc">'+
                        '     <span class="housename">'+houseName+'</span>'+
                        '    <span class="housekind">类型：<span>'+houseKind+'</span></span>'+
                        '     <span class="introduction">'+houseIntro+'</span>'+
                        '    <span class="houseprice">价格：￥<span><b>'+housePrice+'</b></span> 起</span>'+
                        '    <span class="clicktodesc">点击查看详情</span>'+
                        '    </div></a>'+
                        '     </div>'
                    $("#hothouses").append(LiEle);


                }
            })
    }
</script>
</body>
</html>