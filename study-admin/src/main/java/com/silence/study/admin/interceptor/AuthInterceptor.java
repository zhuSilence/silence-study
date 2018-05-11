package com.silence.study.admin.interceptor;

import com.silence.study.core.entity.sys.SysMenuEntity;
import com.silence.study.core.entity.sys.SysUserEntity;
import com.silence.study.core.service.sys.SysMenuService;
import com.silence.study.core.service.sys.SysRoleMenuModService;
import com.origin.eurybia.Constant;
import com.origin.eurybia.annotation.Auth;
import com.origin.eurybia.annotation.Config;
import com.origin.eurybia.common.Tip;
import com.origin.eurybia.exception.AuthException;
import com.origin.eurybia.exception.LoginException;
import com.origin.eurybia.utils.HttpSessionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.NamedThreadLocal;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Autowired(required = false)
    private SysMenuService sysMenuService;
    @Autowired
    private SysRoleMenuModService sysRoleMenuModService;
    private static final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);
    private NamedThreadLocal<Long> stratTimeThredLocal = new NamedThreadLocal<>("StopWatch-StratTime");

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerMethod method = (HandlerMethod) handler;
        Auth auth = method.getMethod().getAnnotation(Auth.class);
        //用户操作权限验证
        if (auth != null && auth.verifyAuthority()) {
            Config config = method.getMethod().getDeclaringClass().getAnnotation(Config.class);
            if (config != null) {
                SysUserEntity loginUser = (SysUserEntity) HttpSessionUtils.getSessionValue(request, Constant.SESSION_LOGIN_USER);
                Integer mod = sysRoleMenuModService.getModByMenuIdRoles(config.menuElId(), loginUser.getUserRoleList());
                Integer runMod = auth.authorityType().key;
                if (mod != null && (runMod & mod) > 0) {
                    if (method.getMethod().getAnnotation(ResponseBody.class) == null) {
                        modelAndView.addObject("mod", mod);
                    }
                } else {
                    throw new AuthException(Tip.NO_AUTHORITY);
                }
            }
        }
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //开始时间
        long beginTime = System.currentTimeMillis();
        //线程绑定变量(只有当前请求线程可见)
        stratTimeThredLocal.set(beginTime);
        String requestURL = request.getRequestURI();
        System.out.println(requestURL + "==>");

        HandlerMethod method = (HandlerMethod) handler;
        Auth auth = method.getMethod().getAnnotation(Auth.class);

        //System.out.println("request.getHeader(\"Referer\")= " + request.getHeader("Referer"));
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0, size = cookies.length; i < size; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("prePathname")) {
                    //System.out.println("prePathname= " + cookie.getValue());
                    String[] urlArry = cookie.getValue().split("\\?");
                    //SysMenuEntity entity=sysMenuService.queryOne("iframeUrl",requestURL);
                    //String url=requestURL+"?menuId="+entity.getMenuId();
                    if (requestURL.equals(urlArry[0])) {
                        Cookie newCookie = new Cookie("prePathname", cookie.getValue());
                        newCookie.setPath("/");
                        newCookie.setMaxAge(0);
                        response.addCookie(newCookie);
                        //String path = cookie.getValue();
                    }
                }
            }
        }

        //判断是否需要登录验证
        if (auth == null || auth.verifyLogin()) {
            SysUserEntity loginUser = (SysUserEntity) HttpSessionUtils.getSessionValue(request, Constant.SESSION_LOGIN_USER);
            //判断用户是否登录
            List<SysMenuEntity> entityList = sysMenuService.queryList();
            boolean bl = true;
            for (SysMenuEntity menuEntity : entityList) {
                if (menuEntity.getIframeUrl().equals(requestURL)) {
                    bl = false;
                    break;
                }
            }
            if (null == loginUser) {
                if (!bl) {
                    String[] urlArry = requestURL.split("/");
                    SysMenuEntity entity = sysMenuService.queryOne("iframeUrl", requestURL);
                    String url = requestURL + "?menuId=" + entity.getMenuId();
                    Cookie cookie = new Cookie("prePathname", url);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
                throw new LoginException(Tip.LOGIN_ERROR);
            } else if (request.getHeader("Referer") == null && !bl) {
                String[] urlArry = requestURL.split("/");
                SysMenuEntity entity = sysMenuService.queryOne("iframeUrl", requestURL);
                String url = requestURL + "?menuId=" + entity.getMenuId();
                Cookie cookie = new Cookie("prePathname", url);
                cookie.setPath("/");
                response.addCookie(cookie);
                throw new LoginException(Tip.LOGIN_ERROR);
            }
        }
        return super.preHandle(request, response, handler);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //super.afterCompletion(request, response, handler, ex);
        long endTime = System.currentTimeMillis();
        long beginTime = stratTimeThredLocal.get();
        long consumeTime = endTime - beginTime;
        if (consumeTime > 500) {
            log.info("{} consume {} millis", request.getRequestURI(), consumeTime);
        }
    }
}
