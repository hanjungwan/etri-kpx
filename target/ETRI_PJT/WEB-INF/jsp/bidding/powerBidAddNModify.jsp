<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%!String code;
	String title;%>
<%request.setCharacterEncoding("UTF-8");
code="add";
if(request.getParameter("code")!=null)
	code=request.getParameter("code").toString();
%>
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
    $("#popList").jqGrid({
        url: "example.json",
        datatype: "json",
        mtype: "POST",
        colNames: colNameArr,
        colModel: colModelArr,
        pager: "#pager",
        width:830,
        viewrecords: true,
        shrinkToFit: false,
        autoencode: true,
        hight:'auto'
    }); 
}); 
</script>
<div style="width: 100%;overflow: auto;">
	<div style="float: right;">
		<span style="font-weight: bold;">중개사업자명</span>
		<select>
			<option>중개사업자명</option>
			<option>1</option>
			<option>2</option>
		</select>
		<span style="font-weight: bold;">판매희망일</span>
		<input type="text" name="shDate" id="shDate"/>
	</div>
</div>
<div style="width: 100%">
	<table id="popList"></table>
</div> 
<!-- <table class="tb4" style="padding-top: 10px;width: 100%;font-size: 10"> -->
<!-- 	<tr> -->
<!-- 		<th>판매희망일</th> -->
<!-- 		<th>집합자원명</th> -->
<%-- 		<%for(int num=1;num<25;num++){ %> --%>
<%-- 			<th><%=num %>h</th> --%>
<%-- 		<%} %> --%>
<!-- 		<th>전체입찰량</th> -->
<!-- 		<th>입찰시간</th> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td rowspan="4">2016.10.11</td> -->
<!-- 		<td>태안복합</td> -->
<%-- 		<%for(int num=1;num<25;num++){ %> --%>
<!-- 			<td>0</td> -->
<%-- 		<%} %> --%>
<!-- 		<td>502</td> -->
<!-- 		<td>2016.10.11 09:45:00</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>금정발전</td> -->
<%-- 		<%for(int num=1;num<25;num++){ %> --%>
<!-- 			<td>0</td> -->
<%-- 		<%} %> --%>
<!-- 		<td>313</td> -->
<!-- 		<td>2016.10.11 09:22:11</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>통해발전</td> -->
<%-- 		<%for(int num=1;num<25;num++){ %> --%>
<!-- 			<td>0</td> -->
<%-- 		<%} %> --%>
<!-- 		<td>233</td> -->
<!-- 		<td>2016.10.11 09:13:00</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>합계</td> -->
<%-- 		<%for(int num=1;num<25;num++){ %> --%>
<!-- 			<td>0</td> -->
<%-- 		<%} %> --%>
<!-- 		<td>1048</td> -->
<!-- 		<td>-</td> -->
<!-- 	</tr> -->
<!-- </table> -->
<%if(code.equals("add")){ %>

	<div class="form-group" style="float: right;width: 290px;">
		<a class="btn_big4" style="float: right;">
			제출
		</a>
	</div>
<%}else if(code.equals("modify")){ %>

	<div class="form-group" style="float: right;width: 290px;">
		<a class="btn_big4" style="float: right;">
			수정
		</a>
	</div>
<%} %>
<script>
setDatePickerOne('shDate');
</script>