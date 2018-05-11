package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysUserRoleEntity;
import com.silence.study.core.mapper.sys.SysUserRoleMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>用户角色关系表 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-19 23:27:11<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysUserRoleService")
public class SysUserRoleService extends BaseService<SysUserRoleEntity> {
	
	private final static Logger log= Logger.getLogger(SysUserRoleService.class);

	@Autowired
    private SysUserRoleMapper mapper;

		
	public SysUserRoleMapper getMapper() {
		return mapper;
	}

}
