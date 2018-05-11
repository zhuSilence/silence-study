package com.silence.study.core.service.album;

import com.origin.eurybia.base.BaseService;
import com.silence.study.core.entity.album.BusAlbumDetailEntity;
import com.silence.study.core.mapper.album.BusAlbumDetailMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>公司相册详情表 Service<br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-12 00:55:52<br>
 * <b>详细说明：</b>无<br>
 */
@Service("busAlbumDetailService")
public class BusAlbumDetailService extends BaseService<BusAlbumDetailEntity> {

    private final static Logger log = Logger.getLogger(BusAlbumDetailService.class);

    @Autowired
    private BusAlbumDetailMapper mapper;


    public BusAlbumDetailMapper getMapper() {
        return mapper;
    }

}
