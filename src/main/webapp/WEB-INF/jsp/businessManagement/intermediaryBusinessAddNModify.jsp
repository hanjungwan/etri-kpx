<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="cnct_no" value="${fn:split(results[0].enpr_cnct_cp,'-')}"/>
<c:set var="tel_no" value="${fn:split(results[0].enpr_tel_no,'-')}"/>
<c:set var="fax_no" value="${fn:split(results[0].enpr_fax_no,'-')}"/>
<form id="bm_popup" style="width: 100%;min-width: 800px;">
	<table class="tb4" style="width: 100%;">
		<c:if test="${param.code eq 'add'}">
			<tr>
				<th>중개사업자ID</th>
				<td><input name="enpr_id" type="text" value="${results[0].enpr_id}"/></td>
			</tr>
		</c:if>
		<tr>
			<th>중개사업자명</th>
			<td><input name="enpr_nm" type="text" value="${results[0].enpr_nm}"/></td>
			<th>대표자명</th>
			<td><input name="enpr_ceo_nm" type="text" value="${results[0].enpr_ceo_nm}"/></td>
		</tr>
		<tr>
			<th>사업자 등록번호</th>
			<td><input name="enpr_rgst_no" type="text" value="${results[0].enpr_rgst_no}"/></td>
			<th>중개사업자번호</th>
			<td><input name="mdt_enpr_info_id" type="text" value="${results[0].mdt_enpr_info_id}"/></td>
		</tr>
		<tr>
			<th>업태(업종)</th>
			<c:if test="${results[0] eq null}">
				<td><input name="enpr_cond" type="text"/></td>
			</c:if>
			<c:if test="${results[0] ne null}">
				<td><input name="enpr_cond" type="text" value="${results[0].enpr_cond}"/></td>
			</c:if>
			<th>사업유형</th>
			<td>
				<select name="enpr_tp">
					<c:forEach var="item" items="${enprTpList}" varStatus="status">
						<c:if test="${item.code eq results[0].enpr_tp}">
							<option value="${item.code}" selected="selected">${item.txt}</option>
						</c:if>
						<c:if test="${item.code ne results[0].enpr_tp}">
							<option value="${item.code}">${item.txt}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>담당자명</th>
			<td><input name="enpr_cnct_nm" type="text" value="${results[0].enpr_cnct_nm}"/></td>
			<th>담당자 전화번호</th>
			<td>
<!-- 				<select> -->
<!-- 					<option>02</option> -->
<!-- 					<option>031</option> -->
<!-- 					<option>032</option> -->
<!-- 				</select> -->
				<input name="cnct_no1" type="text"  size="2" value="${cnct_no[0]}"/>-
				<input name="cnct_no2" type="text"  size="2" value="${cnct_no[1]}"/>-
				<input name="cnct_no3" type="text"  size="2" value="${cnct_no[2]}"/>
			</td>
		</tr>
		<tr>
			<th>회사전화번호</th>
			<td>
<!-- 				<select> -->
<!-- 					<option>02</option> -->
<!-- 					<option>031</option> -->
<!-- 					<option>032</option> -->
<!-- 				</select> -->
				<input name="tel_no1" type="text"  size="2" value="${tel_no[0]}"/>-
				<input name="tel_no2" type="text"  size="2" value="${tel_no[1]}"/>-
				<input name="tel_no3" type="text"  size="2" value="${tel_no[2]}"/>
			</td>
			<th>FAX</th>
			<td>
<!-- 				<select> -->
<!-- 					<option>02</option> -->
<!-- 					<option>031</option> -->
<!-- 					<option>032</option> -->
<!-- 				</select> -->
				<input name="fax_no1" type="text"  size="2" value="${fax_no[0]}"/>-
				<input name="fax_no2" type="text"  size="2" value="${fax_no[1]}"/>-
				<input name="fax_no3" type="text"  size="2" value="${fax_no[2]}"/>
			</td>
		</tr>
		<tr>
			<th rowspan="2">사업장소재지(기본)</th>
			<td colspan="3">
				<input name="enpr_addr_number" type="text" style="float: left;" value="${fn:substring(results[0].enpr_addr,0,fn:indexOf(results[0].enpr_addr,' '))}"/>
				<a class="btn_sm1" style="float: left;" href="javascript:zipPopOpen('zipCode','zipDialog');">
					<img src="../images/img/ico_magnifier_sm.png"/>
					우편번호
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="3"><input name="enpr_addr" type="text" size="95" value="${fn:substring(results[0].enpr_addr,fn:indexOf(results[0].enpr_addr,' '),fn:length(results[0].enpr_addr))}"/></td>
		</tr>
		<tr>
			<th>사업장소재지(상세)</th>
			<td colspan="3"><input name="enpr_dtl_addr" type="text" size="95" value="${results[0].enpr_dtl_addr}"/></td>
		</tr>
	</table>
	<c:if test="${param.code eq 'add'}">
		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;" href="javascript:fnMap.bM.addintermediaryBusiness()">
				등록
			</a>
		</div>
	</c:if>
	<c:if test="${param.code eq 'modify'}">
		<input name="seq_no" type="hidden" value="${results[0].seq_no }">
		<div class="form-group" style="float: right;width: 290px;">
			<a class="btn_big4" style="float: right;" href="javascript:fnMap.bM.updateintermediaryBusiness()">
				수정
			</a>
		</div>
	</c:if>
</form>
<div id="zipDialog" style="display:none;" >
	<div id="zipCode"/>
</div>