package com.nc.adjustment.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nc.adjustment.service.AdjustmentService;

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
 * com.nc.adjustment.controller : AdjustmentController.java
 * @author creme55
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -------------------------------------
 *  2016. 10. 17.          creme55         최초생성 (정산처리 서비스 controller)
 *
 * </pre>
 **/
@Controller
public class AdjustmentController {
	private static final Logger log = LoggerFactory.getLogger(AdjustmentController.class);
	
	@Autowired
	private AdjustmentService adjustmentService;
	
	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 전력 일일정산 조회
	 * </pre>
	 *
	 * @method Name : pwrDylyAdjtInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/pwrDylyAdjtInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwrDylyAdjtInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/pwrDylyAdjtInfoList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 전력 기간정산 조회
	 * </pre>
	 *
	 * @method Name : pwrTermAdjtInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/pwrTermAdjtInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwrTermAdjtInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/pwrTermAdjtInfoList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : REC 일일정산 조회
	 * </pre>
	 *
	 * @method Name : recDylyAdjtInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/recDylyAdjtInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recDylyAdjtInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/recDylyAdjtInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : REC 기간정산 조회
	 * </pre>
	 *
	 * @method Name : recTermAdjtInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/recTermAdjtInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recTermAdjtInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/recTermAdjtInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 전력 정산통계 그래프를 위한 데이터조회
	 * </pre>
	 *
	 * @method Name : pwrAdjtSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/pwrAdjtSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwrAdjtSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/pwrAdjtSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 집합전력 정산통계 그래프를 위한 데이터조회
	 * </pre>
	 *
	 * @method Name : setPwrAdjtSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/setPwrAdjtSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setPwrAdjtSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/setPwrAdjtSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 집합전력 정산통계 그래프를 위한 데이터조회
	 * </pre>
	 *
	 * @method Name : recAdjtSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/recAdjtSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recAdjtSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/recAdjtSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 집합REC 정산통계 그래프를 위한 데이터조회
	 * </pre>
	 *
	 * @method Name : setRecAdjtSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/setRecAdjtSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String setRecAdjtSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/setRecAdjtSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 전력 정산내역통보를 위한 조회
	 * </pre>
	 *
	 * @method Name : pwrAdjtHistSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/pwrAdjtHistSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwrAdjtHistSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/pwrAdjtHistSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : REC 정산내역통보를 위한 조회
	 * </pre>
	 *
	 * @method Name : recAdjtHistSttcInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/recAdjtHistSttcInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recAdjtHistSttcInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/recAdjtHistSttcInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 일일 예측제고량 정산을 위한 조회
	 * </pre>
	 *
	 * @method Name : dylyFcstRemnAdjtInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/dylyFcstRemnAdjtInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String dylyFcstRemnAdjtInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/dylyFcstRemnAdjtInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 기간 예측제고량 정산을 위한 조회
	 * </pre>
	 *
	 * @method Name : termFcstRemnAdjtInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/termFcstRemnAdjtInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String termFcstRemnAdjtInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/termFcstRemnAdjtInfoList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 정산 처리
	 * 2. 처리내용 : 수익관리를 위한 조회
	 * </pre>
	 *
	 * @method Name : prftMngInfoList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/adjustment/prftMngInfoList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String prftMngInfoList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= paramMap : [{}] =", paramMap);
			log.debug("==========================================================================================");
		}
		
		model.addAttribute("paramMap", paramMap);
		
		return "adjustment/prftMngInfoList";
	}
}