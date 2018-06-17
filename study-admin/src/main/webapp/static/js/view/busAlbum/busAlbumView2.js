/**
 * Created by xujianxin on 2016/12/5.
 */
var columns = [{
    field: 'mediaName',
    title: '素材名称',
    query: {
        type: 'text'
    }
}, {
    field: 'mediaTag',
    title: '素材标签',
    query: {
        type: 'text'
    }
}, {
    field: 'mediaClassId',
    title: '素材类型',
    query: {
        type: 'select',
        data: [{
            name: '图片',
            value: 1
        }, {
            name: '视频',
            value: 2
        }]
    }
}, {
    field: 'adSpace',
    title: '广告位名称',
    query: {
        field: 'adSpace.spaceName',
        type: 'text'
    }
}, {
    field: 'adCustomer',
    title: '客户名称',
    query: {
        field: 'adCustomer.company',
        type: 'text'
    }
}, {
    field: 'checkStatus',
    title: '素材状态',
    query: {
        type: 'select',
        data: [{
            name: '草稿',
            value: 0
        }, {
            name: '待审核',
            value: 1
        }, {
            name: '已审核',
            value: 2
        },{
            name: '已测试',
            value: 4
        }, {
            name: '已拒绝',
            value: 3
        }]
    }
}, {
    field: 'createTime',
    title: '创建时间',
    query: {
        type: 'date'
    }
}];

var params = {
    order: "desc",
    sort: "createTime"
};
$(function () {
    //初始化工具栏
    new ToolsBar(columns, {
        findCallback: function (data) {
            $("#page").pagination('setParams', $.extend({}, params, data));
            $("#page").pagination('remote');
        }
    });

    //新增素材
    $('#btnAdd').on('click', function () {
        //window.location.href = 'add.html';
        $alert.window(false, 'add.html');
    });

    $('#page').pagination({
        pageSize: 12,
        remote: {
            url: 'pageList.html',
            showInfo: true,
            showJump: true,
            params: params,
            pageParams: function (data) {
                return {
                    page: data.pageIndex + 1,
                    rows: data.pageSize
                }
            },
            success: function (data) {
                var rows = data.rows || [];
                $('#pic-list').empty();
                var itemList = [];
                if (rows.length > 0) {
                    itemList.push('<ul>');
                    $.each(rows, function (i, n) {
                        itemList.push('<li class="pic">');
                        itemList.push('<div class="in">');
                        itemList.push('<div><h2 class="tit_"></span> ' + n.albumName + '</h2></div>');
                        itemList.push('<div class="img-div" data-checkStatus="' + n.checkStatus + '" data-mediaId="' + n.albumId + '">');
                        itemList.push('<img class="img-responsive" src="../static/images/img_thumb.png" style="width: 100%;" data-src="' + n.icon + '">');
                        itemList.push('</div>');
                        itemList.push('<div class="con-div">');
                        itemList.push('<p><span>公司：' + (n.busCompanyEntity != null ? n.busCompanyEntity.companyName : '') + '</span>');
                        //素材组
                        if (n.mediaDetailList.length > 0) {
                            var seqSet = [];
                            $.each(n.mediaDetailList, function (i, n) {
                                seqSet.push(n.seq);
                            });
                            seqSet = basicFn.uniqueArray(seqSet);
                            if (seqSet.length == 1) {
                                itemList.push('<i class="fa fa-tag pull-right" style="color: #2f4050;font-size: 14px;padding-top: 2px;" title="单组"></i>');
                            } else {
                                itemList.push('<i class="fa fa-tags pull-right" style="color: #2f4050;font-size: 14px;padding-top: 2px;" title="' + seqSet.length + '组"></i>');
                            }
                        }
                        //文件类型
                        // if (n.adMediaClass == null || n.adMediaClass.mediaClassId === 1) {
                            itemList.push('<span class="fa fa-file-image-o pull-right" style="color: #99cc33;font-size: 14px;padding-top: 2px;" title="图片"></span>');
                        // } else {
                        //     itemList.push('<span class="fa fa-file-movie-o pull-right" style="color: #ff6666;font-size: 14px;padding-top: 2px;" title="视频"></span>');
                        // }
                        itemList.push('</p>');
                        //状态
                        itemList.push('<p><span>状态：</span>');
                        switch (n.checkStatus) {
                            case 0:
                                itemList.push('<span class="state">草稿</span> <a href="javascript:;" class="btn btn-xs btn-salad-c btn-songshen">送审</a> <a href="javascript:;" class="btn btn-xs btn-salad-c btn-delete">删除</a>');
                                break;
                            case 1:
                                itemList.push('<span class="state">待审核</span> <a href="javascript:;" class="btn btn-xs btn-salad-c btn-checkBack">撤回</a>');
                                break;
                            case 2:
                                itemList.push('<span class="state">已审核</span>');
                                break;
                            case 3:
                                itemList.push('<span class="state">已拒绝</span>');
                                break;
                            case 4:
                                itemList.push('<span class="state">已测试</span>');
                                break;
                        }
                        // itemList.push(' <span class="btn btn-xs btn-salad-d btn-copy"> 复制</span>');
                        itemList.push('<span class="pull-right">' + (new Date(n.createTime).Format('yyyy-MM-dd')) + '</span>');
                        itemList.push('</p>');
                        itemList.push('</div>');
                        itemList.push('</div>');
                        itemList.push('</li>');
                    });
                    itemList.push('</ul>');
                } else {
                    itemList.push('<div style="text-align: center;margin: 30px 0;font-size: 14px;">没有找到您要的数据!</div>');
                }
                $('#pic-list').append(itemList.join(''));
                //加载图标
                $("img").each(function () {
                    var _this = this;
                    var newImg = new Image();
                    newImg.src = $(this).attr("data-src");
                    $(newImg).load(function () {
                        _this.src = this.src;
                    });
                });

                //点击图片进入编辑或者详情页面
                $('.img-responsive').on('click', function () {
                    editOrDetail($(this).parent().attr('data-mediaId'), $(this).parent().attr('data-checkStatus'));
                });

                //点击送审进行送审
                $('.btn-songshen').on('click', function () {
                    $(this).next().addClass('hidden');
                    songShen($(this).parents('.con-div').prev().attr('data-mediaId'));
                });

                //删除功能
                $('.btn-delete').on('click', function () {
                    $(this).prev().addClass('hidden');
                    deleteMedia($(this).parents('.con-div').prev().attr('data-mediaId'));
                });

                //撤回功能
                $('.btn-checkBack').on('click', function () {

                    //alert($(this).parents('.con-div').prev().attr('data-mediaId'));
                    checkBack($(this).parents('.con-div').prev().attr('data-mediaId'));
                });
                // //复制功能
                // $('.btn-copy').on('click', function () {
                //     let that = this;
                //     $alert.confirm('<div class="form-group"><label for="number">请输入复制的个数</label><input type="number" id="number" class="form-control" value="1" name="number"></div> ', function () {
                //         let number = $('input[name="number"]').val();
                //         if (number > 50 || number <= 0) {
                //             $alert.alert('复制数量必须在1到50之间');
                //         }else {
                //             copyMedia($(that).parents('.con-div').prev().attr('data-mediaId'), number);
                //         }
                //     });
                // });
            }
        }
    });

    /**
     * 编辑相应的素材，传递素材id到后台
     * @param albumId
     */
    var editOrDetail = function (albumId, checkStatus) {
        if (checkStatus == 0) {
            $alert.window(false, 'edit.html?albumId=' + albumId);
        } else {
            $alert.window(false, 'get.html?albumId=' + albumId);
        }
    };

    /**
     * 送审，传递素材id到后台
     * @param albumId
     */
    var songShen = function (albumId) {
        $alert.confirm('确认送审选中的素材吗？', function () {
            $api.post('songshen.html', {albumId: albumId}, function (data) {
                if (data.success) {
                    $alert.msg(data.msg);
                    setTimeout(function () {
                        window.location.href = 'index.html';
                    }, 3000);

                } else {
                    $('.btn-delete').removeClass('hidden');
                    $alert.msg(data.msg);
                }
            });
        }, function () {
            $('.btn-delete').removeClass('hidden');
        });

    };

    /**
     * 删除素材
     * @param id
     */
    var deleteMedia = function (id) {
        let ids = [];
        ids.push(id);
        $alert.confirm('确认要删除选中的数据吗？', function () {
            $api.post('remove.html', ids, function (data) {
                if (data.success) {
                    $alert.msg(data.msg);
                    setTimeout(function () {
                        window.location.href = 'index.html';
                    }, 1000);
                } else {
                    $('.btn-songshen').removeClass('hidden');
                }
            });
        }, function () {
            $('.btn-songshen').removeClass('hidden');
        });
    };

    /**
     * 素材撤回功能
     * @param id
     */
    var checkBack = function (id) {
        let ids = [];
        ids.push(id);
        $api.post('checkBack.html', ids, function (data) {
            if (data.success) {
                $alert.msg(data.msg);
                setTimeout(function () {
                    window.location.href = 'index.html';
                }, 1000);
            } else {
                $('.btn-songshen').removeClass('hidden');
            }
        });
    };

    /**
     * 复制素材
     *
     * @param id
     */
    // var copyMedia = function (id, number) {
    //     let ids = [];
    //     ids.push(id);
    //     $api.get('copy.html?mediaIds=' + ids[0] + '&number=' + number, function (data) {
    //         if (data.success) {
    //             $alert.msg(data.msg);
    //             setTimeout(function () {
    //                 window.location.href = 'index.html';
    //             }, 1000);
    //         }
    //     }, 'json');
    // };
});

var callback = function () {
    $('#btnRefresh').click();
};