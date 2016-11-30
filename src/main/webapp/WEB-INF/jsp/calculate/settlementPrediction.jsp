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
<div class="form-group" style="float: right;">
	<table class="tb1" style="float: left;">
		<tr>
			<td>
				<select>
					<option>중개사업자명</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>		
			<td>
				<select>
					<option>집합발전기명</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td style="width: 200px;">
				<input type="text" name="shDate" id="shDate" size=12/>
			</td>
			<td>
				<a class="btn_big" style="float: right;">
					<img src="../images/img/ico_magnifier.png"/>
					검색
				</a>
			</td>
		</tr>			
	</table>
</div>

<table class="tb2" style="width: 80%;height: 100%;float: right;">
	<thead>
		<tr>
			<th>시간</th>
			<th>초기입찰량</th>
			<th>변동입찰량</th>
			<th>계량전력량</th>
			<th>초기입찰예측제공량</th>
			<th>변동입찰예측제공량</th>
			<th>예측제공량</th>
		</tr>
	</thead>
	<tbody>
		<%for(int num=1;num<25;num++){ %>
		<tr>
			<td><%=num %>h</td>
			<td><%=(num+6)%10 %></td>
			<td><%=(num+1)%20 %></td>
			<td><%=(num+1)%20 %></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<%} %>
	</tbody>
	<tfoot>
		<tr>
			<td>합계</td>
			<td></td>
			<td>6</td>
			<td>4400</td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tfoot>
</table>
<script>
	$('#left_menu_2').attr('class','active');
	setDatePickerOne('shDate');
</script>
</body>
</html>