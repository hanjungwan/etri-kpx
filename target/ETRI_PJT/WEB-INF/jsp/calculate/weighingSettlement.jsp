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
</head>
<body>
<script type="text/javascript">
var colNameArr = ["시간"];
var paramArr = ["길쌈","군포"];
for(data in paramArr){
	colNameArr.push(paramArr[data]);
}
colNameArr.push('계량전력량합');
colNameArr.push('SMP');
colNameArr.push('정산금');
colNameArr.push('수수료');
colNameArr.push('최종정산금');

var colModelArr = [];
colModelArr.push({ name: "시간", width:100, frozen: true});
for(data in paramArr){
	colModelArr.push({ name: paramArr[data],width:100});
}
colModelArr.push({ name: '계량전력량합', width:100});
colModelArr.push({ name: 'SMP', width:100});
colModelArr.push({ name: '정산금', width:100});
colModelArr.push({ name: '수수료', width:100});
colModelArr.push({ name: '최종정산금', width:100});

$(function () {
    $("#list").jqGrid({
        url: "example.json",
        datatype: "json",
        mtype: "POST",
        colNames: colNameArr,
        colModel: colModelArr,
        pager: "#pager",
        width:1000,
        viewrecords: true,
        shrinkToFit: false,
        autoencode: true,
        hight:'auto'
    }); 
    $("#list").jqGrid("setFrozenColumns");
}); 
</script>
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

<div style="float: right;">
	<table id="list"></table> 
</div>
<!-- <table class="tb2" style="width: 80%;height: 100%;float: right;"> -->
<!-- 	<thead> -->
<!-- 		<tr> -->
<!-- 			<th>시간</th> -->
<!-- 			<th>길쌈</th> -->
<!-- 			<th>군포</th> -->
<!-- 			<th>계량전력량합</th> -->
<!-- 			<th>SMP</th> -->
<!-- 			<th>정산금</th> -->
<!-- 			<th>수수료</th> -->
<!-- 			<th>최종정산금</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
<!-- 	<tbody> -->
<%-- 		<%for(int num=1;num<25;num++){ %> --%>
<!-- 		<tr> -->
<%-- 			<td><%=num %>h</td> --%>
<!-- 			<td>0</td> -->
<!-- 			<td>0</td> -->
<!-- 			<td>0</td> -->
<!-- 			<td>76</td> -->
<!-- 			<td>0</td> -->
<!-- 			<td></td> -->
<!-- 			<td>0</td> -->
<!-- 		</tr> -->
<%-- 		<%} %> --%>
<!-- 	</tbody> -->
<!-- 	<tfoot> -->
<!-- 		<tr> -->
<!-- 			<td>합계</td> -->
<!-- 			<td>0</td> -->
<!-- 			<td>0</td> -->
<!-- 			<td>0</td> -->
<!-- 			<td>76</td> -->
<!-- 			<td>0</td> -->
<!-- 			<td></td> -->
<!-- 			<td>0</td> -->
<!-- 		</tr> -->
<!-- 	</tfoot> -->
<!-- </table> -->
<script>
	$('#left_menu_0').attr('class','active');
	setDatePickerOne('shDate');
</script>
</body>
</html>