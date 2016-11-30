package com.nc.common.spring;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.xml.XMLSerializer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;
import org.springframework.web.servlet.View;

import com.nc.common.CommonConstants;
import com.nc.common.constants.APIConstants;

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
 * com.nc.common.spring : APIXmlView.java
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
 *  2016. 10. 12.          creme55         최초 생성 (XML 랜더링 정의)
 *
 * </pre>
 **/
public class APIXmlView implements View {
	
	private static final Logger log = LoggerFactory.getLogger(APIXmlView.class);
	
	public static final String DEFAULT_CONTENT_TYPE = "application/xml";
	public static final String XML_KEY = "_xml";
	public static final String XML_ROOT_KEY = "_xml_root";
	public static final String XML_ELEMENT_KEY = "_xml_element";
	
	private String contentType = DEFAULT_CONTENT_TYPE;
	private String encoding = CommonConstants.DEFAULT_CHARSET;
	private XMLSerializer xmlSerializer;

	public APIXmlView() {
		setContentType(DEFAULT_CONTENT_TYPE);
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentType() {
		return this.contentType;
	}

	public void setEncoding(String encoding) {
		Assert.notNull(encoding, "'encoding' must not be null");
		this.encoding = encoding;
	}
	
	public void setXmlSerializer(XMLSerializer xmlSerializer) {
		this.xmlSerializer = xmlSerializer;
	}

	public void render(Map<String, ?> model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		PrintWriter out = null;

		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= XmlView Rendering... =");
			log.debug("==========================================================================================");
		}
		
		try {
			response.setContentType(getContentType());
			response.setCharacterEncoding(this.encoding);
			response.addHeader("Pragma", "no-cache");
			response.addHeader("Cache-Control", "no-cache, no-store, max-age=0");
			response.addDateHeader("Expires", 1L);
			
			JSON json = null;
			if (model.containsKey(APIConstants.ERROR_CODE_KEY.getCode()) || model.containsKey(APIConstants.ERROR_MESSAGE_KEY.getCode())) {
				Map<String, Object> errorMap = new HashMap<String, Object>();
				errorMap.put(APIConstants.ERROR_CODE_KEY.getCode(), model.get(APIConstants.ERROR_CODE_KEY.getCode()));
				errorMap.put(APIConstants.ERROR_MESSAGE_KEY.getCode(), model.get(APIConstants.ERROR_MESSAGE_KEY.getCode()));
				
				json = JSONSerializer.toJSON(errorMap);
				xmlSerializer.setRootName(APIConstants.ERROR_KEY.getCode());
			} else {
				String jsonStr = (String)model.get(XML_KEY);
				String rootName = "root";
				if ( model.containsKey(XML_ROOT_KEY) == true){
					rootName = (String)model.get(XML_ROOT_KEY);
				}
				
				String elementName = "element";
				if ( model.containsKey(XML_ELEMENT_KEY) == true){
					elementName = (String)model.get(XML_ELEMENT_KEY);
				}
				
				json = JSONSerializer.toJSON(jsonStr);
				xmlSerializer.setRootName(rootName);  
				xmlSerializer.setElementName(elementName);  
			}
			
			xmlSerializer.setTypeHintsEnabled(false);
			String xml = xmlSerializer.write(json, this.encoding);
			
			out = response.getWriter();
			out.print(xml);
			out.flush();
		} finally {
			if(out != null) {
				out.close();
			}
		}
	}
}