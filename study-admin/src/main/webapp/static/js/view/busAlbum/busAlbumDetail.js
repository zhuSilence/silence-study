/**
 * Created by siber.xu on 2015/11/8.
 */
var BusAlbumDetail = jClass.extend({
    init: function () {
        _this = this;

        /** 返回 **/
        $('#btnBack').click(function () {
            //window.location.href = _this.urls.view;
            var winIndex = parent.layer.getFrameIndex(window.name);
            parent.layer.close(winIndex);
        });

        $api.post(_this.urls.data, {albumId: id}, function (res) {
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

    new BusAlbumDetail();

});