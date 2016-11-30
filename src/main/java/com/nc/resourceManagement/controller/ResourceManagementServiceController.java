package com.nc.resourceManagement.controller;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nc.resourceManagement.service.ResourceManagementService;
@Controller
public class ResourceManagementServiceController{
	private static final Logger log = LoggerFactory.getLogger(ResourceManagementServiceController.class);
	@Autowired
	private ResourceManagementService resourceManagementService;			/* 공통 서비스 */
	/**
	 * <pre>
	 * 1. 개요 : 메인페이지 호출
	 * 2. 처리내용 : 메인페이지로 이동 처리
	 * </pre>
	 *
	 * @method Name : mainServicePage
	 * @param 
	 * @return 
	 * @throws
	 * 
	 */
	@RequestMapping(value="/resourceManagement/setOfResource.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setOfResourceServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List<?> result; List<?> nameList;
		try {
			result = resourceManagementService.getDataList("resourceManagement.selectSetOfResourceList", paramMap);
			nameList = resourceManagementService.getDataList("common.selectIBNmList", paramMap);
			model.addAttribute("results", result);
			model.addAttribute("nameList", nameList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "resourceManagement/setOfResource";
	}
	@RequestMapping(value="/resourceManagement/smallResource.do", method={RequestMethod.GET, RequestMethod.POST})
	public String smallResourceServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List<?> result;		List<?> regns;
		try {
			result = resourceManagementService.getDataList("resourceManagement.selectSmallResourceList", paramMap);
			paramMap.put("up_code_id", "REGN");
			regns = resourceManagementService.getDataList("common.selectCode", paramMap);
			model.addAttribute("regns", regns);
			model.addAttribute("results", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "resourceManagement/smallResource";
	}
	@RequestMapping(value="/resourceManagement/setOfResourceAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setOfResourceAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List<?> result; List<?> resource;
		try {
			result = resourceManagementService.getDataList("resourceManagement.selectSetOfResource", paramMap);
			resource = resourceManagementService.getDataList("resourceManagement.selectResourceList", paramMap);
			model.addAttribute("results", result);
			model.addAttribute("resourctList", resource);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "resourceManagement/setOfResourceAddNModify";
	}
	@RequestMapping(value="/resourceManagement/smallResourceAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
	public String smallResourceAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List<?> result;		List<?> regns;		List<?> useds;
		List<?> pwrGnrs;
		try {
			result = resourceManagementService.getDataList("resourceManagement.selectSmallResource", paramMap);
			paramMap.put("up_code_id", "USED");
			useds = resourceManagementService.getDataList("common.selectCode", paramMap);
			paramMap.put("up_code_id", "REGN");
			regns = resourceManagementService.getDataList("common.selectCode", paramMap);
			paramMap.put("up_code_id", "RSRS_DV_CD");
			pwrGnrs = resourceManagementService.getDataList("common.selectCode", paramMap);
			model.addAttribute("pwrGnrs", pwrGnrs);
			model.addAttribute("regns", regns);
			model.addAttribute("results", result);
			model.addAttribute("useds", useds);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "resourceManagement/smallResourceAddNModify";
	}
//	@ResponseBody
//	@RequestMapping(value="/resourceManagement/getSetOfResourceList.do", method={RequestMethod.GET, RequestMethod.POST})
//	public void getSetOfResourceListServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
	@RequestMapping(value="/resourceManagement/setOfResourceData.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setOfResourceDataServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List<?> result;
		try {
			result = resourceManagementService.getDataList("resourceManagement.selectSetOfResourceList", paramMap);
			model.addAttribute("results", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "resourceManagement/setOfResourceData";
	}
	@ResponseBody
	@RequestMapping(value="/resourceManagement/smallResourceAddCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int resourceAddCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;		
		paramMap.put("tel_no", paramMap.get("tel_no1")+"-"+paramMap.get("tel_no2")+"-"+paramMap.get("tel_no3"));
		paramMap.put("fax_no", paramMap.get("fax_no1")+"-"+paramMap.get("fax_no2")+"-"+paramMap.get("fax_no3"));
		paramMap.put("cnct_no", paramMap.get("cnct_no1")+"-"+paramMap.get("cnct_no2")+"-"+paramMap.get("cnct_no3"));
		paramMap.put("addr", paramMap.get("enpr_addr_number")+""+paramMap.get("enpr_addr"));
		paramMap.put("resource","resource");
		result = resourceManagementService.putData("resourceManagement.insertCntcRsrsInfo", paramMap);
//		result = businessManagementService.putData("businessManagement.insertCntcRsrsInfo", paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/resourceManagement/smallResourceModCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int resourceModCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;
		System.out.println(paramMap.get("enpr_id"));
		result = resourceManagementService.putData("resourceManagement.upadteCntcRsrsInfo", paramMap);
//		result = businessManagementService.putData("businessManagement.updateCntcRsrsInfo", paramMap);
		return result;
	}
	@Value(value="#{global['download_path']}")
	private String serverPath;
	
}