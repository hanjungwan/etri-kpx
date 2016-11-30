package com.nc.common.utils.param;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

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
 * com.nc.common.utils.param : ParamHiddenTag.java
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
 *  2016. 10. 12.          creme55         최초 생성(파라미터 HTML Hidden Tag 관리)
 *
 * </pre>
 **/
@SuppressWarnings("serial")
public class ParamHiddenTag extends TagSupport {

	private Map<String, Object> paramMap;
	private String update;
	private boolean requestUse = false;
	private final String hiddenTagFormat = "<input type=\"hidden\" name=\"%s\" value=\"%s\" />";
	
	
	@SuppressWarnings("unchecked")
	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
			
			Map<String, Object> params = null;
			
			if (requestUse) {
				params = ParamUtil.getParamMap(request, update);
			} else {
				if (paramMap == null) {
					Map<String, Object> orgParamMap = (Map<String, Object>)request.getAttribute("paramMapOrg");
					params = new HashMap<String, Object>();
					if(orgParamMap != null) {
						params.putAll(orgParamMap);
					}
				} else {
					params = new HashMap<String, Object>(paramMap);
				}
				
				if (params.size() == 0) {
					params = ParamUtil.getParamMap(request, update);
				} else {
					params = ParamUtil.getParamMap(params, update);
				}
			}
			
			printHiddenTag(params, out);
			return SKIP_BODY;
		} catch (Exception e) {
			throw new JspException(e.toString(), e);
		}
	}
	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : HTML Tag 출력 
	 * 2. 처리내용 : HTML Hidden Tag 출력
	 * </pre>
	 *
	 * @method Name : printHiddenTag
	 * @param params, out 
	 * @return void
	 * @throws Exception
	 * 
	 */
	private void printHiddenTag(Map<String, Object> params, JspWriter out) throws Exception {
		if(params != null) {
			Iterator<String> iter = params.keySet().iterator();
			String key = null;
			String value = null;
			while(iter.hasNext()) {
				key = iter.next();
				value = String.valueOf(params.get(key));
				if(!Strings.isNullOrEmpty(value)) {
					out.println(String.format(hiddenTagFormat, key, value));
				}
			}
		}
	}
	
	public Map<String, Object> getParamMap() {
		return paramMap;
	}

	public void setParamMap(Map<String, Object> paramMap) {
		this.paramMap = paramMap;
	}

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}

	public boolean isRequestUse() {
		return requestUse;
	}

	public void setRequestUse(boolean requestUse) {
		this.requestUse = requestUse;
	}
}