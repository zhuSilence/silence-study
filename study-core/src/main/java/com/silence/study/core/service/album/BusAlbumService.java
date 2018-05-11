package com.silence.study.core.service.album;

import com.origin.eurybia.base.BaseService;
import com.silence.study.core.entity.album.BusAlbumEntity;
import com.silence.study.core.mapper.album.BusAlbumMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>公司相册表 Service<br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-12 00:46:01<br>
 * <b>详细说明：</b>无<br>
 */
@Service("busAlbumService")
public class BusAlbumService extends BaseService<BusAlbumEntity> {

    private final static Logger log = Logger.getLogger(BusAlbumService.class);

    @Autowired
    private BusAlbumMapper mapper;


    public BusAlbumMapper getMapper() {
        return mapper;
    }

}
