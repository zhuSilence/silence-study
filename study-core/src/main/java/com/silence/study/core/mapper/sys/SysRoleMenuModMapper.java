package com.silence.study.core.mapper.sys;

import com.silence.study.core.entity.sys.SysRoleMenuModEntity;
import com.origin.eurybia.base.BaseMapper;

import java.util.Map;

/**
 * <br>
 * <b>功能：</b>角色菜单权限 Mapper<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-21 21:54:25<br>
 * <b>详细说明：</b>无<br>
 */
public interface SysRoleMenuModMapper extends BaseMapper<SysRoleMenuModEntity> {

    /**
     * 根据菜单编号和角色得到权限
     * @param paramMap {menuElId:,roleIds:[]}
     * @return
     */
	public Integer getModByMenuId(Map<String, Object> paramMap);
}
