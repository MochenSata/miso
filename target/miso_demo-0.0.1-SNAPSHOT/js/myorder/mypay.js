
$.fn.zongjia = function(){
//总价
var danjiaEle=document.querySelector(".danjia").innerText
console.log(danjiaEle)

var tianshuEle=document.querySelector(".nights").innerText
console.log(tianshuEle)

var zongjiaEle=document.querySelector(".subtotal").innerText
zongjiaEle=danjiaEle*tianshuEle
console.log(zongjiaEle);
$(".subtotal").text(zongjiaEle);
var couponValue = $("#resultSpan").text();
console.log("优惠券："+couponValue);
var total = zongjiaEle - parseFloat(couponValue);
$('.total').text(total.toFixed(2));

}



$(document).ready(function() {
    $('#myElement').zongjia();
  });





//优惠券
$('.dropdown-toggle').on('click', function (e) {
    e.preventDefault();
    $('.dropdown-menu').toggle();
});

// 隐藏优惠券结果
$('#resultSpan').parent().hide();

// 当选择优惠券时，显示优惠券结果
$('.dropdown-item').on('click', function () {
    // 获取选中的优惠券值
    var selectedValue = $(this).data('value');
    // 将选中的优惠券值显示在下拉列表中
    $('.dropdown-toggle').text($(this).text());
    // 将选中的优惠券值显示在优惠券结果中
    $('#resultSpan').text(selectedValue);
    // 显示优惠券结果
    $('#resultSpan').parent().show();
    // 关闭下拉框
    $('.dropdown-menu').toggle();

    $('#myElement').zongjia();
    
});

// 当取消选择优惠券时，隐藏优惠券结果
$('.dropdown-toggle').on('click', function () {
    $('#resultSpan').parent().hide();
});






//优惠券选择
layui.use(function () {
    var form = layui.form;
    var layer = layui.layer;
    // select 事件
    form.on('select(demo-select-filter)', function (data) {
        var elem = data.elem; // 获得 select 原始 DOM 对象
        var value = data.value; // 获得被选中的值
        var othis = data.othis; // 获得 select 元素被替换后的 jQuery 对象

       
        layer.msg(this.innerHTML + ' 的 value: ' + value); // this 为当前选中 <option> 元素对象

    });
});





layui.use('laydate', function () {
    var laydate = layui.laydate;
    laydate.render({
        elem: '#test6'
        //设置开始日期、日期日期的 input 选择器
        //数组格式为 2.6.6 开始新增，之前版本直接配置 true 或任意分割字符即可
        , range: true,
        done: function (value, date) {
            // 获取选定的起始日期和结束日期数据
            var start = value.split(' - ')[0];
            var end = value.split(' - ')[1];
            console.log(start);
            console.log(end);
            var days = Math.ceil((new Date(end).getTime() - new Date(start).getTime()) / (1000 * 60 * 60 * 24));
            console.log("入住天数：" + days);
            $(".nights").text(days);
            $('#myElement').zongjia();
            

        }, range: ['#test-startDate-1', '#test-endDate-1']

    });

});


//验证姓名
document.querySelector(".zhukexingming").onblur = checkCustname;

//验证身份证
document.querySelector(".shenfenzheng").onblur = checkCustidcard;

//验证手机号
document.querySelector(".telno").onblur = checkCusttelno;

//封装验证方法
function checkIpt(ele,msgTipEle,regexp,errorMsg){
    var eleValue = ele.value;
    if(eleValue == '' || eleValue == null){
        msgTipEle.innerText = "不能为空";
    }else if(!regexp.test(eleValue)){
        msgTipEle.innerText = errorMsg;
        return false;
    }
    else{
        msgTipEle.innerText = "";
        return true;
    }
}

//验证姓名方法
function checkCustname(){
    var custnameEle = document.querySelector(".zhukexingming");
    var custnameTipEle = document.querySelector(".custnameTip");
    var regexp = /^[\u4E00-\u9FA5]{2,4}$/;            
    var errorMsg = "姓名只能是中文,且长度在2-4个字";
    checkIpt(custnameEle,custnameTipEle,regexp,errorMsg);
}

//验证手机号方法
function checkCusttelno(){
    var custtelnoEle = document.querySelector(".telno");
    var custtelnoTipEle = document.querySelector(".custtelnoTip");
    var regexp = /^[0-9]{11}$/;
    var errorMsg = "手机号只能是数字,且长度为11个字符";
    checkIpt(custtelnoEle,custtelnoTipEle,regexp,errorMsg);
}

//验证身份证方法
function checkCustidcard(){
    var custtelnoEle = document.querySelector(".shenfenzheng");
    var custtelnoTipEle = document.querySelector(".custidcardTip");
    const regexp = /^[1-9]\d{5}(19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
    var errorMsg = "身份证只能是数字,或者最后一位为X,且长度为18个字符";
    checkIpt(custtelnoEle,custtelnoTipEle,regexp,errorMsg);
}

// layui.use('laydate', function(){
//     var laydate = layui.laydate;
//     laydate.render({
//     elem: '#test6'
//     //设置开始日期、日期日期的 input 选择器
//     //数组格式为 2.6.6 开始新增，之前版本直接配置 true 或任意分割字符即可
//     , range: true,
//         done: function(value, date){
//           // 获取选定的起始日期和结束日期数据
//           var start = value.split(' - ')[0];
//           var end = value.split(' - ')[1];
//           console.log(start);
//           console.log(end);
//           var days = Math.ceil((new Date(end).getTime() - new Date(start).getTime()) / (1000 * 60 * 60 * 24));
//           console.log("入住天数："+days);
//           $('.nights').text(days);
//         },range: ['#test-startDate-1', '#test-endDate-1']
         
        
//     });
    

    // });