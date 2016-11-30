package com.sched.service;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.net.ssl.SSLContext;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nc.common.CommonUtil;
import com.nc.common.dao.CommonDAO;

@Service
public class SMPDataService {
	
	private static final Logger log = LoggerFactory.getLogger(SMPDataService.class);
	
	@Autowired
	private CommonDAO dao;
	
	private final String URL = "https://www.kpx.or.kr/addService/smpYearExcel.do";
	
	public void getSmpData() throws KeyManagementException, NoSuchAlgorithmException, KeyStoreException{
		
		//https HandShake
		SSLContext sslcontext = SSLContexts.custom().useSSL().loadTrustMaterial(null, new TrustSelfSignedStrategy()).build();
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
		HttpClient http = HttpClientBuilder.create().setSSLSocketFactory(sslsf).build();
		
		try {
			final String year 	= CommonUtil.getCustomTime("yyyy", 	-1);
			HttpGet httpGet = new HttpGet(URL+"?gubun=land&issue_year="+year);
			
			ResponseHandler<String> reph = new ResponseHandler<String>() {
				@Override
				public String handleResponse(HttpResponse rep) {
					try {
						HSSFWorkbook hs = new HSSFWorkbook(rep.getEntity().getContent());
						excelParsing(hs);
					} catch (IOException e) {
						log.error(e.toString());
					}
					return null;
				}
			};
			http.execute(httpGet, reph);
		} catch (Exception e) {
			log.error(e.toString());
		}
	}
	/**
	 * ISmart HTML 문서 파싱 
	**/
	public void excelParsing(HSSFWorkbook hs) {		
		HSSFSheet sheet=hs.getSheetAt(0);
		int rowindex;
		
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		for(rowindex=4;rowindex<=365;rowindex++){
			HSSFRow row=sheet.getRow(rowindex);
			
			if(row == null)
				break;
			
			int columnindex;
			HashMap<String, String> resultMap = new HashMap<String, String>();
			for(columnindex=0;columnindex<=24;columnindex++){
				HSSFCell cell=row.getCell(columnindex);
				
				if(cell == null)
					break;
				
				if(columnindex == 0)
					resultMap.put("smpDate", cell.getStringCellValue());
				else
					resultMap.put("hr"+columnindex, cell.getStringCellValue());
			}
			list.add(resultMap);
			log.debug(resultMap.toString());
		}
		insertData(list);
	}

	public void insertData(List<HashMap<String, String>> list) {		
		for(HashMap<String, String> resultMap : list){
			try {
				dao.insert("job.insertSMPdata", resultMap);
			} catch (Exception e) {
				log.error(e.toString());
			}
		}
	}
}
