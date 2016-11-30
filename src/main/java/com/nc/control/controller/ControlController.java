package com.nc.control.controller;

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

import com.nc.control.service.ControlService;

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
 * com.nc.control.controller : ControlController.java
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
 *  2016. 10. 13.          creme55         최조 생성 (관제 서비스 controller)                 
 *
 * </pre>
 **/
@Controller
public class ControlController {
	private static final Logger log = LoggerFactory.getLogger(ControlController.class);
			
	@Autowired
	private ControlService controlService;
	
	/**
	 * <pre>
	 * 1. 개요 : 관제
	 * 2. 처리내용 : 관제 자원현황 리스트 조회
	 * </pre>
	 *
	 * @method Name : rsrsSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/control/rsrsSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String rsrsSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "control/rsrsSttcInfoList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 관제
	 * 2. 처리내용 : 관제이력 리스트 조회
	 * </pre>
	 *
	 * @method Name : ctrlHistInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/control/ctrlHistInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String ctrlHistInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "control/ctrlHistInfoList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 관제
	 * 2. 처리내용 : 집합발전 관제이력 리스트 조회
	 * </pre>
	 *
	 * @method Name : setGnrCtrlHistInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/control/setGnrCtrlHistInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setGnrCtrlHistInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "control/setGnrCtrlHistInfoList";
	}
}