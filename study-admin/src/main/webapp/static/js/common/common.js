/**
 *  input-spinner
 * Created by siber.xu on 2015/11/7.
 */
(function ($) {
    $('.spinner .btn:first-of-type').on('click', function() {
        $('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
    });
    $('.spinner .btn:last-of-type').on('click', function() {
        $('.spinner input').val( parseInt($('.spinner input').val(), 10) - 1);
    });
})(jQuery);

var basicFn = {};
/**
 * 格式化数量
 * @param {Object} v
 * @return {TypeName}
 */
basicFn.formatNumber = function(v){
    return v.toFixed(basicParams.numberFixed);
};
/**
 * 格式化布爾型
 * @param {Object} v
 */
basicFn.formatBoolean = function(v){
    if(v===true || v==1){
        return '是';
    }else{
        return '否';
    }
};
/**
 * 格式化布爾型为图片显示
 * @param {Object} v
 */
basicFn.formatBooleanToImg = function(v){
    if(v===true || v==1){
        return '<img src="'+origin.bp()+'/themes/images/icons/ok.png" />';
    }else{
        return '<img src="'+origin.bp()+'/themes/images/icons/no.png" />';
    }
};
/**
 * 格式化布爾型为图片显示
 * @param {Object} v
 */
basicFn.formatBooleanToImg2 = function(v){
    if(v===true || v==1){
        return '<img src="'+origin.bp()+'/themes/images/icons/disable.png" />';
    }else{
        return '<img src="'+origin.bp()+'/themes/images/icons/enable.png" />';
    }
};
/**
 * 格式化单价
 * @param {Object} v
 * @return {TypeName}
 */
basicFn.formatPrice = function(v){
    if(v != undefined){
        return new Number(v).toFixed(basicParams.priceFixed);
    }else{
        return '0.00';
    }
};
/**
 * 格式化百分数
 * @param {Object} v
 * @return {TypeName}
 */
basicFn.formatPercent = function(v){
    return new Number(v).toFixed(basicParams.percentFixed)+'%';
};

/**
 * 字符过长隐藏
 * @param v
 * @returns {string}
 */
basicFn.formatTextOver = function (v) {
    var width = this.width || 200;
    return '<div class="text-over" style="width: ' + width + 'px" title="' + v + '">' + v + '</div>'
};

/**
 * 格式化日期
 * @param v
 * @returns {string}
 */
basicFn.formatDate = function (v) {

    return new Date(v).Format('yyyy-MM-dd');
};

/**
 * 格式化文件大小
 * @param value
 * @returns {*}
 */
basicFn.formatFileSize = function (value) {
    if (null == value || value == '') {
        return "0 Bytes";
    }
    var unitArr = new Array("Bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB");
    var index = 0;
    var srcsize = parseFloat(value);
    index = Math.floor(Math.log(srcsize) / Math.log(1024));
    var size = srcsize / Math.pow(1024, index);
    size = size.toFixed(2);//保留的小数位数
    return size + unitArr[index];
};

/**
 * 数组排序
 * @param array
 * @param sortBy
 * @param order
 * @returns {*|Array.<T>}
 */
basicFn.arraySort = function (array, sortBy, order) {
    var getSortFun = function (sortBy, order) {
        var ordAlpah = (order == 'asc') ? '>' : '<';
        var sortFun = new Function('a', 'b', 'return a.' + sortBy + ordAlpah + 'b.' + sortBy + '?1:-1');
        return sortFun;
    };
    return array.sort(getSortFun(sortBy, order));
};

/**
 * 去掉数组中重复项
 * @param array
 * @returns {Array}
 */
basicFn.uniqueArray = function (array) {
    var r = [];
    for (var i = 0, l = array.length; i < l; i++) {
        for (var j = i + 1; j < l; j++)
            if (array[i] === array[j]) j = ++i;
        r.push(array[i]);
    }
    return r;
};

//在iframe页面中隐藏父窗口指定元素
$(function(){
    $(document).on('click',function(){
        $('#tab-context-menu',parent.document).removeClass('open');
        $('.dropdown ',parent.document).removeClass('open');
    });
});

/**
 * 获取指定时间的前几天或后几天
 * @param date 指定日期
 * @param AddDayCount -1（负数）为前一天，0为当天，1（正数）为后一天
 * @returns {string} 返回yyyy-MM-dd格式
 * @constructor
 */
function GetDateStr2(date, AddDayCount) {
    var dd = date;
    dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth() + 1;//获取当前月份的日期
    m = m.toString().length == 1 ? '0' + m : m;
    var d = dd.getDate().toString().length == 1 ? '0' + dd.getDate() : dd.getDate();
    return y + "-" + m + "-" + d;
}

/**
 * 获取指定时间段中的每一天
 * @param startDate 开始时间
 * @param endDate 结束时间
 * @returns {Array} 包含每一天的数组
 */
function getDateRange(startDate, endDate) {
    var date = new Date(startDate);
    var range = [];
    var dateStr = date.Format("yyyy-MM-dd");
    while (dateStr <= endDate) {
        range.push(dateStr);
        dateStr = GetDateStr2(date, 1);
    }
    return range;
}

/**
 * 扩展时间类，格式化成字符串类型时间
 * @param fmt
 * @returns {*}
 * @constructor
 */
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};


