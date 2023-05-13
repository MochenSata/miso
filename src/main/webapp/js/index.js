
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





  