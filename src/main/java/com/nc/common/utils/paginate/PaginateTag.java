package com.nc.common.utils.paginate;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.web.context.WebApplicationContext;
//import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.util.UrlPathHelper;

import com.nc.common.utils.param.ParamUtil;

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
 * com.nc.common.utils.paginate : PaginateTag.java
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
 *  2016. 10. 12.          creme55         최초 생성(페이징 처리 TAG 처리)
 *
 * </pre>
 **/
@SuppressWarnings("serial")
public class PaginateTag extends TagSupport {

	private static final Logger log = LoggerFactory.getLogger(PaginateTag.class);
	
	private Map<String, Object> paramMap = null;
	
	private Map<String, Object> paramMapOrg = null;
	
	private String pageParamSuffix = "";

	public Map<String, Object> getParamMap() {
		return paramMap;
	}

	public void setParamMap(Map<String, Object> paramMap) {
		this.paramMap = paramMap;
	}
	
	public Map<String, Object> getParamMapOrg() {
		return paramMapOrg;
	}

	public void setParamMapOrg(Map<String, Object> paramMapOrg) {
		this.paramMapOrg = paramMapOrg;
	}

	public String getPageParamSuffix() {
		return pageParamSuffix;
	}

	public void setPageParamSuffix(String pageParamSuffix) {
		this.pageParamSuffix = pageParamSuffix;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = null;

		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= PagenateTag doEndTag... =");
			log.debug("==========================================================================================");
		}
		
		try {
			out = pageContext.getOut();
			/*WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());*/
			HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
			String url = new UrlPathHelper().getOriginatingRequestUri(request) + "?";
			
			Map<String, Object> param = null;
			if (this.paramMap == null) {
				Map<String, Object> paramMap = (Map<String, Object>)request.getAttribute("paramMap");
				param = new HashMap<String, Object>();
				if (paramMap != null) {
					param.putAll(paramMap);
				}
			} else {
				param = new HashMap<String, Object>(this.paramMap);
			}
			
			if (param == null || param.size() == 0) {
				throw new Exception("[" + "paramMap" + "] 정의되지 않았습니다.");
			}
			
			Paginate paginate = (Paginate)param.get("PAGENATE" + pageParamSuffix);
			
			if (paginate == null) {
				throw new Exception("[" + "PAGINATE" + pageParamSuffix + "] 정의되지 않았습니다.");
			}
			
			Map<String, Object> paramOrg = null;
			if (this.paramMapOrg == null) {
				Map<String, Object> paramMapOrg = (Map<String, Object>)request.getAttribute("paramMapOrg");
				paramOrg = new HashMap<String, Object>();
				if (paramMapOrg == null) {
					paramOrg = ParamUtil.getParamMap(request);
				} else {
					paramOrg.putAll(paramMapOrg);
				}
			} else {
				paramOrg = new HashMap<String, Object>(this.paramMapOrg);
			}
			
			int currPage = paginate.getCurrPage();
			int totalPages = paginate.getTotalPages();
			int startPage = paginate.getStartPage();
			int endPage = paginate.getEndPage();
			int prevPage = paginate.getPrevPage();
			int nextPage = paginate.getNextPage();
			
			String pageParam = paginate.getPageParam();
			
			StringBuffer sb = new StringBuffer();
			sb.append("<div class=\"paginate\">\n");
			
			if(prevPage > 0) {
				sb.append(MessageFormat.format("<a href=\"{0}\" class=\"pre\"><span><span>&lt;</span>이전</span></a>\n", new Object[]{url + ParamUtil.getParam(paramOrg, pageParam + "=" + prevPage)}));
			} else {
				sb.append("<strong class=\"pre\"><span><span>&lt;</span>이전</span></strong>\n");
			}
			
			for(int i=startPage; i<=endPage; i++) {
				if(i == currPage) {
					sb.append(MessageFormat.format("<strong><span>{0}</span></strong>\n", new Object[]{i}));
				} else {
					sb.append(MessageFormat.format("<a href=\"{0}\"><span>{1}</span></a>\n", new Object[]{url + ParamUtil.getParam(paramOrg, pageParam + "=" + i), i}));
				}
			}
			
			if(endPage < totalPages) {
				sb.append(MessageFormat.format("<a href=\"{0}\" class=\"next\"><span>다음<span>&gt;</span></span></a>\n", new Object[]{url + ParamUtil.getParam(paramOrg, pageParam + "=" + nextPage)}));
			} else {
				sb.append("<strong class=\"next\"><span>다음<span>&gt;</span></span></strong>\n");
			}
			sb.append("</div>");
			
			out.println(sb.toString());
			
		} catch (Exception e) {
			throw new JspException(e.toString(), e);
		}
		return EVAL_PAGE;
	}
}