/**
 * Created by siber.xu on 2015/11/2.
 */

$(function () {

    //MetisMenu
    $("#menu").metisMenu();

    // 导航栏slimscroll
    $('.sidebar-nav').slimScroll({
        height: '100%',
        railOpacity: 0.4,
        wheelStep: 10,
        alwaysVisible: false
    });

    // minimalize menu
    $('.navbar-minimalize').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });
    $('.metismenu>li').click(function () {
        if ($('body').hasClass('mini-navbar')) {
            $('.navbar-minimalize').trigger('click');
        }
    });

    $('.J_menuTabs').contextmenu({target: '#tab-context-menu'});

    /** 开启表单验证 **/
    $.validate({
        form: 'form',
        lang: 'cn'
    });

    //打开修改密码窗口
    $('#btnModifyPwd').on('click', function () {
        $('#modifyPwdModal').modal({backdrop: false});
    });
    //提交修改密码
    $('#btnModifyPwdSubmit').on('click', function () {
        if ($('#modifyPwdFrom').isValid()) {
            var param = $('#modifyPwdFrom').serializeJson();
            $api.post('saveModifyPwd.html', param, function (data) {
                if (data.success) {
                    $('#modifyPwdModal').modal('hide');
                } else {
                    $alert.alert(data.msg);
                }
            });
        }
    });
    //goPrePathname();
    window.onload = function () {
        goPrePathname();
    }
});

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar')) {
        $('.metismenu').hide();
        setTimeout(
            function () {
                $('.metismenu').fadeIn(500);
            }, 100);
    }
}

function getCookie(c_name) {
    if (document.cookie.length > 0) {//先查询cookie是否为空，为空就return ""
        c_start = document.cookie.indexOf(c_name + "=");//通过String对象的indexOf()来检查这个cookie是否存在，不存在就为 -1　　
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;//最后这个+1其实就是表示"="号啦，这样就获取到了cookie值的开始位置
            c_end = document.cookie.indexOf(";", c_start);//其实我刚看见indexOf()第二个参数的时候猛然有点晕，后来想起来表示指定的开始索引的位置...这句是为了得到值的结束位置。因为需要考虑是否是最后一项，所以通过";"号是否存在来判断
            if (c_end == -1) c_end = document.cookie.length;
            return document.cookie.substring(c_start, c_end);
        }
    }
    return "noCookie!"
}

function goPrePathname() {
    var path = getCookie("prePathname");
    if (document.cookie.length > 0 && path != "noCookie!") {
        //console.log("pathhhhhhh= " + path);
        //console.log("$basePath + path = " + ($basePath + path));
        let index = path.indexOf("\"");
        while (index != -1) {
            path = path.replace("\"", "");
            index = path.indexOf("\"");
        }
        $('a[href="' + $basePath + path + '"]').click();
        //parent.document
    }
}
