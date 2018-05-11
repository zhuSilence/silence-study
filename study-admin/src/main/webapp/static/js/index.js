/**
 * Created by siber.xu on 2015/11/5.
 */
var Login = jClass.extend({
    init: function () {

        var $this = this;

        if (window != top) {
            top.location.href = location.href;
        }
        //刷新验证码
        $('#verifyCode').click(this.refreshCaptcha);

        //开启表单验证
        $.validate({
            form: 'form',
            lang: 'cn'
        });

        $('#btnLogin').click(function () {
            $this.submitLogin();
        });
    },
    refreshCaptcha: function () {
        $('#verifyCode').attr({
            "src": $basePath + "/captcha.jpg?_=" + new Date().getTime()
        });
    },
    submitLogin: function () {
        var $this = this;
        if ($('#form').isValid()) {
            var param = $('#form').serializeJson();
            $api.post($basePath + '/userlogin.html', param, function (data) {
                if (data.success) {
                    window.location = "main.html";
                } else {
                    $.ladda('stopAll');
                    $this.refreshCaptcha();
                    alert(data.msg);
                }
            });
        }else{
            setTimeout(function(){
                $.ladda('stopAll');
            },500);
        }
    }
});

$(function () {
    new Login();
    $('#btnLogin').ladda('bind');
    //监听回车键登录
    $(document).on('keydown',function(e){
        var theEvent = e || window.event;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if (code == 13) {
            //回车执行查询
            $('#btnLogin').trigger('click');
        }
    })
});