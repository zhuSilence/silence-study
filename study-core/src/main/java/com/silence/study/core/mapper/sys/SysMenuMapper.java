package com.silence.study.core.mapper.sys;

import com.silence.study.core.entity.sys.SysMenuEntity;
import com.origin.eurybia.base.BaseMapper;

import java.util.List;

/**
 * <br>
 * <b>功能：</b>系统菜单 Mapper<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2014-02-20 15:06:44<br>
 * <b>详细说明：</b>无<br>
 */
public interface SysMenuMapper extends BaseMapper<SysMenuEntity> {
	
	/**
	 * 获取指定角色列表对应的菜单聚合,已去重
	 * @param roleIds
	 * @return
	 */
	public List<SysMenuEntity> getMenusByRole(List<Integer> roleIds);
}
