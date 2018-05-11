package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysMenuEntity;
import com.silence.study.core.mapper.sys.SysMenuMapper;
import com.origin.eurybia.base.BaseService;
import com.origin.eurybia.jdbc.plugin.Pager;
import com.origin.eurybia.jdbc.query.WhereOperator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <br>
 * <b>功能：</b>系统菜单 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2014-02-20 15:06:44<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysMenuService")
public class SysMenuService extends BaseService<SysMenuEntity> {

    private final static Logger log = LoggerFactory.getLogger(SysMenuService.class);

    @Autowired
    private SysMenuMapper mapper;
    @Autowired
    private SysRoleMenuModService sysRoleMenuModService;

    /**
     * 获取指定角色列表对应的菜单聚合,已去重
     *
     * @param roleIds
     * @return
     */
    public List<SysMenuEntity> getMenusByRole(List<Integer> roleIds) {

        return mapper.getMenusByRole(roleIds);
    }

    @Override
    public Integer deleteBatch(Object... ids) {
        //同时删除角色对应的菜单
        for (Object id : ids) {
            sysRoleMenuModService.deleteBatch("menuId", id);
        }
        return super.deleteBatch(ids);
    }

    public void TestMapper() {
        for (int i = 0; i < 7; i++) {
            WhereOperator whereOperator = WhereOperator.where(SysMenuEntity.class, "seq").eq(i);

            Pager<SysMenuEntity> pager = new Pager<SysMenuEntity>();
            pager.addWhereOperator(whereOperator);

            this.queryPage(pager);

            System.out.println("--->" + pager.getResults().size());
            System.out.println("--->" + pager.getRowCount());
        }
    }

    public SysMenuMapper getMapper() {
        return mapper;
    }

}
