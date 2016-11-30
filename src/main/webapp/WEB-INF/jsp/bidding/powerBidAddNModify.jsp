<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- 	<div class="tb_wrap" style="border: solid 1px #D7D7D7;"> -->
		<table id="popList"></table>
		<div id="popListPager"></div> 	
<!-- 	</div> -->
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
<c:if test="${param.code eq 'add'}">
	<div class="form-group" style="float: right; width: 290px;">
		<a class="btn_big4" style="float: right;">
			제출
		</a>
	</div>
</c:if>
<c:if test="${param.code eq 'modify'}">
	<div class="form-group" style="float: right;width: 290px;">
		<a class="btn_big4" style="float: right;">
			수정
		</a>
	</div>
</c:if>