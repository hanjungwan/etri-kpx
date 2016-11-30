package com.nc.api.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nc.api.service.CliAPIService;
import com.nc.api.validator.CliResponseBean;
import com.nc.common.utils.RestUtils;

@Controller
public class ClientAPIController {
	
	private static final Logger log = LoggerFactory.getLogger(ClientAPIController.class);
	
	@Autowired
	private RestUtils rest;
	
	@Autowired
	private CliAPIService service;
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/cli/getEnprInfoList.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap getEnprInfoList(@RequestParam Map<String, Object> request, HttpServletRequest httpRequest, ModelMap model){
		ModelMap result = new ModelMap();
		try {
			rest.execOpenAPI("/api/member/getEnprInfoList.json", "get", request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		/*request.put("jobNo", 	"J00001");
		
		CliResponseBean res;
		ModelMap result = new ModelMap();
		try {
			
			res = rest.execOpenAPI("/api/member/getEnprInfoList.json", "get", request);
			String status = res.getStaus().get("code");
			
			if(StringUtils.equalsIgnoreCase(status, "200")){
				service.execEnprInfo(res);
				result.put("status", "success");
			}else{
				result.put("status", "fail");
			}
		} catch (Exception e) {
			log.error(e.toString());
		}finally{
			return result;
		}*/
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/cli/getSetRsrsInfoList.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap getSetRsrsInfoList(@RequestParam Map<String, Object> request, HttpServletRequest httpRequest, ModelMap model){
		
		request.put("jobNo", 	"J00002");
		
		CliResponseBean res;
		ModelMap result = new ModelMap();
		try {
			
			res = rest.execOpenAPI("/api/resource/getSetRsrsInfoList.json", "get", request);
			String status = res.getStaus().get("code");
			
			if(StringUtils.equalsIgnoreCase(status, "200")){
				service.execSetRsrsInfo(res);
				result.put("status", "success");
			}else{
				result.put("status", "fail");
			}
		} catch (Exception e) {
			log.error(e.toString());
		}finally{
			return result;
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/cli/getRsrsInfoList.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap getRsrsInfoList(@RequestParam Map<String, Object> request, HttpServletRequest httpRequest, ModelMap model){
		
		request.put("jobNo", 	"J00003");
		
		CliResponseBean res;
		ModelMap result = new ModelMap();
		try {
			
			res = rest.execOpenAPI("/api/resource/getRsrsInfoList.json", "get", request);
			String status = res.getStaus().get("code");
			
			if(StringUtils.equalsIgnoreCase(status, "200")){
				service.execRsrsInfo(res);
				result.put("status", "success");
			}else{
				result.put("status", "fail");
			}
		} catch (Exception e) {
			log.error(e.toString());
		}finally{
			return result;
		}
	}
	
}
