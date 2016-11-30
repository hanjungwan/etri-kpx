package com.nc.common.utils.param;

import java.util.HashMap;
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
 * com.nc.common.utils.param : ParamTag.java
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
 *  2016. 10. 12.          creme55         최초 생성 (파라미터 관리)                  
 *
 * </pre>
 **/
@SuppressWarnings("serial")
public class ParamTag extends TagSupport {

	private Map<String, Object> paramMap;
	private String update;
	private String prefix = "?";
	private boolean requestUse = false;
	
	@SuppressWarnings("unchecked")
	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
			String param = null;
			
			if (requestUse) {
				param = ParamUtil.getParam(request, update);
			} else {
				Map<String, Object> params = null;
				if (paramMap == null) {
					Map<String, Object> paramMapOrg = (Map<String, Object>)request.getAttribute("paramMapOrg");
					params = new HashMap<String, Object>();
					if (paramMapOrg != null) {
						params.putAll(paramMapOrg);
					}
				} else {
					params = new HashMap<String, Object>(paramMap);
				}
				
				if(params.size() == 0) {
					param = ParamUtil.getParam(request, update);
				} else {
					param = ParamUtil.getParam(params, update);
				}
			}
			
			if(!Strings.isNullOrEmpty(param)) {
				param = prefix + param;
			}
			
			out.print(param);

			return SKIP_BODY;
		} catch (Exception e) {
			throw new JspException(e.toString(), e);
		}
	}
	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
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

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public boolean isRequestUse() {
		return requestUse;
	}

	public void setRequestUse(boolean requestUse) {
		this.requestUse = requestUse;
	}
}