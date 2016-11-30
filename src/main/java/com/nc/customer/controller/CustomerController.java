package com.nc.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nc.common.utils.SessionUtil;
import com.nc.customer.service.CustomerService;

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
 * com.nc.customer.controller : CustomerController.java
 * @author creme55
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                         수정내용
 *  -------------        -----------       --------------------------------------
 *  2016. 10. 17.          creme55         최초 생성 (고객지원 서비스 controller)
 *
 * </pre>
 **/
@Controller
public class CustomerController {
	private static final Logger log = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;
	
	/**
	 * <pre>
	 * 1. 개요 : 고객지원 처리
	 * 2. 처리내용 : 공지사항 리스트 조회
	 * </pre>
	 *
	 * @method Name : getNotifyList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/customer/notifyList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getNotifyList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List<?> result = customerService.getNotifyList("", paramMap);
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", result.get(0));
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("results", result);
		
		return "";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 고객지원
	 * 2. 처리내용 : 공지사항의 등록 처리
	 * </pre>
	 *
	 * @method Name : putNotifyInfo
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="/customer/putNotifyInfo.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap putNotifyInfo(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, @RequestBody ModelMap model) throws Exception {
		ModelMap result = new ModelMap();
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= parameter is [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		Map<String, Object> tmpResult = new HashMap<String, Object>();
		int rowCnt = customerService.putNotifyInfo("customer.insertNotcInfo", paramMap);
		tmpResult.put("resultMesg", (rowCnt > 0) ? "1" : "0");
		
		/* 문자열 변환을 위한 jackson library method 호출 */
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(tmpResult);
		
		result.put("results", jsonStr);
		
		return result;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 고객지원 처리
	 * 2. 처리내용 : 공지사항 리스트 조회 테스트
	 * </pre>
	 *
	 * @method Name : getNotifyInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/customer/notifyInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getNotifyInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		//List<?> result = customerService.getNotifyList("", paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		/* Session 객체에서 로그인 정보를 가져온다. */
		String loginId = String.valueOf(SessionUtil.getAttribute("loginId"));

		/* Session 정보를 전송하기 위해 확인 */
		resultMap.put("loginId", loginId);
		resultMap.put("serviceType", "customer");

		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "test for notification service...");
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("results", resultMap);
		
		return "customer/notifyInfoList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 통보함 처리
	 * 2. 처리내용 : 통보함 리스트 조회 테스트
	 * </pre>
	 *
	 * @method Name : getInformInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/customer/informInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getInformInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		//List<?> result = customerService.getNotifyList("", paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		/* Session 객체에서 로그인 정보를 가져온다. */
		String loginId = String.valueOf(SessionUtil.getAttribute("loginId"));

		/* Session 정보를 전송하기 위해 확인 */
		resultMap.put("loginId", loginId);
		resultMap.put("serviceType", "customer");
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "test for notification service...");
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("results", resultMap);
		
		return "customer/informInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 질의응답(Q&A) 처리
	 * 2. 처리내용 : 질의응답(Q&A) 리스트 조회 테스트
	 * </pre>
	 *
	 * @method Name : getQnaInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/customer/qnaInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getQnaInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		//List<?> result = customerService.getNotifyList("", paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		/* Session 객체에서 로그인 정보를 가져온다. */
		String loginId = String.valueOf(SessionUtil.getAttribute("loginId"));

		/* Session 정보를 전송하기 위해 확인 */
		resultMap.put("loginId", loginId);
		resultMap.put("serviceType", "customer");
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "test for notification service...");
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("results", resultMap);
		
		return "customer/qnaInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 이의신청 처리
	 * 2. 처리내용 : 이의신청 리스트 조회 테스트
	 * </pre>
	 *
	 * @method Name : getAppealInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/customer/appealInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getAppealInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		//List<?> result = customerService.getNotifyList("", paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		/* Session 객체에서 로그인 정보를 가져온다. */
		String loginId = String.valueOf(SessionUtil.getAttribute("loginId"));

		/* Session 정보를 전송하기 위해 확인 */
		resultMap.put("loginId", loginId);
		resultMap.put("serviceType", "customer");
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "test for notification service...");
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("results", resultMap);
		
		return "customer/appealInfoList";
	}
}