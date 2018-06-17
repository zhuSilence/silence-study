/**
 * Created by siber.xu on 2015/11/8.
 */
var BusCompanyDetail = jClass.extend({
    init: function () {
        _this = this;

        /** 返回 **/
        $('#btnBack').click(function () {
            //window.location.href = _this.urls.view;
            var winIndex = parent.layer.getFrameIndex(window.name);
            parent.layer.close(winIndex);
        });

        $api.post(_this.urls.data, {companyId: id}, function (res) {
            if (res.success) {
                $('form').JsonToForm(res.data);
                //-1删除0草稿1发布中2下线
                if (res.data.recordStatus == -1) {
                    $('[name="recordStatus"]').text('删除');
                }
                if (res.data.recordStatus == 0) {
                    $('[name="recordStatus"]').text('草稿');
                }
                if (res.data.recordStatus == 1) {
                    $('[name="recordStatus"]').text('发布中');
                }
                if (res.data.recordStatus == 2) {
                    $('[name="recordStatus"]').text('下线');
                }
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

    new BusCompanyDetail();

});