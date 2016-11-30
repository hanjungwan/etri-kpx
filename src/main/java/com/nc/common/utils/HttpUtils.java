package com.nc.common.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nc.common.CommonConstants;
import com.nc.common.exception.NCException;

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
 * com.nc.common.utils : HttpUtils.java
 * @author creme55
 * @since 2016. 11. 21.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -----------------------------
 *  2016. 11. 21.          creme55         http 관련 유틸리티
 *
 * </pre>
 **/
public class HttpUtils {
	private static final Logger log = LoggerFactory.getLogger(HttpUtils.class);
	
	@Value(value="#{global['server.openAPI']}")
	private String serverOpenAPI;
	
	public static final String HTTP_CONTENT = "target";
	
	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI 요청
	 * </pre>
	 *
	 * @method Name : execOpenAPI
	 * @param String subUrl, Map<String, Object> paramMap, String method
	 * @return String
	 * @throws Exception
	 * 
	 */
	public String execOpenAPI(String subUrl, Map<String, Object> paramMap, String method) throws Exception {
		String result = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		
		try {
			RequestBuilder requestBuilder = null;
			
			if ("get".equals(method)) {
				requestBuilder = RequestBuilder.get();
			} else {
				requestBuilder = RequestBuilder.post();
			}
			
			requestBuilder = requestBuilder.setUri(new URI(serverOpenAPI + subUrl));
			Iterator<String> iter = paramMap.keySet().iterator();
			String key = null;
			String val = null;
			while(iter.hasNext()) {
				key = iter.next();
				val = (String)paramMap.get(key);
				requestBuilder.addParameter(key, val);
			}

			HttpUriRequest httpPost = requestBuilder.build();
			
			if (log.isDebugEnabled()) {
				log.debug("==========================================================================================");
				log.debug("= API 서버 요청 : [{}]", httpPost);
				log.debug("= API 서버 요청 파라미터 : [{}]", requestBuilder.getParameters());
				log.debug("==========================================================================================");
			}
			
			CloseableHttpResponse response = httpclient.execute(httpPost);
			StatusLine statusLine = response.getStatusLine();
			
			if (log.isDebugEnabled()) {
				log.debug("==========================================================================================");
				log.debug("= API 서버 응답 : [{}] =", statusLine);
				log.debug("==========================================================================================");
			}
			
			try {
				if(statusLine.getStatusCode() == HttpStatus.SC_OK) {
					HttpEntity entity = response.getEntity();
					if (entity != null) {
						result = EntityUtils.toString(entity, CommonConstants.DEFAULT_CHARSET);
						if (log.isDebugEnabled()) {
							log.debug("==========================================================================================");
							log.debug("= API 서버 요청 결과 : [{}] =", result);
							log.debug("==========================================================================================");
						}
		            }
					EntityUtils.consume(entity);
				}
			} finally {
                response.close();
            }
		} finally {
            httpclient.close();
        }
		return result;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI Multipart 요청
	 * </pre>
	 *
	 * @method Name : execOpenAPIMultipart
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return String
	 * @throws Exception
	 * 
	 */
	public String execOpenAPIMultipart(String subUrl, Map<String, Object> paramMap) throws Exception {
		String result = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			
			HttpPost httpPost = new HttpPost(new URI(serverOpenAPI + subUrl));
			// httpPost.addHeader("Content-Type", "application/json");
			
			MultipartEntityBuilder multipartEntityBuilder = MultipartEntityBuilder.create()
					.setMode(HttpMultipartMode.BROWSER_COMPATIBLE)
					.setCharset(Charset.forName(CommonConstants.DEFAULT_CHARSET));
			
			Iterator<String> iter = paramMap.keySet().iterator();
			String key = null;
			String val = null;

			while (iter.hasNext()) {
				key = iter.next();
				val = (String)paramMap.get(key);
				
				if (log.isDebugEnabled()) {
					log.debug("==========================================================================================");
					log.debug(" = 파라미터 : [{} - {}] =", key, val);
					log.debug("==========================================================================================");
				}
				
				multipartEntityBuilder.addTextBody(key, val);
			}
			httpPost.setEntity(multipartEntityBuilder.build());
			
			if (log.isDebugEnabled()) {
				log.debug("==========================================================================================");
				log.debug("= API 서버 요청 : [{}]", httpPost);
				log.debug("==========================================================================================");
			}
			
			CloseableHttpResponse response = httpclient.execute(httpPost);
			StatusLine statusLine = response.getStatusLine();
			
			if (log.isDebugEnabled()) {
				log.debug("==========================================================================================");
				log.debug("= API 서버 응답 : [{}]", statusLine);
				log.debug("==========================================================================================");
			}
			
			try {
				if (statusLine.getStatusCode() == HttpStatus.SC_OK) {
					HttpEntity entity = response.getEntity();
					if (entity != null) {
						result = EntityUtils.toString(entity, CommonConstants.DEFAULT_CHARSET);
						if (log.isDebugEnabled()) {
							log.debug("==========================================================================================");
							log.debug("= API 서버 요청 결과 : [{}] =", result);
							log.debug("==========================================================================================");
						}
		            }
					EntityUtils.consume(entity);
				}
			} finally {
                response.close();
            }
		} finally {
            httpclient.close();
        }
		return result;
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI Content 요청
	 * </pre>
	 *
	 * @method Name : execOpenAPIContent
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return String
	 * @throws Exception
	 * 
	 */
	public String execOpenAPIContent(String subUrl, Map<String, Object> paramMap) throws Exception {
		String result = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			RequestBuilder requestBuilder = RequestBuilder
				.post()
				.setUri(new URI(serverOpenAPI + subUrl))
				.setEntity(new StringEntity((String)paramMap.get(HTTP_CONTENT), CommonConstants.DEFAULT_CHARSET));
			
			HttpUriRequest httppost = requestBuilder.build();
			
			if (log.isDebugEnabled()) {
				log.debug("==========================================================================================");
				log.debug("= API 서버 요청 : [{}]", httppost);
				log.debug("= API 서버 요청 파라미터 : [{}]", paramMap.get(HTTP_CONTENT));
				log.debug("==========================================================================================");
			}
			
			CloseableHttpResponse response = httpclient.execute(httppost);
			StatusLine statusLine = response.getStatusLine();
			
			if (log.isDebugEnabled()) {
				log.debug("==========================================================================================");
				log.debug("= API 서버 응답 : [{}] =", statusLine);
				log.debug("==========================================================================================");
			}
			
			try {
				if (statusLine.getStatusCode() == HttpStatus.SC_OK) {
					HttpEntity entity = response.getEntity();
					if (entity != null) {
						result = EntityUtils.toString(entity, CommonConstants.DEFAULT_CHARSET);
						
						if (log.isDebugEnabled()) {
							log.debug("==========================================================================================");
							log.debug("= API 서버 요청 결과 : {[}]", result);
							log.debug("==========================================================================================");
						}
		            }
					EntityUtils.consume(entity);
				}
			} finally {
                response.close();
            }
		} finally {
            httpclient.close();
        }
		return result;
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : 
	 * </pre>
	 *
	 * @method Name : getOpenAPI
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return String
	 * @throws 
	 * 
	 */
	public String getOpenAPI(String subUrl, Map<String, Object> paramMap) throws Exception {
		return execOpenAPI(subUrl, paramMap, "get");
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : 
	 * </pre>
	 *
	 * @method Name : postOpenAPI
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return String
	 * @throws Exception
	 * 
	 */
	public String postOpenAPI(String subUrl, Map<String, Object> paramMap) throws Exception {
		return execOpenAPI(subUrl, paramMap, "post");
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI 요청 (Map) - GET
	 * </pre>
	 *
	 * @method Name : getOpenAPIToMap
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return Map<String, String> 
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> getOpenAPIToMap(String subUrl, Map<String, Object> paramMap) throws Exception {
		String result = getOpenAPI(subUrl, paramMap);
		StringUtil stringUtil = new StringUtil();

		if (stringUtil.isEmptyOrWhitespace(result)) {
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		return (Map<String, String>)mapper.readValue(result, Map.class);
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI 요청 (Map) - POST
	 * </pre>
	 *
	 * @method Name : postOpenAPIToMap
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return Map<String, String>
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> postOpenAPIToMap(String subUrl, Map<String, Object> paramMap) throws Exception {
		String result = postOpenAPI(subUrl, paramMap);
		StringUtil stringUtil = new StringUtil();
		
		if (stringUtil.isEmptyOrWhitespace(result)) {
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		return (Map<String, String>)mapper.readValue(result, Map.class);
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI Multipart 요청
	 * </pre>
	 *
	 * @method Name : multipartOpenAPI
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return String
	 * @throws Exception
	 * 
	 */
	public String multipartOpenAPI(String subUrl, Map<String, Object> paramMap) throws Exception {
		return execOpenAPIMultipart(subUrl, paramMap);
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI Multipart 요청 (Map)
	 * </pre>
	 *
	 * @method Name : multipartOpenAPIToMap
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return Map<String, String>
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> multipartOpenAPIToMap(String subUrl, Map<String, Object> paramMap) throws Exception {
		String result = execOpenAPIMultipart(subUrl, paramMap);
		StringUtil stringUtil = new StringUtil();
		
		if (stringUtil.isEmptyOrWhitespace(result)) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		return (Map<String, String>)mapper.readValue(result, Map.class);
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI Content 요청
	 * </pre>
	 *
	 * @method Name : contentOpenAPI
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return String
	 * @throws Exception
	 * 
	 */
	public String contentOpenAPI(String subUrl, Map<String, Object> paramMap) throws Exception {
		return execOpenAPIContent(subUrl, paramMap);
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : OpenAPI Content 요청 (Map)
	 * </pre>
	 *
	 * @method Name : contentOpenAPIToMap
	 * @param String subUrl, Map<String, Object> paramMap
	 * @return Map<String, String>
	 * @throws Exception
	 * 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> contentOpenAPIToMap(String subUrl, Map<String, Object> paramMap) throws Exception {
		String result = execOpenAPIContent(subUrl, paramMap);
		StringUtil stringUtil = new StringUtil();
		
		if (stringUtil.isEmptyOrWhitespace(result)) {
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		return (Map<String, String>)mapper.readValue(result, Map.class);
	}

	/**
	 * <pre>
	 * 1. 개요 : http 요청 처리
	 * 2. 처리내용 : POST 요청에 대한 response body 처리 (multipart / urlencode)
	 * </pre>
	 *
	 * @method Name : getBodyConts
	 * @param HttpServletRequest request, int type
	 * @return String
	 * @throws Exception
	 * 
	 */
	public static String getBodyConts(HttpServletRequest request, int type) throws Exception {
		int loopNo = 1;
		String body = null;
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;
 
		try {
			InputStream inputStream = request.getInputStream();
			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				String line = "";
				while ((line = bufferedReader.readLine()) != null) {
					if (type == 1) {
						if (loopNo == 2 || loopNo == 4) {
							if (loopNo == 2) {
								line = line.substring(line.indexOf("=") + 1, line.length());
							} else if (loopNo == 4) {
								if (line.indexOf("pageNo") > 0) {
									line = ":" + line + ",";
								} else {
									line = ":\"" + line + "\",";
								}
							}
							stringBuilder.append(line);
						}
						
						loopNo++;
						
						if (loopNo > 4) {
							loopNo = 1;
						}
					} else if (type == 2) {
						stringBuilder.append(line);
					}
				}
			}
		} catch (IOException ex) {
			throw new NCException(ex.getMessage(), ex);
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {
					throw new NCException(ex.getMessage(), ex);
				}
			}
		}
 
		body = stringBuilder.toString();
		
		if (type == 1) {
			body = body.substring(0, body.length() - 1);
			body = "{" + body + "}";
		}
		
		return body;
	}	
}