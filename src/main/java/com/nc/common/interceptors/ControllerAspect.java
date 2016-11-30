package com.nc.common.interceptors;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 *  ETRI Distributed Resource/Mediation System for new re-generation Energy Exchange
 *
 *  Copyright ⓒ [2016] ETRI. All rights reserved.
 *
 *    This is a proprietary software of ETRI, and you may not use this file except in
 *  compliance with license agreement with ETRI. Any redistribution or use of this
 *  software, with or without modification shall be strictly prohibited without prior written
 *  approval of ETRI, and the copyright notice above does not evidence any actual or
 *  intended publication of such software.
 *
 * com.nc.common.interceptors : ControllerAspect.java
 * @author creme55
 * @since 2016. 10. 12.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 12.          creme55         최초 생성 (Controller AOP정의)
 *
 * </pre>
 **/
@Aspect
@Component
public class ControllerAspect { 

	private static final Logger log = LoggerFactory.getLogger(ControllerAspect.class);
	
	@Pointcut("execution(public * com.nc.controller..*(..))")
	public void logging() {}
	
	@Before("logging()")
	public void logging(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		String signatureStr = signature.toString();
		String paramStr = null;
		int paramStart = signatureStr.indexOf("(");
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("Class : [{}]", signature.getDeclaringTypeName());
			log.debug("Method : [{}]", signature.getName());
		}
		
		if (paramStart > -1) {
			int paramEnd = signatureStr.lastIndexOf(")");
			if(paramEnd > -1) {
				paramStr = signatureStr.substring(paramStart + 1, paramEnd);
			}
		}
		
		if (paramStr != null) {
			String[] param = paramStr.split(",");
			Object[] args = joinPoint.getArgs();
			int argsSize = args.length;
			
			if (argsSize == param.length) {
				for(int i = 0; i < argsSize; i++) {
					if (log.isDebugEnabled()) {
						log.debug("argument [{}] : [{}] : [{}]", new Object[]{i, param[i], args[i]});
					}
				}
			}
		}

		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
		}
	}
}