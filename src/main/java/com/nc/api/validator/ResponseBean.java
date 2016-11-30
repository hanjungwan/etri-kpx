package com.nc.api.validator;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;

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
 * com.nc.api.validator : ResponseBean.java
 * @author creme55
 * @since 2016. 11. 3.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       ----------------------------------------------------
 *  2016. 11. 3.          creme55          최초 생성 (요청에 대한 전송을 위한 데이터 생성 객체)
 *
 * </pre>
 **/
public class ResponseBean {
	private static Logger log = LoggerFactory.getLogger(ResponseBean.class);
	
	private ModelMap result;
	private ModelMap status;
	private ModelMap params;
	private ModelMap paging;
	
	private List<ModelMap> items;	
	private ModelMap item;
		
	public ModelMap getResult() {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= making the result ..... =");
			log.debug("==========================================================================================");
		}
		
		if (result == null) {
			result = new ModelMap();		
		}

		result.put("status", this.getStatus());
		result.put("params", this.getParams());
		result.put("paging", this.getPaging());		
		result.put("items",  this.getItems());
		
		ModelMap logMap = new ModelMap();		
		logMap.put("results", result);
		
		return result;
	}
	
	public ModelMap getResultNoPage() {
		if (result == null) result = new ModelMap();		
		result.put("status", this.getStatus());
		result.put("params", this.getParams());	
		result.put("paging", this.getPaging());		
		result.put("items",  this.getItems());	
		
		ModelMap logMap = new ModelMap();		
		logMap.put("results", result);	

		return result;
	}
	
	public ModelMap getResultItem() {
		if (result == null) result = new ModelMap();
		
		result.put("status", this.getStatus());
		result.put("params", this.getParams());
		result.put("paging", this.getPaging());		
		result.put("items",  this.getItem());	
		
		ModelMap logMap = new ModelMap();		
		logMap.put("results", result);	

		return result;
	}
	
	public ModelMap getResult(String error) {
		
		if (result == null) result = new ModelMap();
		
		result.put("status", this.getStatus());
		result.put("params", this.getParams());
		
		ModelMap logMap = new ModelMap();		
		logMap.put("results", result);
		
		return result;
	}
	
	public ModelMap getStatus() {
		if (status == null) status = new ModelMap();
		
		return status;
	}

	public ModelMap getParams() {
		if (params == null) params = new ModelMap();
		return params;
	}

	public ModelMap getPaging() {
		if (paging == null) paging = new ModelMap();
		return paging;
	}

	public List<ModelMap> getItems() {
		if (items == null) items = new ArrayList<ModelMap>();
		return items;
	}
	
	public ModelMap getItem() {
		if (item == null) item = new ModelMap();
		return item;
	}

	public void setStatus(int code, String message) {
		status = new ModelMap();
		if ("200".equals(code + "")) {		
			status.put("code", code + "");
			status.put("msg", message);
		} else if ("204".equals(code + "")) {
			status.put("code", code + "");
			status.put("msg", message);
		} else if ("400".equals(code + "")) {
			status.put("code", code + "");
			status.put("msg", message);
		} else if ("405".equals(code + "")) {
			status.put("code", code + "");
			status.put("msg", message);
		} else if ("500".equals(code + "")) {
			status.put("code", code + "");
			status.put("msg", message);
		} else {
			status.put("code", "503");
			status.put("msg", "Service Unavailable");
		}		
	}
	
	public void setPaging(ModelMap data) {
		if (paging == null) {
			paging = new ModelMap();
		}
		
		paging.addAllAttributes(data);
	}

	public void setParams(ModelMap params) {
		if (params == null) {
			params = new ModelMap();
		}
		
		params.addAttribute(params);
	}

	public void setItems(List<ModelMap> data) {
		if (items == null) {
			items = new ArrayList<ModelMap>();
		}
		
		items = data;			
	}
	
	public void setItem(ModelMap data) {
		if (item == null) {
			item = new ModelMap();
		}
		
		item.addAllAttributes(data);			
	}
}