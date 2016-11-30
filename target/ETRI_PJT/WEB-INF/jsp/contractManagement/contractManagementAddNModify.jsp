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
	<table style="padding-top: 10px;width: 100%;">
		<tr>
			<td style="background: #c8ddff;">중개사업자</td>
			<td colspan="3"><input type="text"/>
				<a class="btn_sm1">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">자원보유자명</td>
			<td><input type="text"/>
				<a class="btn_sm1">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
			<td style="background: #c8ddff;"><font color="red">*</font>자원명</td>
			<td><input type="text"/>
				<a class="btn_sm1">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">사업자등록번호</td>
			<td>
				<input type="text" name="startDate" id="startDate"/>
				<input type="text" name="endDate" id="endDate"/>
			</td>
			<td style="background: #c8ddff;">중개계약번호</td>
			<td><label></label></td>
		</tr>
		<tr>
			<td style="background: #c8ddff;"><font color="red">*</font>계약날짜</td>
			<td><input type="text"/></td>
			<td style="background: #c8ddff;">계약기간</td>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">전력거래수수요율</td>
			<td><input type="text"/></td>
			<td style="background: #c8ddff;">유지보수수수료</td>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">REC거래수수요율</td>
			<td><input type="text"/></td>
			<td style="background: #c8ddff;">KPX전력거래수수료</td>
			<td><label></label></td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">KPX 인증서거래수수료</td>
			<td colspan="3"><input type="text" size="89"/>
				<a class="btn_sm1">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
			</td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">첨부서류1</td>
			<td colspan="3"><input type="text" size="89"/>
				<a class="btn_sm1">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
			</td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">첨부서류2</td>
			<td colspan="3"><input type="text" size="89"/>
				<a class="btn_sm1">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
			</td>
		</tr>
		<tr>
			<td style="background: #c8ddff;">▼첨부서류3</td>
			<td colspan="3"><label></label></td>
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
setDatePicker('startDate','endDate');
</script>