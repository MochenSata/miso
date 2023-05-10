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
        ,href:"/customer/login.html"
      },{
        title: '消息'
        ,href:"/customer/login.html"
      },{
        title: '我的订单'
        ,href:"/customer/login.html"
      }]
      ,click: function(obj){
        window.location.href = obj.href;
      }
    });

  });