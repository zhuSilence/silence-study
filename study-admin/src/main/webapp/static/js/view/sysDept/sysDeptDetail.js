/**
 * Created by siber.xu on 2015/11/8.
 */
var SysDeptDetail = jClass.extend({
    init: function () {
        _this = this;

        /** 返回 **/
        $('#btnBack').click(function () {
            window.location.href = _this.urls.view;
        });

        $api.post(_this.urls.data, {deptId: id}, function (res) {
            if (res.success) {
                $('form').JsonToForm(res.data);
            } else {
                $alert.msg(res.msg);
            }
        });

    },
    urls: {
        view: 'index.html',
        data: 'data.html'
    }
})

$(function () {

    new SysDeptDetail();

});