package com.silence.study.core.mapper.sys;

import com.silence.study.core.entity.sys.SysLogLoginEntity;
import com.origin.eurybia.base.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>系统登录日志 Mapper<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-18 23:02:32<br>
 * <b>详细说明：</b>无<br>
 */
public interface SysLogLoginMapper extends BaseMapper<SysLogLoginEntity> {

	public List<SysLogLoginEntity> getLists(Map<String, Object> map);
}
