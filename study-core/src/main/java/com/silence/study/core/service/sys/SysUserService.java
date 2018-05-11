package com.silence.study.core.service.sys;

import com.silence.study.core.entity.sys.SysUserEntity;
import com.silence.study.core.entity.sys.SysUserRoleEntity;
import com.silence.study.core.mapper.sys.SysUserMapper;
import com.origin.eurybia.base.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <br>
 * <b>功能：</b>用户管理 Service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-17 21:18:45<br>
 * <b>详细说明：</b>无<br>
 */
@Service("sysUserService")
public class SysUserService extends BaseService<SysUserEntity> {

    private final static Logger log = Logger.getLogger(SysUserService.class);

    @Autowired
    private SysUserMapper mapper;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    public SysUserMapper getMapper() {
        return mapper;
    }

    @Override
    public SysUserEntity save(SysUserEntity entity) throws Exception {
        super.save(entity);
        //保存角色信息
        if (entity.getUserRoleList() != null && entity.getUserRoleList().size() > 0) {
            List<SysUserRoleEntity> userRoleList = new ArrayList<SysUserRoleEntity>();
            for (Integer roleId : entity.getUserRoleList()) {
                SysUserRoleEntity userRoleEntity = new SysUserRoleEntity();
                userRoleEntity.setUserId(entity.getUserId());
                userRoleEntity.setRoleId(roleId);
                userRoleList.add(userRoleEntity);
            }
            sysUserRoleService.saveBatch(userRoleList);
        }
        return entity;
    }

    @Override
    public Integer deleteBatch(Object... ids) {
        for (Object id : ids) {
            SysUserRoleEntity userRoleEntity = new SysUserRoleEntity();
            userRoleEntity.setUserId((Integer) id);
            sysUserRoleService.deleteBatch(userRoleEntity);
        }
        return super.deleteBatch(ids);
    }

    public void updateUserInfoSelective(SysUserEntity entity) throws Exception {
        super.updateSelective(entity);
        //删除原用户角色信息
        sysUserRoleService.deleteBatch("userId",entity.getUserId());
        //保存角色信息
        if (entity.getUserRoleList() != null && entity.getUserRoleList().size() > 0) {
            List<SysUserRoleEntity> userRoleList = new ArrayList<SysUserRoleEntity>();
            for (Integer roleId : entity.getUserRoleList()) {
                SysUserRoleEntity userRoleEntity = new SysUserRoleEntity();
                userRoleEntity.setUserId(entity.getUserId());
                userRoleEntity.setRoleId(roleId);
                userRoleList.add(userRoleEntity);
            }
            sysUserRoleService.saveBatch(userRoleList);
        }
    }

}
