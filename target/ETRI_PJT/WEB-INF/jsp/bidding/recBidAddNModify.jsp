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
	<div style="float: right;">
		<select>
			<option>중개사업자명</option>
			<option>1</option>
			<option>2</option>
		</select>
		<select>
			<option>집합자원명</option>
			<option>1</option>
			<option>2</option>
		</select>
		<input type="text" name="shDate" id="shDate"/>
		<a class="btn_big2">
			<img src="../images/img/ico_add.png"/>
			행추가
		</a>
	</div>
	<table class="tb4" style="padding-top: 10px;width: 100%;font-size: 10">
		<tr>
			<th>자원명</th>
			<th>설비코드</th>
			<th>REC코드</th>
			<th>매도가능수량</th>
			<th>매도수량</th>
			<th>매도단가</th>
			<th>매도가격</th>
			<th>입찰시간</th>
		</tr>
		<tr>
			<td>
				<select>
					<option>길쌈</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td>201401</td>
			<td>
				<select>
					<option>201401-001</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td>10</td>
			<td>1</td>
			<td>1,100</td>
			<td>1,100</td>
			<td>2016.10.11 09:45:00</td>
		</tr>
		<tr>
			<td>
				<select>
					<option>영월</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td>201421</td>
			<td>
				<select>
					<option>201421-001</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td>11</td>
			<td>4</td>
			<td>1,200</td>
			<td>4,800</td>
			<td>2016.10.11 09:22:11</td>
		</tr>
		<tr>
			<td>
				<select>
					<option>군포</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td>201411</td>
			<td>
				<select>
					<option>201411-001</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td>6</td>
			<td>6</td>
			<td>1,100</td>
			<td>6,600</td>
			<td>2016.10.11 09:13:00</td>
		</tr>
		<tr>
			<td colspan="4">합계</td>
			<td>11</td>
			<td>3,400</td>
			<td>37,400</td>
			<td>-</td>
		</tr>
	</table>
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
</div>
<script>
setDatePickerOne('shDate');
</script>