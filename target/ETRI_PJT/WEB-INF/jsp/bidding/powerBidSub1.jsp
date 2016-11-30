<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
var colNameArr = ["판매희망일", "집합자원명","전체입찰량","입찰시간"];
for(var num=0;num<25;num++){
	colNameArr[num+4]=num+1+"h";
}

var colModelArr = [];
colModelArr.push({ name: "판매희망일", width:100, frozen: true});
colModelArr.push({ name: "집합지원명", width:100, frozen: true});
colModelArr.push({ name: "전체입찰량", width:100, frozen: true});
colModelArr.push({ name: "입찰시간", width:100, frozen: true});
for(var num=0;num<25;num++){
	colModelArr.push({ name: num+1+"h",width:50});
}

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
<div style="width: 100%;overflow: auto;">
	<div class="form-group" style="float: right;">
		<table class="tb1" style="float: left;width: 100%;">
			<tr>
				<td>중개사업자명</td>
				<td>
					<select>
						<option>중개사업자명</option>
						<option>1</option>
						<option>2</option>
					</select>
				</td>
				<td>입찰시간</td>
				<td>
					<input type="text" name="startDate" id="startDate"/>
					<input type="text" name="endDate" id="endDate"/>
				</td>
				<td>
					<a class="btn_big" style="float: right;">
						<img src="../images/img/ico_magnifier.png"/>
						검색
					</a>
				</td>
				<td>
					<a class="btn_big2" style="float: right;" href="javascript:fnMap.bidding.addPopUp('입찰',0)">
						<img src="../images/img/ico_add.png"/>
						신규입찰
					</a>
				</td>
			</tr>			
		</table>
	</div>
</div>
<div style="width: 100%;">

<table id="list"></table> 
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
<script>
setDatePicker('startDate','endDate');
</script>
