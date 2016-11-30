package com.nc.common.utils.constants;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nc.common.CommonConstants;

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
 * com.nc.common.utils.constants : CommConstantsMap.java
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
 *  2016. 10. 12.          creme55         최초 생성(공통 상수 맵 관리)         
 *
 * </pre>
 **/
@SuppressWarnings("serial")
public class CommConstantsMap extends HashMap<String, Object> {
	
	private static final Logger log = LoggerFactory.getLogger(CommConstantsMap.class);
	private static Map<String, Object> reflectedConstants;
	public static final CommConstantsMap commConstants = new CommConstantsMap();

	static {
		reflectedConstants = new HashMap<String, Object>();
		Field[] fields = CommonConstants.class.getFields();
		int i=0, s=fields.length;
		try {
			for(; i<s; i++) {
				reflectedConstants.put(fields[i].getName(), fields[i].get(null));
			}
		} catch (IllegalAccessException ex) {
			log.error("Exception accessing field : " + fields[i].getName());
		}
	}

	public Object get(Object key) {
		Object value = reflectedConstants.get(key);
		if (value == null) {
			throw new IllegalArgumentException("[" + key + "] " + "No such constant defined in class Constants");
		}
		return value;
	}
}