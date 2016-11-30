package com.nc.businessManagement.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nc.common.dao.CommonDAO;
import com.nc.common.utils.ExcelUtil;

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
 * com.nc.commonservice.service : CommonServiceImpl.java
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
 *  2016. 10. 12.          creme55         최초 생성 (공통 서비스 구현체)                  
 *
 * </pre>
 **/
@Service("businessManagementService")
public class BusinessManagementServiceImpl implements BusinessManagementService {
	private static final Logger log = LoggerFactory.getLogger(BusinessManagementServiceImpl.class);

	@Autowired
	private CommonDAO commonDao;					/* 공통 DAO 서비스 */
	
	/**
	 * <pre>
	 * 1. 개요 : 공통 서비스
	 * 2. 처리내용 : 현재(한국기준) 날짜정보를 얻는다.
	 * </pre>
	 *
	 * @method Name : getCurrentMonthDate
	 * @param 
	 * @return String
	 * @throws none
	 * 
	 */
	public static String getCurrentMonthDate() {
		Calendar aCalendar = Calendar.getInstance();

		int year = aCalendar.get(Calendar.YEAR);
		int month = aCalendar.get(Calendar.MONTH) + 1;
		String strDate = Integer.toString(year) + ((month < 10) ? "0" + Integer.toString(month) : Integer.toString(month));
		
		return strDate;
	}

	@Override
	public List getDataList(String sqlId,
			Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =");
			log.debug("==========================================================================================");
		}
		
		return commonDao.getSelectResult(sqlId, paramMap);
	}
	public int putData(String sqlId, Map<String, Object> paramMap) throws Exception {
		int tmpResult = commonDao.insert(sqlId, paramMap);
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= executed result (count) : [{}] =", tmpResult);
			log.debug("==========================================================================================");
		}
		
		return tmpResult;
	}

}