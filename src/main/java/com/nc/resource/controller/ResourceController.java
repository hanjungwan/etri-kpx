package com.nc.resource.controller;

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

import com.nc.resource.service.ResourceService;

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
 * com.nc.resource.controller : ResourceController.java
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
 *  2016. 10. 13.          creme55         최초 생성 (자원관리 서비스 controller)
 *
 * </pre>
 **/
@Controller
public class ResourceController {
	private static final Logger log = LoggerFactory.getLogger(ResourceController.class);
	
	@Autowired
	private ResourceService resourceService;
	
	/**
	 * <pre>
	 * 1. 개요 : 자원관리 조회
	 * 2. 처리내용 : 자원관리 리스트 조회
	 * </pre>
	 *
	 * @method Name : getResourceList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/resource/smlGnrResMngInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String smlGnrResMngInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		return "resource/smlGnrResMngInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 자원관리 조회
	 * 2. 처리내용 : 자원관리 리스트 조회
	 * </pre>
	 *
	 * @method Name : getResourceList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/resource/setGnrMngInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setGnrMngInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		return "resource/setGnrMngInfoList";
	}
}