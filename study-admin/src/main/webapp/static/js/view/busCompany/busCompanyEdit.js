/**
 * Created by siber.xu on 2015/11/8.
 */
var BusCompanyEdit = jClass.extend({
    init: function () {
        _this = this;
        $form = $('#form');

        var formDataMd5;

        /** 开启表单验证 **/
        $.validate({
            form: 'form',
            lang: 'cn'
        });
        /** 保存 **/
        $('#btnSave').click(function () {
            _this.save(function () {
                formDataMd5 = null;
                $('#form').resetForm();
                $('#btnBack').trigger('click');
            });
        });
        /** 返回 **/
        $('#btnBack,#btnBottomBack').click(function () {
            var winIndex = parent.layer.getFrameIndex(window.name);
            if (formDataMd5 != null && formDataMd5 != $.md5(JSON.stringify($form.serializeJson()))) {
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

        $api.post(_this.urls.data, {companyId: id}, function (res) {
            if (res.success) {
                // $('form').JsonToForm(res.data);
                $.extend(busCompany.$data, res.data);
                busCompany.$forceUpdate();
                formDataMd5 = $.md5(JSON.stringify($form.serializeJson()))
            } else {
                $alert.msg(res.msg);
            }
        });
    },
    urls: {
        view: 'index.html',
        save: 'save.html',
        data: 'data.html'
    },
    save: function (callback) {
        var _this = this;
        var form = $('#form');
        if (form.isValid()) {
            // var param = form.serializeJson();
            param = busCompany.$data;
            $api.post(_this.urls.save, param, function (data) {
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
});

var busCompany;
$(function () {

    busCompany = new Vue({
        el: '#form',
        data: {
            companyId: 0,
            companyName: '',
            companyEnglishName: '',
            address: '',
            registerTime: '',
            registerNumber: '',
            legalPerson: '',
            registerAdd: '',
            registerMoney: 0,
            officialWebsite: '',
            contactPerson: '',
            contactPhone: '',
            description: '',
        },
        methods: {

        }
    });
    new BusCompanyEdit();

});