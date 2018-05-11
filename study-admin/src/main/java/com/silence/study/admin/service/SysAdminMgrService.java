package com.silence.study.admin.service;

import com.silence.study.core.entity.sys.SysLogLoginEntity;
import com.silence.study.core.entity.sys.SysUserEntity;
import com.silence.study.core.service.sys.SysLogLoginService;
import com.silence.study.core.service.sys.SysUserService;
import com.origin.eurybia.Constant;
import com.origin.eurybia.utils.DateUtils;
import com.origin.eurybia.utils.HttpSessionUtils;
import com.origin.eurybia.utils.MD5Encode;
import com.origin.eurybia.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * <br>
 * <b>功能：</b>系统管理服务<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-22 14:03<br>
 * <b>详细说明：</b><br>
 */
@Service
public class SysAdminMgrService {
    private final static Logger log = LoggerFactory.getLogger(SysAdminMgrService.class);

    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysLogLoginService sysLogLoginService;

    /**
     * 会员登录
     *
     * @param request
     * @param account
     * @param pwd
     * @return
     */
    public Boolean userLogin(HttpServletRequest request, String account, String pwd) {

        SysUserEntity user = sysUserService.queryOne("loginName", account);
        Boolean isLogin = false;
        if (user != null) {
            String md5PWD = MD5Encode.getMD5Str(MD5Encode.getMD5Str(pwd + user.getSalt()));
            if (user.getLoginPwd().equals(md5PWD)) {
                //写入SESSION
                HttpSessionUtils.setSessionValue(request, Constant.SESSION_LOGIN_USER, user);
                Date loginTime = DateUtils.getCurDate();
                String loginIp = Utils.getIpAddr(request);
                SysUserEntity upUserEntity = new SysUserEntity();
                upUserEntity.setUserId(user.getUserId());
                upUserEntity.setLoginTime(loginTime);
                upUserEntity.setLoginIp(loginIp);
                upUserEntity.setLoginCount(user.getLoginCount() + 1);
                try {
                    sysUserService.updateSelective(upUserEntity);
                    SysLogLoginEntity login = new SysLogLoginEntity();
                    login.setUserName(user.getLoginName());
                    login.setUserId(user.getUserId());
                    login.setLoginTime(loginTime);
                    login.setLoginIp(loginIp);
                    login.setLoginType(0);
                    login.setUserAgent(request.getHeader("user-agent"));
                    login.setRemark("登录");
                    sysLogLoginService.save(login);
                } catch (Exception e) {
                    e.printStackTrace();
                    log.error("用户登录时写入数据失败！");
                }
                isLogin = true;
            }
        }
        return isLogin;
    }
}
