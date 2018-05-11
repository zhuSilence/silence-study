package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysLogLoginEntity;
import com.silence.study.core.mapper.sys.SysLogLoginMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>系统登录日志 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-18 23:02:32<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysLogLoginService")
public class SysLogLoginService extends BaseService<SysLogLoginEntity> {
	
	private final static Logger log= Logger.getLogger(SysLogLoginService.class);

	@Autowired
    private SysLogLoginMapper mapper;

	public List<SysLogLoginEntity> getLists(Map<String,Object> map){

		return mapper.getLists(map);
	}
		
	public SysLogLoginMapper getMapper() {
		return mapper;
	}

}
