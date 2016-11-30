package com.nc.bidding.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import com.nc.bidding.service.BiddingService;
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
public class BiddingServiceController{
	private static final Logger log = LoggerFactory.getLogger(BiddingServiceController.class);
	
	@Autowired
	private BiddingService biddingService;			/* 공통 서비스 */

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
	@RequestMapping(value="/bidding/powerBid.do", method={RequestMethod.GET, RequestMethod.POST})
	public String powerBidServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		return "bidding/powerBid";
	}
	@RequestMapping(value="/bidding/recBid.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recBidServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		String jsonStr;
		List iBNmList;
		try {
			jsonStr = makeBidding(biddingService.getDataList("bidding.selectRecBid", paramMap));
			iBNmList = biddingService.getDataList("common.selectIBNmList", paramMap);
			model.addAttribute("iBNmList", iBNmList);			
			model.addAttribute("results", jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
//		List result;
//		try {
//			result = biddingService.getDataList("bidding.selectRecBid", paramMap);
//			Map<?, ?> m;
//			String start="";
//			int startNumber=0;
//			int cnt=0;
//			for(int num=0;num<result.size();num++){
//				m = (Map<?, ?>)result.get(num);
//				if(!start.equals((String)m.get("sle_wnt_dt"))){
//					start=(String) m.get("sle_wnt_dt");
//					if(num!=0){
//						HashMap attr = new HashMap();	
//						attr.put("sle_wnt_dt", new HashMap());
//						((HashMap)attr.get("sle_wnt_dt")).put("rowspan", ""+cnt);
//						((HashMap)result.get(startNumber)).put("attr", attr);
//						cnt=0;
//					}
//					startNumber=num;
//				}
//				else{
//					HashMap attr = new HashMap();	
//					attr.put("sle_wnt_dt", new HashMap());
//					((HashMap)attr.get("sle_wnt_dt")).put("display", "none");
//					((HashMap)result.get(num)).put("attr", attr);
//				}
//				cnt++;
//			}
//			HashMap attr = new HashMap();	
//			attr.put("sle_wnt_dt", new HashMap());
//			((HashMap)attr.get("sle_wnt_dt")).put("rowspan", ""+cnt);
//			((HashMap)result.get(startNumber)).put("attr", attr);
//			ObjectMapper om = new ObjectMapper();
//			String jsonStr = om.writeValueAsString(result);
//			System.out.println(jsonStr);
//			model.addAttribute("results", jsonStr);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println(e.getMessage());
//		}
		return "bidding/recBid";
	}
	@RequestMapping(value="/bidding/powerBidSub1.do", method={RequestMethod.GET, RequestMethod.POST})
	public String powerBidSub1ServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		String jsonStr;
		List iBNmList;
		try {
			jsonStr = makeBidding(biddingService.getDataList("bidding.selectBidSub1", paramMap));
			iBNmList = biddingService.getDataList("common.selectIBNmList", paramMap);
			model.addAttribute("iBNmList", iBNmList);			
			model.addAttribute("results", jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "bidding/powerBidSub1";
	}
	@RequestMapping(value="/bidding/powerBidSub2.do", method={RequestMethod.GET, RequestMethod.POST})
	public String powerBidSub2ServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		String jsonStr;
		List iBNmList;
		try {
			jsonStr = makeBidding(biddingService.getDataList("bidding.selectBidSub2", paramMap));
			iBNmList = biddingService.getDataList("common.selectIBNmList", paramMap);
			model.addAttribute("iBNmList", iBNmList);			
			model.addAttribute("results", jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "bidding/powerBidSub2";
	}
	@RequestMapping(value="/bidding/powerBidSub1.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap powerBidSub1JsonServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		ModelMap result = new ModelMap();
		result.put("results", makeBidding(biddingService.getDataList("bidding.selectBidSub1", paramMap)));
		return result;
	}
	@RequestMapping(value="/bidding/powerBidSub2.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap powerBidSub2JsonServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		ModelMap result = new ModelMap();
		result.put("results", makeBidding(biddingService.getDataList("bidding.selectBidSub2", paramMap)));
		return result;
	}
	@RequestMapping(value="/bidding/recBid.json", method={RequestMethod.GET, RequestMethod.POST})
	public ModelMap recBidJsonServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		ModelMap result = new ModelMap();
		result.put("results", makeBidding(biddingService.getDataList("bidding.selectRecBid", paramMap)));
		return result;
	}
	private String makeBidding(List<?> result) throws Exception {
		String jsonStr="";
		ObjectMapper om = new ObjectMapper();
		if(result.size()!=0){
			Map<?, ?> m;
			String start="";
			int startNumber=0;
			int cnt=0;
			for(int num=0;num<result.size();num++){
				m = (Map<?, ?>)result.get(num);
				if(!start.equals((String)m.get("sle_wnt_dt"))){
					start=(String) m.get("sle_wnt_dt");
					if(num!=0){
						HashMap attr = new HashMap();	
						attr.put("sle_wnt_dt", new HashMap());
						((HashMap)attr.get("sle_wnt_dt")).put("rowspan", ""+cnt);
						((HashMap)result.get(startNumber)).put("attr", attr);
						cnt=0;
					}
					startNumber=num;
				}
				else{
					HashMap attr = new HashMap();	
					attr.put("sle_wnt_dt", new HashMap());
					((HashMap)attr.get("sle_wnt_dt")).put("display", "none");
					((HashMap)result.get(num)).put("attr", attr);
				}
				cnt++;
			}
			HashMap attr = new HashMap();	
			attr.put("sle_wnt_dt", new HashMap());
			((HashMap)attr.get("sle_wnt_dt")).put("rowspan", ""+cnt);
			((HashMap)result.get(startNumber)).put("attr", attr);
			jsonStr = om.writeValueAsString(result);
		}
		System.out.println(jsonStr);
		return jsonStr;
	}
	@RequestMapping(value="/bidding/powerBidAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
	public String powerBidAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		return "bidding/powerBidAddNModify";
	}
	@RequestMapping(value="/bidding/recBidAddNModify.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recBidAddNModifyServicePage(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		return "bidding/recBidAddNModify";
	}
	
	@Value(value="#{global['download_path']}")
	private String serverPath;
	
}