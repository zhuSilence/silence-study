package com.silence.study.admin.controller.sys;

import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.utils.ResultMsg;
import com.silence.study.core.entity.sys.SysRoleEntity;
import com.silence.study.core.model.sys.SysRoleModel;
import com.silence.study.core.service.sys.SysRoleService;
import com.origin.eurybia.annotation.Auth;
import com.origin.eurybia.annotation.Config;
import com.origin.eurybia.bean.AuthEnum;
import com.origin.eurybia.jdbc.plugin.Pager;
import com.origin.eurybia.jdbc.query.Query;
import com.origin.eurybia.jdbc.query.SortOperator;
import com.origin.eurybia.jdbc.query.WhereOperator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>系统用户角色管理<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-21 10:16:39<br>
 * <b>详细说明：</b><br>
 */
@Controller
@Config(menuElId = "sysRole")
@RequestMapping(value = "sysRole")
public class SysRoleController extends BaseController {

    @Autowired(required = false)
    private SysRoleService sysRoleService;

    /**
     * 系统用户角色视图
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/index")
    public ModelAndView indexView() throws Exception {

        Map<String, Object> map = new HashMap<>();

        return RenderView("sysRole/sysRoleView", map);
    }

    /**
     * 获取单条记录
     * @param model
     * @return
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/data", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg dataOne(@RequestBody SysRoleModel model) {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysRoleEntity.class, model);
        query.addWhereOperator(whereOperator);
        SysRoleEntity sysRoleEntity = sysRoleService.queryOne(query);
        return new ResultMsg(true, sysRoleEntity, "");
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
    public List<SysRoleEntity> dataList(SysRoleModel model) throws Exception {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysRoleEntity.class, model);
        query.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysRoleEntity.class,model);
        query.addSortOperator(sortOperator);

        return sysRoleService.queryList(query);
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
    public Map<String, Object> dataPageList(@RequestBody SysRoleModel model) throws Exception {

        Pager<SysRoleEntity> pager = new Pager<>();
        pager.setPageId(model.getPage());
        pager.setPageSize(model.getRows());

        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysRoleEntity.class, model);
        pager.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysRoleEntity.class,model);
        pager.addSortOperator(sortOperator);

        sysRoleService.queryPage(pager);

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

        return RenderView("sysRole/sysRoleDetail", map);
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

        return RenderView("sysRole/sysRoleAdd", map);
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

        return RenderView("sysRole/sysRoleEdit", map);
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
    public ResultMsg save(@RequestBody SysRoleEntity entity) throws Exception {

        if (entity.getRoleId() == null) {
            sysRoleService.save(entity);
        } else {
            sysRoleService.updateSelective(entity);
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

        sysRoleService.deleteBatch(ids);
        return new ResultMsg(true);
    }
}
