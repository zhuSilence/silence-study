package com.silence.study.admin.controller.sys;

import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.utils.ResultMsg;
import com.silence.study.core.entity.sys.SysLogOpEntity;
import com.silence.study.core.model.sys.SysLogOpModel;
import com.silence.study.core.service.sys.SysLogOpService;
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
 * <b>功能：</b>系统操作日志管理<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-18 23:12:48<br>
 * <b>详细说明：</b><br>
 */
@Controller
@Config(menuElId = "sysLogOp")
@RequestMapping(value = "sysLogOp")
public class SysLogOpController extends BaseController {

    @Autowired(required = false)
    private SysLogOpService sysLogOpService;

    /**
     * 系统操作日志视图
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/index")
    public ModelAndView indexView() throws Exception {

        Map<String, Object> map = new HashMap<>();

        return RenderView("sysLogOp/sysLogOpView", map);
    }

    /**
     * 获取单条记录
     * @param model
     * @return
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/data", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg dataOne(@RequestBody SysLogOpModel model) {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysLogOpEntity.class, model);
        query.addWhereOperator(whereOperator);
        SysLogOpEntity sysLogOpEntity = sysLogOpService.queryOne(query);
        return new ResultMsg(true, sysLogOpEntity, "");
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
    public List<SysLogOpEntity> dataList(SysLogOpModel model) throws Exception {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysLogOpEntity.class, model);
        query.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysLogOpEntity.class,model);
        query.addSortOperator(sortOperator);

        return sysLogOpService.queryList(query);
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
    public Map<String, Object> dataPageList(@RequestBody SysLogOpModel model) throws Exception {

        Pager<SysLogOpEntity> pager = new Pager<>();
        pager.setPageId(model.getPage());
        pager.setPageSize(model.getRows());

        //查询条件
        WhereOperator whereOperator = getQueryTerm(SysLogOpEntity.class, model);
        pager.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(SysLogOpEntity.class,model);
        pager.addSortOperator(sortOperator);

        sysLogOpService.queryPage(pager);

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

        return RenderView("sysLogOp/sysLogOpDetail", map);
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

        return RenderView("sysLogOp/sysLogOpAdd", map);
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

        return RenderView("sysLogOp/sysLogOpEdit", map);
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
    public ResultMsg save(@RequestBody SysLogOpEntity entity) throws Exception {

        if (entity.getId() == null) {
            sysLogOpService.save(entity);
        } else {
            sysLogOpService.updateSelective(entity);
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

        sysLogOpService.deleteBatch(ids);
        return new ResultMsg(true);
    }
}
