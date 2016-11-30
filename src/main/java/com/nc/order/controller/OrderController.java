package com.nc.order.controller;

import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nc.order.service.OrderService;

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
 * com.nc.order.controller : OrderController.java
 * @author creme55
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       ------------------------------------------
 *  2016. 10. 17.          creme55         최초 생성 (주문 처리 서비스 controller)
 *
 * </pre>
 **/
@Controller
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	/**
	 * <pre>
	 * 1. 개요 : 주문 처리
	 * 2. 처리내용 : 전력거래 주문 리스트 조회
	 * </pre>
	 *
	 * @method Name : getOrderForm
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/order/ordPwrTrdList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getOrdPwrTrdList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		//List<?> result = orderService.getOrderForm("order.selectOrdPwrTrdList", paramMap);
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			//log.debug("= result : [{}] =", result.get(0));
			log.debug("==========================================================================================");
		}
		
		//model.addAttribute("results", result);
		
		return "order/orderPowerTradeList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 주문/입찰에 처리
	 * 2. 처리내용 : REC 주문 리스트 조회
	 * </pre>
	 *
	 * @method Name : getRecOrdPwrTrdList
	 * @param paramMap, request, model
	 * @return String
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/order/recOrdPwrTrdList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getRecOrdPwrTrdList(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		//List<?> result = orderService.getOrderForm("order.selectOrdPwrTrdList", paramMap);
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			//log.debug("= result : [{}] =", result.get(0));
			log.debug("==========================================================================================");
		}
		
		//model.addAttribute("results", result);
		
		return "order/recOrderPowerTradeList";
	}

	/**
	 * <pre>
	 * 1. 개요 : 주문입찰 처리
	 * 2. 처리내용 : 전력거래주문 리스트 조회 후 결과를 JSON으로 전달
	 * </pre>
	 *
	 * @method Name : getOrdPwrTrdListData
	 * @param paramMap, request
	 * @return ModelMap
	 * @throws Exception
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="/order/ordPwrTrdListData.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap getOrdPwrTrdListData(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		ModelMap result = new ModelMap();
		List<?> searchResult = new ArrayList<Map<?, ?>>();
		
		searchResult = orderService.getOrderForm("order.selectOrdPwrTrdList", paramMap);
		
		/* 조회된 결과를 JSON Mapper를 통해 재구성 */
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(searchResult);
		
		result.put("results", jsonStr);
		
		return result;
	}
}