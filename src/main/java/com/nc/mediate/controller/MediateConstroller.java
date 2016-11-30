package com.nc.mediate.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nc.mediate.service.MediateService;

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
 * com.nc.mediate.controller : MediateConstroller.java
 * @author creme55
 * @since 2016. 10. 13.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 13.          creme55         최초 생성 (중개 계약 서비스 Controller)
 *
 * </pre>
 **/
@Controller
public class MediateConstroller {
	private static final Logger log = LoggerFactory.getLogger(MediateConstroller.class);
	
	@Autowired
	private MediateService mediateService;
	
	/**
	 * <pre>
	 * 1. 개요 : 중개 계약 조회
	 * 2. 처리내용 : 중개 계약 리스트 조회
	 * </pre>
	 *
	 * @method Name : getContractList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/mediate/medteCnteInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String medteCnteInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "aaa");
			log.debug("==========================================================================================");
		}
		
		return "mediate/medteCnteInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 중개 계약 조회
	 * 2. 처리내용 : 유지보수 리스트 조회
	 * </pre>
	 *
	 * @method Name : mntnInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/mediate/mntnInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mntnInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "aaa");
			log.debug("==========================================================================================");
		}
		
		return "mediate/mntnInfoList";
	}
}