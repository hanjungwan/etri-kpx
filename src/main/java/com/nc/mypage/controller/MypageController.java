package com.nc.mypage.controller;

import java.util.HashMap;
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

import com.nc.common.utils.SessionUtil;
import com.nc.mypage.service.MypageService;

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
 * com.nc.mypage.controller : MypageController.java
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
 *  2016. 10. 13.          creme55         최초생성 (마이페이지 서비스 controller)
 *
 * </pre>
 **/
@Controller
public class MypageController {
	private static final Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageService mypageService;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지
	 * 2. 처리내용 : 등록된 사용자, 사업자 중개사업자 정보 수정
	 * </pre>
	 *
	 * @method Name : getMypageInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/mypage/mypageInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getMypageInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		/* Session 객체에서 로그인 정보를 가져온다. */
		String loginId = String.valueOf(SessionUtil.getAttribute("loginId"));

		/* Session 정보를 전송하기 위해 확인 */
		resultMap.put("loginId", loginId);
		resultMap.put("serviceType", "mypage");
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =", "test for notification service...");
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("results", resultMap);
		
		return "member/memberRegist";
	}
}