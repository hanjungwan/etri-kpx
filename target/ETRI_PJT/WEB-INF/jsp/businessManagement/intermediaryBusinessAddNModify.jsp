<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%!String code;
	String title;%>
<%request.setCharacterEncoding("UTF-8");
code="add";
if(request.getParameter("code")!=null)
	code=request.getParameter("code").toString();
%>
<div style="width: 800px;">
	<table class="tb4" style="width: 100%;">
		<tr>
			<th>중개사업자명</th>
			<td><input type="text"/></td>
			<th>대표자명</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>사업자 등록번호</th>
			<td><input type="text"/></td>
			<th>중개사업자번호</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>업태(업종)</th>
			<td><input type="text"/></td>
			<th>사업유형</th>
			<td>
				<select>
					<option>소규모전력공급자</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>담당자명</th>
			<td><input type="text"/></td>
			<th>담당자 전화번호</th>
			<td>
				<select>
					<option>02</option>
					<option>031</option>
					<option>032</option>
				</select>
				-<input type="text" size="4"/>-<input type="text" size="4"/>
			</td>
		</tr>
		<tr>
			<th>회사전화번호</th>
			<td>
				<select>
					<option>02</option>
					<option>031</option>
					<option>032</option>
				</select>
				-<input type="text" size="4"/>-<input type="text" size="4"/>
			</td>
			<th>FAX</th>
			<td>
				<select>
					<option>02</option>
					<option>031</option>
					<option>032</option>
				</select>
				-<input type="text" size="4"/>-<input type="text" size="4"/>
			</td>
		</tr>
		<tr>
			<th rowspan="2">사업장소재지(기본)</th>
			<td colspan="3">
				<input type="text" style="float: left;"/>
				<a class="btn_sm1" style="float: left;">
					<img src="../images/img/ico_magnifier_sm.png"/>
					우편번호
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="3"><input type="text" size="110"/></td>
		</tr>
		<tr>
			<th>사업장소재지(상세)</th>
			<td colspan="3"><input type="text" size="110"/></td>
		</tr>
	</table>
	<%if(code.equals("add")){ %>

		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;" href="javascript:fnMap.bM.addintermediaryBusiness()">
				등록
			</a>
		</div>
	<%}else if(code.equals("modify")){ %>

		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;">
				수정
			</a>
		</div>
	<%} %>
</div>