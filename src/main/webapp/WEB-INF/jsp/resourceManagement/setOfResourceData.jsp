<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="tb2" style="width: 100%;height: 100%;">
	<tr>
		<th>번호</th>
		<th>집합발전명</th>
		<th>사업자명</th>
		<th>발전총용량</th>
		<th>지역</th>
		<th>처리</th>
	</tr>
	
	<c:forEach var="result" items="${results}" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${result.set_gnr_nm}</td>
			<td>${result.enpr_nm}</td>
			<td>${result.tot_eqpm_cpct}</td>
			<td>${result.regn}</td>
			<td>
				<a class="btn_big" href="javascript:fnMap.rM.modifyPopUp('집합발전기',0,'${result.enpr_id}')">
					<img src="../images/img/ico_modify.png"/>
					변경
				</a>
			</td>
		</tr>
	</c:forEach>
</table>