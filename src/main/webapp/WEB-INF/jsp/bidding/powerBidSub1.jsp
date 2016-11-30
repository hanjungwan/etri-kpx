<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	    if(val == '합계')	return ' colspan=2';
	    if(rawObject.set_gnr_nm == '합계' && val !='합계' && cm.name!='all_hr')	return ' style="display:none;"';
	};
	var colNameArr = ["판매희망일", "집합자원명","입찰시간","전체입찰량"];
	for(var num=0;num<24;num++){
		if(num+1<10)
			colNameArr[num+4]= "hr_0"+(num+1);
		else
			colNameArr[num+4]= "hr_"+(num+1);
	}

	var colModelArr = [];
	colModelArr.push({ name: "sle_wnt_dt",index:'sle_wnt_dt', width:100, frozen: true, cellattr: rowSetting });
	colModelArr.push({ name: "set_gnr_nm",index:'set_gnr_nm', width:100, frozen: true, cellattr: colSetting });
	colModelArr.push({ name: "crt_dt",index:'crt_dt', width:100, frozen: true,cellattr: colSetting });
	colModelArr.push({ name: "all_hr",index:'all_hr', width:100, frozen: true,cellattr: colSetting });
	for(var num=0;num<24;num++){
		if(num+1<10)
			colModelArr.push({ name: "hr_0"+(num+1),index:'hr_0'+(num+1),width:50});
		else
			colModelArr.push({ name: "hr_"+(num+1),index:'hr_'+(num+1),width:50});
	}
	setDatePicker('startDate','endDate');
	setJqGridFormKPX('list', 'listPager', colNameArr, colModelArr, '',1000,'auto',gridData);
});
</script>
<div style="width: 100%;overflow: auto;">
	<form id="bd_popup" class="form-group" style="float: right;">
		<table id="bd_form" class="tb1" style="float: left;width: 100%;">
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
					<a class="btn_big" style="float: right;" href="javascript:shBid('1');">
						<img src="../images/img/ico_magnifier.png"/>
						검색
					</a>
				</td>
<!-- 				<td> -->
<!-- 					<a class="btn_big2" style="float: right;" href="javascript:fnMap.bidding.addPopUp('입찰',0)"> -->
<!-- 						<img src="../images/img/ico_add.png"/> -->
<!-- 						신규입찰 -->
<!-- 					</a> -->
<!-- 				</td> -->
			</tr>			
		</table>
	</form>
</div>
<div style="width: 100%;">

<!-- <div class="tb_wrap" style="border: solid 1px #D7D7D7;"> -->
	<table id="list"></table>
	<div id="listPager" style="padding-top: 20px;"></div> 	
<!-- </div> -->
<!-- 	<table class="tb2" style="height: 100%;float: right;"> -->
	
<!-- 		<tr> -->
<!-- 			<th>판매희망일</th> -->
<!-- 			<th>집합자원명</th> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<%-- 				<th class="hour"><%=num %>h</th> --%>
<%-- 			<%} %> --%>
<!-- 			<th>전체입찰량</th> -->
<!-- 			<th>입찰시간</th> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td rowspan="4">2016.10.11</td> -->
<!-- 			<td>태안복합</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>502</td> -->
<!-- 			<td>2016.10.11 09:45:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>금정발전</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>313</td> -->
<!-- 			<td>2016.10.11 09:22:11</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>통해발전</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>233</td> -->
<!-- 			<td>2016.10.11 09:13:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>합계</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>1048</td> -->
<!-- 			<td>-</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td rowspan="3">2016.10.12</td> -->
<!-- 			<td>태안복합</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>502</td> -->
<!-- 			<td>2016.10.12 09:45:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>금정발전</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>111</td> -->
<!-- 			<td>2016.10.12 09:15:00</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>합계</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>613</td> -->
<!-- 			<td>-</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
</div>