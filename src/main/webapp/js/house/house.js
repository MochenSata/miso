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
        }, range: ['#test-startDate-1', '#test-endDate-1']
    });
});




