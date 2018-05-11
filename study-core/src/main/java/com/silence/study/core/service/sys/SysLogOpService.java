package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysLogOpEntity;
import com.silence.study.core.mapper.sys.SysLogOpMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>系统操作日志 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-18 23:12:48<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysLogOpService")
public class SysLogOpService extends BaseService<SysLogOpEntity> {
	
	private final static Logger log= Logger.getLogger(SysLogOpService.class);

	@Autowired
    private SysLogOpMapper mapper;

		
	public SysLogOpMapper getMapper() {
		return mapper;
	}

}
