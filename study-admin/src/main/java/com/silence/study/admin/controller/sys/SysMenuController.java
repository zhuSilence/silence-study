package com.silence.study.admin.controller.sys;

import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.utils.ResultMsg;
import com.silence.study.core.entity.sys.SysMenuEntity;
import com.silence.study.core.entity.sys.SysRunEntity;
import com.silence.study.core.model.sys.SysMenuModel;
import com.silence.study.core.service.sys.SysMenuService;
import com.silence.study.core.service.sys.SysRunService;
import com.origin.eurybia.annotation.Auth;
import com.origin.eurybia.annotation.Config;
import com.origin.eurybia.bean.AuthEnum;
import com.origin.eurybia.jdbc.plugin.Pager;
import com.origin.eurybia.jdbc.query.Query;
import com.origin.eurybia.jdbc.query.QueryEnums;
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
 * <b>功能：</b>系统菜单管理<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-18 22:27:00<br>
 * <b>详细说明：</b><br>
 */
@Controller
@RequestMapping(value = "sysMenu")
@Config(menuElId = "sysMenu")// 菜单ID
public class SysMenuController extends BaseController {

    @Autowired(required = false)
    private SysMenuService sysMenuService;
    @Autowired(required = false)
    private SysRunService sysRunService;

    /**
     * 系统菜单视图
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/index")
    public ModelAndView indexView() throws Exception {

        Map<String, Object> map = new HashMap<>();

        return RenderView("sysMenu/sysMenuView", map);
    }

    /**
     * 获取单条记录
     * @param model
     * @return
     */
    @RequestMapping(value = "/data", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg dataOne(@RequestBody SysMenuModel model) {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysMenuEntity.class, model);
        query.addWhereOperator(whereOperator);
        SysMenuEntity sysMenuEntity = sysMenuService.queryOne(query);
        return new ResultMsg(true, sysMenuEntity, "");
    }

    /**
     * 普通查询不分页
     *
     * @param model
     * @return
     * @throws Exception
     */
    //@Auth(verifyAuthority=true,authorityType=AuthorityEnum.BROWSER)
    @RequestMapping(value = "/dataList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public List<SysMenuEntity> dataList(SysMenuModel model) throws Exception {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysMenuEntity.class, model);
        query.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysMenuEntity.class,model);
        query.addSortOperator(sortOperator);

        return sysMenuService.queryList(query);
    }

    /**
     * 普通查询分页
     *
     * @param model
     * @return
     * @throws Exception
     */
    //@Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "pageList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> dataPageList(@RequestBody SysMenuModel model) throws Exception {

        Pager<SysMenuEntity> pager = new Pager<>();
        pager.setPageId(model.getPage());
        pager.setPageSize(model.getRows());

        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysMenuEntity.class, model);
        pager.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysMenuEntity.class,model);
        pager.addSortOperator(sortOperator);

        sysMenuService.queryPage(pager);

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
    @RequestMapping(value = "/detail")
    public ModelAndView detailView(@RequestParam Integer id) throws Exception {

        Map<String, Object> map = new HashMap<>();
        map.put("id", id);

        return RenderView("sysMenu/sysMenuDetail", map);
    }


    /**
     * 增加记录
     *
     * @return
     * @throws Exception
     */
    //@Auth(verifyAuthority = true, authorityType=AuthorityEnum.ADD)
    @RequestMapping("/add")
    public ModelAndView add() throws Exception {

        Map<String, Object> map = new HashMap<>();
        List<SysRunEntity> sysRunList = sysRunService.queryList("seq", QueryEnums.Sort.DESC);
        List<SysMenuEntity> menuList = sysMenuService.queryList("pmid", 0);
        map.put("sysRunList", sysRunList);
        map.put("menuList", menuList);

        return RenderView("sysMenu/sysMenuAdd", map);
    }

    /**
     * 修改记录
     *
     * @param id
     * @return
     * @throws Exception
     */
    //@Auth(verifyAuthority = true, authorityType = AuthorityEnum.EDIT)
    @RequestMapping("/edit")
    public ModelAndView edit(@RequestParam Integer id) throws Exception {

        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        List<SysRunEntity> sysRunList = sysRunService.queryList("seq", QueryEnums.Sort.DESC);
        map.put("sysRunList", sysRunList);

        return RenderView("sysMenu/sysMenuEdit", map);
    }

    /**
     * 新增、编辑保存
     *
     * @param entity
     * @return
     * @throws Exception
     */
    //@Auth(verifyAuthority = true, authorityType = AuthorityEnum.SAVE)
    @RequestMapping(value = "save", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg save(@RequestBody SysMenuEntity entity) throws Exception {

        if (entity.getMenuId() == null) {
            entity.setTabId("");
            entity.setTabTitle(entity.getTabTitle());
            entity.setTabIcon(entity.getIconClass());
            sysMenuService.save(entity);
        } else {
            entity.setTabTitle(entity.getTabTitle());
            entity.setTabIcon(entity.getIconClass());
            sysMenuService.updateSelective(entity);
        }
        return new ResultMsg(true, "数据保存成功");

    }

    /**
     * 删除记录
     *
     * @param ids
     * @return
     */
    //@Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.DEL)
    @RequestMapping(value = "remove", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg remove(@RequestBody Integer[] ids) {

        sysMenuService.deleteBatch(ids);
        return new ResultMsg(true);
    }
}
