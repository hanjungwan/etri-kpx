<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form id="cm_form" style="width: 100%;min-width: 800px;">
	<table class="tb4" style="padding-top: 10px;width: 100%;">
		<colgroup>
			<col style="width:150px;">
			<col style="width:250px;">
			<col style="width:150px;">
			<col style="width:250px;">
		</colgroup>
		<tr>
			<td>계약 ID</td>
			<td><input id="cntr_id" name="cntr_id" type="text" value="${results[0].cntr_id}"/></td>
		</tr>
		<tr>
			<th>중개사업자</th>
			<td colspan="3"><input id="mdt_nm" name="mdt_nm"  type="text" value="${results[0].mdt_nm}"/>
				<input id="mdt_enpr_id" name="mdt_enpr_id" type="hidden" value="${results[0].mdt_enpr_id }"/>
				<a class="btn_sm1" href="javascript:shSelectionList('selectionList','selectionListDialog','중개사업자 목록','Mdt','mdt_enpr_id','mdt_nm');">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
		</tr>
		<tr>
			<th>자원보유자명</th>
			<td><input id="enpr_nm" name="enpr_nm"  type="text" value="${results[0].enpr_nm}"/>
				<input id="enpr_id" name="enpr_id" type="hidden" value="${results[0].enpr_id }"/>
				<a class="btn_sm1" href="javascript:shSelectionList('selectionList','selectionListDialog','보유자명 목록','RHolder','enpr_id','enpr_nm');">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
			<th><font color="red">*</font>자원명</th>
			<td><input id="rsrs_nm" name="rsrs_nm"  type="text" value="${results[0].rsrs_nm}"/>
				<input id="rsrs_id" name="rsrs_id" type="hidden" value="${results[0].rsrs_id }"/>
				<a class="btn_sm1" href="javascript:shSelectionList('selectionList','selectionListDialog','자원 목록','Resource','rsrs_id','rsrs_nm');">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
		</tr>
		<tr>
			<th>사업자등록번호</th>
			<td>
				<input name="enpr_rgst_no"  type="text" value="${results[0].enpr_rgst_no}"/>
			</td>
			<th>중개계약번호</th>
			<td>
				<input name="mdt_cntr_no"  type="text" value="${results[0].mdt_cntr_no}"/>
			</td>
		</tr>
		<tr>
			<th><font color="red">*</font>계약날짜</th>
			<td>
				<input name="cntr_wnts_dt"  type="text" name="startDate" id="startDate" size="8" value="${results[0].cntr_wnts_dt}"/>~
				<input name="cntr_wnte_dt"  type="text" name="endDate" id="endDate" size="8" value="${results[0].cntr_wnte_dt}"/>
			</td>
			<th>계약기간</th>
			<td><input name="cntr_terms"  type="text" value="${results[0].cntr_terms}"/></td>
		</tr>
		<tr>
			<th>전력거래수수요율</th>
			<td><input name="pwr_mdt_fee"  type="text" value="${results[0].pwr_mdt_fee}"/></td>
			<th>유지보수수수료</th>
			<td><input name="mtnc_fee"  type="text" value="${results[0].mtnc_fee}"/></td>
		</tr>
		<tr>
			<th>REC거래수수요율</th>
			<td><input name="rec_mdt_fee"  type="text" value="${results[0].rec_mdt_fee}"/></td>
			<th>KPX전력거래수수료</th>
			<td><label>${results[0].kpx_pwr_fee}</label></td>
		</tr>
		<tr>
			<th>KPX 인증서거래수수료</th>
			<td><input name="kpx_cert_fee"  type="text" value="${results[0].kpx_cert_fee}"/></td>
		</tr>
		<tr>
			<th>첨부서류1</th>
			<td colspan="3"><input type="text" size="89"/>
				<a class="btn_sm1" href="javascript:fileAct('apndFile1')">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
				<input type="file" name="apndFile1" id="apndFile1" style="display: none;" class="multi
				{max:3, accept:'gif|jpg|bmp|png|doc|docx|ppt|pptx|xls|xlsx|hwp|pdf|txt', STRING:{
				 remove:'x 삭제',
				 selected:'선책된 파일은  $file 입니다.',
				 denied:'gif, jpg, bmp, png, doc, docx, ppt, pptx, xls, xlsx, hwp, pdf, txt 등  파일만 업로드가 가능합니다. $ext!',
				 duplicate:'$file은 이미 선택된 파일입니다.'
				}}" />
			</td>
		</tr>
		<tr>
			<th>첨부서류2</th>
			<td colspan="3"><input type="text" size="89"/>
				<a class="btn_sm1" href="javascript:fileAct('apndFile2')">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
				<input type="file" name="apndFile2" id="apndFile2" style="display: none;" class="multi
				{max:3, accept:'gif|jpg|bmp|png|doc|docx|ppt|pptx|xls|xlsx|hwp|pdf|txt', STRING:{
				 remove:'x 삭제',
				 selected:'선책된 파일은  $file 입니다.',
				 denied:'gif, jpg, bmp, png, doc, docx, ppt, pptx, xls, xlsx, hwp, pdf, txt 등  파일만 업로드가 가능합니다. $ext!',
				 duplicate:'$file은 이미 선택된 파일입니다.'
				}}" />
			</td>
		</tr>
		<tr>
			<th>▼첨부서류3</th>
			<td colspan="3"><input type="text" size="89"/>
				<a class="btn_sm1" href="javascript:fileAct('apndFile3')">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
				<input type="file" name="apndFile3" id="apndFile3" style="display: none;" class="multi
				{max:3, accept:'gif|jpg|bmp|png|doc|docx|ppt|pptx|xls|xlsx|hwp|pdf|txt', STRING:{
				 remove:'x 삭제',
				 selected:'선책된 파일은  $file 입니다.',
				 denied:'gif, jpg, bmp, png, doc, docx, ppt, pptx, xls, xlsx, hwp, pdf, txt 등  파일만 업로드가 가능합니다. $ext!',
				 duplicate:'$file은 이미 선택된 파일입니다.'
				}}" />
			</td>
		</tr>
	</table>
<%-- 	<c:if test="${param.code eq 'add'}"> --%>
		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;" href="javascript:fnMap.cM.addContract()">
				등록
			</a>
		</div>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${param.code eq 'modify'}"> --%>
		<input name="seq_no" type="hidden" value="${results[0].seq_no }">
		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;" href="javascript:fnMap.cM.updateContract()">
				수정
			</a>
		</div>
<%-- 	</c:if> --%>
</form>
<div id="selectionListDialog" style="display:none;" >
	<div id="selectionList"/>
</div>