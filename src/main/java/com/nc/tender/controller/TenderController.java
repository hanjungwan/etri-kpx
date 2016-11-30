package com.nc.tender.controller;

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

import com.nc.tender.service.TenderService;

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
 * com.nc.tender.controller : TenderController.java
 * @author creme55
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       ----------------------------------
 *  2016. 10. 17.          creme55         최초 생성 (입찰 서비스 controller)
 *
 * </pre>
 **/
@Controller
public class TenderController {
	private static final Logger log = LoggerFactory.getLogger(TenderController.class);
	
	@Autowired
	private TenderService tenderService;
	
	/**
	 * <pre>
	 * 1. 개요 : 입찰 처리
	 * 2. 처리내용 : 전력거래 입찰현황 조회
	 * </pre>
	 *
	 * @method Name : pwrSleTndrInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/tender/pwrSleTndrInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwrSleTndrInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "");
			log.debug("==========================================================================================");
		}
		
		return "tender/pwrSleTndrInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 입찰 처리
	 * 2. 처리내용 : REC거래 입찰현황 조회
	 * </pre>
	 *
	 * @method Name : recSleTndrSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/tender/recSleTndrSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recSleTndrSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "");
			log.debug("==========================================================================================");
		}
		
		return "tender/recSleTndrSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 입찰 처리
	 * 2. 처리내용 : 전력 입찰통계 조회
	 * </pre>
	 *
	 * @method Name : pwrTndrSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/tender/pwrTndrSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwrTndrSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "");
			log.debug("==========================================================================================");
		}
		
		return "tender/pwrTndrSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 입찰 처리
	 * 2. 처리내용 : 집합전력 입찰통계 조회
	 * </pre>
	 *
	 * @method Name : setPwrTndrSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/tender/setPwrTndrSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setPwrTndrSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "");
			log.debug("==========================================================================================");
		}
		
		return "tender/setPwrTndrSttcInfoList";
	}
}