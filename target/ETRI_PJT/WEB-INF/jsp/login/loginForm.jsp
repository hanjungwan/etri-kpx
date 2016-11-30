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
 * @since 2016. 10. 21.
 * @version 1.0
 * @see 
 * @Copyright ? [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 21.          creme55         로그인 페이지 
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ETRI 분산자원/신재생에너지 전력거래 중개시스템</title>
<%@ include file="/WEB-INF/jsp/common/include/resource_import.jsp" %>
<script src="/js/service/mypage/mypage.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#usrId").focus();
});
</script>
</head>
<body>

<!-- //Wrap-->
<div class="log_Wrap">

	<form name="loginFrm" id="loginFrm" method="POST" action="">
		<div class="login_box">
			<div class="idwrap"><input type="text" name="usrId" id="usrId" value="" placeholder="아이디를 입력하세요" maxlength="20"></div>
			<div class="pwwrap"><input type="password" name="usrPwd" id="usrPwd" value="" placeholder="비밀번호를 입력하세요" maxlength="32"></div>
			<div class="bnwrap"><img src="/images/btn/login.png" onclick="javascript:sysLogin('loginFrm');"></div>
			<div class="memwrap">
				<a href="javascript:;" onclick="javascript:fndUsrInfo(); return false;">아이디/비밀번호 찾기</a>
				<a href="javascript:;" onclick="javascript:moveMemberRegist(); return false;" style="margin: 0 0 0 20px;">회원가입</a>
			</div>
		</div>
	</form>
</div>
<!--Wrap//-->	

</body>
</html>