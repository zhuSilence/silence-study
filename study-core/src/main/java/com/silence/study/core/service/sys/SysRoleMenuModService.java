package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysRoleMenuModEntity;
import com.silence.study.core.mapper.sys.SysRoleMenuModMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>角色菜单权限 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-21 21:54:25<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysRoleMenuModService")
public class SysRoleMenuModService extends BaseService<SysRoleMenuModEntity> {
	
	private final static Logger log= Logger.getLogger(SysRoleMenuModService.class);

	@Autowired
    private SysRoleMenuModMapper mapper;

	@Override
	public Integer saveBatch(List<SysRoleMenuModEntity> entitys) throws Exception {
		if (entitys.size() > 0 && entitys.get(0).getMenuId()!=null) {
			Integer roleId = entitys.get(0).getRoleId();
			delete(roleId);
			return super.saveBatch(entitys);
		}else {//当取消所有选中的权限时
			Integer roleId = entitys.get(0).getRoleId();
			delete(roleId);
			return null;
		}

	}

	/**
	 * 根据菜单角色获取权限
	 * @param menuElId
	 * @param roleIds
	 * @return
	 */
	public Integer getModByMenuIdRoles(String menuElId, List<Integer> roleIds) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menuElId", menuElId);
		paramMap.put("roleIds", roleIds);
		return mapper.getModByMenuId(paramMap);
	}

	public SysRoleMenuModMapper getMapper() {
		return mapper;
	}

}
