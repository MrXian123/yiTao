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

	@Before("poin()") // ǰ��֪ͨ
	public void myBefore(JoinPoint joinPoint) {
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateString = formatter.format(new Date());
		
		Log log = new Log();
		log.setMethod(joinPoint.getSignature().getName());
		System.out.println("����"+joinPoint.getSignature());
		if (user2!=null) {
			log.setUserid(user2.getId());
			log.setUsername(user2.getLoginid());
		}
		
		log.setDatatime(dateString);
		logsDao.save(log);
	}

	@Around("poin()") // ����֪ͨ
	public Object myAround(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("���ƿ�ʼ��");
		Object object = joinPoint.proceed();
		System.out.println("����" + joinPoint.getSignature().getName());
		System.out.println("���ƽ���");
		return object;

	}

	@After("poin()") // ����֪ͨ
	public void myAfter() {
		// TODO Auto-generated method stub
		System.out.println("����֪ͨ  ");

	}

	@AfterThrowing(value = "poin()", throwing = "e") // �쳣֪ͨ
	public void myAfterThrowing(JoinPoint joinPoint, Throwable e) {
		System.out.println("�쳣����" + e.getMessage());
	}

	@AfterReturning(value = "poin()") // ����֪ͨ ���
	public void myAfterReturning(JoinPoint joinPoint) {
		System.out.println("����֪ͨ" + joinPoint.getSignature().getName());
		
	}
}
