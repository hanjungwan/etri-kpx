package com.nc.commonservice.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nc.common.dao.CommonDAO;
import com.nc.common.utils.ExcelUtil;

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
 * com.nc.commonservice.service : CommonServiceImpl.java
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
 *  2016. 10. 12.          creme55         최초 생성 (공통 서비스 구현체)                  
 *
 * </pre>
 **/
@Service("commonService")
public class CommonServiceImpl implements CommonService {
	private static final Logger log = LoggerFactory.getLogger(CommonServiceImpl.class);

	@Autowired
	private CommonDAO commonDao;					/* 공통 DAO 서비스 */

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
	public Map<?, ?> getCodeList(String sqlId, Map<String, Object> paramMap) throws Exception {
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =");
			log.debug("==========================================================================================");
		}
		
		return commonDao.getSelectResultMap(sqlId, paramMap);
	}
	
	@Value(value="#{global['upload_path']}")
	private String serverPath;
	
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
	public Map<String, Object> uploadFileProcess(final HttpServletRequest request) throws Exception {
		String fileUploadServerPath = "";
		String mdlAttrName = request.getParameter("fileReadNm");
		
		String fileUploadType = "";
		if(request.getParameter("serviceType") != null){
			fileUploadType = request.getParameter("serviceType");
		}
		
		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    
	    /* to upload process for multiple-uploading of files, by creme55 at August 9, 2016 */
	    List<MultipartFile> uploadFiles = multiRequest.getFiles(mdlAttrName);
	    
	    Map<String,Object> mResult = new HashMap<String,Object>();
	    
	    if (files == null || files.size() == 0) {
	    	ArrayList<Map<String, Object>> alFileInfo = new ArrayList<Map<String, Object>>();
	    	mResult.put("alFileInfo", alFileInfo);
	    } else {
	    	/* 파일 업로드 위치 설정, 개발진행하면서 관련 룰 재설정 예정 */
	    	if (fileUploadType.equals("order")) {
	    		/* 주문/입찰 */
	    		fileUploadServerPath = serverPath;
	    	} else {
		    	fileUploadServerPath = serverPath;
		    }
	    	
		    //String monthData = getCurrentMonthDate();
		    String uploadPathTmp = "";
		    String imgUploadPath = "";
		    
		    /* 파일 위치 구분 */
		    if (fileUploadType.equals("00")){
			    /* 주문/입찰에 대한 파일 */
		    	uploadPathTmp =  fileUploadServerPath;
			    imgUploadPath =  fileUploadServerPath;
		    } else {
		    	/* 타 서비스에서 사용하는 파일, 개발 진행중에 해당 룰 적용 예정 */ 
		    }

		    /* process files */
		    File saveFolder = new File(uploadPathTmp);
		    
		    /* 디렉토리 생성 */
		    if (!saveFolder.exists() || saveFolder.isFile()) {
		    	if(saveFolder.mkdirs()) {
		    		if (log.isDebugEnabled()) {
		    			log.debug("==========================================================================================");
		    			log.debug("= Message : Directory Created =");
		    			log.debug("==========================================================================================");
		    		}
		        } else {
		    		if (log.isDebugEnabled()) {
		    			log.debug("==========================================================================================");
		    			log.debug("= Message : Directory is not created =");
		    			log.debug("==========================================================================================");
		    		}
		        }
		    }

		    MultipartFile file;
		    
		    String newFileNm = ExcelUtil.getCurrentDateNum();
		    String filePath = "";
		    
		    ArrayList<Map<String, Object>> alFileInfo = new ArrayList<Map<String, Object>>();
		    int alListCnt = 0;
		    
		    /* to handle DefaultMultipartHttpServletRequest's API, by creme55 at August 9, 2016 */
		    for (int i = 0; i < uploadFiles.size(); i++) {
		    	alListCnt = i;
		    	String newFileNmStr = newFileNm + alListCnt;
		    	Map<String, Object> fileInfo = new HashMap<String, Object>();
		    	
		    	file = uploadFiles.get(i);

		    	if (!"".equals(file.getOriginalFilename())) {
					String filename = file.getOriginalFilename();
		    		fileInfo.put("originalFileName", filename);
		    		String extension = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
		    		fileInfo.put("file_ext", extension);
		    		newFileNmStr = newFileNmStr + "." + extension;
		    		fileInfo.put("file_name", newFileNmStr);
		    		fileInfo.put("file_path", imgUploadPath);
		    		filePath = uploadPathTmp + "\\" + newFileNmStr;
		    		file.transferTo(new File(filePath));
		    		alFileInfo.add(fileInfo);

		    		if (log.isDebugEnabled()) {
				    	log.debug("===================================================================================================");
						log.debug("= tempFile name : {} =", filename);
						log.debug("= newFileNmStr name : {} =", newFileNmStr);
		    		}
		    	}
		    }
		    
		    if (log.isDebugEnabled()) {
		    	log.debug("===================================================================================================");
		    }
		    
		    mResult.put("alFileInfo", alFileInfo);
	    }
	    
        return mResult;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통 처리 
	 * 2. 처리내용 : 사용자 정보 조회
	 * </pre>
	 *
	 * @method Name : getUsrInfo
	 * @param paramMap
	 * @return Map<?, ?>
	 * @throws Exception
	 * 
	 */
	public Map<?, ?> getUsrInfo(String sqlId, Map<String, Object> paramMap) throws Exception {
		return commonDao.getSelectResultMap(sqlId, paramMap);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 공통 서비스
	 * 2. 처리내용 : 현재(한국기준) 날짜정보를 얻는다.
	 * </pre>
	 *
	 * @method Name : getCurrentMonthDate
	 * @param 
	 * @return String
	 * @throws none
	 * 
	 */
	public String getCurrentMonthDate() {
		Calendar aCalendar = Calendar.getInstance();

		int year = aCalendar.get(Calendar.YEAR);
		int month = aCalendar.get(Calendar.MONTH) + 1;
		String strDate = Integer.toString(year) + ((month < 10) ? "0" + Integer.toString(month) : Integer.toString(month));
		
		return strDate;
	}
	@Override
	public List<?> getDataList(String sqlId,
			Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		if (log.isDebugEnabled()) {
			log.debug("==========================================================================================");
			log.debug("= result : [{}] =");
			log.debug("==========================================================================================");
		}
		
		return commonDao.getSelectResult(sqlId, paramMap);
	}

}