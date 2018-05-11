package com.silence.study.admin.controller;

import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.bean.LoginBean;
import com.silence.study.admin.bean.ModifyPwdBean;
import com.silence.study.admin.utils.Constant;
import com.silence.study.admin.utils.ResultMsg;
import com.silence.study.admin.service.SysAdminMgrService;
import com.silence.study.core.entity.sys.SysMenuEntity;
import com.silence.study.core.entity.sys.SysUserEntity;
import com.silence.study.core.service.sys.SysMenuService;
import com.silence.study.core.service.sys.SysUserService;
import com.origin.eurybia.annotation.Auth;
import com.origin.eurybia.captcha.CaptchaBean;
import com.origin.eurybia.jdbc.query.Query;
import com.origin.eurybia.jdbc.query.SortOperator;
import com.origin.eurybia.jdbc.query.WhereOperator;
import com.origin.eurybia.utils.HttpSessionUtils;
import com.origin.eurybia.utils.MD5Encode;
import com.origin.eurybia.utils.ServletUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>主界面<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-01 11:35<br>
 * <b>详细说明：</b><br>
 */
@Controller
public class MainController extends BaseController {

    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private SysAdminMgrService sysAdminMgrService;
    @Autowired
    private SysUserService sysUserService;


    @RequestMapping(value = "main")
    public ModelAndView mainView() {

        List<SysMenuEntity> sysMenuEntities;
        SysUserEntity loginUserEntity = getLoginUser();
        if (loginUserEntity.getSuperUser() == 1) {
            Query query = new Query();
            query.addWhereOperator(WhereOperator.where(SysMenuEntity.class, "disabled").eq(0));
            SortOperator sort = SortOperator.orderby(SysMenuEntity.class).ASC("pmid").DESC("seq");
            query.addSortOperator(sort);
            sysMenuEntities = sysMenuService.queryList(query);
        } else {
            List<Integer> rids = loginUserEntity.getUserRoleList();
            sysMenuEntities = sysMenuService.getMenusByRole(rids);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("menusList", sysMenuEntities);
        map.put("loginUser", loginUserEntity);


        return RenderView("main", map);
    }

    /**
     * 登录界面
     *
     * @return
     */
    @Auth(verifyLogin = false)
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView indexView() {

        return RenderView("index");
    }

    /**
     * 会员登录
     *
     * @param loginBean
     * @return
     */
    @Auth(verifyLogin = false)
    @RequestMapping(value = "userlogin", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg login(@RequestBody LoginBean loginBean) {

        ResultMsg resultMsg;
        //签证码
        CaptchaBean bean = (CaptchaBean) HttpSessionUtils.getSessionValue(ServletUtil.getRequest(), Constant.SESSION_CAPTCHA);
        if (bean == null || !loginBean.getVerifyCode().equals(bean.getCaptcha())) {
            return new ResultMsg(false, "验证码错误！");
        }
        SysUserEntity user = sysUserService.queryOne("loginName", loginBean.getUserName());
        if (user == null) {
            return resultMsg = new ResultMsg(false, "该账号不存在！");
        }
        if (user.getDisabled() == 1) {
            return resultMsg = new ResultMsg(false, "该账号已禁用！");
        }
        Boolean loginSuccess = sysAdminMgrService.userLogin(ServletUtil.getRequest(), loginBean.getUserName(), loginBean.getLoginPwd());
        if (loginSuccess) {
            resultMsg = new ResultMsg(true);
        } else {
            resultMsg = new ResultMsg(false, "用户名或密码错误！");
        }
        return resultMsg;
    }


//    @RequestMapping(value = "schedule", produces = "text/html;charset=UTF-8", method = {RequestMethod.POST})
//    @ResponseBody
//    public Map<String, Object> dataPageList(@RequestBody AdScheduleModel model) throws Exception {
//
//        Pager<AdScheduleEntity> pager = new Pager<>();
//        pager.setPageId(1);
//        pager.setPageSize(6);
//        model.setFlag(null);
//        WhereOperator whereOperator = getQueryTerm(AdScheduleEntity.class, model);
//        whereOperator.and("scheduleStatus").eq(4);
//        pager.addWhereOperator(whereOperator);
//        //排序
//        SortOperator sortOperator = SortOperator.orderby(AdScheduleEntity.class).DESC("createTime");
//        //sortOperator.DESC("createTime");
//        pager.addSortOperator(sortOperator);
//
////        adScheduleService.queryPage(pager);
//        //设置页面数据
//        Map<String, Object> jsonMap = new HashMap<>();
//        jsonMap.put("total", pager.getRowCount());
//        jsonMap.put("rows", pager.getResults());
//        return jsonMap;
//    }

    /**
     * 退出登陆
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @Auth(verifyLogin = false)
    @RequestMapping(value = "logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSessionUtils.getSession(request).invalidate();

        response.sendRedirect(request.getHeader("Referer"));
    }

    /**
     * 保存修改密码
     *
     * @return
     */
    @RequestMapping(value = "saveModifyPwd", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg saveModifyPwd(@RequestBody ModifyPwdBean modifyPwdBean) throws Exception {

        ResultMsg resultMsg;
        SysUserEntity loginUser = getLoginUser();
        String oldPwdMd5 = MD5Encode.getMD5Str(MD5Encode.getMD5Str(modifyPwdBean.getOldPwd() + loginUser.getSalt()));
        if (!oldPwdMd5.equals(loginUser.getLoginPwd())) {
            resultMsg = new ResultMsg(false, "旧密码输入错误!");
        } else {
            String newPwdMd5 = MD5Encode.getMD5Str(MD5Encode.getMD5Str(modifyPwdBean.getNewPwd() + loginUser.getSalt()));
            SysUserEntity updateUserEntity = new SysUserEntity();
            updateUserEntity.setUserId(loginUser.getUserId());
            updateUserEntity.setLoginPwd(newPwdMd5);
            sysUserService.updateSelective(updateUserEntity);
            resultMsg = new ResultMsg(true);
        }
        return resultMsg;
    }
}
