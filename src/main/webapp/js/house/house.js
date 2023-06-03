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
//                 var originalPrice=document.querySelector(".housePriceValue")
//                 var priceText =originalPrice.textContent.trim();
//                 if (/^\d+(\.\d+)?$/.test(priceText)){
//                     var price = parseFloat(priceText);
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
//                 }
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
//              console.log(price);
//             console.log('是否为周末：' + isWeekend);
//             console.log('是否为假期：' + isHoliday);
//             console.log("起始日期是"+dayOfWeekText[startDayOfWeek]);
//             console.log("结束日期是"+dayOfWeekText[endDayOfWeek]);
//             console.log(start);
//             console.log(end);
//         }, range: ['#test-startDate-1', '#test-endDate-1']
//     });
// });
//
//
//
//
//
