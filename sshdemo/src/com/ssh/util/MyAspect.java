package com.ssh.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.entity.Log;
import com.ssh.entity.User;

@Aspect
@Component
public class MyAspect {

	@Resource
	private LogsDao logsDao;
	

	@Pointcut("execution(* com.ssh.dao..*(..))")
	private void poin() {

	}

	@Before("poin()") // 前置通知
	public void myBefore(JoinPoint joinPoint) {
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateString = formatter.format(new Date());
		
		Log log = new Log();
		log.setMethod(joinPoint.getSignature().getName());
		System.out.println("类名"+joinPoint.getSignature());
		if (user2!=null) {
			log.setUserid(user2.getId());
			log.setUsername(user2.getLoginid());
		}
		
		log.setDatatime(dateString);
		logsDao.save(log);
	}

	@Around("poin()") // 环绕通知
	public Object myAround(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("环绕开始：");
		Object object = joinPoint.proceed();
		System.out.println("环绕" + joinPoint.getSignature().getName());
		System.out.println("环绕结束");
		return object;

	}

	@After("poin()") // 最终通知
	public void myAfter() {
		// TODO Auto-generated method stub
		System.out.println("最终通知  ");

	}

	@AfterThrowing(value = "poin()", throwing = "e") // 异常通知
	public void myAfterThrowing(JoinPoint joinPoint, Throwable e) {
		System.out.println("异常出错" + e.getMessage());
	}

	@AfterReturning(value = "poin()") // 后置通知 最后
	public void myAfterReturning(JoinPoint joinPoint) {
		System.out.println("后置通知" + joinPoint.getSignature().getName());
		
	}
}
