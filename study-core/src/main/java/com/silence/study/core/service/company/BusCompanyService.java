package com.silence.study.core.service.company;

import com.origin.eurybia.base.BaseService;
import com.silence.study.core.entity.company.BusCompanyEntity;
import com.silence.study.core.mapper.company.BusCompanyMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>公司信息表 Service<br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-12 00:32:22<br>
 * <b>详细说明：</b>无<br>
 */
@Service("busCompanyService")
public class BusCompanyService extends BaseService<BusCompanyEntity> {

    private final static Logger log = Logger.getLogger(BusCompanyService.class);

    @Autowired
    private BusCompanyMapper mapper;


    public BusCompanyMapper getMapper() {
        return mapper;
    }

}
