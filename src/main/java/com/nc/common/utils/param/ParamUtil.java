package com.nc.common.utils.param;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import com.google.common.base.Strings;

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
 * com.nc.common.utils.param : ParamUtil.java
 * @author creme55
 * @since 2016. 10. 12.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 12.          creme55         최초 생성 (파라미터 관련 유틸리티)
 *
 * </pre>
 **/
public class ParamUtil {
	
	private static final String patten = "^(.*)=(.*)$";
	private static final Pattern paramPatten = Pattern.compile(patten, Pattern.MULTILINE);
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터 맵을 문자열로 변환
	 * </pre>
	 *
	 * @method Name : getParam
	 * @param params
	 * @return String
	 * @throws Exception
	 * 
	 */
	public static String getParam(Map<?, ?> params) throws Exception {
		if(params == null) {
			return "";
		}
		
		StringBuffer sb = new StringBuffer();
		Iterator<?> iter = params.keySet().iterator();
		
		String key = null;
		String value = null;
		while (iter.hasNext()) {
			key = String.valueOf(iter.next());
			value = String.valueOf(params.get(key));
			if (!Strings.isNullOrEmpty(value))
				sb.append(key + "=" + value + "&");
		}
		return sb.toString().replaceAll("&$", "");
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터 맵을 문자열로 변환하여 관리
	 * </pre>
	 *
	 * @method Name : getParam
	 * @param params, update 
	 * @return String
	 * @throws Exception
	 * 
	 */
	public static String getParam(Map<String, Object> params, String update) throws Exception {
		if(params == null) {
			return "";
		}
		if(!Strings.isNullOrEmpty(update)) {
			String newParam = update.replaceAll("^\\?", "");
			String newParamToken[] = newParam.split("&");
			int newParamTokenCnt = newParamToken.length;
			Matcher newParamMatcher = null;
			String newParamName = null;
			String newParamValue = null;
			for(int i=0; i<newParamTokenCnt; i++) {
				newParamMatcher = paramPatten.matcher(newParamToken[i]);
				newParamName = newParamMatcher.replaceAll("$1");
				if(!Strings.isNullOrEmpty(newParamName)) {
					newParamValue = newParamMatcher.replaceAll("$2");
					params.put(newParamName, newParamValue);
				}
			}
		}
		return getParam(params);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터 맵 변환
	 * </pre>
	 *
	 * @method Name : getParamMap
	 * @param params, update
	 * @return Map<String, Object>
	 * @throws Exception
	 * 
	 */
	public static Map<String, Object> getParamMap(Map<String, Object> params, String update) throws Exception {
		if(params == null) {
			return params;
		}
		if(!Strings.isNullOrEmpty(update)) {
			String newParam = update.replaceAll("^\\?", "");
			String newParamToken[] = newParam.split("&");
			int newParamTokenCnt = newParamToken.length;
			Matcher newParamMatcher = null;
			String newParamName = null;
			String newParamValue = null;
			for(int i=0; i<newParamTokenCnt; i++) {
				newParamMatcher = paramPatten.matcher(newParamToken[i]);
				newParamName = newParamMatcher.replaceAll("$1");
				if(!Strings.isNullOrEmpty(newParamName)) {
					newParamValue = newParamMatcher.replaceAll("$2");
					if(Strings.isNullOrEmpty(newParamValue)) {
						params.remove(newParamName);
					} else {
						params.put(newParamName, newParamValue);
					}
				}
			}
		}
		return params;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터를 맵으로 변환
	 * </pre>
	 *
	 * @method Name : getParamMap
	 * @param request 
	 * @return Map<String, Object>
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getParamMap(HttpServletRequest request) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Enumeration<String> enumeration = request.getParameterNames();
        do {
            if(!enumeration.hasMoreElements()) {
            	break;
            }
            String key = enumeration.nextElement();
            String values[] = request.getParameterValues(key);
            if(values != null) {
            	if(values.length == 1) {
            		paramMap.put(key, values[0]);
            	} else {
            		for(int i=0, s=values.length; i<s; i++) {
            			values[i] = values[i];
            		}
            		paramMap.put(key, values);
            	}
            }
        } while(true);
        return paramMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터를 맵으로 변환, 관리
	 * </pre>
	 *
	 * @method Name : getParamMap
	 * @param request, update 
	 * @return Map<String, Object>
	 * @throws Exception
	 * 
	 */
	public static Map<String, Object> getParamMap(HttpServletRequest request, String update) throws Exception {
		Map<String, Object> paramMap = getParamMap(request);
		return getParamMap(paramMap, update);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터를 문자열로 변환
	 * </pre>
	 *
	 * @method Name : getParam
	 * @param request 
	 * @return String
	 * @throws Exception
	 * 
	 */
	public static String getParam(HttpServletRequest request) throws Exception {
		Map<String, Object> paramMap = getParamMap(request);
		return getParam(paramMap);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터를 문자열로 변환, 관리
	 * </pre>
	 *
	 * @method Name : getParam
	 * @param request, update 
	 * @return String
	 * @throws Exception
	 * 
	 */
	public static String getParam(HttpServletRequest request, String update) throws Exception {
		Map<String, Object> paramMap = getParamMap(request);
		return getParam(paramMap, update);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터에서 주어진 파라미터를 맵으로 재구성
	 * </pre>
	 *
	 * @method Name : selectParamMap
	 * @param params, key 
	 * @return Map<String, Object>
	 * @throws Exception
	 * 
	 */
	public static Map<String, Object> selectParamMap(Map<String, Object> params, String...keys) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(keys != null) {
			Object value = null;
			for(String key : keys) {
				value = params.get(key);
				if(value != null) {
					if(value instanceof String) {
						paramMap.put(key, value);
					}
				}
			}
		}
		return paramMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 파라미터 변환 
	 * 2. 처리내용 : 파라미터에서 주어진 파라미터를 추출
	 * </pre>
	 *
	 * @method Name : selectParam
	 * @param params, key 
	 * @return String
	 * @throws Exception
	 * 
	 */
	public static String selectParam(Map<String, Object> params, String...keys) throws Exception {
		Map<String, Object> paramMap = selectParamMap(params, keys);
		return getParam(paramMap);
	}
}