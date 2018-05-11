package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysRunEntity;
import com.silence.study.core.mapper.sys.SysRunMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>菜单功能表 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-21 14:13:05<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysRunService")
public class SysRunService extends BaseService<SysRunEntity> {
	
	private final static Logger log= Logger.getLogger(SysRunService.class);

	@Autowired
    private SysRunMapper mapper;

		
	public SysRunMapper getMapper() {
		return mapper;
	}

}
