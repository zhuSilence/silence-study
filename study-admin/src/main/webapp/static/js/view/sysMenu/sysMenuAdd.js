/**
 * Created by siber.xu on 2015/11/8.
 */
var SysMenuAdd = jClass.extend({
    init: function () {
        _this = this;
        $form = $('#form');

        var formDataMd5 = $.md5(JSON.stringify($form.serializeJson()));

        /** 开启表单验证 **/
        $.validate({
            form: 'form',
            lang: 'cn'
        });
        /** 保存 **/
        $('#btnSave').click(function () {
            _this.save(function () {
                $('#form').resetForm();
                //$alert.success('保存成功!');
                 formDataMd5= $.md5(JSON.stringify($form.serializeJson()));
                $('#btnBack').trigger('click');
            });
        });
        /** 返回 **/
        $('#btnBack,#btnBottomBack').click(function () {
            var winIndex = parent.layer.getFrameIndex(window.name);
            if (formDataMd5 != $.md5(JSON.stringify($form.serializeJson()))) {
                $alert.confirm("当前数据有修改是否保存？", function () {
                    $('#btnSave').trigger('click');
                    $alert.closeAll();
                }, function () {
                    //window.location.href = _this.urls.view;
                    parent.layer.close(winIndex);
                });
            } else {
                //window.location.href = _this.urls.view;
                parent.layer.close(winIndex);
            }
        });
        /** 重置 **/
        $('#btnReset').click(function () {
            $('#form').resetForm();
        });

        $('input[type="checkbox"][name="sysRunCheckbox"]').click(function () {
            var mod = 0;
            $('input[type="checkbox"][name="sysRunCheckbox"]').each(function (i, n) {
                if ($(this).is(":checked"))
                    mod = mod | $(n).val();
            });
            $('input[type="hidden"][name="runMod"]').val(mod);
        });
    },
    urls: {
        view: 'index.html',
        save: 'save.html'
    },
    save: function (callback) {
        var form = $('#form');
        if (form.isValid()) {
            var param = form.serializeJson();
            $api.post('save.html', param, function (data) {
                if (data.success) {
                    parent.callback();
                    if ($.isFunction(callback)) {
                        callback(data);
                    }
                } else {
                    $alert.alert($alert.errmsg.saveError);
                }
            });
        }
    }
})

$(function () {

    new SysMenuAdd();

});