



//分类按钮
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



//热门推荐
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






  