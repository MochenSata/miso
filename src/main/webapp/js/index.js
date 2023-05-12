

  //个人中心

  
  layui.use(['dropdown', 'util', 'layer', 'table'], function(){
    var dropdown = layui.dropdown
    ,util = layui.util
    ,layer = layui.layer
    ,table = layui.table
    ,$ = layui.jquery;
    
    //初演示
    dropdown.render({
      elem: '.demo1'
      ,data: [{
        title: '个人中心'
        ,href:"myorder/miso_order_all.html"
      },{
        title: '消息'
        ,href:"customer/login.html"
      },{
        title: '我的订单'
        ,href:"customer/login.html"
      }]
      ,click: function(obj){
        window.location.href = obj.href;
      }
    });

  });
  $(".classification").on("click", "button", function(event) {
    var ele = $(event.target).closest("button");
    if (ele.length) {
      var oldbtn = $(".selectkindbtn");
      oldbtn.removeClass("selectkindbtn").addClass("kindbtn");
      ele.addClass("selectkindbtn");
      var selectbtnValue = ele.find(".kindword").text();
      console.log("被选中的" + selectbtnValue);
    }
  });

setTimeout(function (){
  layui.use(['carousel', 'form'], function(){

    var carousel = layui.carousel
        ,form = layui.form;

    //设定各种参数
    var ins3 = carousel.render({
      elem: '#test3'
      ,width:'1070px'
      ,height:'498px'

    });
    $("#hothouses").html(hotHtml);

    ins3.reload({elem: '#test3'});//重置轮播图
  });
},2000);






  