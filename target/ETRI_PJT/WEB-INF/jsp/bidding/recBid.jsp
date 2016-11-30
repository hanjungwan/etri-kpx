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
	<table class="tb1" style="float: right;">
		<tr>
			<td>
				<select>
					<option>중개사업자명</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td style="width: 350px;">
				<input type="text" name="startDate" id="startDate" value="캘린더" size=12/>
				<input type="text" name="endDate" id="endDate" value="캘린더" size=12/>
			</td>
			<td>
				<a class="btn_big" style="float: right;">
					<img src="../images/img/ico_magnifier.png"/>
					검색
				</a>
			</td>
			<td>
				<a class="btn_big2" style="float: right;" href="javascript:fnMap.bidding.addPopUp('REC',1);">
					<img src="../images/img/ico_add.png"/>
					신규입찰
				</a>
			</td>
		</tr>			
	</table>
</div>

<table class="tb2" style="width: 80%;height: 100%;float: right;">
	<thead>
		<tr>
			<th>판매희망일</th>
			<th>집합자원명</th>
			<th>REC 코드</th>
			<th>매도수량</th>
			<th>매도단가</th>
			<th>매도가격</th>
			<th>입찰시간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="4">2016.10.11</td>
			<td>태안복합</td>
			<td>201401-001</td>
			<td>1</td>
			<td>1,100</td>
			<td>1,100</td>
			<td>2016.10.11 09:45:00</td>
		</tr>
		<tr>
			<td>금정발전</td>
			<td>201401-001</td>
			<td>4</td>
			<td>1,200</td>
			<td>4,800</td>
			<td>2016.10.11 09:22:11</td>
		</tr>
		<tr>
			<td>통해발전</td>
			<td>201401-001</td>
			<td>6</td>
			<td>1,100</td>
			<td>6,600</td>
			<td>2016.10.11 09:13:00</td>
		</tr>
		<tr>
			<td colspan="2">합계</td>
			<td>11</td>
			<td>3,400</td>
			<td>37,400</td>
			<td>-</td>
		</tr>
		<tr>
			<td rowspan="3">2016.10.12</td>
			<td>태안복합</td>
			<td>201401-001</td>
			<td>7</td>
			<td>1,100</td>
			<td>7,700</td>
			<td>2016.10.12 09:45:00</td>
		</tr>
		<tr>
			<td>금정발전</td>
			<td>201401-001</td>
			<td>8</td>
			<td>1,200</td>
			<td>9,600</td>
			<td>2016.10.12 09:15:00</td>
		</tr>
		<tr>
			<td colspan="2">합계</td>
			<td>15</td>
			<td>2,200</td>
			<td>33,000</td>
			<td>-</td>
		</tr>
	</tbody>
</table>
<div id="popUpDialog" style="display:none;" >
	<div id="popContext"/>
</div>
<script>
	$('#left_menu_1').attr('class','active');
	
	setDatePicker('startDate','endDate');
// 	var optionStr = {
// 	        closeText: '닫기',
// 	        prevText: '이전달',
// 	        nextText: '다음달',
// 	        currentText: '오늘',
// 	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
// 	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
// 	        dayNames: ['일','월','화','수','목','금','토'],
// 	        dayNamesShort: ['일','월','화','수','목','금','토'],
// 	        dayNamesMin: ['일','월','화','수','목','금','토'],
// 	        dateFormat: 'yy-mm-dd',
// 	        showMonthAfterYear: true,
// 	        yearSuffix: '년',
// 	        changeMonth: true,
// 	        changeYear: true,
// 	        showButtonPanel: true,
// 	        showOn: "both",
// 	        buttonImage: "/images/img/ico_calendar.png",
// 	        buttonImageOnly: true,
// 	        yearRange: 'c-99:c+99'
// 	},
// 	$startDay = $("#startDate").datepicker(optionStr),
// 	$endtDay = $("#endDate").datepicker(optionStr);
	

// 	$startDay.datepicker('option', 'maxDate', $endtDay.val());   	    
// 	$endtDay.datepicker('option', 'minDate', $startDay.val());
	
</script>
</body>
</html>