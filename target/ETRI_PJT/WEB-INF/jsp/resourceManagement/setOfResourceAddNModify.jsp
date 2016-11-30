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
	<div class="tit_st1" style="float: left;">
		<img src="../images/img/ico_tit.png"/>집합발전기 정보
	</div>
	<table class="tb4" style="padding-top: 10px;">
		<tr>
			<th>중개사업자</th>
			<td colspan="3">
				<input type="text" style="float: left;"/>
				<a class="btn_sm1" style="float: left;">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
		</tr>
		<tr>
			<th>집합발전기명</th>
			<td><input type="text"/></td>
			<th>지역</th>
			<td>
				<select>
					<option>수도권</option>
					<option>경기</option>
					<option>제주</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>KPX등록번호</th>
			<td><input type="text"/></td>
			<th>KPX등록명</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>설비총용량(KW)</th>
			<td><label></label></td>
			<th>발전원 개수</th>
			<td><label></label>	</td>
		</tr>
	</table>
	<div style="padding-top: 10px;">
		<div class="tit_st1" style="float: left;">
			<img src="../images/img/ico_tit.png"/>집합발전기 정보
		</div>
		<div style="float: right;">
			<a class="btn_big2">
				<img src="../images/img/ico_add.png"/>
				지원추가
			</a>
			<a class="btn_big2">
				<img src="../images/img/ico_delete.png"/>
				지원삭제
			</a>
		</div>
	</div>
	<table class="tb4" style="width:800px; padding-top: 10px;">
		<tr>
			<th><input type="checkbox"/> </th>
			<th>소규모 발전 자원명</th>
			<th>자원 보유자명</th>
			<th>발전원</th>
			<th>용도</th>
			<th>설비용량(KW)</th>
			<th>등록일</th>
		</tr>
		<tr>
			<td><input type="checkbox"/> </td>
			<td>태안복합 태양광</td>
			<td>(주) 태안복합발전</td>
			<td>태양광(PV)</td>
			<td>발전사업용</td>
			<td>100</td>
			<td>2015.12.20</td>
		</tr>
		<tr>
			<td><input type="checkbox"/> </td>
			<td>태안복합 여유ESS</td>
			<td>(주)대안복합발전</td>
			<td>전기자동차(EV)</td>
			<td>자가용</td>
			<td>50</td>
			<td>2015.12.20</td>
		</tr>
		<tr>
			<td><input type="checkbox"/> </td>
			<td>
				<select>
					<option>태안복합전기</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
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