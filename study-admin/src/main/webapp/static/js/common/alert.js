/**
 * Created by siber.xu on 2015/11/8.
 */
(function (window) {
    var alert = {
        errmsg: {
            recordSuccess: '执行成功！',
            saveError: '保存异常！',
            warnmsg: '错误提示'
        },
        alert: function (msg) {
            BootstrapDialog.alert({title: '提示', message: msg});
        },
        success: function (msg) {
            BootstrapDialog.alert({title: '提示', type: BootstrapDialog.TYPE_SUCCESS, message: msg});
        },
        error: function (msg) {
            BootstrapDialog.alert({title: '提示', type: BootstrapDialog.TYPE_DANGER, message: msg});
        },
        /*弹出框*/
        msg: function (msg) {
            layer.msg(msg);
        },
        show : function(opt){
            BootstrapDialog.show(opt);
        },
        /*确认弹出框*/
        confirm: function (msg, callback,cancelCallback) {
            BootstrapDialog.confirm({
                title: '提示',
                message: msg || '确认这样操作吗？',
                btnCancelLabel: '否',
                btnOKLabel: '是',
                callback: function (result) {
                    if (result) {
                        if ($.isFunction(callback)) {
                            callback();
                        }
                    } else {
                        if ($.isFunction(cancelCallback)) {
                            cancelCallback();
                        }
                    }
                }
            });
        },
        window: function (title, url) {
            var index = layer.open({
                type: 2,
                area: ['700px', '450px'],
                offset: 'lt',
                fixed: false, //不固定
                //maxmin: true,
                title: title,
                content: url
            });
            layer.full(index);
        },
        selectWin: function (title, url) {
            layer.open({
                type: 2,
                area: ['850px', '420px'],
                fixed: false, //不固定
                title: title,
                content: url
            });
        },
        progress: function (msg) {
            return layer.msg(msg || '正在请求数据中...', {icon: 16, time: 0});
        },
        close: function (index) {
            layer.close(index);
        },
        closeAll: function () {
            layer.closeAll();
        },
        showBigImg: function (title, content) {
            layer.open({
                type: 1,
                title: title, //不显示标题栏
                area: '800px',
                anim: 3,
                scrollbar: true,
                maxmin: true,
                fixed: false, //不固定
                offset: '80px',
                shadeClose: true, //点击遮罩层关闭
                shade: 0.5, //透明度
                id: 'showBigImg', //设定一个id，防止重复弹出
                resize: false,
                moveType: 1, //拖拽模式，0或者1
                content: content

            });
        },
        photos: function (json) {
            layer.photos({
                photos: json,
                area: ['800px', '500px'],
                shade: 0.5, //透明度
                shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
            });
        }
    }
    window.$alert = alert;
})(window);