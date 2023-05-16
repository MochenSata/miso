var startDate = new Date($("#test-startDate-1").val());
var endDate = new Date($("#test-endDate-1").val());

var timeDiff = Math.abs(endDate.getTime() - startDate.getTime());
var diffDays = Math.floor(timeDiff / (1000 * 3600 * 24));
$(".nights").text(diffDays);
$.fn.zongjia = function(){
//总价
var danjiaEle=document.querySelector(".danjia").innerText
console.log(danjiaEle)

// var tianshuEle=document.querySelector(".nights").innerText
// console.log(tianshuEle)

var zongjiaEle=document.querySelector(".subtotal").innerText
// zongjiaEle=danjiaEle*tianshuEle
// console.log(zongjiaEle);
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

setTimeout(function (){



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
},2000);




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
// //动态房价
// layui.use('laydate', function () {
//     var laydate = layui.laydate;
//     laydate.render({
//         elem: '#test6'
//         //设置开始日期、日期日期的 input 选择器
//         //数组格式为 2.6.6 开始新增，之前版本直接配置 true 或任意分割字符即可
//         , range: true,
//         done: function (value, date) {
//             console.log(date); // 输出date对象
//             console.log(typeof date); // 输出date对象的类型
//             // 获取选定的起始日期和结束日期数据
//             var start = value.split(' - ')[0];
//             var end = value.split(' - ')[1];
//             // 将起始日期和结束日期转换为Date对象
//             var startDate=new Date(start);
//             var endDate=new Date(end);
//             // 获取起始日期和结束日期的星期几
//             var startDayOfWeek = startDate.getDay();
//             var endDayOfWeek = endDate.getDay();
//             var dayOfWeekText = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
//             //var isHoliday=false;//假设今天不是假日
//             //var isWeekend = false; // 假设今天不是周末
//
//             // if (startDayOfWeek === 6 || startDayOfWeek === 0 || endDayOfWeek === 6 || endDayOfWeek === 0) {
//             //     isWeekend = true;
//             //     priceMultiplier=1.5;// 周末倍率为1.5
//             //
//             // }
//
//             var holidayList = ['2023-01-01','2023-01-02', '2023-01-03', '2023-04-04','2023-04-05','2023-04-06',
//                 '2023-05-01',
//                 '2023-05-02',
//                 '2023-05-03',
//                 '2023-04-29',
//                 '2023-04-30',
//                 '2023-09-29',
//                 '2023-09-30',
//                 '2023-10-01',
//                 '2023-10-02',
//                 '2023-10-03',
//                 '2023-10-04',
//                 '2023-10-05',
//                 '2023-10-06',]; // 假期列表
//             for (var d=startDate;d<=endDate;d.setDate(d.getDate()+1)){
//                 var dayOfWeek=d.getDay();
//                 var isWeekend = (dayOfWeek === 6 || dayOfWeek === 0);
//                 var isHoliday =(holidayList.indexOf(d.toISOString().substr(0, 10)) !== -1) ;
//                 //var originalPrice=document.querySelector(".housePriceValue")
//                 var originalPrice=document.querySelector(".danjia");
//                 var priceText =originalPrice.textContent.trim();
//                 if (/^\d+(\.\d+)?$/.test(priceText)){
//                     var price = parseFloat(priceText.substring(1));
//                     var priceMultiplier = 1;
//                     if (isWeekend) {
//                         if (dayOfWeek === 6) {
//                             priceMultiplier = 1.5;
//                         } else if (dayOfWeek === 0) {
//                             priceMultiplier = 1.5;
//                         }
//                     }
//                     if (isHoliday) {
//                         priceMultiplier = 2;
//                     }
//                     var dynamicPrice = price * priceMultiplier;
//                     console.log(d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + dayOfWeekText[dayOfWeek] + ' 价格：' + dynamicPrice);
//                     console.log('星期' + dayOfWeek);
//                 } else {
//                     console.error('房价格式不正确：' + priceText);
//                 }
//             }
//             //     var priceMultiplier=1;// 默认倍率为1
//             //     if (isWeekend) {
//             //         priceMultiplier = 1.5;
//             //     }
//             //     if (isHoliday) {
//             //         priceMultiplier = 2;
//             //     }
//             //     var dynamicPrice=price*priceMultiplier;
//             //     console.log(d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + dayOfWeekText[dayOfWeek] + ' 价格：' + dynamicPrice);
//             // }
//             // var dateString = startDate.getFullYear() + '-' + (startDate.getMonth() + 1) + '-' + startDate.getDate(); // 将日期转换为字符串
//             // if (holidayList.indexOf(dateString) !== -1) {
//             //     isHoliday = true;
//             //     priceMultiplier=2;// 假日倍率为2
//             //
//             // }
//             // for (var i = 0; i < holidayList.length; i++) {
//             //     var holidayDate = new Date(holidayList[i]);
//             //     var holidayMonth = parseInt(holidayList[i].split('-')[0]) - 1;
//             //     var holidayDate = parseInt(holidayList[i].split('-')[1]);
//             //     if (startDate.getMonth() === holidayMonth && startDate.getDate() === holidayDate) {
//             //         isHoliday = true;
//             //         priceMultiplier = 2;
//             //         break;
//             //     }
//             // }
//             //拿到房价
//             //var dynamicPrice=parseFloat(originalPrice.textContent)*priceMultiplier;
//             console.log(dynamicPrice);
//             console.log(price);
//             console.log('是否为周末：' + isWeekend);
//             console.log('是否为假期：' + isHoliday);
//             console.log("起始日期是"+dayOfWeekText[startDayOfWeek]);
//             console.log("结束日期是"+dayOfWeekText[endDayOfWeek]);
//             console.log(start);
//             console.log(end);
//         }, range: ['#test-startDate-1', '#test-endDate-1']
//     });
// });



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


