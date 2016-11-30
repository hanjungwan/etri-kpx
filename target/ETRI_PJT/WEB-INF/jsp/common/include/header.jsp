<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include/tag_define.jsp" %>
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
 *  2016. 10. 13.          creme55         최초 생성(header include file)
 *
 * </pre>
 **/
%>
<script type="text/javascript">

/**
 * @Function Name : dispCurrDate 
 * @Description : 현재 날짜를 dates attribute의 텍스트로 바인딩
 *				현재 시간을 1초 주기로 사용하기 위해 현재 시간을 가져오는 부분
 * @params : none
 * @return : void
 * @usage : dispCurrDate();
 *
 * ${tags}
 **/
 function dispCurrDate() {
	var dispTp = true;
	var dateStr = getCurrDate(dispTp);
	
	$("#dates").text(dateStr);
}

 /**
  * @Function Name : getCurrDate 
  * @Description : 현재 날짜를 확인하여 날짜 문자열을 리턴
  * @params : dispTp (년월일 보이기 위한 필터)
  * @return : String
  * @usage : getCurrDate(true);
  *
  * ${tags}
  **/
function getCurrDate(dispTp) {
	var newDate = new Date();
	var year = newDate.getFullYear();
	var month = newDate.getMonth() + 1;
	var day = newDate.getDate();
	var curr_hour = newDate.getHours();
	var curr_min = newDate.getMinutes();
	var curr_sec = newDate.getSeconds();
	
	month = (String(month).length == 1) ? "0" + month : month;
	day = (String(day).length == 1) ? "0" + day : day;
	
	curr_hour = (String(curr_hour).length == 1) ? "0" + curr_hour : curr_hour;
	curr_min = (String(curr_min).length == 1) ? "0" + curr_min : curr_min;
	curr_sec = (String(curr_sec).length == 1) ? "0" + curr_sec : curr_sec;
	
	if (dispTp) {
		var todayMesg = year + "년 " + month + "월 " + day + "일  " + curr_hour + ":" + curr_min + ":" + curr_sec;
	} else {
		var todayMesg = curr_hour + ":" + curr_min + ":" + curr_sec;
	}
	
	return todayMesg;
}

$(document).ready(function() {
	/* 1초 단위로 시간을 보이도록 함. */
	checkTime = setInterval(function() { dispCurrDate();}, 1000);
	
});
</script>

<!-- 		<div class="header"> -->
<!-- 			<div class="topwrap"> -->
<!-- 				<ul class="header topwrap"> -->
<!-- 					<li><a href="#" id="dates"></a></li> -->
<!-- 					<li><a href="#" id="help">HELP</a></li> -->
<!-- 					<li><a href="#" id="callback">통보함</a></li> -->
<!-- 					<li><a href="#" id="mypage">마이페이지</a></li> -->
<!-- 					<li><a href="#" id="login">로그인</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<nav class="nav">
			<div class="navbar">
				<a href="javascript:;" class="toplogo" onclick="javascript:goHome(); return false;"><img src="/images/img/logo.png" alt="ETRI 분산자원/신재생에너지 전력거래 중개시스템"></a>
				<ul class="nav navbar">
					<li><a href="/businessManagement/intermediaryBusiness.do"  id="b_management">사업자 관리</a></li>
					<li><a href="/resourceManagement/setOfResource.do"  id="r_management">자원관리</a></li>
					<li><a href="/contractManagement/contractManagement.do" id="c_management">중개계약관리</a></li>
					<li><a href="/bidding/powerBid.do" id="bidding">입찰</a></li>
					<li><a href="/calculate/weighingSettlement.do" id="calculate">정산</a></li>
					<li><a href="/meteringControl/meteringControl.do" id="meteringControl">미터링 관제</a></li>
					<li><a href="/set/smpPrices.do" id="smpPrices">설정</a></li>
				</ul>
			</div>
		</nav>
		