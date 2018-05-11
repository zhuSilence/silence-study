package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysRoleEntity;
import com.silence.study.core.mapper.sys.SysRoleMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <br>
 * <b>功能：</b>系统用户角色 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-21 10:16:39<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysRoleService")
public class SysRoleService extends BaseService<SysRoleEntity> {
	
	private final static Logger log= Logger.getLogger(SysRoleService.class);

	@Autowired
    private SysRoleMapper mapper;

	@Autowired
	private SysRoleMenuModService sysRoleMenuModService;

	@Override
	public Integer deleteBatch(Object... ids) {

		sysRoleMenuModService.deleteBatch(ids);

		return super.deleteBatch(ids);
	}

	public SysRoleMapper getMapper() {
		return mapper;
	}

}
