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
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright ? [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 17.          creme55         최초 생성 (메인페이지, 홈페이지 이동)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
</head>
<body>
<div style="height: 20px;"></div>
<div style="width: 80%;float: right;">
<!-- 	<input type="button" value="최고 입찰" onclick="javascript:powerBidBodyAction(0);"/> -->
<!-- 	<input type="button" value="입찰 이력" onclick="javascript:powerBidBodyAction(1);"/> -->
	<div id="tab" class="bodytab_list m1" style="width:100%;">
		<ul>
			<li class="m1"><a href="javascript:powerBidBodyAction(0);" class="tabmn"><span>최종입찰</span></a></li>
			<li class="m2"><a href="javascript:powerBidBodyAction(1);" class="tabmn"><span>입찰이력</span></a></li>
		</ul>
	</div>
</div>
<div style="width: 80%;float: right;height: 100%">
	<div id="powerBidBody">
		<jsp:include page="/bidding/powerBidSub1.do"></jsp:include>
	</div>
</div>
<!-- <div> -->
<%-- 	<jsp:include page="powerBidSub2.jsp"></jsp:include> --%>
<!-- </div> -->
<script>
	$('#left_menu_0').attr('class','active');
</script>
<div id="popUpDialog" style="display:none;" >
	<div id="popContext"/>
</div>
</body>
</html>