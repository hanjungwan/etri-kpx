<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/**
 *  ETRI Distributed Resource/Mediation System for new re-generation Energy Exchange
 *
 *  Copyright ⓒ [2016] ETRI. All rights reserved.
 *
 *    This is a proprietary software of ETRI, and you may not use this file except in
 *  compliance with license agreement with ETRI. Any redistribution or use of this
 *  software, with or without modification shall be strictly prohibited without prior written
 *  approval of ETRI, and the copyright notice above does not evidence any actual or
 *  intended publication of such software.
 *
 * @author creme55
 * @since 2016. 10. 17.
 * @version 1.0
 * @see 
 * @Copyright ? [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 17.          creme55         최초 생성 (메인페이지, 홈페이지 이동)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
</head>
<body>
<div class="form-group" style="float: right;width: 290px;">
	<a class="btn_big2" style="float: right;" href="javascript:fnMap.bM.addPopUp('중개사업자',0)">
		<img src="../images/img/ico_add.png"/>
		추가
	</a>
</div>

<table class="tb2" style="width: 80%;height: 100%;float: right;">
	<thead>
		<tr>
			<th>번호</th>
			<th>중개사업자명</th>
			<th>총위착발전기대수</th>
			<th>위탁관리발전총용량</th>
			<th>등록일</th>
			<th>처리</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>김쌈에너지</td>
			<td>1</td>
			<td>1,000kw</td>
			<td>2016.01.01</td>
			<td>
				<a class="btn_big" href="javascript:fnMap.bM.modifyPopUp('중개사업자',0)">
					<img src="../images/img/ico_modify.png"/>
					변경
				</a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>해남에너지</td>
			<td>3</td>
			<td>430kw</td>
			<td>2016.02.13</td>
			<td>
				<a class="btn_big" href="javascript:fnMap.bM.modifyPopUp('중개사업자',0)">
					<img src="../images/img/ico_modify.png"/>
					변경
				</a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>판교에너지</td>
			<td>2</td>
			<td>5,130kw</td>
			<td>2016.03.14</td>
			<td>
				<a class="btn_big" href="javascript:fnMap.bM.modifyPopUp('중개사업자',0)">
					<img src="../images/img/ico_modify.png"/>
					변경
				</a>
			</td>
		</tr>
		<tr>
			<td>4</td>
			<td>금정에너지</td>
			<td>6</td>
			<td>2,130kw</td>
			<td>2016.04.01</td>
			<td>
				<a class="btn_big" href="javascript:fnMap.bM.modifyPopUp('중개사업자',0)">
					<img src="../images/img/ico_modify.png"/>
					변경
				</a>
			</td>
		</tr>
		<tr>
			<td>5</td>
			<td>은숙에너지</td>
			<td>7</td>
			<td>1,730kw</td>
			<td>2016.05.01</td>
			<td>
				<a class="btn_big" href="javascript:fnMap.bM.modifyPopUp('중개사업자',0)">
					<img src="../images/img/ico_modify.png"/>
					변경
				</a>
			</td>
		</tr>
		<tr>
			<td>6</td>
			<td>정원에너지</td>
			<td>1</td>
			<td>2,430kw</td>
			<td>2016.06.01</td>
			<td>
				<a class="btn_big" href="javascript:fnMap.bM.modifyPopUp('중개사업자',0)">
					<img src="../images/img/ico_modify.png"/>
					변경
				</a>
			</td>
		</tr>
	</tbody>
</table>
<div id="popUpDialog" style="display:none;" >
	<div id="popContext"/>
</div>
<script>
	$('#left_menu_0').attr('class','active');
</script>
</body>
</html>