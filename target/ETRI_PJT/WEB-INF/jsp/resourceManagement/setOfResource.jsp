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
<div class="form-group" style="float: right;width: 290px;">
	<table class="tb1" style="float: left;width: 120px;">
		<tr>
			<td>
				<select>
					<option>중개사업자명</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>										
		</tr>			
	</table>
	<div style="float: right;padding-top: 7px;">
		<a class="btn_big">
			<img src="../images/img/ico_magnifier_sm.png"/>
			검색
		</a>
		<a class="btn_big2" href="javascript:fnMap.rM.addPopUp('집합발전기',0)">
			<img src="../images/img/ico_add.png"/>
			추가
		</a>
	</div>
</div>
<table class="tb2" style="width: 80%;height: 100%;float: right;">
	<tr>
		<th>번호</th>
		<th>집합발전명</th>
		<th>사업자명</th>
		<th>발전총용량</th>
		<th>지역</th>
		<th>처리</th>
	</tr>
	<tr>
		<td>1</td>
		<td>태양광 집합</td>
		<td>솔라원</td>
		<td>100</td>
		<td>수도권</td>
		<td>
			<a class="btn_big" href="javascript:fnMap.rM.modifyPopUp('집합발전기',0)">
				<img src="../images/img/ico_modify.png"/>
				변경
			</a>
		</td>
	</tr>
	<tr>
		<td>2</td>
		<td>태양광+ESS</td>
		<td>ESS복합</td>
		<td>50</td>
		<td>수도권</td>
		<td>
			<a class="btn_big" href="javascript:fnMap.rM.modifyPopUp('집합발전기',0)">
				<img src="../images/img/ico_modify.png"/>
				변경
			</a>
		</td>
	</tr>
	<tr>
		<td>3</td>
		<td>풍력용 집합</td>
		<td>윈드파워</td>
		<td>500</td>
		<td>비수도권</td>
		<td>
			<a class="btn_big" href="javascript:fnMap.rM.modifyPopUp('집합발전기',0)">
				<img src="../images/img/ico_modify.png"/>
				변경
			</a>
		</td>
	</tr>
</table>
<div id="popUpDialog" style="display:none;" >
	<div id="popContext"/>
</div>
<script>
	$('#left_menu_0').attr('class','active');
</script>
</body>
</html>