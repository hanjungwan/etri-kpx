package com.nc.customer.service;

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
 * com.nc.customer.service : CustomerService.java
 * @author creme55
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                        수정내용
 *  -------------        -----------       -------------------------------------
 *  2016. 10. 17.          creme55         최초 생성(고객지원 서비스 인터페이스)
 *
 * </pre>
 **/
public interface CustomerService {
	/**
	 * <pre>
	 * 1. 개요 : 고객지원 처리
	 * 2. 처리내용 : 공지사항 리스트 조회
	 * </pre>
	 *
	 * @method Name : getNotifyList
	 * @param sqlId, paramMap
	 * @return List<?>
	 * @throws Exception
	 * 
	 */
	public List<?> getNotifyList(String sqlId, Map<String, Object> paramMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 고객지원 처리 - 공지사항
	 * 2. 처리내용 : 공지사항을 등록
	 * </pre>
	 *
	 * @method Name : putNotifyInfo
	 * @param sqlId, paramMap
	 * @return int
	 * @throws Exception
	 * 
	 */
	public int putNotifyInfo(String sqlId, Map<String, Object> paramMap) throws Exception;
}