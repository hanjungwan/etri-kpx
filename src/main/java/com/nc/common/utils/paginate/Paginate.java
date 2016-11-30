package com.nc.common.utils.paginate;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
 * com.nc.common.utils.paginate : Paginate.java
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
 *  2016. 10. 12.          creme55         최초 생성(페이지 처리 정의)
 *
 * </pre>
 **/
public class Paginate {
	
	private static final Logger log = LoggerFactory.getLogger(Paginate.class);
	
	// 페이지 파라미터
	private String pageParam = "pg";
	
	// 페이지 파라미터 prefix
	private String pageParamPrefix = "pg";
	
	// 페이지 파라미터 Suffix
	private String pageParamSuffix = "";
	
	// 페이지 사이즈
	private int pageSize;

	// 레코드 사이즈
	private int recordSize;
	
	// 현재 페이지
	private int currPage;
	
	// 총 레코드 수
	private int totalRecords;
	
	// 총 페이지수
	private int totalPages;
	
	// 현재페이지 시작번호
	private int startNum;
	
	// 현재페이지 종료번호
	private int endNum;
	
	// 블럭 시작 페이지
	private int startPage;
	
	// 블럭 종료 페이지
	private int endPage;
	
	// 이전 블럭의 마지막 페이지
	private int prevPage;
	
	// 다음 블럭의 첫번째 페이지
	private int nextPage;
	
	
	public void initialize(Map<String, Object> paramMap, int totalRecords) {

		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= Pagenate initialize... =");
			log.debug("==========================================================================================");
		}
		
		String currPageStr = (String)paramMap.get(pageParam);
		currPage = Strings.isNullOrEmpty(currPageStr) ? 1 : Integer.parseInt(currPageStr);
		if(currPage<1) {
			currPage = 1;
		}
		
		totalPages = (totalRecords - 1) / recordSize + 1;
		if(currPage > totalPages) {
			currPage = totalPages;
		}
		
		startNum = (currPage - 1) * recordSize + 1;
		endNum = currPage * recordSize;
		
		prevPage = ((currPage - 1) / pageSize) * pageSize;
		startPage = prevPage + 1;
		
		nextPage = startPage + pageSize;
		endPage = nextPage - 1;
		if(endPage > totalPages) {
			endPage = totalPages;
		}
		
		paramMap.put(pageParam, currPage);
		paramMap.put(pageParam + "TotalRecords", totalRecords);
		paramMap.put(pageParam + "TotalPages", totalPages);
		
		paramMap.put(pageParam + "StartIndex", startNum-1);
		paramMap.put(pageParam + "RecordSize", recordSize);
	}


	public String getPageParam() {
		return pageParam;
	}

	public void setPageParam(String pageParam) {
		this.pageParam = pageParam;
	}
	
	public String getPageParamSuffix() {
		return pageParamSuffix;
	}

	public void setPageParamSuffix(String pageParamSuffix) {
		this.pageParamSuffix = pageParamSuffix;
		setPageParam(pageParamPrefix + pageParamSuffix);
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordSize() {
		return recordSize;
	}

	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
}