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
	<table class="tb4" style="padding-top: 10px;width: 100%;">
		<tr>
			<th colspan="4">자원정보</th>
		</tr>
		<tr>
			<th>자원보유자명</th>
			<td>
				<input type="text" style="float: left;"/>
				<a class="btn_sm1" style="float: left;">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
			<th><font color="red">*</font>자원명</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th rowspan="2"><font color="red">*</font>자원소재지(기본)</th>
			<td>
				<input type="text" style="float: left;"/>
				<a class="btn_sm1" style="float: left;">
					<img src="../images/img/ico_magnifier_sm.png"/>
					우편번호
				</a>
			</td>
			<th><font color="red">*</font>지역</th>
			<td>
				<select>
					<option>수도권</option>
					<option>경기도</option>
					<option>제주도</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="text" size="35"/></td>
			<th><font color="red">*</font>용도</th>
			<td>
				<select>
					<option>자가용</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
		</tr>
		<tr>
			<th><font color="red">*</font>자원소재지(상세)</th>
			<td><input type="text" size="35"/></td>
			<th><font color="red">*</font>설비용량(KW)</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>최대발전용량(KW)</th>
			<td><input type="text"/></td>
			<th>최소발전용량(KW)</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th><font color="red">*</font>발전원</th>
			<td>
				<select>
					<option>태양광(PV)</option>
					<option>1</option>
				</select>
			</td>
			<th><font color="red">*</font>설치부지(지목)</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th><font color="red">*</font>설치부지(소유자)</th>
			<td><input type="text"/></td>
			<th><font color="red">*</font>설치부지(사용권원)</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>KPX회원번호</th>
			<td><input type="text"/></td>
			<th><font color="red">*</font>허가번호</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th><font color="red">*</font>등록번호</th>
			<td><input type="text"/></td>
			<th><font color="red">*</font>전력량계번호</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>REC계좌번호</th>
			<td><input type="text"/></td>
			<th>광제용RTU정보</th>
			<td><input type="text" placeholder="IP" size=15/><input type="text" placeholder="port" size=6/></td>
		</tr>
		<tr>
			<th>설비대수</th>
			<td><input type="text"/></td>
			<th>관제용 RTU정보</th>
			<td>
				<input type="text" name="shDate" id="shDate"/>
			</td>
		</tr>
		<tr>
			<th>▼&nbsp;&nbsp;첨부화일1</th>
			<td colspan="3">
				<a class="btn_sm1" style="float: left;">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
			</td>
		</tr>
	</table>
	<%if(code.equals("add")){ %>

		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;">
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
<script>
setDatePickerOne('shDate');
</script>