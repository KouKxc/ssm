package cn.kxc.ssm.controller;

import cn.kxc.ssm.domain.SysLog;
import cn.kxc.ssm.service.IAopSysLogService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Component
@Aspect//声明切面类
public class AopSysLog {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private IAopSysLogService aopSysLogService;
    //定义环绕通知
    @Around("execution(* cn.kxc.ssm.controller.*.*(..))")
    public Object saveLog(ProceedingJoinPoint joinPoint){
        try{
            //访问时间
            Date visitTime = new Date();
            //操作的用户名
            String username = SecurityContextHolder.getContext().getAuthentication().getName();

            //方法执行前的实时毫秒数
            long start =System.currentTimeMillis();
            //执行切入点方法
            Object proceed = joinPoint.proceed();

            //访问ip
            String ip = request.getRemoteAddr();
            //获取访问url
            String url = request.getRequestURI();

            //计算方法执行时长
            long end = System.currentTimeMillis();
            int executionTime = (int) (end- start);

            //访问方法
            //获取切入点方法所在类的字节码对象
            String className = joinPoint.getTarget().getClass().getName();
            //获取切入点方法名称
            String methodName = joinPoint.getSignature().getName();
            String method = className + "." + methodName;

            //将上述参数封装SysLog中
            SysLog sysLog = new SysLog();
            sysLog.setVisitTime(visitTime);
            sysLog.setUsername(username);
            sysLog.setIp(ip);
            sysLog.setUrl(url);
            sysLog.setExecutionTime(executionTime);
            sysLog.setMethod(method);
            //调用业务层保存
            aopSysLogService.save(sysLog);
            System.out.println(sysLog);
            return proceed;
        }catch (Throwable throwable){
            throwable.printStackTrace();
        }
        return null;

    }
}
