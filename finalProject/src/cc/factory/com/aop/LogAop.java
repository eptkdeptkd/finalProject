package cc.factory.com.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

//import org.springframework.beans.factory.annotation.Autowired;

//import bit.com.a.service.BbsService;

@Aspect
public class LogAop {

	/*
	@Autowired
	BbsService service;
	*/
	
	@Around("within(cc.factory.com.controller.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint)throws Throwable {		
		String signatureStr = joinpoint.getSignature().toShortString();		
		//System.out.println(signatureStr + " - 시작");	// 실행전
		
		// session check
		HttpServletRequest request
			= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		try {						
			System.out.println("loggerAOP:" + signatureStr + " 메소드가 실행되었습니다");
			Object obj = joinpoint.proceed();		// 실행시
			
			return obj;
			
		}finally {
			//System.out.println("실행 후:" + System.currentTimeMillis());			
			//System.out.println(signatureStr + " - 종료");	// 실행후
		}		
	}
}








