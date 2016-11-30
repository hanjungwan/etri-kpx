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
<div style="width: 80%;float: right;margin: 10px;">
	<table class="tb2" style="width: 100%;">
		<tr>
			<th colspan="4">정산</th>
		</tr>
		<tr>
			<th>초기입찰 FAF</th>
			<td><input type="text"/></td>
			<th>초기입찰FAWF</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>변동입찰 FAF</th>
			<td><input type="text"/></td>
			<th>변동입찰FAWF</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>전력거래 KPX수수료 FAF</th>
			<td><input type="text"/></td>
			<th>REC거래 수수료</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>REC낙찰 변동값</th>
			<td colspan="4"><input type="text"/></td>
		</tr>
	</table>
	<div style="height: 20px;">&nbsp;</div>
	<table class="tb2" style="width: 100%;">
		<tr>
			<th colspan="4">스케줄시간</th>
		</tr>
		<tr>
			<th>자동전력정산 시간</th>
			<td colspan="3">
				<select>
					<option>D + 2</option>
					<option>D + 1</option>
					<option>D + 0</option>
					<option>D - 1</option>
					<option>D - 2</option>
				</select>
				일
				<select>
					<%for(int num=0;num<24;num++){ %>
						<option><%=num %>0:00</option>
					<%}; %>
				</select>
			</td>
		</tr>
		<tr>
			<th>SMP흭득 시간</th>
			<td colspan="3">
				<select>
					<option>D + 2</option>
					<option>D + 1</option>
					<option>D + 0</option>
					<option>D - 1</option>
					<option>D - 2</option>
				</select>
				일
				<select>
					<%for(int num=0;num<24;num++){ %>
						<option><%=num %>0:00</option>
					<%}; %>
				</select>
			</td>
		</tr>
		<tr>
			<th>자동REC정산시간</th>
			<td colspan="3">
				<select>
					<option>D + 2</option>
					<option>D + 1</option>
					<option>D + 0</option>
					<option>D - 1</option>
					<option>D - 2</option>
				</select>
				일
				<select>
					<%for(int num=0;num<24;num++){ %>
						<option><%=num %>0:00</option>
					<%}; %>
				</select>
			</td>
		</tr>
	</table>
</div>
<script>
	$('#left_menu_1').attr('class','active');
</script>
</body>
</html>