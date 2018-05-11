package com.silence.study.core.base;

import com.origin.eurybia.common.Tip;
import com.origin.eurybia.exception.CheckException;
import com.origin.eurybia.jdbc.annotation.Validator;
import com.origin.eurybia.utils.RegexUtil;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * 实体数据校验
 */
@Aspect
@Component
public class DataValidatorAspect {

    @Before("execution(public * com.silence.study.core..*Service.save(..))||execution(public * com.origin.core..*Service.update*(..))")
    public void beforeMethod(JoinPoint jp) throws CheckException {
        Object entity = jp.getArgs()[0];
        Class<?> aClass = entity.getClass();
        for (Field f : entity.getClass().getDeclaredFields()) {
            Validator validator = f.getAnnotation(Validator.class);
            if (validator == null) continue;

            String fName = f.getName();
            String mName = "get" + StringUtils.capitalize(fName);

            Object o = null;
            try {

                Method method = aClass.getMethod(mName);
                o = method.invoke(entity);
            } catch (Exception ignored) {
            }

            if (o == null || "".equals(o)) {
                if (validator.notNull()) {
                    throw new CheckException(Tip.PARAMETER_REQUIRED, validator.name());
                }
            } else {
                int lenMin = validator.lenMin();

                if (lenMin != 0 && ((String) o).length() < lenMin) {
                    throw new CheckException(Tip.LEN_GE, validator.name(), validator.lenMin());
                }
                int len = validator.len();
                if (len != 0 && ((String) o).length() > len) {
                    throw new CheckException(Tip.LEN_LE, validator.name(), validator.len());
                }
                int min = validator.min();
                if (min != Integer.MIN_VALUE && ((Number) o).doubleValue() < min) {
                    throw new CheckException(Tip.NUMBER_GE, validator.name(), validator.min());
                }
                int max = validator.max();
                if (max != Integer.MAX_VALUE && ((Number) o).doubleValue() > max) {
                    throw new CheckException(Tip.NUMBER_LE, validator.name(), validator.max());

                }
                if (!RegexUtil.ALL.equals(validator.rgx()) && !validator.rgx().isValid((String) o)) {
                    throw new CheckException(Tip.WRONG_FORMAT, validator.name());
                }
            }
        }
    }

}
