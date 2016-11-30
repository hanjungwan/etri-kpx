package com.sched;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nc.common.dao.CommonDAO;

/**
 * 
 * @Class Name  : WSClientSched
 * @작성일   : 2014. 7. 30. 
 * @작성자   : Han Jung-Wan
 * @변경이력  :
 * @Class 설명 : SchedDynamicConfig을 상속 받아 getJobList()을 구현 한다.
 * 스케쥴 리스트을 리턴 해준다.
 */
@Component
public class SchedRun extends SchedDynamicConfig{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	protected List<HashMap<String, String>>  getJobList() {
		List<HashMap<String, String>> list = null;
		try {
			list =  (List<HashMap<String, String>>) dao.getSelectResult("job.selectSchedList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
