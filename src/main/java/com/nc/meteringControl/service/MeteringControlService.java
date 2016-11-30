package com.nc.meteringControl.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
 * com.nc.commonservice.service : CommonService.java
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
 *  2016. 10. 12.          creme55         최초 생성 (공통 서비스 인터페이스)                  
 *
 * </pre>
 **/
public interface MeteringControlService {
	
	/**
	 * <pre>
	 * 1. 개요 : 공통코드 조회 서비스 인터페이스 
	 * 2. 처리내용 : 공통코드 조회
	 * </pre>
	 *
	 * @method Name : getCodeList
	 * @param sqlId, paramMap
	 * @return Map<?, ?>
	 * @throws Exception
	 * 
	 */
	public Map<?, ?> getCodeList(String sqlId, Map<String, Object> paramMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 공통 서비스
	 * 2. 처리내용 : 파일 업로드 처리 (파일을 프로퍼티에 기술된 디렉토리에 업로드 후 관련된 정보를 맵 리스트로 리턴)
	 * </pre>
	 *
	 * @method Name : uploadFileProcess
	 * @param request
	 * @return Map<String, Object>
	 * @throws Exception
	 * 
	 */
	public Map<String, Object> uploadFileProcess(final HttpServletRequest request) throws Exception;
}