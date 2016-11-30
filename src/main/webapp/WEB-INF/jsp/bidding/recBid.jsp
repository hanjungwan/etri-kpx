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
<script type="text/javascript">
$(function () {
	var gridData = ${results};
// 		[{"set_gnr_nm":"2","tot_eqpm_cpct":200,"hr_11":2.0,"hr_10":2.0,"hr_13":2.0,"hr_12":2.0,"hr_15":2.0,"hr_14":2.0,"hr_17":2.0,"hr_16":2.0,"hr_19":2.0,"hr_18":2.0,"crt_dt":"2016-11-13 17:50:13","sle_wnt_dt":"2016-11-13 17:50:13","attr":{"sle_wnt_dt":{"rowspan":"1"}},"hr_02":2.0,"hr_01":2.0,"hr_23":2.0,"hr_06":2.0,"hr_24":2.0,"hr_05":2.0,"hr_21":2.0,"hr_04":2.0,"hr_22":2.0,"hr_03":2.0,"hr_09":2.0,"hr_20":2.0,"hr_08":2.0,"hr_07":2.0},{"set_gnr_nm":"1","tot_eqpm_cpct":1,"hr_11":1.0,"hr_10":1.0,"hr_13":1.0,"hr_12":1.0,"hr_15":1.0,"hr_14":1.0,"hr_17":1.0,"hr_16":1.0,"hr_19":1.0,"hr_18":1.0,"crt_dt":"2016-11-14 17:50:13","sle_wnt_dt":"2016-11-14 17:50:13","attr":{"sle_wnt_dt":{"rowspan":"2"}},"hr_02":1.0,"hr_01":1.0,"hr_23":1.0,"hr_06":1.0,"hr_24":1.0,"hr_05":1.0,"hr_21":1.0,"hr_04":1.0,"hr_22":1.0,"hr_03":1.0,"hr_09":1.0,"hr_20":1.0,"hr_08":1.0,"hr_07":1.0},{"set_gnr_nm":"3","tot_eqpm_cpct":100,"hr_11":3.0,"hr_10":3.0,"hr_13":3.0,"hr_12":3.0,"hr_15":3.0,"hr_14":3.0,"hr_17":3.0,"hr_16":3.0,"hr_19":3.0,"hr_18":3.0,"crt_dt":"2016-11-14 17:50:13","sle_wnt_dt":"2016-11-14 17:50:13","attr":{"sle_wnt_dt":{"display":"none"}},"hr_02":3.0,"hr_01":3.0,"hr_23":3.0,"hr_06":3.0,"hr_24":3.0,"hr_05":3.0,"hr_21":3.0,"hr_04":3.0,"hr_22":3.0,"hr_03":3.0,"hr_09":3.0,"hr_20":3.0,"hr_08":3.0,"hr_07":3.0}],
	rowSetting = function (rowId, val, rawObject, cm) {
	    var attr = rawObject.attr[cm.name], result;
	    if (attr.rowspan) {
		    result = ' rowspan=' + '"' + attr.rowspan + '"';
	    } else if (attr.display) {
		    result = ' style="display:' + attr.display + '"';
	    }
	    return result;
	};
	colSetting = function (rowId, val, rawObject, cm) {
		if(val=='-') return ' style="text-align: center;"';
	    if(val == '합계')	return ' colspan=3,style="text-align: center;"';
	    if(rawObject.set_gnr_nm == '합계' && (cm.name =='rsrs_nm' || cm.name=='rec_eqpm_id'))	return ' style="display:none;"';
	};
	var colNameArr = ["판매희망일", "집합자원명","자원명","REC코드","매도수량","매도단가","매도가격","입찰시간"];

	var colModelArr = [];
	colModelArr.push({ name: "sle_wnt_dt",index:'sle_wnt_dt', width:174, frozen: true, cellattr: rowSetting });
	colModelArr.push({ name: "set_gnr_nm",index:'set_gnr_nm', width:100, frozen: true, cellattr: colSetting });
	colModelArr.push({ name: "rsrs_nm",index:'rsrs_nm', width:100, frozen: true,cellattr: colSetting });
	colModelArr.push({ name: "rec_eqpm_id",index:'rec_eqpm_id', width:100, frozen: true,cellattr: colSetting });
	colModelArr.push({ name: "sle_cnt",index:'sle_cnt', width:100,cellattr: colSetting });
	colModelArr.push({ name: "sle_upr",index:'sle_upr', width:100,cellattr: colSetting });
	colModelArr.push({ name: "tot_sle_amt",index:'tot_sle_amt', width:100,cellattr: colSetting });
	colModelArr.push({ name: "crt_dt",index:'crt_dt', width:170, cellattr: colSetting });
// 	setDatePicker('startDate','endDate');
	setJqGridFormKPX('list', 'listPager', colNameArr, colModelArr, '',1000,'auto',gridData);
}); 
</script>
<div style="width: 1000px;float: right;">
	<form id="bd_form" class="form-group">
		<table class="tb1" style="float: right;">
			<tr>
				<td>중개사업자명</td>
				<td>
					<select name="enpr_id">
						<c:forEach var="item" items="${iBNmList}">
							<option value="${item.enpr_id }">${item.enpr_nm }</option>
						</c:forEach>
					</select>
				</td>
				<td>입찰시간</td>
				<td>
					<input type="text" name="startDate" id="startDate"/>
					<input type="text" name="endDate" id="endDate"/>
				</td>
				<td>
					<a class="btn_big" style="float: right;" href="javascript:shBid('3');">
						<img src="../images/img/ico_magnifier.png"/>
						검색
					</a>
				</td>
	<!-- 			<td> -->
	<!-- 				<a class="btn_big2" style="float: right;" href="javascript:fnMap.bidding.addPopUp('REC',1);"> -->
	<!-- 					<img src="../images/img/ico_add.png"/> -->
	<!-- 					신규입찰 -->
	<!-- 				</a> -->
	<!-- 			</td> -->
			</tr>			
		</table>
	</form>
</div>
<div style="width: 1000px;height: 100%;float: right;">
	<table id="list"></table>
	<div id="listPager" style="padding-top: 20px;"></div> 	
</div>
<!-- <table class="tb2" style="width: 80%;height: 100%;float: right;"> -->
<!-- 	<thead> -->
<!-- 		<tr> -->
<!-- 			<th>판매희망일</th> -->
<!-- 			<th>집합자원명</th> -->
<!-- 			<th>REC 코드</th> -->
<!-- 			<th>매도수량</th> -->
<!-- 			<th>매도단가</th> -->
<!-- 			<th>매도가격</th> -->
<!-- 			<th>입찰시간</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
<!-- 	<tbody> -->
<!-- 		<tr> -->
<!-- 			<td rowspan="4">2016.10.11</td> -->
<!-- 			<td>태안복합</td> -->
<!-- 			<td>201401-001</td> -->
<!-- 			<td>1</td> -->
<!-- 			<td>1,100</td> -->
<!-- 			<td>1,100</td> -->
<!-- 			<td>2016.10.11 09:45:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>금정발전</td> -->
<!-- 			<td>201401-001</td> -->
<!-- 			<td>4</td> -->
<!-- 			<td>1,200</td> -->
<!-- 			<td>4,800</td> -->
<!-- 			<td>2016.10.11 09:22:11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>통해발전</td> -->
<!-- 			<td>201401-001</td> -->
<!-- 			<td>6</td> -->
<!-- 			<td>1,100</td> -->
<!-- 			<td>6,600</td> -->
<!-- 			<td>2016.10.11 09:13:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="2">합계</td> -->
<!-- 			<td>11</td> -->
<!-- 			<td>3,400</td> -->
<!-- 			<td>37,400</td> -->
<!-- 			<td>-</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td rowspan="3">2016.10.12</td> -->
<!-- 			<td>태안복합</td> -->
<!-- 			<td>201401-001</td> -->
<!-- 			<td>7</td> -->
<!-- 			<td>1,100</td> -->
<!-- 			<td>7,700</td> -->
<!-- 			<td>2016.10.12 09:45:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>금정발전</td> -->
<!-- 			<td>201401-001</td> -->
<!-- 			<td>8</td> -->
<!-- 			<td>1,200</td> -->
<!-- 			<td>9,600</td> -->
<!-- 			<td>2016.10.12 09:15:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="2">합계</td> -->
<!-- 			<td>15</td> -->
<!-- 			<td>2,200</td> -->
<!-- 			<td>33,000</td> -->
<!-- 			<td>-</td> -->
<!-- 		</tr> -->
<!-- 	</tbody> -->
<!-- </table> -->
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