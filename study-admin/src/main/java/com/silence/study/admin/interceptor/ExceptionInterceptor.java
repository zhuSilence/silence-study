package com.silence.study.admin.interceptor;


import com.silence.study.core.entity.sys.SysUserEntity;
import com.origin.eurybia.Constant;
import com.origin.eurybia.common.Tip;
import com.origin.eurybia.exception.AuthException;
import com.origin.eurybia.exception.CheckException;
import com.origin.eurybia.exception.LoginException;
import com.origin.eurybia.exception.OriginException;
import com.origin.eurybia.utils.HttpSessionUtils;
import com.origin.eurybia.utils.ServletUtil;
import org.mybatis.spring.MyBatisSystemException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Spring MVC 异常处理类
 * Created by Siber on 2015/10/10.
 */
@Component
public class ExceptionInterceptor implements HandlerExceptionResolver {

    private static Logger logger = LoggerFactory.getLogger(ExceptionInterceptor.class);
    private static final int HTTP_STATUS = 444;

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        String msg;

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("ex", ex);

        //根据不同错误转向不同页面
        if (ex instanceof LoginException) {
            SysUserEntity loginUser = (SysUserEntity) HttpSessionUtils.getSessionValue(request, Constant.SESSION_LOGIN_USER);
            if(null==loginUser) {
                return new ModelAndView("redirect:/index.html");
            }else {
                return new ModelAndView("redirect:/main.html");
            }
            //return new ModelAndView("redirect:/index.html");
        } else if (ex instanceof AuthException) {
            AuthException authException = (AuthException) ex;
            Enum tip = authException.getTip();
            msg = getMassage(tip, authException.getErrMeassage(), authException.getReplaces());
        } else if (ex instanceof CheckException) {
            CheckException checkException = (CheckException) ex;
            Enum tip = checkException.getTip();
            msg = getMassage(tip, checkException.getErrMeassage(), checkException.getReplaces());
        } else if (ex instanceof OriginException) {
            OriginException originException = (OriginException) ex;
            Enum tip = originException.getTip();
            msg = getMassage(tip, originException.getErrMeassage(), originException.getReplaces());
        } else if (ex instanceof MyBatisSystemException) {
            msg = getMassage(ex.getCause().getCause().getMessage());
        } else {
            msg = Tip.SYSTEM_ERROR.toString();
            ex.printStackTrace();
        }

        if (AnnotationUtils.findAnnotation(((HandlerMethod) handler).getMethod(), ResponseBody.class) != null) {
            //设置状态
            response.setStatus(HTTP_STATUS);
            ServletUtil.write(msg, response);
            return new ModelAndView();
        }
        model.put("msg", msg);
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("error");
        modelView.addAllObjects(model);
        return modelView;
    }

    /**
     * 获取错误信息
     *
     * @param message
     * @return
     */
    private String getMassage(String message) {

        return getMassage(null, message, null);
    }

    /**
     * 获取错误信息
     *
     * @param tip
     * @param message
     * @param replaces
     * @return
     */
    private String getMassage(Enum tip, String message, Object[] replaces) {
        String resMsg;
        if (tip == null) {
            resMsg = Tip.toString("000000", message);
        } else {
            resMsg = tip.toString();
            if (replaces != null) {
                resMsg = String.format(resMsg, replaces);
            }
        }
        return resMsg;
    }

//    private void notVerified(HttpServletRequest request, HttpServletResponse response, String msg) {
//        boolean isAjax = StringUtils.contains(request.getHeader("accept"), "application/json");
//        if (isAjax) {
//            //ajax请求
//            Map<String, Object> result = new HashMap<String, Object>();
//            result.put("success", false);
//            result.put("msg", msg);
//            // 传统的登录页面
//            response.setContentType("application/json");
//            //设置页面不缓存
//            response.setHeader("Pragma", "No-cache");
//            response.setHeader("Cache-Control", "no-cache");
//            response.setCharacterEncoding("UTF-8");
//            PrintWriter out = null;
//            try {
//                out = response.getWriter();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            out.print(JsonUtils.obj2Json(result));
//            out.flush();
//            out.close();
//        } else {
//            //普通请求
//            String uri = request.getRequestURL().toString();
//            Cookie cookie = new Cookie(Constant.COOKIE_URL, uri);
//            cookie.setPath("/");
//            response.addCookie(cookie);
//            try {
//                response.sendRedirect(Utils.getBasePath(request) + "/index.html");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }
}
