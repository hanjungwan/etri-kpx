package com.nc.meteringControl.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nc.businessManagement.service.BusinessManagementService;
import com.nc.common.utils.FileMngUtil;
import com.nc.commonservice.service.CommonService;
import com.nc.meteringControl.service.MeteringControlService;

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
 * com.nc.commonservice.controller : CommonServiceController.java
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
 *  2016. 10. 13.          creme55         최초 생성(공통 서비스 Controller)
 *
 * </pre>
 **/
@Controller
public class MeteringControlServiceController{
	private static final Logger log = LoggerFactory.getLogger(MeteringControlServiceController.class);
	
	@Autowired
	private MeteringControlService meteringControlService;			/* 공통 서비스 */

	/**
	 * <pre>
	 * 1. 개요 : 메인페이지 호출
	 * 2. 처리내용 : 메인페이지로 이동 처리
	 * </pre>
	 *
	 * @method Name : mainServicePage
	 * @param 
	 * @return 
	 * @throws
	 * 
	 */
	@RequestMapping(value="/meteringControl/meteringControl.do", method={RequestMethod.GET, RequestMethod.POST})
	public String meteringControlServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		return "meteringControl/meteringControl";
	}
	
	@Value(value="#{global['download_path']}")
	private String serverPath;
	
}