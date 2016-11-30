package com.nc.api.service;

import java.util.List;
import java.util.Map;

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
 * com.nc.api.service : APIService.java
 * @author creme55
 * @since 2016. 11. 21.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                              수정내용
 *  -------------        -----------       -------------------------------------------------
 *  2016. 11. 21.          creme55         최초생성 (시큘레이터 연동을 위한 인터페이스 정의)
 *
 * </pre>
 **/
public interface APIService {
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 정보 조회 API 1
	 * 2. 처리내용 : 사용자 정보를 조회한 후 JSON 타입으로 데이터 전달
	 * </pre>
	 *
	 * @method Name : getEnprInfoList
	 * @param sqlId, paramMap
	 * @return List<?>
	 * @throws Exception
	 * 
	 */
	public List<?> getEnprInfoList(String sqlId, Map<String, Object> paramMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 정보 조회 API 1-1
	 * 2. 처리내용 : 사용자 정보를 조회한 후 그 결과를 리턴
	 * </pre>
	 *
	 * @method Name : getEnprInfoListCnt
	 * @param sqlId, paramMap
	 * @return int
	 * @throws Exception
	 * 
	 */
	public int getEnprInfoListCnt(String sqlId, Map<String, Object> paramMap) throws Exception;
}