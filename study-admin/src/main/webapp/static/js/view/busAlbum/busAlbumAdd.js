/**
 * Created by siber.xu on 2015/11/8.
 */
var BusAlbumAdd = jClass.extend({
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
    },
    urls: {
        view: 'index.html',
        save: 'save.html'
    },
    save: function (callback) {
        var form = $('#form');
        if (form.isValid()) {
            if (albumVue.imgList.length <= 0) {
                $alert.alert('未上传图片');
                return false;
            }
            var param = albumVue.$data;
            console.log(param);
            // delete param.imgList;
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
});

var albumVue;
$(function () {

    albumVue = new Vue({
        el: '#form',
        data: {
            albumName: '',
            companyId: 0,
            companyName: '',
            albumDesc: '',
            imgList: [],
            accept: 'image/gif, image/jpeg, image/png, image/jpg',
            size: 0
        },
        methods: {
            //设置
            limitClick(state) {
                this.imgList = [];
                if (state)
                    this.limit = 2;
                else
                    this.limit = undefined;
            },
            fileClick() {
                document.getElementById('upload_file').click()
            },
            fileChange(el) {
                if (!el.target.files[0].size) return;
                this.fileList(el.target);
                el.target.value = ''
            },
            fileList(fileList) {
                let files = fileList.files;
                for (let i = 0; i < files.length; i++) {
                    //判断是否为文件夹
                    if (files[i].type != '') {
                        this.fileAdd(files[i]);
                    } else {
                        //文件夹处理
                        this.folders(fileList.items[i]);
                    }
                }
            },
            //文件夹处理
            folders(files) {
                let _this = this;
                //判断是否为原生file
                if (files.kind) {
                    files = files.webkitGetAsEntry();
                }
                files.createReader().readEntries(function (file) {
                    for (let i = 0; i < file.length; i++) {
                        if (file[i].isFile) {
                            _this.foldersAdd(file[i]);
                        } else {
                            _this.folders(file[i]);
                        }
                    }
                })
            },
            foldersAdd(entry) {
                let _this = this;
                entry.file(function (file) {
                    _this.fileAdd(file)
                })
            },
            fileAdd(file) {
                if (this.limit !== undefined) this.limit--;
                if (this.limit !== undefined && this.limit < 0) return;
                //判断是否为图片文件
                if (this.accept.indexOf(file.type) === -1) {
                    $alert.alert('图片格式不正确！');
                    return false;
                } else {
                    //总大小
                    this.size = this.size + file.size;
                    let reader = new FileReader();
                    let image = new Image();
                    let _this = this;
                    reader.readAsDataURL(file);
                    reader.onload = function () {
                        file.src = this.result;
                        image.onload = function () {
                            let width = image.width;
                            let height = image.height;
                            file.width = width;
                            file.height = height;
                            _this.imgList.push({
                                file
                            });
                            console.log(_this.imgList);
                        };
                        image.src = file.src;
                    }
                }
            },
            fileDel(index) {
                this.size = this.size - this.imgList[index].file.size;//总大小
                this.imgList.splice(index, 1);
                if (this.limit !== undefined) this.limit = this.imgList.length;
            },
            bytesToSize(bytes) {
                if (bytes === 0) return '0 B';
                let k = 1000, // or 1024
                    sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
                    i = Math.floor(Math.log(bytes) / Math.log(k));
                return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
            },
            dragenter(el) {
                el.stopPropagation();
                el.preventDefault();
            },
            dragover(el) {
                el.stopPropagation();
                el.preventDefault();
            },
            drop(el) {
                el.stopPropagation();
                el.preventDefault();
                this.fileList(el.dataTransfer);
            },
            pickCompany: function () {
                $alert.window("相关公司选择器", $basePath + '/busCompany/select.html');
            }
        },
    });
    new BusAlbumAdd();


    console.log(albumObj)
    if (albumObj != null) {
        $.extend(albumVue.$data, albumObj);
        //公司名称
        albumVue.companyName = albumObj.busCompanyEntity.companyName;
        //不能更改公司
        $('#pickCompany').hide();

        if (albumObj.mediaDetailList != null && albumObj.mediaDetailList.length > 0) {
            $.each(albumObj.mediaDetailList, function (index, obj) {
                getImgToBase64(obj.pictureUrl, function (data) {
                    let file = dataURLtoFile(data, obj.pictureUrl.substring(obj.pictureUrl.lastIndexOf('/') + 1, obj.pictureUrl.length));
                    albumVue.fileAdd(file);
                });
            });
        }
    }

});

//设置订单信息
var setData = function (data) {
    if (data) {
        albumVue.companyId = data.companyId;
        albumVue.companyName = data.companyName;
    }
};


/**
 * 将base64转换为文件
 * @param dataurl
 * @param filename
 * @returns {File}
 */
function dataURLtoFile(dataurl, filename) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new File([u8arr], filename, {type: mime});
}

/**
 * 将图片转换为Base64，需要配置支持跨域请求
 * @param url
 * @param callback
 */
function getImgToBase64(url, callback) {
    var canvas = document.createElement('canvas'),
        ctx = canvas.getContext('2d'),
        img = new Image;
    img.crossOrigin = 'Anonymous';
    img.onload = function () {
        canvas.height = img.height;
        canvas.width = img.width;
        ctx.drawImage(img, 0, 0);
        var dataURL = canvas.toDataURL('image/png');
        callback(dataURL);
        canvas = null;
    };
    img.src = url;
}

