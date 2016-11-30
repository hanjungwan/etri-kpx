<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var colNameArr = ["판매희망일", "집합자원명","전체입찰량","입찰시간","최종여부"];
for(var num=0;num<25;num++){
	colNameArr[num+5]=num+1+"h";
}

var colModelArr = [];
colModelArr.push({ name: "판매희망일", width:100, frozen: true});
colModelArr.push({ name: "집합지원명", width:100, frozen: true});
colModelArr.push({ name: "전체입찰량", width:100, frozen: true});
colModelArr.push({ name: "입찰시간", width:100, frozen: true});
colModelArr.push({ name: "최종여부", width:100, frozen: true});
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
		<table class="tb1" style="width: 100%;">
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
					<input type="text" name="shDate" id="shDate"/>
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
</div>
<div style="width: 100%;">
<table id="list"></table> 
<!-- 	<table class="tb2" style="width: 80%;height: 100%;float: right;"> -->
<!-- 		<tr> -->
<!-- 			<th>판매희망일</th> -->
<!-- 			<th>집합자원명</th> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<%-- 				<th><%=num %>h</th> --%>
<%-- 			<%} %> --%>
<!-- 			<th>전체입찰량</th> -->
<!-- 			<th>입찰시간</th> -->
<!-- 			<th>최종여부</th> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td rowspan="4">2016.10.11</td> -->
<!-- 			<td>태안복합</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>502</td> -->
<!-- 			<td>2016.10.11 09:45:00</td> -->
<!-- 			<td>Y</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>태안복합</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>313</td> -->
<!-- 			<td>2016.10.11 09:22:11</td> -->
<!-- 			<td>N</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>태안복합</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>233</td> -->
<!-- 			<td>2016.10.11 09:13:00</td> -->
<!-- 			<td>N</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>태안복합</td> -->
<%-- 			<%for(int num=1;num<25;num++){ %> --%>
<!-- 				<td>0</td> -->
<%-- 			<%} %> --%>
<!-- 			<td>111</td> -->
<!-- 			<td>2016.10.11 09:10:00</td> -->
<!-- 			<td>N</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
</div>
<script>
setDatePickerOne('shDate');
</script>