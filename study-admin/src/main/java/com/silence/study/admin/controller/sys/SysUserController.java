package com.silence.study.admin.controller.sys;

import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.utils.ResultMsg;
import com.silence.study.core.entity.sys.SysDeptEntity;
import com.silence.study.core.entity.sys.SysRoleEntity;
import com.silence.study.core.entity.sys.SysUserEntity;
import com.silence.study.core.model.sys.SysUserModel;
import com.silence.study.core.service.sys.SysDeptService;
import com.silence.study.core.service.sys.SysRoleService;
import com.silence.study.core.service.sys.SysUserService;
import com.origin.eurybia.annotation.Auth;
import com.origin.eurybia.annotation.Config;
import com.origin.eurybia.bean.AuthEnum;
import com.origin.eurybia.exception.OriginException;
import com.origin.eurybia.jdbc.plugin.Pager;
import com.origin.eurybia.jdbc.query.Query;
import com.origin.eurybia.jdbc.query.QueryEnums;
import com.origin.eurybia.jdbc.query.SortOperator;
import com.origin.eurybia.jdbc.query.WhereOperator;
import com.origin.eurybia.utils.DateUtils;
import com.origin.eurybia.utils.MD5Encode;
import com.origin.eurybia.utils.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>用户管理管理<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-17 21:18:45<br>
 * <b>详细说明：</b><br>
 */
@Controller
@Config(menuElId = "sysUser")
@RequestMapping(value = "sysUser")
public class SysUserController extends BaseController {

    @Autowired(required = false)
    private SysUserService sysUserService;
    @Autowired
    private SysDeptService sysDeptService;
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 用户管理视图
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/index")
    public ModelAndView indexView() throws Exception {

        Map<String, Object> map = new HashMap<>();

        return RenderView("sysUser/sysUserView", map);
    }

    /**
     * 获取单条记录
     *
     * @param model
     * @return
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/data", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg dataOne(@RequestBody SysUserModel model) {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysUserEntity.class, model);
        query.addWhereOperator(whereOperator);
        SysUserEntity sysUserEntity = sysUserService.queryOne(query);
        return new ResultMsg(true, sysUserEntity, "");
    }

    /**
     * 普通查询不分页
     *
     * @param model
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/dataList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public List<SysUserEntity> dataList(SysUserModel model) throws Exception {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysUserEntity.class, model);
        query.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysUserEntity.class, model);
        query.addSortOperator(sortOperator);

        return sysUserService.queryList(query);
    }

    /**
     * 普通查询分页
     *
     * @param model
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "pageList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> dataPageList(@RequestBody SysUserModel model) throws Exception {

        Pager<SysUserEntity> pager = new Pager<>();
        pager.setPageId(model.getPage());
        pager.setPageSize(model.getRows());

        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysUserEntity.class, model);
        pager.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysUserEntity.class, model);
        pager.addSortOperator(sortOperator);

        sysUserService.queryPage(pager);

        //设置页面数据
        Map<String, Object> jsonMap = new HashMap<>();
        jsonMap.put("total", pager.getRowCount());
        jsonMap.put("rows", pager.getResults());
        return jsonMap;
    }

    /**
     * 详情界面
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/detail")
    public ModelAndView detailView(@RequestParam Integer id) throws Exception {

        Map<String, Object> map = new HashMap<>();
        map.put("id", id);

        return RenderView("sysUser/sysUserDetail", map);
    }


    /**
     * 增加记录
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType= AuthEnum.AuthorityEnum.ADD)
    @RequestMapping("/add")
    public ModelAndView add() throws Exception {

        Map<String, Object> map = new HashMap<>();
        //可用部门列表
        List<SysDeptEntity> deptList = sysDeptService.queryList("disabled", 0);
        map.put("deptList", deptList);
        //角色列表
        List<SysRoleEntity> sysRoleList = sysRoleService.queryList("seq", QueryEnums.Sort.DESC);
        map.put("sysRoleList", sysRoleList);

        return RenderView("sysUser/sysUserAdd", map);
    }

    /**
     * 修改记录
     *
     * @param id
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.EDIT)
    @RequestMapping("/edit")
    public ModelAndView edit(@RequestParam Integer id) throws Exception {

        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        //可用部门列表
        List<SysDeptEntity> deptList = sysDeptService.queryList("disabled", 0);
        map.put("deptList", deptList);
        //角色列表
        List<SysRoleEntity> sysRoleList = sysRoleService.queryList("seq", QueryEnums.Sort.DESC);
        map.put("sysRoleList", sysRoleList);

        return RenderView("sysUser/sysUserEdit", map);
    }

    /**
     * 新增、编辑保存
     *
     * @param entity
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.SAVE)
    @RequestMapping(value = "save", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg save(@RequestBody SysUserEntity entity) throws Exception {

        if (entity.getUserId() == null) {
            int queryCount = sysUserService.queryCount("loginName", entity.getLoginName());
            if (queryCount > 0) {
                throw new OriginException("登录账号不能重复!");
            } else {
                String salt = RandomUtils.getNum(6);
                entity.setSalt(salt);
                entity.setLoginPwd(MD5Encode.getMD5Str(MD5Encode.getMD5Str(entity.getLoginPwd() + salt)));
                entity.setLoginCount(0);
                entity.setSuperUser(0);
                entity.setCreateDate(DateUtils.getCurDate());
                entity.setModifyDate(DateUtils.getCurDate());
                sysUserService.save(entity);
            }
        } else {
            SysUserEntity queryUserInfo = sysUserService.queryId(entity.getUserId());//通过getUserId()获得表中的该ID所对应的信息
            if(queryUserInfo.getLoginPwd().equals(entity.getLoginPwd()) || StringUtils.isBlank(entity.getLoginPwd())){
                entity.setLoginPwd(null);
            }else{
                entity.setLoginPwd(MD5Encode.getMD5Str(MD5Encode.getMD5Str(entity.getLoginPwd() + queryUserInfo.getSalt())));
            }
            entity.setModifyDate(DateUtils.getCurDate());
            sysUserService.updateUserInfoSelective(entity);
        }
        return new ResultMsg(true, "数据保存成功");

    }

    /**
     * 删除记录
     *
     * @param ids
     * @return
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.DEL)
    @RequestMapping(value = "remove", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg remove(@RequestBody Integer[] ids) {

        sysUserService.deleteBatch(ids);
        return new ResultMsg(true);
    }
}
