package com.nc.api.validator;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.nc.common.constants.APIConstants;
import com.nc.common.dao.CommonDAO;
import com.nc.common.utils.HttpUtils;
import com.nc.common.utils.JsonUtils;
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
 * com.nc.api.validator : ApiCommonValidator.java
 * @author creme55
 * @since 2016. 11. 3.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       --------------------------------------
 *  2016. 11. 3.          creme55          최초 생성 (API 정합성 검사, validator)
 *
 * </pre>
 **/
@Service("validator")
public class ApiCommonValidator {
	private static Logger log = LoggerFactory.getLogger(ApiCommonValidator.class);
	private final int FETCH_ROWS = 20;
	
	@Autowired
	private CommonDAO commonDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 입력파라미터 정합성 점검
	 * 2. 처리내용 : 로그인 파라미터 점검
	 * </pre>
	 *
	 * @method Name : isValidParam
	 * @param request
	 * @return ModelMap
	 * @throws Exception
	 * 
	 */
	public ModelMap isValidParam(Map<String, Object> request) {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= validation check..... =");
			log.debug("==========================================================================================");
		}
		
		StringUtil strUtil = new StringUtil();
		ModelMap resultMap = null;
		ResponseBean respBean = new ResponseBean();

		String enprTp = StringUtil.nvl(request.get("enprTp"), "");
		String jobNo = StringUtil.nvl(request.get("jobNo"), "");
		
		respBean.getParams().putAll(request);
		
		if ("J00001".equals(jobNo)) {
			if (strUtil.isEmptyOrWhitespace(jobNo)) {
				respBean.setStatus(Integer.valueOf(APIConstants.ERROR_PARAMETER.getCode()), "작업번호가 입력되지 않았습니다.");
				resultMap = new ModelMap();
				resultMap.put("results", respBean.getResult());

				return resultMap;
			}
			
			if (strUtil.isEmptyOrWhitespace(enprTp)) {
				respBean.setStatus(Integer.valueOf(APIConstants.ERROR_PARAMETER.getCode()), "사용자 구분이 입력되지 않았습니다.");
				resultMap = new ModelMap();
				resultMap.put("results", respBean.getResult());

				return resultMap;
			}
		}else if ("J00005".equals(jobNo)) {
			String tender = StringUtil.nvl(request.get("tenderDate"), "");
			if (strUtil.isEmptyOrWhitespace(tender)) {
				respBean.setStatus(Integer.valueOf(APIConstants.ERROR_PARAMETER.getCode()), "판매희망일이 입력되지 않았습니다.");
				resultMap = new ModelMap();
				resultMap.put("results", respBean.getResult());

				return resultMap;
			}
		}
		
		return resultMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 입력 파라미터 정합성 점검
	 * 2. 처리내용 : POST일때 해당 컨텐츠를 가져오는 부분
	 * </pre>
	 *
	 * @method Name : getPostContents
	 * @param HttpServletRequest request
	 * @return String
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getPostContents(HttpServletRequest request, Map<String, Object> paramMap) throws Exception {
		String body = "";
		
		if ("POST".equals(request.getMethod())) {
			if (!"application/x-www-form-urlencoded".equals(request.getContentType())) {
				body = HttpUtils.getBodyConts(request, 1);
				Map<String, Object> tempMap = (Map<String, Object>)JsonUtils.exchangeJSONStrToMap(body);
				
				for(Map.Entry<String, Object> item : tempMap.entrySet() ){
					paramMap.put(item.getKey(), item.getValue());
				}
				
				if (log.isDebugEnabled()) {
					log.debug("==========================================================================================");
					log.debug("= body is [{}] =", body);
					log.debug("= body is [{}] =", request.getContentType());
					log.debug("==========================================================================================");
				}
			}
		}
		
		return paramMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : validator
	 * 2. 처리내용 : parameter 재구성
	 * </pre>
	 *
	 * @method Name : makeParamRequest
	 * @param request, httpRequest
	 * @return Map<String, Object>
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unused")
	public Map<String, Object> makeParamRequest(Map<String, Object> request, HttpServletRequest httpRequest) throws Exception {
		int pageNum = 1;
		int firstIndex = 0;
		String jobNo = StringUtil.nvl(request.get("jobNo"));
		String pageNo = StringUtil.nvl(request.get("pageNo"), "");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		/* 페이징 처리 : 현재 버젼에서는 페이징은 사용하지 않을 계획이나 향후를 위해 작성해 놓음 */
		pageNum = ("".equals(pageNo)) ? 1 : Integer.valueOf(pageNo);
		firstIndex = (pageNum - 1) * FETCH_ROWS;
		
		if ("J00001".equals(jobNo)) {
			paramMap.put("enprTp", StringUtil.nvl(request.get("enprTp"), ""));
		}
		
		/* 공통적인 파라미터, 향후를 위한 구조 */
		paramMap.put("key", StringUtil.nvl(httpRequest.getHeader("x-etri-authorization"), ""));
		
		return paramMap;
	}
}