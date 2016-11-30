package com.nc.businessManagement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nc.businessManagement.service.BusinessManagementService;
import com.nc.common.utils.FileMngUtil;
import com.nc.commonservice.service.CommonService;

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
 * com.nc.commonservice.controller : CommonServiceController.java
 * @author creme55
 * @since 2016. 10. 13.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 13.          creme55         최초 생성(공통 서비스 Controller)
 *
 * </pre>
 **/
@Controller
public class BusinessManagementServiceController{
	private static final Logger log = LoggerFactory.getLogger(BusinessManagementServiceController.class);
	
	@Autowired
	private BusinessManagementService businessManagementService;			/* 공통 서비스 */

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
	@RequestMapping(value="/businessManagement/intermediaryBusiness.do", method={RequestMethod.GET, RequestMethod.POST})
	public String intermediaryBusinessServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
//		model.addAttribute("test", "뀨?");
		List result;
		try {
			result = businessManagementService.getDataList("businessManagement.selectIntermediaryList", paramMap);

			ObjectMapper om = new ObjectMapper();
			String jsonStr = om.writeValueAsString(result);
			
//			System.out.println(jsonStr);
			model.addAttribute("results", result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "businessManagement/intermediaryBusiness";
	}
	@RequestMapping(value="/businessManagement/resourceholders.do", method={RequestMethod.GET, RequestMethod.POST})
	public String resourceholdersServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List result;
		try {
			result = businessManagementService.getDataList("businessManagement.selectResourceHoldersList", paramMap);

			ObjectMapper om = new ObjectMapper();
			String jsonStr = om.writeValueAsString(result);
			
//			System.out.println(jsonStr);
			model.addAttribute("results", result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "businessManagement/resourceholders";
	}
	@RequestMapping(value="/businessManagement/intermediaryBusinessAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
	public String intermediaryBusinessAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
//		for (String iterable_element : paramMap.keySet()) {
//			System.out.println("KEY : "+iterable_element+", value : "+paramMap.get(iterable_element));	
//		}
		List result;
		List enprTpList = new ArrayList();
		enprTpList.add(new ModelMap());
		enprTpList.add(new ModelMap());
		enprTpList.add(new ModelMap());
		((ModelMap)enprTpList.get(0)).put("txt", "개인");
		((ModelMap)enprTpList.get(1)).put("txt", "법인");
		((ModelMap)enprTpList.get(2)).put("txt", "기타");
		((ModelMap)enprTpList.get(0)).put("code", "01");
		((ModelMap)enprTpList.get(1)).put("code", "02");
		((ModelMap)enprTpList.get(2)).put("code", "03");
		try {
			result = businessManagementService.getDataList("businessManagement.selectIntermediary", paramMap);
			model.addAttribute("results", result);
			model.addAttribute("enprTpList", enprTpList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "businessManagement/intermediaryBusinessAddNModify";
	}
	@ResponseBody
	@RequestMapping(value="/businessManagement/intermediaryBusinessAddCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int intermediaryBusinessAddCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;		
		paramMap.put("tel_no", paramMap.get("tel_no1")+"-"+paramMap.get("tel_no2")+"-"+paramMap.get("tel_no3"));
		paramMap.put("fax_no", paramMap.get("fax_no1")+"-"+paramMap.get("fax_no2")+"-"+paramMap.get("fax_no3"));
		paramMap.put("cnct_no", paramMap.get("cnct_no1")+"-"+paramMap.get("cnct_no2")+"-"+paramMap.get("cnct_no3"));
		paramMap.put("addr", paramMap.get("enpr_addr_number")+""+paramMap.get("enpr_addr"));
		result = businessManagementService.putData("businessManagement.insertEnprInfo", paramMap);
		result = businessManagementService.putData("businessManagement.insertCntcSetInfo", paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/businessManagement/intermediaryBusinessModCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int intermediaryBusinessModCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;
		paramMap.put("tel_no", paramMap.get("tel_no1")+"-"+paramMap.get("tel_no2")+"-"+paramMap.get("tel_no3"));
		paramMap.put("fax_no", paramMap.get("fax_no1")+"-"+paramMap.get("fax_no2")+"-"+paramMap.get("fax_no3"));
		paramMap.put("cnct_no", paramMap.get("cnct_no1")+"-"+paramMap.get("cnct_no2")+"-"+paramMap.get("cnct_no3"));
		paramMap.put("addr", paramMap.get("enpr_addr_number")+""+paramMap.get("enpr_addr"));
		for (String key : paramMap.keySet()) {
			System.out.println(key + " : "+paramMap.get(key));
		}		
		result = businessManagementService.putData("businessManagement.updateEnprInfo", paramMap);
		return result;
	}
	@RequestMapping(value="/businessManagement/resourceAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
	public String resourceAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List result;
		List enprTpList = new ArrayList();
		enprTpList.add(new ModelMap());
		enprTpList.add(new ModelMap());
		enprTpList.add(new ModelMap());
		((ModelMap)enprTpList.get(0)).put("txt", "개인");
		((ModelMap)enprTpList.get(1)).put("txt", "법인");
		((ModelMap)enprTpList.get(2)).put("txt", "기타");
		((ModelMap)enprTpList.get(0)).put("code", "01");
		((ModelMap)enprTpList.get(1)).put("code", "02");
		((ModelMap)enprTpList.get(2)).put("code", "03");
		try {
			result = businessManagementService.getDataList("businessManagement.selectResourceHolders", paramMap);
			model.addAttribute("results", result);
			model.addAttribute("enprTpList", enprTpList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "businessManagement/resourceAddNModify";
	}
	@ResponseBody
	@RequestMapping(value="/businessManagement/resourceAddCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int resourceAddCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;		
		paramMap.put("tel_no", paramMap.get("tel_no1")+"-"+paramMap.get("tel_no2")+"-"+paramMap.get("tel_no3"));
		paramMap.put("fax_no", paramMap.get("fax_no1")+"-"+paramMap.get("fax_no2")+"-"+paramMap.get("fax_no3"));
		paramMap.put("cnct_no", paramMap.get("cnct_no1")+"-"+paramMap.get("cnct_no2")+"-"+paramMap.get("cnct_no3"));
		paramMap.put("addr", paramMap.get("enpr_addr_number")+""+paramMap.get("enpr_addr"));
		paramMap.put("resource","resource");
		result = businessManagementService.putData("businessManagement.insertEnprInfo", paramMap);
//		result = businessManagementService.putData("businessManagement.insertCntcRsrsInfo", paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/businessManagement/resourceModCmd.do", method={RequestMethod.GET, RequestMethod.POST})
	public int resourceModCmdServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		int result = 0;
		paramMap.put("tel_no", paramMap.get("tel_no1")+"-"+paramMap.get("tel_no2")+"-"+paramMap.get("tel_no3"));
		paramMap.put("fax_no", paramMap.get("fax_no1")+"-"+paramMap.get("fax_no2")+"-"+paramMap.get("fax_no3"));
		paramMap.put("cnct_no", paramMap.get("cnct_no1")+"-"+paramMap.get("cnct_no2")+"-"+paramMap.get("cnct_no3"));
		paramMap.put("addr", paramMap.get("enpr_addr_number")+""+paramMap.get("enpr_addr"));
		paramMap.put("resource","resource");
		result = businessManagementService.putData("businessManagement.updateEnprInfo", paramMap);
//		result = businessManagementService.putData("businessManagement.updateCntcRsrsInfo", paramMap);
		return result;
	}
//	@RequestMapping(value="/businessManagement/resourceAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
//	public String resourceAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
//		List result;
//		try {
//			result = businessManagementService.getDataList("businessManagement.selectResourceHolders", paramMap);
//			model.addAttribute("results", result);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println(e.getMessage());
//		}
//		return "businessManagement/resourceAddNModify";
//	}
	
	@RequestMapping(value="/businessManagement/test.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap test(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		ModelMap result = new ModelMap();
		
		Map<String, Object> tmpResult = new HashMap<String, Object>();
		
//		tmpResult.put("resultMesg",  "test");
		
		/* 문자열 변환을 위한 jackson library method 호출 */
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(tmpResult);
		
		result.put("results", jsonStr);
		
		return result;
//		return "businessManagement/test";
	}
//	
	@Value(value="#{global['download_path']}")
	private String serverPath;
	
}