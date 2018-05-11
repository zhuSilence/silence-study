package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysDeptEntity;
import com.silence.study.core.mapper.sys.SysDeptMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>部门管理 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-17 20:59:19<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysDeptService")
public class SysDeptService extends BaseService<SysDeptEntity> {
	
	private final static Logger log= Logger.getLogger(SysDeptService.class);

	@Autowired
    private SysDeptMapper mapper;

		
	public SysDeptMapper getMapper() {
		return mapper;
	}

}
