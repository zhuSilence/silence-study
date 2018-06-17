package com.silence.study.admin.service;

import com.alibaba.fastjson.JSONObject;
import com.origin.eurybia.jdbc.query.Query;
import com.origin.eurybia.jdbc.query.WhereOperator;
import com.origin.eurybia.utils.DateUtils;
import com.origin.eurybia.utils.JsonUtils;
import com.origin.eurybia.utils.RandomUtils;
import com.silence.study.admin.model.AlbumDetailModel;
import com.silence.study.admin.utils.Base64Util;
import com.silence.study.admin.utils.Constant;
import com.silence.study.core.entity.album.BusAlbumDetailEntity;
import com.silence.study.core.entity.album.BusAlbumEntity;
import com.silence.study.core.model.album.BusAlbumModel;
import com.silence.study.core.service.album.BusAlbumDetailService;
import com.silence.study.core.service.album.BusAlbumService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <br>
 * <b>功能：</b><br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-28 22:53<br>
 * <b>详细说明：</b>无<br>
 */
@Service
public class AlbumService {

    @Autowired
    private BusAlbumService albumService;

    @Autowired
    private BusAlbumDetailService albumDetailService;

    /**
     * 保存影集和相册子表
     *
     * @param model
     * @throws Exception
     */
    public void saveAlbum(BusAlbumModel model) throws Exception {

        //保存主表
        BusAlbumEntity entity = new BusAlbumEntity();
        BeanUtils.copyProperties(model, entity);
        //新增
        if (null == model.getAlbumId()) {
            entity = albumService.save(entity);
        }else {
            //更新
            albumService.updateSelective(entity);
            //清空子表
            albumDetailService.deleteBatch("albumId", entity.getAlbumId());
        }
        Integer albumId = entity.getAlbumId();
        //保存子表
        final String[] icon = {""};
        List<BusAlbumDetailEntity> detailList = new ArrayList<>();
        if (model.getImgList() != null && model.getImgList().size() > 0) {
            model.getImgList().forEach(detail -> {
                BusAlbumDetailEntity detailEntity = new BusAlbumDetailEntity();
                detailEntity.setAlbumId(albumId);
                AlbumDetailModel albumDetailModel = getModel(detail);
                String filePath = DateUtils.formatDate(DateUtils.getCurDate(), DateUtils.DFyyyyMMdd) + "/" + DateUtils.getTimeMillis() + ".jpg";
                String temp = Constant.UPLOAD_PATH + filePath;
                String tempUrl = Constant.UPLOAD_URL + filePath;
                if (albumDetailModel.getSrc() != null && albumDetailModel.getSrc().split(",").length > 0) {
                    if (Base64Util.GenerateImage(albumDetailModel.getSrc().split(",")[1], temp)) {
                        detailEntity.setPictureUrl(tempUrl);
                        icon[0] = tempUrl;
                    }
                }
                detailEntity.setCreateTime(DateUtils.getCurDate());
                detailList.add(detailEntity);
            });
        }
        entity.setIcon(icon[0]);
        albumService.updateSelective(entity);
        if (detailList.size() > 0) {
            albumDetailService.saveBatch(detailList);
        }
    }


    /**
     * 删除素材，以及素材列表
     *
     * @param ids
     */
    public void deleteBatch(Integer[] ids) {
        Query query = new Query();
        WhereOperator whereOperator = new WhereOperator(BusAlbumDetailEntity.class);
        whereOperator.and("albumId").in(ids);
        query.addWhereOperator(whereOperator);
        albumDetailService.deleteBatch(query);
        albumService.deleteBatch(ids);
    }


    /**
     * 讲获取model
     *
     * @param object
     * @return
     */
    public AlbumDetailModel getModel(Object object) {
        JSONObject jsonObject = (JSONObject) object;
        JSONObject file = (JSONObject) jsonObject.get("file");
        return JsonUtils.json2Object(file.toJSONString(), AlbumDetailModel.class);
    }
}
