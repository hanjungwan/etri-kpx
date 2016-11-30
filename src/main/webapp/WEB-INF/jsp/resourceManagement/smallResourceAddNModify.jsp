<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form id="rm_popup" style="width: 100%;min-width: 800px;">
	<table class="tb4" style="padding-top: 10px;width: 100%;">
		<colgroup>
			<col style="width:150px;">
			<col style="width:280px;">
			<col style="width:150px;">
			<col style="width:220px;">
		</colgroup>
		<tr>
			<th colspan="4">자원정보</th>
		</tr>
		<tr>
			<th>자원 아이디</th>
			<td><input name="rsrs_id" type="text" value="${results[0].rsrs_id}"/></td>
		</tr>
		<tr>
			<th>자원보유자명</th>
			<td>
				<input name="enpr_id" id="txtEnprId" type="hidden" value="${results[0].enpr_id}"/>
				<input name="enpr_nm" id="txtEnprNm" type="text" style="float: left;" value="${results[0].enpr_nm}"/>
				<a class="btn_sm1" style="float: left;" href="javascript:shSelectionList('rHolder','rHolderDialog','보유자명 목록','RHolder','txtEnprId','txtEnprNm');">
					<img src="../images/img/ico_magnifier_sm.png"/>
					검색
				</a>
			</td>
			<th><font color="red">*</font>자원명</th>
			<td><input name="rsrs_nm" type="text" value="${results[0].rsrs_nm}"/></td>
		</tr>
		<tr>
			<th rowspan="2"><font color="red">*</font>자원소재지(기본)</th>
			<td>
				<input name="rsrs_bas_addr" type="text" style="float: left;" value="${results[0].rsrs_bas_addr}"/>
				<a class="btn_sm1" style="float: left;" href="javascript:zipPopOpen('zipCode','zipDialog');">
					<img src="../images/img/ico_magnifier_sm.png"/>
					우편번호
				</a>
			</td>
			<th><font color="red">*</font>지역</th>
			<td>
				<select name="regn">
					<c:forEach var="item" items="${regns}">
						<c:if test="${item.code_id eq results[0].regn}">
							<option value="${item.code_id }" selected="selected">${item.code_nm }</option>
						</c:if>
						<c:if test="${item.code_id ne results[0].regn}">
							<option value="${item.code_id }">${item.code_nm }</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="text" size="35" value="${results[0].rsrs_bas_addr}"/></td>
			<th><font color="red">*</font>용도</th>
			<td>
				<select name="used">
					<c:forEach var="item" items="${useds}">
						<c:if test="${item.code_id eq results[0].used}">
							<option value="${item.code_id }" selected="selected">${item.code_nm }</option>
						</c:if>
						<c:if test="${item.code_id ne results[0].used}">
							<option value="${item.code_id }">${item.code_nm }</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th><font color="red">*</font>자원소재지(상세)</th>
			<td><input name="rsrs_dtl_addr" type="text" size="35" value="${results[0].rsrs_dtl_addr}"/></td>
			<th><font color="red">*</font>설비용량(KW)</th>
			<td><input name="eqpm_cpct" type="text" value="${results[0].eqpm_cpct}"/></td>
		</tr>
		<tr>
			<th>최대발전용량(KW)</th>
			<td><input name="max_gnr_cpct" type="text" value="${results[0].max_gnr_cpct}"/></td>
			<th>최소발전용량(KW)</th>
			<td><input name="mix_gnr_cpct" type="text" value="${results[0].mix_gnr_cpct}"/></td>
		</tr>
		<tr>
			<th><font color="red">*</font>발전원</th>
			<td>
				<select>
					<c:forEach var="item" items="${pwrGnrs}">
						<c:if test="${item.code_id eq results[0].pwr_gnr}">
							<option value="${item.code_id }" selected="selected"><c:out value=" ${item.code_nm }"/></option>
						</c:if>
						<c:if test="${item.code_id ne results[0].pwr_gnr}">
							<option value="${item.code_id }"><c:out value=" ${item.code_nm }"/></option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<th><font color="red">*</font>설치부지(지목)</th>
			<td><input name="instl_lnd" type="text" value="${results[0].instl_lnd}"/></td>
		</tr>
		<tr>
			<th><font color="red">*</font>설치부지(소유자)</th>
			<td><input name="instl_own" type="text" value="${results[0].instl_own}"/></td>
			<th><font color="red">*</font>설치부지(사용권원)</th>
			<td><input name="instl_use" type="text" value="${results[0].instl_use}"/></td>
		</tr>
		<tr>
			<th>KPX회원번호</th>
			<td><input name="kpx_memb_no" type="text" value="${results[0].kpx_memb_no}"/></td>
			<th><font color="red">*</font>허가번호</th>
			<td><input name="lcns_no" type="text" value="${results[0].lcns_no}"/></td>
		</tr>
		<tr>
			<th><font color="red">*</font>등록번호</th>
			<td><input name="rgst_no" type="text" value="${results[0].rgst_no}"/></td>
			<th><font color="red">*</font>전력량계번호</th>
			<td><input name="wtt_hrmtr_no" type="text" value="${results[0].wtt_hrmtr_no}"/></td>
		</tr>
		<tr>
			<th>REC계좌번호</th>
			<td><input name="rec_acct_no" type="text" value="${results[0].rec_acct_no}"/></td>
			<th>광제용RTU정보</th>
			<td>
				<input name="ctrl_rtu_ip" type="text" placeholder="IP" size=15 value="${results[0].ctrl_rtu_ip}"/>
				<input name="ctrl_rtu_prt" type="text" placeholder="port" size=6 value="${results[0].ctrl_rtu_prt}"/>
			</td>
		</tr>
		<tr>
			<th>설비대수</th>
			<td><input name="eqpm_cnt" type="text" value="${results[0].eqpm_cnt}"/></td>
			<th>운전시작일시</th>
			<td>
				<input name="work_st_dt" type="text" name="shDate" id="shDate" value="${results[0].work_st_dt}"/>
			</td>
		</tr>
		<tr>
			<th>▼&nbsp;&nbsp;첨부화일1</th>
			<td colspan="3">
				<a class="btn_sm1" style="float: left;" href="javascript:fileAct('apndFile')">
					<img src="../images/img/ico_magnifier_sm.png"/>
					찾아보기
				</a>
				<input name="" type="file" name="apndFile" id="apndFile" style="display: none;" class="multi
				{max:3, accept:'gif|jpg|bmp|png|doc|docx|ppt|pptx|xls|xlsx|hwp|pdf|txt', STRING:{
				 remove:'x 삭제',
				 selected:'선책된 파일은  $file 입니다.',
				 denied:'gif, jpg, bmp, png, doc, docx, ppt, pptx, xls, xlsx, hwp, pdf, txt 등  파일만 업로드가 가능합니다. $ext!',
				 duplicate:'$file은 이미 선택된 파일입니다.'
				}}" />
			</td>
		</tr>
	</table>
	<c:if test="${param.code eq 'add'}">
		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;" href="javascript:fnMap.rM.addSmallResource()">
				등록
			</a>
		</div>
	</c:if>
	<c:if test="${param.code eq 'modify'}">
		<input name="" name="seq_no" type="hidden" value="${results[0].seq_no }">
		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;" href="javascript:fnMap.rM.updateSmallResource()">
				수정
			</a>
		</div>
	</c:if>
</form>
<div id="zipDialog" style="display:none;" >
	<div id="zipCode"/>
</div>
<div id="rHolderDialog" style="display:none;" >
	<div id="rHolder"/>
</div>