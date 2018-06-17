package com.silence.study.admin.controller.company;

import com.origin.eurybia.annotation.Auth;
import com.origin.eurybia.annotation.Config;
import com.origin.eurybia.bean.AuthEnum;
import com.origin.eurybia.jdbc.plugin.Pager;
import com.origin.eurybia.jdbc.query.Query;
import com.origin.eurybia.jdbc.query.SortOperator;
import com.origin.eurybia.jdbc.query.WhereOperator;
import com.origin.eurybia.utils.DateUtils;
import com.origin.eurybia.utils.StringUtils;
import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.utils.ResultMsg;
import com.silence.study.core.entity.company.BusCompanyEntity;
import com.silence.study.core.model.company.BusCompanyModel;
import com.silence.study.core.service.company.BusCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>公司信息表管理<br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-12 00:32:22<br>
 * <b>详细说明：</b><br>
 */
@Controller
@Config(menuElId = "busCompany")
@RequestMapping(value = "busCompany")
public class BusCompanyController extends BaseController {

    @Autowired(required = false)
    private BusCompanyService busCompanyService;

    /**
     * 公司信息表视图
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/index")
    public ModelAndView indexView() throws Exception {

        Map<String, Object> map = new HashMap<>(16);

        return RenderView("busCompany/busCompanyView", map);
    }

    /**
     * 公司选择页面
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/select")
    public ModelAndView select() throws Exception {

        Map<String, Object> map = new HashMap<>(16);

        return RenderView("busCompany/select", map);
    }
    /**
     * 获取单条记录
     *
     * @param model
     * @return
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/data", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg dataOne(@RequestBody BusCompanyModel model) {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(BusCompanyEntity.class, model);
        query.addWhereOperator(whereOperator);
        BusCompanyEntity busCompanyEntity = busCompanyService.queryOne(query);
        return new ResultMsg(true, busCompanyEntity, "");
    }

    /**
     * 普通查询不分页
     *
     * @param model
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/dataList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public List<BusCompanyEntity> dataList(BusCompanyModel model) throws Exception {

        Query query = new Query();
        //查询条件
        WhereOperator whereOperator = getQueryTerm(BusCompanyEntity.class, model);
        query.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(BusCompanyEntity.class, model);
        query.addSortOperator(sortOperator);

        return busCompanyService.queryList(query);
    }

    /**
     * 普通查询分页
     *
     * @param model
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "pageList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> dataPageList(@RequestBody BusCompanyModel model) throws Exception {

        Pager<BusCompanyEntity> pager = new Pager<>();
        pager.setPageId(model.getPage());
        pager.setPageSize(model.getRows());

        //查询条件
        String createTimeBegin = null;
        String createTimeEnd = null;
        if (model.getCreateTime() != null) {
            createTimeBegin = DateUtils.formatDate(model.getCreateTime(), "yyyy-MM-dd 00:00:00");
            createTimeEnd = DateUtils.formatDate(model.getCreateTime(), "yyyy-MM-dd 23:59:59");
            model.setCreateTime(null);
        }
        WhereOperator whereOperator = getQueryTerm(BusCompanyEntity.class, model);
        if (StringUtils.isNotBlank(createTimeBegin) && StringUtils.isNotBlank(createTimeEnd)) {
            whereOperator.and("createTime").between(createTimeBegin, createTimeEnd);
        }
        pager.addWhereOperator(whereOperator);
        //排序
        SortOperator sortOperator = getSortTerm(BusCompanyEntity.class, model);
        pager.addSortOperator(sortOperator);

        busCompanyService.queryPage(pager);

        //设置页面数据
        Map<String, Object> jsonMap = new HashMap<>(16);
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
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/detail")
    public ModelAndView detailView(@RequestParam Integer id) throws Exception {

        Map<String, Object> map = new HashMap<>(16);
        map.put("id", id);

        return RenderView("busCompany/busCompanyDetail", map);
    }


    /**
     * 增加记录
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority = true, authorityType = AuthEnum.AuthorityEnum.ADD)
    @RequestMapping("/add")
    public ModelAndView add() throws Exception {

        Map<String, Object> map = new HashMap<>(16);

        return RenderView("busCompany/busCompanyAdd", map);
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

        Map<String, Object> map = new HashMap<>(16);
        map.put("id", id);

        return RenderView("busCompany/busCompanyEdit", map);
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
    public ResultMsg save(@RequestBody BusCompanyEntity entity) throws Exception {

        if (entity.getCompanyId() == null) {
            busCompanyService.save(entity);
        } else {
            busCompanyService.updateSelective(entity);
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

        busCompanyService.deleteBatch(ids);
        return new ResultMsg(true);
    }
}
