package com.nc.api.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpStatus;
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

import com.nc.api.service.APIServiceImpl;
import com.nc.api.service.CliAPIService;
import com.nc.api.validator.ApiCommonValidator;
import com.nc.api.validator.ResponseBean;
import com.nc.common.constants.APIConstants;
import com.nc.common.utils.StringUtil;

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
 * com.nc.api.controller : APIServiceController.java
 * @author creme55
 * @since 2016. 11. 21.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 11. 21.          creme55                  
 *
 * </pre>
 **/
@Controller
public class APIServiceController {
	private static final Logger log = LoggerFactory.getLogger(APIServiceController.class);
	
	@Autowired 
	private ApiCommonValidator validator;

	@Autowired
	private APIServiceImpl apiService;
	
	@Autowired
	private CliAPIService service;
	
	/**
	 * <pre>
	 * 1. 개요 : API 인터페이스 (시뮬레이터)
	 * 2. 처리내용 : 사업자 정보 조회 (jobNo, enprTp-1(소규모발전자원), 2(집합발전기자원))
	 * </pre>
	 *
	 * @method Name : getEnprInfoList
	 * @param request, httpRequest, model
	 * @return ModelMap
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/api/member/getEnprInfoList.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap getEnprInfoList(@RequestParam Map<String, Object> request, HttpServletRequest httpRequest, ModelMap model) throws Exception {
		ModelMap result = new ModelMap();
		ResponseBean respBean = new ResponseBean();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<ModelMap> resultList = new ArrayList<ModelMap>();
		
		if ("POST".equals(httpRequest.getMethod()) && "application/x-www-form-urlencoded".equals(httpRequest.getContentType())) {
			request = validator.getPostContents(httpRequest, request);
		}
		
		paramMap = validator.makeParamRequest(request, httpRequest);
		
		request.put("key", StringUtil.nvl(httpRequest.getHeader("x-etri-authorization"), ""));
		
		/* 
		 * 파라미터 및 정합성 체크 
		 * 0. Http Header Check 
		 */
		if (validator.isValidParam(request) != null) {
			return validator.isValidParam(request);
		}
		
		/* 입력 파라미터를 전송하기 위해 재구성 */
		respBean.getParams().putAll(paramMap);
		
		/* 
		 * 서비스 호출 
		 * 1. 사업자 정보 조회 
		 */
		List<?> tmpResult = apiService.getEnprInfoList("api.selectEnprInfoList", paramMap);
		
		/* 
		 * 서비스 호출 
		 * 2. 사업자 정보수 조회 
		 */
		int totalCount = apiService.getEnprInfoListCnt("api.selectEnprInfoListCnt", paramMap);
		
		try {
			if (tmpResult != null && tmpResult.size() > 0) {
				respBean.setStatus(HttpStatus.SC_OK, "Ok");
				
				for (int i = 0; i < tmpResult.size(); i++) {
					Map<String, Object> temp = (Map<String, Object>) tmpResult.get(i);
					ModelMap itemData = new ModelMap();
					
					for (String keyStr : temp.keySet()) {
						itemData.put(keyStr, temp.get(keyStr));
					}
					
					resultList.add(itemData);
				}
				
				ModelMap page = new ModelMap();
				page.put("page_no", 1);
				page.put("tuple_count", totalCount);
				respBean.setPaging(page);
				
				respBean.setItems(resultList);
				result.put("results", respBean.getResult());
			} else {
				result.put("results", respBean.getResultNoPage());
			}
		} catch(Exception err) {
			respBean.setStatus(Integer.valueOf(APIConstants.ERROR_SYSTEM.getCode()), "문제가 지속되면 시스템 관리자에게 문의하시기 바랍니다.");
			result.put("results", respBean.getResult(APIConstants.ERROR_SYSTEM.getCode()));
		}
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= Parameter is [{}] =", paramMap);
			log.debug("= Controller name is [{}] =", this.getClass().getMethods()[0].getName());
			log.debug("= Result is [{}] =", result);
			log.debug("==========================================================================================");
		}
		
		return result;
	}
	/**
	 * <pre>
	 * 1. 개요 : API 인터페이스 (시뮬레이터)
	 * 2. 처리내용 : 입찰정보 수신 (tenderDate)
	 * </pre>
	 *
	 * @method Name : getEnprInfoList
	 * @param request, httpRequest, model, respBean
	 * @return ModelMap
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/api/tender/putTndrInfoRgst.json", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ModelMap putTndrInfoRgst(@RequestParam Map<String, Object> request, HttpServletRequest httpRequest, ModelMap model, @RequestBody ResponseBean respBean ) throws Exception {
		
		ModelMap result = new ModelMap();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		request.put("key", StringUtil.nvl(httpRequest.getHeader("x-etri-authorization"), ""));
		
		paramMap = validator.makeParamRequest(request, httpRequest);
		/* 
		 * 파라미터 및 정합성 체크 
		 * 0. Http Header Check 
		 */
		if (validator.isValidParam(request) != null) {
			return validator.isValidParam(request);
		}
		
		respBean.getParams().putAll(paramMap);
				
		List<ModelMap> list = respBean.getItems();
		
		try {
			if (list != null && list.size() > 0) {
				respBean.setStatus(HttpStatus.SC_OK, "Ok");
				service.execTenerInfo(list);
				result.put("results", respBean.getResult());
			} else {
				result.put("results", respBean.getResultNoPage());
			}
		}catch(Exception err) {
			respBean.setStatus(Integer.valueOf(APIConstants.ERROR_SYSTEM.getCode()), "문제가 지속되면 시스템 관리자에게 문의하시기 바랍니다.");
			result.put("results", respBean.getResult(APIConstants.ERROR_SYSTEM.getCode()));
		}
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= Parameter is [{}] =", paramMap);
			log.debug("= Controller name is [{}] =", this.getClass().getMethods()[0].getName());
			log.debug("= Result is [{}] =", result);
			log.debug("==========================================================================================");
		}
		
		return result;
	}
}