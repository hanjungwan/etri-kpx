<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 *  2016. 10. 13.          creme55         최초 생성(index template file)
 *
 * </pre>
 **/
%>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ include file="/WEB-INF/jsp/common/include/tag_define.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>[<decorator:title default="ETRI 분산자원/신재생에너지 전력거래 중개시스템" />]</title>
<decorator:head />
<page:apply-decorator name="resource_import" />
</head>
<body>

<!----//wrapper----->
<div id="wrapper">
	<page:apply-decorator name="header" />
	
	<!----//container----->
	<div class="container">
	
		<page:apply-decorator name="b_management_left_menu" />
		<decorator:body />

	</div>
	<!----container//----->	
	
</div>
 <!----wrapper//----->

<div class="footer">
	<page:apply-decorator name="footer" />
</div>

</body>
</html>