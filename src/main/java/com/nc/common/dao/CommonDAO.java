package com.nc.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nc.common.exception.NCException;

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
 * com.nc.common.dao : CommonDAO.java
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
 *  2016. 10. 12.          creme55         최초 생성 (공통 DAO 정의, MYBATIS)       
 *
 * </pre>
 **/
@Repository("commonDao")
public class CommonDAO extends NCAbstractDAO {
	private static final Logger log = LoggerFactory.getLogger(CommonDAO.class);

	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리 
	 * 2. 처리내용 : 쿼리 결과 LIST 리턴
	 * </pre>
	 * 
	 * @method Name : getSelectResult
	 * @param String sqlMapId, Map<?, ?> parameterMap
	 * @return List<?>
	 * @throws NCException
	 * 
	 */
	public List<?> getSelectResult(String sqlMapId, Map<?, ?> parameterMap) throws Exception {
		List<?> list;
		
		try {
			long startTime = System.currentTimeMillis();
			list = getSqlSession().selectList(sqlMapId, parameterMap);
			long endTime = System.currentTimeMillis();
			
			if (log.isDebugEnabled()) {
				log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
			}
		} catch (Exception e) {
			log.debug("DAO ERROR : " + e.getMessage());
			throw new NCException(e.getMessage());
		}
		
		return list;
	}
	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리 
	 * 2. 처리내용 : 쿼리 결과 LIST 리턴
	 * </pre>
	 * 
	 * @method Name : getSelectResult
	 * @param String sqlMapId
	 * @return List<?>
	 * @throws NCException
	 * 
	 */
	public List<?> getSelectResult(String sqlMapId) throws Exception {
		List<?> list;
		
		try {
			long startTime = System.currentTimeMillis();
			list = getSqlSession().selectList(sqlMapId);
			long endTime = System.currentTimeMillis();
			
			if (log.isDebugEnabled()) {
				log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
			}
		} catch (Exception e) {
			log.debug("DAO ERROR : " + e.getMessage());
			throw new NCException(e.getMessage());
		}
		
		return list;
	}
	/**
	 * @method Name : getSelectResultMap
	 * @param String sqlMapId, Map<?, ?> parameterMap
	 * @return List<?> 
	 * @throws NCException
	 * 
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리
	 * 2. 처리내용 : 쿼리 결과 Map 리턴 (첫번째 경우)
	 * </pre>
	 */
	public Map<?, ?> getSelectResultMap(String sqlMapId, Map<?, ?> parameterMap) throws Exception {
		Map<?, ?> resultMap = null;
		
		try {
			long startTime = System.currentTimeMillis();
			List<?> resultList = getSqlSession().selectList(sqlMapId, parameterMap);
			
			if (resultList.size() > 0) {
				resultMap = (Map<?, ?>) resultList.get(0);
			}
			long endTime = System.currentTimeMillis();
			
			if (log.isDebugEnabled()) {
				log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
			}
		} catch (Exception e) {
			log.debug("DAO ERROR : " + e.getMessage());
			throw new NCException(e.getMessage());
		}
		
		return resultMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리
	 * 2. 처리내용 : 쿼리 결과 Map 리턴
	 * </pre>
	 * 
	 * @method Name : getMapResult
	 * @param String sqlMapId, Map<?, ?> parameterMap, String keyProperty
	 * @return List<?> 
	 * @throws NanumException
	 * 
	 */
	public Map<?, ?> getMapResult(String sqlMapId, Map<?, ?> parameterMap, String keyProperty) throws Exception {
		Map<?, ?> resultMap = null;
		
		try {
			long startTime = System.currentTimeMillis();
			resultMap = getSqlSession().selectMap(sqlMapId, parameterMap, keyProperty);
			long endTime = System.currentTimeMillis();
			
			if (log.isDebugEnabled()) {
				log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
			}
		} catch (Exception e) {
			log.debug("DAO ERROR : " + e.getMessage());
			throw new NCException(e.getMessage());
		}
		
		return resultMap;
	}
	
	public Map<?, ?> getMapResult(String sqlMapId) throws Exception {
		Map<?, ?> resultMap = null;
		
		try {
			long startTime = System.currentTimeMillis();
			resultMap = getSqlSession().selectOne(sqlMapId);
			long endTime = System.currentTimeMillis();
			
			if (log.isDebugEnabled()) {
				log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
			}
		} catch (Exception e) {
			log.debug("DAO ERROR : " + e.getMessage());
			throw new NCException(e.getMessage());
		}
		
		return resultMap;
	}

	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리
	 * 2. 처리내용 : 쿼리 결과 페이징 리턴
	 * </pre>
	 *
	 * @method Name : getSelectPaginatedResult
	 * @param String sqlMapId, Map<String, Integer> parameterMap, int pageNum
	 * @return List<?> 
	 * @throws NCException
	 * 
	 */
	public List<?> getSelectPaginatedResult(String sqlMapId, Map<String, Integer> parameterMap, int pageNum) throws Exception {
		return getSelectPaginatedResult(sqlMapId, parameterMap, pageNum, 10);
	}

	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리
	 * 2. 처리내용 : 쿼리 결과 페이징 리턴
	 * </pre>
	 * 
	 * @method Name : getSelectPaginatedResult
	 * @param String sqlMapId, Map<String, Integer> parameterMap, int pageNum, int listSize
	 * @return List<?> 
	 * @throws NCException
	 * 
	 */
	public List<?> getSelectPaginatedResult(String sqlMapId, Map<String, Integer> parameterMap, int pageNo, int listSize) throws Exception {
		List<?> list;
		
		try {
			int maxListSize = listSize;
			int skipResults = maxListSize * (pageNo - 1) + 1;
			long startTime = System.currentTimeMillis();
			
			parameterMap.put("pageNo", pageNo);
			parameterMap.put("firstRow", skipResults);
			parameterMap.put("lastRow", skipResults + maxListSize - 1);
			
			list = getSqlSession().selectList(sqlMapId, parameterMap);
			long endTime = System.currentTimeMillis();
			
			if (log.isDebugEnabled()) {
				log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
			}
		} catch (Exception e) {
			log.debug("DAO ERROR : " + e.getMessage());
			throw new Exception(e.getMessage());
		}
		
		return list;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리
	 * 2. 처리내용 : CUD쿼리 결과 리턴
	 * </pre>
	 * 
	 * @method Name : getClassResult
	 * @param String sqlMapId, Map<String, Integer> parameterMap
	 * @return Object <T> 
	 * @throws NCException
	 * 
	 */
	public Object getClassResult(String sqlMapId, Map<?, ?> parameterMap) throws Exception {
		Object obj;
		
		try {
			long startTime = System.currentTimeMillis();
			obj = getSqlSession().selectOne(sqlMapId, parameterMap);
			long endTime = System.currentTimeMillis();
			
			if (log.isDebugEnabled()) {
				log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
			}
		} catch (Exception e) {
			log.debug("DAO ERROR : " + e.getMessage());
			throw new NCException(e.getMessage());
		}
		
		return obj;
	}

	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리
	 * 2. 처리내용 : CUD쿼리 결과 리턴
	 * </pre>
	 * 
	 * @method Name : getExecuteResult
	 * @param String sqlMapId, Object parameterMap
	 * @return Object <T> 
	 * @throws NCException
	 * 
	 */
	public int getExecuteResult(String sqlMapId, Object parameterMap) throws Exception {
		int updatedRowCount = 0;
		
		long startTime = System.currentTimeMillis();
		updatedRowCount = getSqlSession().update(sqlMapId, parameterMap);
		long endTime = System.currentTimeMillis();
		
		if (log.isDebugEnabled()) {
			log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
		}
		
		return updatedRowCount;
	}

	/**
	 * <pre>
	 * 1. 개요 : 쿼리 결과 처리
	 * 2. 처리내용 : CUD쿼리 결과 리턴
	 * </pre>
	 * 
	 * @method Name : insert
	 * @param String sqlMapId, Object parameterMap
	 * @return Object <T> 
	 * @throws NanumException
	 * 
	 */
	public int insert(String sqlMapId, Object parameterMap) throws Exception {
		long startTime = System.currentTimeMillis();
		int obj = getSqlSession().insert(sqlMapId, parameterMap);
		long endTime = System.currentTimeMillis();
		
		if (log.isDebugEnabled()) {
			log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
		}
		
		return obj;
	}
	
	public int delete(String sqlMapId, Object parameterMap) throws Exception {
		long startTime = System.currentTimeMillis();
		int obj = getSqlSession().delete(sqlMapId, parameterMap);
		long endTime = System.currentTimeMillis();
		
		if (log.isDebugEnabled()) {
			log.debug("[" + sqlMapId + "]query execute TIME : " + (endTime - startTime) + "(ms)]]");
		}
		
		return obj;
	}
}