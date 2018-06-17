<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>公司相册表-新增</title>
    <#include "../header.ftl"/>
    <style>
        .upload_warp_img_div_del {
            position: absolute;
            top: 6px;
            width: 16px;
            right: 4px;
        }

        .upload_warp_img_div_top {
            position: absolute;
            top: 0;
            width: 100%;
            height: 30px;
            background-color: rgba(0, 0, 0, 0.4);
            line-height: 30px;
            text-align: left;
            color: #fff;
            font-size: 12px;
            text-indent: 4px;
        }

        .upload_warp_img_div_text {
            white-space: nowrap;
            width: 80%;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .upload_warp_img_div img {
            max-width: 100%;
            max-height: 100%;
            vertical-align: middle;
        }

        .upload_warp_img_div {
            position: relative;
            height: 100px;
            width: 158px;
            border: 1px solid #ccc;
            margin: 0px 30px 10px 0px;
            float: left;
            line-height: 100px;
            display: table-cell;
            text-align: center;
            background-color: #eee;
            cursor: pointer;
        }

        .upload_warp_img {
            border-top: 1px solid #D2D2D2;
            padding: 14px 0 0 14px;
            overflow: hidden
        }

        .upload_warp_text {
            text-align: left;
            margin-bottom: 10px;
            padding-top: 10px;
            text-indent: 14px;
            border-top: 1px solid #ccc;
            font-size: 14px;
        }

        .upload_warp_right {
            float: left;
            width: 57%;
            margin-left: 2%;
            height: 100%;
            border: 1px dashed #999;
            border-radius: 4px;
            line-height: 130px;
            color: #999;
        }

        .upload_warp_left img {
            margin-top: 32px;
        }

        .upload_warp_left {
            float: left;
            width: 40%;
            height: 100%;
            border: 1px dashed #999;
            border-radius: 4px;
            cursor: pointer;
        }

        .upload_warp {
            margin: 14px;
            height: 130px;
            text-align: center;
        }

        .upload {
            border: 1px solid #ccc;
            background-color: #fff;
            width: 650px;
            box-shadow: 0px 1px 0px #ccc;
            border-radius: 4px;
            margin-left: 15px;
        }

    </style>
</head>
<body style="background: #f2f2f2">
<#--<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [公司相册表] 增加公司相册表！
</div>-->
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i
                class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal" enctype="multipart/form-data">
            <div class="form-group"><label class="col-sm-2 control-label">相册名称</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" v-model.trim="albumName" data-validation=" required length"
                           data-validation-length="max50">
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">相关公司</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" v-model="companyName" data-validation="required  length" data-validation-length="max45" placeholder="请选择相关公司" readonly="readonly" style="width: 300px;display: inline-block">
                    <input type="hidden" v-model="companyId" v-model.trim="companyId">
                    <button id="pickCompany" @click="pickCompany()" type="button" class="btn btn-primary">选择</button>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">上传图片</label>
            <#--<button @click="limitClick(1)">点击设置上传数量：2</button>-->
            <#--<button @click="limitClick(0)">点击取消上传数量</button>-->
            <#--<div class="hello">-->
                <div class="upload col-sm-8">

                    <div class="upload_warp">
                        <div class="upload_warp_left" @click="fileClick">
                            <img src="${urls.StaticPath}/static/images/upload_icon.png">
                        </div>
                        <div class="upload_warp_right" @drop="drop($event)" @dragenter="dragenter($event)"
                             @dragover="dragover($event)">
                            或者将文件拖到此处
                        </div>
                    </div>
                    <div class="upload_warp_text">
                        选中{{imgList.length}}张文件，共{{bytesToSize(this.size)}}
                    </div>
                    <input @change="fileChange($event)" type="file" id="upload_file" multiple style="display: none"/>
                    <div class="upload_warp_img" v-show="imgList.length != 0">
                        <div class="upload_warp_img_div" v-for="(item,index) of imgList">
                            <div class="upload_warp_img_div_top">
                                <div class="upload_warp_img_div_text">
                                    {{item.file.name}}
                                </div>
                                <img src="${urls.StaticPath}/static/images/del_icon.png" class="upload_warp_img_div_del"
                                     @click="fileDel(index)">
                            </div>
                            <img :src="item.file.src">
                        </div>
                    </div>
                </div>
            <#--</div>-->
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">相册描述</label>
                <div class="col-sm-7">
                    <#--<input type="text" class="form-control" name="albumDesc" data-validation="  length"-->
                           <#--data-validation-length="max200">-->
                    <textarea class="form-control" style="height: 162px;" v-model.trim="albumDesc" data-validation="  length"
                              data-validation-length="max200"></textarea>
                </div>
            </div>

        </form>

        <div class="form-split"></div>
        <a id="btnBottomBack" class="btn btn-default" href="javascript:;" role="button"> <i
                class="glyphicon glyphicon-menu-left"></i> 返回 </a>
        <a id="btnSave" class="btn btn-primary" href="javascript:;" role="button"><i class="fa fa-save"></i> 保存 </a>
        <a id="btnReset" class="btn btn-default" href="javascript:;" role="button"><i class="fa fa-refresh"></i> 重置 </a>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script>
    var albumEntity = '${albumEntity!''}';
    if (albumEntity !== '') {
        var albumObj = JSON.parse(albumEntity);
    }
</script>
<script src="${urls.StaticPath}/static/js/view/busAlbum/busAlbumAdd.js"></script>
</html>