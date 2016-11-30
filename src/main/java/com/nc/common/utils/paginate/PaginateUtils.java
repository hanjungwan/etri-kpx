package com.nc.common.utils.paginate;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.google.common.base.Strings;

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
 * com.nc.common.utils.paginate : PaginateUtils.java
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
 *  2016. 10. 12.          creme55         최초 생성(페이지 처리 유틸리티)
 *
 * </pre>
 **/
@Component
public class PaginateUtils {

	@Value("#{global['paginate.page.size']}")
	private int pageSize;
	
	@Value("#{global['paginate.record.size']}")
	private int recordSize;
	
	public static final String PAGE_SIZE = "PAGINATE_PAGE_SIZE";
	public static final String RECORD_SIZE = "PAGINATE_RECORD_SIZE";
	public static final String PAGE_PARAM_SUFFIX = "PAGINATE_PAGE_PARAM_SUFFIX";
	
	public Paginate initialize(Map<String, Object> paramMap, int totalRecords) {
		Paginate paginate = new Paginate();
		
		int pageSize = this.pageSize;
		if(paramMap.get(PAGE_SIZE) != null) {
			pageSize = (Integer)paramMap.get(PAGE_SIZE);
		}
		int recordSize = this.recordSize;
		if(paramMap.get(RECORD_SIZE) != null) {
			recordSize = (Integer)paramMap.get(RECORD_SIZE);
		}
		paginate.setPageSize(pageSize);
		paginate.setRecordSize(recordSize);
		
		String pageParamSuffix = (String)paramMap.get(PAGE_PARAM_SUFFIX);
		if(!Strings.isNullOrEmpty(pageParamSuffix)) {
			paginate.setPageParamSuffix(pageParamSuffix);
		} else {
			pageParamSuffix = "";
		}
		paginate.initialize(paramMap, totalRecords);
		
		paramMap.put("PAGINATE" + pageParamSuffix, paginate);
		return paginate;
	}
}