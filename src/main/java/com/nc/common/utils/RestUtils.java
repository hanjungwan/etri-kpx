package com.nc.common.utils;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.nc.api.validator.CliResponseBean;
import com.nc.api.validator.ResponseBean;
import com.nc.common.dao.CommonDAO;

@Component
public class RestUtils {
	
	@Autowired
	private CommonDAO dao;
	
	public CliResponseBean execOpenAPI(String uri, String method, Map<String, Object> params) throws Exception{
			
		Map<String, String> urlInfo = (Map<String, String>) dao.getMapResult("api.selectOpenAPI");
					
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromUriString(urlInfo.get("CODE_NM")+uri);
		if(params != null) {
			Iterator<String>  it = (Iterator<String>)params.keySet().iterator();
			while(it.hasNext()){
				String keyStr = it.next();
				uriComponentsBuilder.queryParam(keyStr, params.get(keyStr));
			}
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("x-etri-authorization", "");
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED); 
		HttpEntity requestEntity =  new  HttpEntity (headers);
		ResponseEntity<CliResponseBean> response = new RestTemplate().exchange(uriComponentsBuilder.build().encode().toString(), 
				HttpMethod.GET, requestEntity, 
				CliResponseBean.class);
		
		return response.getBody();
	}
	
	public CliResponseBean postOpenAPI(String uri, String method, Map<String, Object> params, List<ModelMap> list) throws Exception{
		
		Map<String, String> urlInfo = (Map<String, String>) dao.getMapResult("api.selectOpenAPI");
		
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromUriString(urlInfo.get("CODE_NM")+uri);
		if(params != null) {
			Iterator<String>  it = (Iterator<String>)params.keySet().iterator();
			while(it.hasNext()){
				String keyStr = it.next();
				uriComponentsBuilder.queryParam(keyStr, params.get(keyStr));
			}
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("x-etri-authorization", "");
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_FORM_URLENCODED));
		headers.setContentType(MediaType.APPLICATION_JSON); 
		ResponseBean respBean = new ResponseBean();

		respBean.setItems(list);
		HttpEntity requestEntity =  new  HttpEntity (respBean, headers);
		
		RestTemplate rest = new RestTemplate();
		ResponseEntity<CliResponseBean> response = rest.exchange(uriComponentsBuilder.build().encode().toString(), 
				HttpMethod.POST, requestEntity, CliResponseBean.class);
		
		return response.getBody();
	}
}
