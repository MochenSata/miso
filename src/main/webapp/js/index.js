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

  //修改分类样式
  // $(".classification").on("click", "button", function(event) {
  //   var ele = event.target;
  //   if (ele.nodeName == "BUTTON") {
  //     var oldbtn = $(".selectkindbtn");
  //     oldbtn.removeClass("selectkindbtn").addClass("kindbtn");
  //     $(ele).addClass("selectkindbtn");
  //     var selectbtnValue = $(ele).text();
  //     console.log("被选中的" + selectbtnValue);
  //   }
  // });

  // document.querySelector(".classification").onclick=(function(event) {
  //   var ele = event.target;
  //   if (ele.nodeName === "BUTTON") {
  //     var oldbtn = document.querySelector(".selectkindbtn");
  //     oldbtn.classList.remove("selectkindbtn");
  //     oldbtn.classList.add("kindbtn");
  //     ele.classList.add("selectkindbtn");
  //     var selectbtnValue = ele.textContent;
  //     console.log("被选中的" + selectbtnValue);
  //   }
  // });
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

  