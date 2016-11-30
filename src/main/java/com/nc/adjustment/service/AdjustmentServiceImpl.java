package com.nc.adjustment.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nc.common.dao.CommonDAO;

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
 * com.nc.adjustment.service : AdjustmentServiceImpl.java
 * @author creme55
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       ----------------------------------
 *  2016. 10. 17.          creme55         최초 생성 (정산처리 서비스 구현체)
 *
 * </pre>
 **/
@Service("adjustmentService")
public class AdjustmentServiceImpl implements AdjustmentService {
	private static final Logger log = LoggerFactory.getLogger(AdjustmentServiceImpl.class);
	
	@Autowired
	private CommonDAO commonDao;					/* 공통 DAO 서비스 */

	/**
	 * <pre>
	 * 1. 개요 : 정산처리
	 * 2. 처리내용 : 전력거래 일일현황 조회
	 * </pre>
	 *
	 * @method Name : getAdjustmentStatusList
	 * @param sqlId, paramMap
	 * @return List<?>
	 * @throws Exception
	 * 
	 */
	public List<?> getAdjustmentStatusList(String sqlId, Map<String, Object> paramMap) throws Exception {
		List<?> tmpResult = commonDao.getSelectResult(sqlId, paramMap);
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [] =");
			log.debug("==========================================================================================");
		}

		return tmpResult;
	}
}