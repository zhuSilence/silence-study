package com.silence.study.admin.base;

import com.silence.study.core.entity.sys.SysUserEntity;
import com.origin.eurybia.Constant;
import com.origin.eurybia.jdbc.query.WhereOperator;
import com.origin.eurybia.utils.HttpSessionUtils;
import com.origin.eurybia.utils.ServletUtil;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * <br>
 * <b>功能：</b>BaseController<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2016-09-21 10:31<br>
 * <b>详细说明：</b>无<br>
 */
public class BaseController extends com.origin.eurybia.base.BaseController {

    //@Autowired
    //private SysRoleMenuModService sysRoleMenuModService;

    @Override
    public ModelAndView RenderView(String viewName, Map<String, Object> map) {

        ModelAndView modelAndView = super.RenderView(viewName, map);
        modelAndView.addObject("mediaServerUrl", com.silence.study.admin.utils.Constant.MEDIA_SERVER);
        return modelAndView;
    }

    /**
     * 获取当前登录用户信息
     *
     * @return
     */
    protected SysUserEntity getLoginUser() {

        SysUserEntity loginUser = (SysUserEntity) HttpSessionUtils.getSessionValue(ServletUtil.getRequest(), Constant.SESSION_LOGIN_USER);

        return loginUser;
    }

    /**
     * 根据map组装查询条件，去除不包含在对应实体里面的属性值
     *
     * @param clazz
     * @param map
     * @return
     */
    protected WhereOperator getQuery(Class clazz, Map<String, Object> map) {
        WhereOperator whereOperator = WhereOperator.where(clazz);
        if (map.get("startDate") != null && map.get("endDate") != null) {
            whereOperator.and("statDate").between(map.get("startDate"), map.get("endDate"));
        }
        map.remove("startDate");
        map.remove("endDate");
        map.remove("mediaType");
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (entry.getValue() instanceof String) {
                whereOperator.and(entry.getKey()).like("%" + entry.getValue() + "%");
            } else {
                whereOperator.and(entry.getKey()).eq(entry.getValue());
            }
        }
        return whereOperator;
    }
}
