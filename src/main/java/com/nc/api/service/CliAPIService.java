package com.nc.api.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.nc.api.validator.CliResponseBean;
import com.nc.api.validator.ResponseBean;
import com.nc.common.dao.CommonDAO;

@Service
public class CliAPIService {
	
	private static final Logger log = LoggerFactory.getLogger(CommonDAO.class);
	
	@Autowired
	private CommonDAO dao;

	public void execEnprInfo(CliResponseBean res) {
		try {
			List<Map<String, String>> list = res.getItems();

			for (Map<String, String> result : list) {
				String use = result.get("USE_YN");
				String dataTp = result.get("DATA_TP");
				if (StringUtils.equalsIgnoreCase(use, "N")) {
					dao.delete("api.deleteEnprInfo", result);
				} else if (StringUtils.equalsIgnoreCase(dataTp, "N")) {
					dao.delete("api.deleteEnprInfo", result);
					dao.insert("api.insertEnprInfo", result);
				} else {
					dao.insert("api.updateEnprInfo", result);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void execSetRsrsInfo(CliResponseBean res) {
		try {
			List<Map<String, String>> list = res.getItems();

			for (Map<String, String> result : list) {
				String use = result.get("USE_YN");
				String dataTp = result.get("DATA_TP");
				if (StringUtils.equalsIgnoreCase(use, "N")) {
					dao.delete("api.deleteSetRsrsInfo", result);
				} else if (StringUtils.equalsIgnoreCase(dataTp, "N")) {
					dao.delete("api.deleteSetRsrsInfo", result);
					dao.insert("api.insertSetRsrsInfo", result);
				} else {
					dao.insert("api.updateSetRsrsInfo", result);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void execRsrsInfo(CliResponseBean res) {
		try {
			List<Map<String, String>> list = res.getItems();

			for (Map<String, String> result : list) {
				String use = result.get("USE_YN");
				String dataTp = result.get("DATA_TP");
				if (StringUtils.equalsIgnoreCase(use, "N")) {
					dao.delete("api.deleteRsrsInfo", result);
				} else if (StringUtils.equalsIgnoreCase(dataTp, "N")) {
					dao.delete("api.deleteRsrsInfo", result);
					dao.insert("api.insertRsrsInfo", result);
				} else {
					dao.insert("api.updateRsrsInfo", result);
				}
			}
		} catch (Exception e) {
			log.error(e.toString());
		}
	}
	
	public void execTenerInfo(List<ModelMap> list) {
		try {
			for (ModelMap result : list) {
				dao.insert("api.insertTenderInfo", result);
			}
		} catch (Exception e) {
			log.error(e.toString());
		}
	}
}
