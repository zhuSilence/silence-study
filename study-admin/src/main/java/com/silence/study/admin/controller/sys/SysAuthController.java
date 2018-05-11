package com.silence.study.admin.controller.sys;

import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.utils.ResultMsg;
import com.silence.study.core.entity.sys.SysMenuEntity;
import com.silence.study.core.entity.sys.SysRoleEntity;
import com.silence.study.core.entity.sys.SysRoleMenuModEntity;
import com.silence.study.core.service.sys.SysMenuService;
import com.silence.study.core.service.sys.SysRoleMenuModService;
import com.silence.study.core.service.sys.SysRoleService;
import com.silence.study.core.service.sys.SysRunService;
import com.origin.eurybia.annotation.Auth;
import com.origin.eurybia.bean.AuthEnum;
import com.origin.eurybia.jdbc.query.QueryEnums;
import com.origin.eurybia.jdbc.query.SortOperator;
import com.origin.eurybia.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>角色权限管理<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-21 11:42<br>
 * <b>详细说明：</b><br>
 */
@Controller
@RequestMapping(value = "sysAuth")
public class SysAuthController extends BaseController {

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private SysRunService sysRunService;

    @Autowired
    private SysRoleMenuModService sysRoleMenuModService;

    /**
     * 权限管理视图
     *
     * @return
     * @throws Exception
     */
    @Auth(verifyAuthority=true,authorityType= AuthEnum.AuthorityEnum.BROWSER)
    @RequestMapping(value = "/index")
    public ModelAndView indexView() throws Exception {

        Map<String, Object> map = new HashMap<>();

        return RenderView("sysAuth/sysAuthView", map);
    }

    /**
     * 获取菜单及操作列表
     *
     * @return
     */
    @RequestMapping(value = "/getMenuList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> getMenuList() throws Exception {
        Map<String, Object> map = new HashMap<>();
        SortOperator sortOperator = SortOperator.orderby(SysMenuEntity.class).ASC("pmid").DESC("seq");
        List<SysMenuEntity> menuEntities = sysMenuService.queryList("disabled", 0, sortOperator);
        map.put("sysMenus", JsonUtils.json2Maps(JsonUtils.getListToTreeJson(menuEntities, "menuId", "pmid", null)));
        map.put("sysRuns", sysRunService.queryList("seq", QueryEnums.Sort.DESC));
        map.put("sysRoles", sysRoleService.queryList("seq", QueryEnums.Sort.DESC));
        return map;
    }

    /**
     * 获取角色列表
     *
     * @return
     */
    @RequestMapping(value = "/getRoleList", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
    @ResponseBody
    public List<SysRoleEntity> getRoleList() {

        return sysRoleService.queryList("seq", QueryEnums.Sort.DESC);
    }

    @RequestMapping(value = "/save", produces = "text/html;charset=UTF-8",consumes = "application/json", method = {RequestMethod.POST})
    @ResponseBody
    public ResultMsg save(@RequestBody SysRoleMenuModEntity[] entity) throws Exception {

        sysRoleMenuModService.saveBatch(Arrays.asList(entity));
        return new ResultMsg(true);
    }

}
