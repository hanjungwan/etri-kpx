package com.nc.contractManagement.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nc.businessManagement.service.BusinessManagementService;
import com.nc.common.utils.FileMngUtil;
import com.nc.commonservice.service.CommonService;
import com.nc.contractManagement.service.ContractManagementService;

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
public class ContractManagementServiceController{
	private static final Logger log = LoggerFactory.getLogger(ContractManagementServiceController.class);
	
	@Autowired
	private ContractManagementService contractManagementService;			/* 공통 서비스 */

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
	@RequestMapping(value="/contractManagement/contractManagement.do", method={RequestMethod.GET, RequestMethod.POST})
	public String contractManagementServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List result;
		try {
			result = contractManagementService.getDataList("contractManagement.selectContractManagementList", paramMap);

			ObjectMapper om = new ObjectMapper();
			String jsonStr = om.writeValueAsString(result);
			
//			System.out.println(jsonStr);
			model.addAttribute("results", result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "contractManagement/contractManagement";
	}
	@RequestMapping(value="/contractManagement/contractManagementAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
	public String contractManagementAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List result;
		try {
			result = contractManagementService.getDataList("contractManagement.selectContractManagement", paramMap);

			ObjectMapper om = new ObjectMapper();
			String jsonStr = om.writeValueAsString(result);
			
//			System.out.println(jsonStr);
			model.addAttribute("results", result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "contractManagement/contractManagementAddNModify";
	}

	@ResponseBody
	@RequestMapping(value="/contractManagement/contractManagementAddCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int resourceAddCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;		
		result = contractManagementService.putData("contractManagement.insertContractManagement", paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/contractManagement/contractManagementModCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int resourceModCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;
		result = contractManagementService.putData("contractManagement.updateContractManagement", paramMap);
		return result;
	}
	@Value(value="#{global['download_path']}")
	private String serverPath;
	
}