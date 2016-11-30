package com.nc.commonservice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nc.common.utils.EncryptionUtil;
import com.nc.common.utils.FileMngUtil;
import com.nc.common.utils.SessionUtil;
import com.nc.common.utils.StringUtil;
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
public class CommonServiceController {
	private static final Logger log = LoggerFactory.getLogger(CommonServiceController.class);
	
	@Autowired
	private CommonService commonService;			/* 공통 서비스 */

	/**
	 * <pre>
	 * 1. 개요 : 
	 * 2. 처리내용 : 
	 * </pre>
	
	 * @method Name : getCodeList
	 * @param 
	 * @return 
	 * @throws
	 * 
	 */
	@RequestMapping(value="/common/codeList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getCodeList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		ModelMap result = new ModelMap();
		
		//Map<?, ?> tmpResult = commonDao.getSelectResultMap("common.testSelect", paramMap);
		
		//result.addAttribute("result", tmpResult);
		
		model.addAllAttributes(result);
		
		log.debug(">>>>> result {}", result);
		
		return "common/codeList";
	}
	/**
	 * <pre>
	 * 1. 개요 : 
	 * 2. 처리내용 : 
	 * </pre>
	
	 * @method Name : getCodeList
	 * @param 
	 * @return 
	 * @throws
	 * 
	 */
	@RequestMapping(value="/common/zipCode.do", method={RequestMethod.GET, RequestMethod.POST})
	public String zipCode(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		return "common/popup/zipCode";
	}
	@RequestMapping(value="/common/selectionList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String shIdName(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		List<?> result;
		try {
			result = commonService.getDataList("common.select"+paramMap.get("code"), paramMap);
			model.addAttribute("results", result);
			model.addAttribute("nmInput", paramMap.get("nmInput"));
			model.addAttribute("idInput", paramMap.get("idInput"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "common/popup/selectionList";
	}
	
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
	@RequestMapping(value="/main/index.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		String loginId = String.valueOf(request.getSession().getAttribute("loginId"));
		String svcNm = "";
		Map<String, Object> subSvcNm = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		subSvcNm.put("size", 0);
		subSvcNm.put("1", "");
		subSvcNm.put("2", "");
				
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= loginId : [{}] =", loginId);
			log.debug("==========================================================================================");
		}
		
		resultMap.put("loginId", loginId);
		resultMap.put("serviceType", "common");
		resultMap.put("mainMenuName", svcNm);
		resultMap.put("subMenuName", subSvcNm);
		
		model.put("results", resultMap);
		
		return "main/index";
	}
	
	@Value(value="#{global['download_path']}")
	private String serverPath;
	
	/**
	 * <pre>
	 * 1. 개요 : file dowload
	 * 2. 처리내용 : 파일 다운로드 기능 (절대경로는 프로퍼티로 관리)
	 * </pre>
	 *
	 * @method Name : templateDownload
	 * @param paramMap, request, response
	 * @return none
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/excelTemplateDownload.do", method=RequestMethod.GET)
	public void templateDownload(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* 파일 위치 */
		String templateFile = serverPath;
		String serviceType = String.valueOf(paramMap.get("serviceType"));
		String fileName = String.valueOf(paramMap.get("fileName"));
		
		if (serviceType.equals("order")) {
			templateFile += fileName;
			
			if (log.isDebugEnabled()) {
				log.debug("==========================================================================================");
				log.debug("= serverPath : [{}] =", serverPath);
				log.debug("= serviceType : [{}] =", serviceType);
				log.debug("= fileName : [{}] =", fileName);
				log.debug("= templateFile : [{}] =", templateFile);
				log.debug("==========================================================================================");
			}
			
			FileMngUtil.downFile(request, response, templateFile, fileName);
		} else {
			
			/* Excel Data 생성, 개발 진행중 */
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 로그인 페이지로 이동한다.
	 * 2. 처리내용 : 로그인을 위한 입력 폼으로 이동한다.
	 * </pre>
	 *
	 * @method Name : getLoginFrom
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/login/loginForm.do", method=RequestMethod.GET)
	public String getLoginFrom(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		return "login/loginForm";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 로그인 처리
	 * 2. 처리내용 : 로그인 처리 후 해당 페이지로 이동, 오류 일 경우에는 로그인 페이지로 redirect
	 * </pre>
	 *
	 * @method Name : getSystemLogin
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/login/login.do", method=RequestMethod.POST)
	public String getSystemLogin(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		/* 파라미터 확인 */
		String usrId = String.valueOf(paramMap.get("usrId"));
		String usrPwd = String.valueOf(paramMap.get("usrPwd"));
		
		usrId = (StringUtil.isEmpty(usrId)) ? "" : usrId;
		usrPwd = (StringUtil.isEmpty(usrPwd)) ? "" : usrPwd;
		
		/* 사용자 조회 */
		Map<?, ?> searchMap = new HashMap<String, Object>();
		searchMap = commonService.getUsrInfo("common.selectUserInfo", paramMap);
		
		/* 사용자 조회가 성공일 경우, 비밀번호 매핑 처리 */
		boolean pwdCmp = false;
		
		if (searchMap != null && searchMap.isEmpty()) {
			if (!StringUtil.isEmpty(String.valueOf(searchMap.get("USR_ID")))) {
				String rstUsrPwd = String.valueOf(searchMap.get("USR_PWD"));
				
				if (rstUsrPwd.equals(EncryptionUtil.encrypt_sha2(usrPwd))) {
					pwdCmp = true;
				}
			}
		}
		
		/* 사용자 비밀번호가 맞을 경우, 관련 정보를 세션에 담고, 사용자 권한 등을 조회한 후 그 결과를 세션에 담는다. */
		if (pwdCmp) {
			 
			SessionUtil.setAttribute("loginId", usrId);
			SessionUtil.setAttribute("userId", searchMap.get("USER_ID"));
			SessionUtil.setAttribute("usrNm", searchMap.get("USR_NM"));
			SessionUtil.setAttribute("usrPwd", searchMap.get("USR_PWD"));
			SessionUtil.setAttribute("compId", searchMap.get("COMP_ID"));
			SessionUtil.setAttribute("authId", searchMap.get("AUTH_ID"));
			SessionUtil.setAttribute("cpNo", searchMap.get("CP_NO"));
			SessionUtil.setAttribute("crtDt", searchMap.get("CRT_DT"));
			SessionUtil.setAttribute("prmtSttcsCd", searchMap.get("PRMT_STTCS_CD"));
			SessionUtil.setAttribute("prmtSttcsCdNm", searchMap.get("PRMT_STTCS_CD_NM"));
			
			return "redirect:/main/index.do";
		} else {
			String returnMesg = "";
			
			if (searchMap == null) {
				returnMesg = "사용자 아이디를 확인하시기 바랍니다.";
			} else {
				if (!pwdCmp) {
					returnMesg = "비밀번호를 확인하시기 바랍니다.";
				} else {
					returnMesg = "로그인 진행중에 오류가 발생하였습니다.";
				}
			}
			
			SessionUtil.setAttribute("loginId", "creme55");
			SessionUtil.setAttribute("serviceType", "common");
			SessionUtil.setAttribute("mesg", returnMesg);
			
			return "redirect:/main/index.do";
			//return "redirect:/login/loginForm.do?retMesg=" + returnMesg;
		}
	}
}