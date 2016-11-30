<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%
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
 * @author creme55
 * @since 2016. 10. 13.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                         수정자                                               수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 13.          creme55         최초 생성(error 공통 file)
 *
 * </pre>
 **/
%>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/WEB-INF/jsp/common/include/tag_define.jsp" %>
<%@ page import="java.io.*" %>
<%
log("WEB ERROR", exception);
String msg = exception.getMessage();
   
ByteArrayOutputStream osbyte = new ByteArrayOutputStream();
PrintStream ps = new PrintStream(osbyte);
exception.printStackTrace(ps);
String traceInfo = osbyte.toString().replaceAll("\\n", "<br />");
ps.close();
osbyte.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="error" />
<title>ETRI 분산자원/신재생에너지 전력거래 중개시스템</title>
</head>
<body>

	<!----//row100----->
          <div class="row" >
                
			
				<!---//Contents----->			
				   <div class="contents" >				    
                          <div class="error500">
						      <div class="font_pos1 font0"><span>"죄송합니다!"</span></div>
							  <div class="font_pos2 font4">서버에 시스템 오류가 발생하였습니다.</div>
							  <div class="err_box2">
							    <p>서버에 500-내부 오류가 발생하여 요청을 끝까지 처리하지 못했습니다.<br/>이전 페이지로 돌아가겠습니까?<br/><br/>
								<a href="/" class="btn_big3">메인 페이지</a>
								</p>
							  </div>
                         </div>
				   </div>
				
				<!---Contents//----->

				<p style="margin: 250px 0 0 0; font-size: 0.9em; color: #0000ff;">System Error Message : <%=msg %></p>
		  </div>
		  <!----row100//----->

</body>
</html>
