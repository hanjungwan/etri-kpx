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
 *  2016. 10. 13.          creme55         최초 생성(error for view page do not exist)
 *
 * </pre>
 **/
%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ include file="/WEB-INF/jsp/common/include/tag_define.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
<%@ include file="/WEB-INF/jsp/common/include/resource_import.jsp" %>
</head>
<body>
<!----//wrapper----->

      <!----//container----->
	  <div class="sub_container">
         
          <!----//row100----->
          <div class="row" style="min-height:210px;">
                
				<!---left Menu//----->


				<!---//Contents----->
				<div class="col_p85">
				   <div class="contents" >
				    
                          <div class="error">
						    <p class="font1">ERROR </p>
							<p class="font0"><span>요청하신 페이지</span>를 찾을 수 없습니다. </p>

							<p class="font2">주소가 잘못 입력되었거나, 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br>
							입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.<br/><br/>
							시스템 이용에 관련한 문의 사항은 <span>아래 번호</span>로 전화주시면 
							안내해 드리겠습니다. 감사합니다. </p>
							<br> 

							 <div class="err_box">
								<p class="font3">
								문의전화 : 021-1234  <br/>
								운영시간 : 09:00 ~ 18:00 (평일)
								</p>
						     </div>
                         </div>
				   </div>
				</div>
				<!---Contents//----->


		  </div>
		  <!----row100//----->


	  </div>
	  <!----container//----->
</div>
 <!----wrapper//----->
  


<!---//footer--->
<div class="footer">
 <div class="copy">
  <span>(34129) 대전광역시 유성구 가정로 218, TEL 042-860-6114<br/>2016 Electronics and Telecommunications Research Institute. All rights reserved.</span>
 </div>
</div>
<!---footer//--->
		
</body>
</html>