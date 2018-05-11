/**
 * api.js
 * @fileOverview 网站共用方法库-适用于支持HTML5 B/S架构
 * @author siber.xu
 * @version 1.0
 * @date 2015-01-16
 * @extends jquery 2.0+
 * @remark 不涉及网站具体业务逻辑,只是对常用公共方法进行封装
 */
(function (window) {
    /* 对话框全局配置 */
    layer.config({
        skin: 'layer-ext-moon',
        extend: 'skin/moon/style.css'
    });
    //Jquery AJAX 全局配置
    var $doc = $(document);
    $doc.ajaxStart(function () {
        NProgress.start();
    }).ajaxComplete(function (event, request, settings) {
        if (request.status == 444) {
            var info = eval('(' + request.responseText + ')');
            //code =typeof(info.msg)=='undefined'?'':"，错误代码："+info.code;
            if (typeof(info.msg) != 'undefined')
                $alert.error(info.msg);
        }
    }).ajaxError(function (event, request, settings, exception) {
        if (exception == 'timeout')alert('请求超时，你的可能没有连接到网络！');
        if (request.status == 405) {
            alert("请求被拒绝，可能请求的页面已经不存在了，状态：405");
        }
        if (request.status == 500) {
            alert("服务器请求异常，状态：500");
        }
    }).ajaxStop(function(){
        NProgress.done();
    });


    var u = {};

    var isAndroid = (/android/gi).test(navigator.appVersion);
    var uzStorage = function () {
        var ls = window.localStorage;
        if (isAndroid) {
            ls = os.localStorage();
        }
        return ls;
    };

    function parseArguments(url, data, fnSuc, dataType) {
        if (typeof(data) == 'function') {
            dataType = fnSuc;
            fnSuc = data;
            data = undefined;
        }
        if (typeof(fnSuc) != 'function') {
            dataType = fnSuc;
            fnSuc = undefined;
        }
        ;
        return {
            url: url,
            data: data,
            fnSuc: fnSuc,
            dataType: dataType
        }
    };

    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };


    u.trim = function (str) {
        if (String.prototype.trim) {
            return str == null ? "" : String.prototype.trim.call(str);
        } else {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }
    };

    u.trimAll = function (str) {
        return str.replace(/\s*/g, '');
    };

    u.isArray = function (obj) {
        if (Array.isArray) {
            return Array.isArray(obj);
        } else {
            return obj instanceof Array;
        }
    };

    /**
     * 格式化字符串
     * 使用方法：origin.fs('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
     * @param str
     * @returns {*}
     */
    u.format = function (str) {
        for (var i = 0; i < arguments.length - 1; i++) {
            str = str.replace("{" + i + "}", arguments[i + 1]);
        }
        return str;
    };

    /**
     * 格式化数字显示方式
     * 用法
     * formatNumber(12345.999,'#,##0.00');
     * formatNumber(12345.999,'#,##0.##');
     * formatNumber(123,'000000');
     * @param num
     * @param pattern
     * @returns {string}
     */
    u.formatNumber = function (num, pattern) {
        var strarr = num ? num.toString().split('.') : ['0'];
        var fmtarr = pattern ? pattern.split('.') : [''];
        var retstr = '';

        // 整数部分
        var str = strarr[0];
        var fmt = fmtarr[0];
        var i = str.length - 1;
        var comma = false;
        for (var f = fmt.length - 1; f >= 0; f--) {
            switch (fmt.substr(f, 1)) {
                case '#':
                    if (i >= 0)
                        retstr = str.substr(i--, 1) + retstr;
                    break;
                case '0':
                    if (i >= 0)
                        retstr = str.substr(i--, 1) + retstr;
                    else
                        retstr = '0' + retstr;
                    break;
                case ',':
                    comma = true;
                    retstr = ',' + retstr;
                    break;
            }
        }
        if (i >= 0) {
            if (comma) {
                var l = str.length;
                for (; i >= 0; i--) {
                    retstr = str.substr(i, 1) + retstr;
                    if (i > 0 && ((l - i) % 3) == 0)
                        retstr = ',' + retstr;
                }
            } else
                retstr = str.substr(0, i + 1) + retstr;
        }

        retstr = retstr + '.';
        // 处理小数部分
        str = strarr.length > 1 ? strarr[1] : '';
        fmt = fmtarr.length > 1 ? fmtarr[1] : '';
        i = 0;
        for (var f = 0; f < fmt.length; f++) {
            switch (fmt.substr(f, 1)) {
                case '#':
                    if (i < str.length)
                        retstr += str.substr(i++, 1);
                    break;
                case '0':
                    if (i < str.length)
                        retstr += str.substr(i++, 1);
                    else
                        retstr += '0';
                    break;
            }
        }
        return retstr.replace(/^,+/, '').replace(/\.$/, '');
    };

    /**
     * 接收一个以逗号分割的字符串，返回数组
     * @param value
     * @returns {Array}
     */
    u.strToArray = function (value) {
        if (value != undefined && value != '') {
            var values = [];
            var t = value.split(',');
            for (var i = 0; i < t.length; i++) {
                values.push('' + t[i]);
                /* 避免他将ID当成数字 */
            }
            return values;
        } else {
            return [];
        }
    };

    //获取URL中的参数值
    u.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null)
            return unescape(r[2]);
        return null;
    };

    /**
     * JSON转字符串
     * @param json
     * @returns {JSON|*}
     */
    u.jsonToStr = function (json) {
        if (typeof json === 'object') {
            return JSON && JSON.stringify(json);
        }
    };

    /**
     * 字符串转JSON
     * @param str
     * @returns {*}
     */
    u.strToJson = function (str) {
        var resObj;
        if (typeof str != 'string') {
            return str;
        }
        try {
            var ToJsonOBJ = eval("(" + str + ")");
            if (typeof ToJsonOBJ == 'object' || typeof ToJsonOBJ == 'array') {
                return ToJsonOBJ;
            }
        } catch (e) {
        }
        return resObj;
    };

    u.compare = function (o1, o2) {
        if (o1.constructor == Object) {
            return $.md5(u.jsonToStr(o1)) == $.md5(u.jsonToStr(o2));
        }
    };

    u.jsonToForm = function ($form, json) {
        var jsonObj = json;
        if (typeof json === 'string') {
            jsonObj = $.parseJSON(json);
        }

        for (var key in jsonObj) {  //遍历json字符串
            var objtype = $.type(jsonObj[key]); // 获取值类型

            if (objtype === "array") { //如果是数组，一般都是数据库中多对多关系

                var obj1 = jsonObj[key];
                for (var arraykey in obj1) {
                    //alert(arraykey + jsonObj[arraykey]);
                    var arrayobj = obj1[arraykey];
                    for (var smallkey in arrayobj) {
                        setCkb(key, arrayobj[smallkey]);
                        break;
                    }
                }
            } else if (objtype === "object") { //如果是对象，啥都不错，大多数情况下，会有 xxxId 这样的字段作为外键表的id

            } else if (objtype === "string") { //如果是字符串
                var str = jsonObj[key];
                var date = new Date(str);
                if (date.getDay()) {  //这种判断日期是本人懒，不想写代码了，大家慎用。
                    $("[name=" + key + "]", $form).val(date.format("yyyy-MM-dd"));
                    continue;
                }

                var tagobjs = $("[name=" + key + "]", $form);
                if ($(tagobjs[0]).attr("type") == "radio") {//如果是radio控件
                    $.each(tagobjs, function (keyobj,value) {
                        if ($(value).attr("val") == jsonObj[key]) {
                            value.checked = true;
                        }
                    });
                    continue;
                }

                $("[name=" + key + "]", $form).val(jsonObj[key]);

            } else { //其他的直接赋值
                $("[name=" + key + "]", $form).val(jsonObj[key]);
            }

        }
    };

    //存储数据到本地
    u.setStorage = function (key, value) {
        if (arguments.length === 2) {
            var v = value;
            if (typeof v == 'object') {
                v = JSON.stringify(v);
                v = 'obj-' + v;
            } else {
                v = 'str-' + v;
            }
            var ls = uzStorage();
            if (ls) {
                ls.setItem(key, v);
            }
        }
    };

    /**
     * 读取本地数据
     * @param key
     * @returns {*}
     */
    u.getStorage = function (key) {
        var ls = uzStorage();
        if (ls) {
            var v = ls.getItem(key);
            if (!v) {
                return;
            }
            if (v.indexOf('obj-') === 0) {
                v = v.slice(4);
                return JSON.parse(v);
            } else if (v.indexOf('str-') === 0) {
                return v.slice(4);
            }
        }
    };
    //删除某个本地数据
    u.rmStorage = function (key) {
        var ls = uzStorage();
        if (ls && key) {
            ls.removeItem(key);
        }
    };
    //除空本地数据
    u.clearStorage = function () {
        var ls = uzStorage();
        if (ls) {
            ls.clear();
        }
    };

    /**
     * AJAX POST异步请求
     */
    u.post = function (/*url,data,fnSuc,dataType,contentType*/) {
        var argsToJson = parseArguments.apply(null, arguments);
        var json = {};
        json.type = 'post';
        json.contentType = 'application/json; charset=utf-8';
        var fnSuc = argsToJson.fnSuc;
        argsToJson.url && (json.url = argsToJson.url);
        argsToJson.contentType && (json.contentType = argsToJson.contentType);
        argsToJson.data && (json.data = (json.contentType === 'application/json; charset=utf-8' && json.type === 'post' ? JSON.stringify(argsToJson.data) : argsToJson.data));
        if (argsToJson.dataType) {
            var type = (argsToJson.dataType).toLowerCase();
            if (type == 'text' || type == 'json') {
                json.dataType = type;
            }
        } else {
            json.dataType = 'json';
        }

        json.success = function (data) {
            //if (data.success == false) {
            //window.top.location.href = $basePath + '/index.html';
            //return false;
            //}
            if ($.isFunction(fnSuc)) {
                fnSuc(data);
            }
        };
        $.ajax(json);
    };

    /**
     * AJAX GET异步请求
     */
    u.get = function (/*url,fnSuc,dataType*/) {
        var argsToJson = parseArguments.apply(null, arguments);
        var json = {};
        var fnSuc = argsToJson.fnSuc;
        argsToJson.url && (json.url = argsToJson.url);
        //argsToJson.data && (json.data = argsToJson.data);
        if (argsToJson.dataType) {
            var type = (argsToJson.dataType).toLowerCase();
            if (type == 'text' || type == 'json') {
                json.dataType = type;
            }
        } else {
            json.dataType = 'text';
        }
        json.type = 'get';
        json.success = function (data) {
            if (data.success == false && data.msg == '9999') {
                window.top.location.href = $basePath + '/index.html';
                return false;
            }
            if ($.isFunction(fnSuc)) {
                fnSuc(data);
            }
        };
        $.ajax(json);
    };

    //对象克隆
    u.cloneObject = function (obj) {
        var con = obj.constructor, cloneObj = null;
        if (con == Object) {
            cloneObj = new con();
        } else if (con == Function) {
            return Cute.Function.clone(obj);
        } else cloneObj = new con(obj.valueOf());

        for (var it in obj) {
            if (cloneObj[it] != obj[it]) {
                if (typeof (obj[it]) != 'object') {
                    cloneObj[it] = obj[it];
                } else {
                    cloneObj[it] = arguments.callee(obj[it])
                }
            }
        }
        cloneObj.toString = obj.toString;
        cloneObj.valueOf = obj.valueOf;
        return cloneObj;
    };

    //阻止事件冒泡
    u.stopEvent = function (event) {
        if (event && event.preventDefault) {
            // 阻止默认浏览器动作(W3C)
            event.preventDefault();
        } else {
            // IE中阻止函数器默认动作的方式
            window.event.returnValue = false;
        }
        if (event && event.stopPropagation) {
            // 因此它支持W3C的stopPropagation()方法
            event.stopPropagation();
        } else {
            // 否则，我们需要使用IE的方式来取消事件冒泡
            window.event.cancelBubble = true;
        }
    };

    //获取浏览器版本
    u.browser = function () {
        var na = navigator.appVersion;
        var Browser = {};
        Browser.isIE = !Browser.isOpera && (/msie/gi).test(na);
        Browser.isIE10 = Browser.isIE && (/msie 10/gi).test(na);
        Browser.isOpera = (/opera/gi).test(na);
        Browser.isWebKit = !Browser.isIE && (/webkit/gi).test(na);
        Browser.isIphone = (/iphone/gi).test(na);
        Browser.isAndroid = (/android/gi).test(na);
        Browser.isWindows = (/windows|win32/gi).test(na);
        Browser.isMac = (/macintosh|mac os x/gi).test(na);
        Browser.isAir = (/adobeair/gi).test(na);
        Browser.isLinux = (/linux/gi).test(na);
        Browser.isIpad = (/ipad/gi).test(na);
        Browser.isIpadFull = false;

        if (Browser.isAndroid || Browser.isIphone) {
            Browser.isMobile = true;
        } else {
            Browser.isMobile = false;
        }
        if (Browser.isAndroid || Browser.isIphone || Browser.isIpad) {
            Browser.isTouchFlat = true;
        } else {
            Browser.isTouchFlat = false;
        }
        return Browser;
    };

    window.$api = u;
})(window);

/**
 * 显示时钟
 * @constructor
 */
function Clock() {
    var date = new Date();
    this.day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[date.getDay()];

    this.toString = function () {
        return date.Format('yyyy年MM月dd日 hh:mm:ss' + '' + this.day);
    };

    this.display = function (ele) {
        var clock = new Clock();
        ele.innerHTML = clock.toString();
        window.setTimeout(function () {
            clock.display(ele);
        }, 1000);
    };
}
