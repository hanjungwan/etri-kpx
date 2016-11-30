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
 * @since 2016. 10. 24.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 24.          creme55         최초 생성 (소규모발전자원관리 view page)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="/js/service/resource/resource.js" charset="utf-8"></script>
</head>
<body>

				<!---//Contents----->
				<div class="col_p85">
					<div class="contents" >
						<div class="title">소규모 발전자원관리
							<div class="location">
								<a href=""><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goResourceHome(); return false;">자원관리</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goSmlGnrResMng(); return false;">소규모발전자원관리</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="smlGnrResMngSearchFrm" id="smlGnrResMngSearchFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th style="text-align: left !important;">
											등록일자
										</th>
										<td>
											<input type="text" name="rgstSdt" id="rgstSdt" size="5">&nbsp;~&nbsp;&nbsp;<input type="text" name="rgstEdt" id="rgstEdt" size="5">
										</td>
										<th style="text-align: left !important;">
											중개 계약 체결
										</th>
										<td>
											<select name="mediateCntc" id="mediateCntc" style="width: 92%;">
												<option value="01">전체</option>
											</select>
										</td>
										<th style="text-align: left !important;">
											발전원유형
										</th>
										<td>
											<select name="gnrRsrsTp" id="gnrRsrsTp" style="width: 92%;">
												<option value="01">태양광(PV)</option>
											</select>
										</td>
									</tr>
									<tr>
										<th style="text-align: left !important;">
											용도
										</th>
										<td>
											<select name="use" id="use" style="width: 92%;">
												<option>자가용</option>
											</select>
										</td>	
										<th style="text-align: left !important;">
											설비용량
										</th>
										<td>
											<input type="text" name="capaMin" id="capaMin" size="4">&nbsp;~&nbsp;&nbsp;<input type="text" name="capaMax" id="capaMax" size="4">
										</td>
										<th style="text-align: left !important;">
											집합발전기명
										</th>
										<td>
											<select name="setGnrNm" id="setGnrNm" style="width: 92%;">
												<option>비수도권 집합발전기1</option>
											</select>
										</td>	
									</tr>
									<tr>
										<th style="text-align: left !important">
											소규모자원공급자
										</th>
										<td colspan="3">
											<select name="smlRsEnprNm" id="smlRsEnprNm" style="width: 44%;">
												<option>(주)태양복합잘전</option>
											</select>
										</td>	
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchSmlGnrResMng(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:smlGnrResMngRegistFormOpen('smlGnrResMngRgstDialog', 'open'); return false;" class="btn_big3">소규모발전자원등록</a><a href="javascript:;" onclick="javascript:smlGnrResMngDelete(); return false;" class="btn_big3">삭제</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="smlGnrResMngLst"></table>
								<div id="smlGnrResMngPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : 전력거래 등록  -->
				<div id="smlGnrResMngRgstDialog" class="popUp" style="display:none;" title="소규모 발전자원 등록">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="smlGnrResMngRgstPopUp" id="smlGnrResMngRgstPopUp" method="post" encType="multipart/form-data" action="">
									<div class="form-group">
										<table class="tb4">
										<colgroup>
											<col width="15%"><col>
											<col width="15%"><col>
										</colgroup>
			
										<tbody>
										<tr>
											<th colspan="4" class="subject">자원 정보</th>
										</tr>
										<tr>
											<th>
												<span>*</span>
												소규모 자원<br />&nbsp;&nbsp;&nbsp;공급자명
											</th>
											<td>
												<input type="text" name="smlGnrEnprNm" id="smlGnrEnprNm" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												소규모 발전<br />&nbsp;&nbsp;&nbsp;자원명
											</th>
											<td>
												<select name="smlGnrRsrsNm" id="smlGnrRsrsNm" style="width: 100%;">
													<option value="">태양복합 태양광발전 1호기</option>
												</select>
											</td>
										</tr>
										<tr>
											<th rowspan="2">
												<span>*</span>
												자원 소재지<br />&nbsp;&nbsp;&nbsp;(기본)
											</th>
											<td>
												<input type="text" name="zipCode" id="zipCode" style="width: 52%;" />&nbsp;<a href="javascript:;"  onclick="javascript:zipCodeSearchDialog('zipCodeSearchDialog', 'open'); return false;" class="btn_big3">우편번호 검색</a>
											</td>
											<th>
												<span>*</span>
												지역
											</th>
											<td>
												<select name="regn" id="regn" style="width: 100%;">
													<option value="">수도권</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>
												<input type="text" name="addr" id="addr" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												용도
											</th>
											<td>
												<select name="use" id="use" style="width: 100%;">
													<option value="">자가용</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												자원 소재지<br />&nbsp;&nbsp;&nbsp;(상세)
											</th>
											<td>
												<input type="text" name="rsrsDtlAddr" id="rsrsDtlAddr" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												설비용량(KW)
											</th>
											<td>
												<input type="text" name="eqpmCpct" id="eqpmCpct" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												최대 발전<br />&nbsp;&nbsp;&nbsp;용량(KW)
											</th>
											<td>
												<input type="text" name="maxGnrCpct" id="maxGnrCpct" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												최소 발전<br />&nbsp;&nbsp;&nbsp;용량(KW)
											</th>
											<td>
												<input type="text" name="minGnrCpct" id="minGnrCpct" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												발전원 유형
											</th>
											<td>
												<select name="pwrGnr" id="pwrGnr" style="width: 100%;">
													<option value="">태양광(PV)</option>
												</select>
											</td>
											<th>
												<span>*</span>
												설치부지<br />&nbsp;&nbsp;&nbsp;(지목)
											</th>
											<td>
												<input type="text" name="instlLnd" id="instlLnd" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												설치부지<br />&nbsp;&nbsp;&nbsp;(소유자)
											</th>
											<td>
												<input type="text" name="instlLOwn" id="instlLOwn" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												설치부지<br />&nbsp;&nbsp;&nbsp;(사용권한)
											</th>
											<td>
												<input type="text" name="instlLOwn" id="instlLOwn" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												KPX<br />&nbsp;&nbsp;&nbsp;회원번호
											</th>
											<td>
												<input type="text" name="kpxMembNo" id="kpxMembNo" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												허가번호
											</th>
											<td>
												<input type="text" name="lcnsNo" id="lcnsNo" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												등록번호
											</th>
											<td>
												<input type="text" name="rgstNo" id="rgstNo" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												전력량계<br />&nbsp;&nbsp;&nbsp;번호
											</th>
											<td>
												<input type="text" name="wttHrmtrNo" id="wttHrmtrNo" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												REC<br />&nbsp;&nbsp;&nbsp;계좌번호
											</th>
											<td>
												<input type="text" name="rgstNo" id="rgstNo" style="width: 52%;" />&nbsp;<a href="javascript:;" onclick="javascript:searchRecRsCd(); return false;" class="btn_big3">REC설비코드</a>
												<div id="recRsrsCd" style="display: none;">
													<table class="tb1">
													<thead>
													<tr>
														<th>
															REC 설비코드
														</th>
														<th>
															전체수량
														</th>
														<th>
															예상 매도단가
														</th>
													</tr>
													</thead>
													<tbody>
													<tr>
														
													</tr>
													</tbody>
													</table>
												</div>
											</td>
											<th>
												<span>*</span>
												관제용<br />&nbsp;&nbsp;&nbsp;RTU 정보
											</th>
											<td>
												<input type="text" name="ctrlRtuIp" id="ctrlRtuIp" style="width: 45%;" placeholder="IP" />&nbsp;&nbsp;
												<input type="text" name="ctrlRtuPrt" id="ctrlRtuPrt" style="width: 40%;" placeholder="PORT" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												설비대수
											</th>
											<td>
												<input type="text" name="eqpmCnt" id="eqpmCnt" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												운전<br />&nbsp;&nbsp;&nbsp;시작일자
											</th>
											<td>
												<input type="text" name="workStDt" id="workStDt" style="width: 85%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												첨부파일
											</th>
											<td colspan="3">
												<input type="file" name="apndFile" id="apndFile" style="width: 98%;" class="multi
												{max:3, accept:'gif|jpg|bmp|png|doc|docx|ppt|pptx|xls|xlsx|hwp|txt|pdf', STRING:{
												 remove:'x 삭제',
												 selected:'선책된 파일은  $file 입니다.',
												 denied:'gif, jpg, bmp, png, doc, docx, ppt, pptx, xls, xlsx, hwp, txt, pdf 등  파일만 업로드가 가능합니다. $ext!',
												 duplicate:'$file은 이미 선택된 파일입니다.'
												}}" />
											</td>
										</tr>
										</table>
										
										<div id="smlGnrResMngTabs">
											<ul style="font-size: 1.0em;">
												<li><a href="#smlGnrResMngTab1">춘추기</a></li>
												<li><a href="#smlGnrResMngTab2">하절기</a></li>
												<li><a href="#smlGnrResMngTab3">동절기</a></li>
											</ul>
											<div id="smlGnrResMngTab1" style="margin: 0 0 0 15px;">
												<table class="tb1">
												<colgroup>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
												</colgroup>
												<tbody>
												<tr>
													<th>
														1h
													</th>
													<td>
														<input type="text" name="tab0101" id="tab0101" size="7" />
													</td>
													<th>
														2h
													</th>
													<td>
														<input type="text" name="tab0102" id="tab0102" size="7" />
													</td>
													<th>
														3h
													</th>
													<td>
														<input type="text" name="tab0103" id="tab0103" size="7" />
													</td>
													<th>
														4h
													</th>
													<td>
														<input type="text" name="tab0104" id="tab0104" size="7" />
													</td>
													<th>
														5h
													</th>
													<td>
														<input type="text" name="tab0105" id="tab0105" size="7" />
													</td>
													<th>
														6
													</th>
													<td>
														<input type="text" name="tab0106" id="tab0106" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														7h
													</th>
													<td>
														<input type="text" name="tab0107" id="tab0107" size="7" />
													</td>
													<th>
														8h
													</th>
													<td>
														<input type="text" name="tab0108" id="tab0108" size="7" />
													</td>
													<th>
														9h
													</th>
													<td>
														<input type="text" name="tab0109" id="tab0109" size="7" />
													</td>
													<th>
														10h
													</th>
													<td>
														<input type="text" name="tab0110" id="tab0110" size="7" />
													</td>
													<th>
														11h
													</th>
													<td>
														<input type="text" name="tab0111" id="tab0111" size="7" />
													</td>
													<th>
														12H
													</th>
													<td>
														<input type="text" name="tab0112" id="tab0112" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														13h
													</th>
													<td>
														<input type="text" name="tab0113" id="tab0113" size="7" />
													</td>
													<th>
														14h
													</th>
													<td>
														<input type="text" name="tab0114" id="tab0114" size="7" />
													</td>
													<th>
														15h
													</th>
													<td>
														<input type="text" name="tab0115" id="tab0115" size="7" />
													</td>
													<th>
														16h
													</th>
													<td>
														<input type="text" name="tab0116" id="tab0116" size="7" />
													</td>
													<th>
														17h
													</th>
													<td>
														<input type="text" name="tab0117" id="tab0117" size="7" />
													</td>
													<th>
														18h
													</th>
													<td>
														<input type="text" name="tab0118" id="tab0118" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														19h
													</th>
													<td>
														<input type="text" name="tab0119" id="tab0119" size="7" />
													</td>
													<th>
														20h
													</th>
													<td>
														<input type="text" name="tab0120" id="tab0120" size="7" />
													</td>
													<th>
														21h
													</th>
													<td>
														<input type="text" name="tab0121" id="tab0121" size="7" />
													</td>
													<th>
														22h
													</th>
													<td>
														<input type="text" name="tab0122" id="tab0122" size="7" />
													</td>
													<th>
														23h
													</th>
													<td>
														<input type="text" name="tab0123" id="tab0123" size="7" />
													</td>
													<th>
														24h
													</th>
													<td>
														<input type="text" name="tab0124" id="tab0124" size="7" />
													</td>
												</tr>
												</tbody>
												</table>
											</div>
											
											<div id="smlGnrResMngTab2" style="margin: 0 0 0 15px;">
												<table class="tb1">
												<colgroup>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
												</colgroup>
												<tbody>
												<tr>
													<th>
														1h
													</th>
													<td>
														<input type="text" name="tab0201" id="tab0201" size="7" />
													</td>
													<th>
														2h
													</th>
													<td>
														<input type="text" name="tab0202" id="tab0202" size="7" />
													</td>
													<th>
														3h
													</th>
													<td>
														<input type="text" name="tab0203" id="tab0203" size="7" />
													</td>
													<th>
														4h
													</th>
													<td>
														<input type="text" name="tab0204" id="tab0204" size="7" />
													</td>
													<th>
														5h
													</th>
													<td>
														<input type="text" name="tab0205" id="tab0205" size="7" />
													</td>
													<th>
														6
													</th>
													<td>
														<input type="text" name="tab0206" id="tab0206" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														7h
													</th>
													<td>
														<input type="text" name="tab0207" id="tab0207" size="7" />
													</td>
													<th>
														8h
													</th>
													<td>
														<input type="text" name="tab0208" id="tab0208" size="7" />
													</td>
													<th>
														9h
													</th>
													<td>
														<input type="text" name="tab0209" id="tab0209" size="7" />
													</td>
													<th>
														10h
													</th>
													<td>
														<input type="text" name="tab0210" id="tab0210" size="7" />
													</td>
													<th>
														11h
													</th>
													<td>
														<input type="text" name="tab0211" id="tab0211" size="7" />
													</td>
													<th>
														12H
													</th>
													<td>
														<input type="text" name="tab0212" id="tab0212" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														13h
													</th>
													<td>
														<input type="text" name="tab0213" id="tab0213" size="7" />
													</td>
													<th>
														14h
													</th>
													<td>
														<input type="text" name="tab0214" id="tab0214" size="7" />
													</td>
													<th>
														15h
													</th>
													<td>
														<input type="text" name="tab0215" id="tab0215" size="7" />
													</td>
													<th>
														16h
													</th>
													<td>
														<input type="text" name="tab0216" id="tab0216" size="7" />
													</td>
													<th>
														17h
													</th>
													<td>
														<input type="text" name="tab0217" id="tab0217" size="7" />
													</td>
													<th>
														18h
													</th>
													<td>
														<input type="text" name="tab0218" id="tab0218" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														19h
													</th>
													<td>
														<input type="text" name="tab0219" id="tab0219" size="7" />
													</td>
													<th>
														20h
													</th>
													<td>
														<input type="text" name="tab0220" id="tab0220" size="7" />
													</td>
													<th>
														21h
													</th>
													<td>
														<input type="text" name="tab0221" id="tab0221" size="7" />
													</td>
													<th>
														22h
													</th>
													<td>
														<input type="text" name="tab0222" id="tab0222" size="7" />
													</td>
													<th>
														23h
													</th>
													<td>
														<input type="text" name="tab0223" id="tab0223" size="7" />
													</td>
													<th>
														24h
													</th>
													<td>
														<input type="text" name="tab0224" id="tab0224" size="7" />
													</td>
												</tr>
												</tbody>
												</table>
											</div>

											<div id="smlGnrResMngTab3" style="margin: 0 0 0 15px;">
												<table class="tb1">
												<colgroup>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
													<col width="10%"><col>
												</colgroup>
												<tbody>
												<tr>
													<th>
														1h
													</th>
													<td>
														<input type="text" name="tab0301" id="tab0301" size="7" />
													</td>
													<th>
														2h
													</th>
													<td>
														<input type="text" name="tab0302" id="tab0302" size="7" />
													</td>
													<th>
														3h
													</th>
													<td>
														<input type="text" name="tab0303" id="tab0303" size="7" />
													</td>
													<th>
														4h
													</th>
													<td>
														<input type="text" name="tab0304" id="tab0304" size="7" />
													</td>
													<th>
														5h
													</th>
													<td>
														<input type="text" name="tab0305" id="tab0305" size="7" />
													</td>
													<th>
														6
													</th>
													<td>
														<input type="text" name="tab0306" id="tab0306" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														7h
													</th>
													<td>
														<input type="text" name="tab0307" id="tab0307" size="7" />
													</td>
													<th>
														8h
													</th>
													<td>
														<input type="text" name="tab0308" id="tab0308" size="7" />
													</td>
													<th>
														9h
													</th>
													<td>
														<input type="text" name="tab0309" id="tab0309" size="7" />
													</td>
													<th>
														10h
													</th>
													<td>
														<input type="text" name="tab0310" id="tab0310" size="7" />
													</td>
													<th>
														11h
													</th>
													<td>
														<input type="text" name="tab0311" id="tab0311" size="7" />
													</td>
													<th>
														12H
													</th>
													<td>
														<input type="text" name="tab0312" id="tab0312" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														13h
													</th>
													<td>
														<input type="text" name="tab0313" id="tab0313" size="7" />
													</td>
													<th>
														14h
													</th>
													<td>
														<input type="text" name="tab0314" id="tab0314" size="7" />
													</td>
													<th>
														15h
													</th>
													<td>
														<input type="text" name="tab0315" id="tab0315" size="7" />
													</td>
													<th>
														16h
													</th>
													<td>
														<input type="text" name="tab0316" id="tab0316" size="7" />
													</td>
													<th>
														17h
													</th>
													<td>
														<input type="text" name="tab0317" id="tab0317" size="7" />
													</td>
													<th>
														18h
													</th>
													<td>
														<input type="text" name="tab0318" id="tab0318" size="7" />
													</td>
												</tr>
												<tr>
													<th>
														19h
													</th>
													<td>
														<input type="text" name="tab0319" id="tab0319" size="7" />
													</td>
													<th>
														20h
													</th>
													<td>
														<input type="text" name="tab0320" id="tab0320" size="7" />
													</td>
													<th>
														21h
													</th>
													<td>
														<input type="text" name="tab0321" id="tab0321" size="7" />
													</td>
													<th>
														22h
													</th>
													<td>
														<input type="text" name="tab0322" id="tab0322" size="7" />
													</td>
													<th>
														23h
													</th>
													<td>
														<input type="text" name="tab0323" id="tab0323" size="7" />
													</td>
													<th>
														24h
													</th>
													<td>
														<input type="text" name="tab0324" id="tab0324" size="7" />
													</td>
												</tr>
												</tbody>
												</table>
											</div>

											<!---//button---->
											<div class="both_wrap">
												<div class="lfbn">									
												</div>
												<div class="rgbn"><!---테이블하단버튼 스타일 btn_big4----->
													<a href="javascript:;" onclick="javascript:smlGnrResMngRegist(); return false;" class="btn_big4">저&nbsp;장</a> <a href="javascript:;" onclick="javascript:smlGnrResMngClearForm('smlGnrResMngRgstPopUp'); return false;" class="btn_big4">취&nbsp;소</a>
												</div>
											</div>
											<!---button//---->

										</div>
										<br /><br /><br />
									</div>
								</form>
							</div>
							<!---search//---->
						</div>
					</div>
					<!----wrapper//----->
                </div>
                
                <!-- 우편번호 검색 -->
				<div id="zipCodeSearchDialog" class="popUp" style="display:none;" title="우편번호 조회">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="zipCodeSearchPopUp" id="zipCodeSearchPopUp" method="post" action="">
									<div class="form-group">
                						<table class="tb1">
                						<tr>
                							<th>검색어 (시군구명)</th>
                							<td>
                								<input type="text" name="keyword" id="keyword" size="75" value="" />
                							</td>
                						</tr>
                						</table>
										<div class="bn"><a href="javascript:;" onclick="" name="zipCodeSearch" id="zipCodeSearch" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
									</div>
								</form>
							</div>
							
						</div>
					             
					<!---//table---->
					<div class="row">
						<div class="tb_y_wrap" style="margin: 30px 0 30px 15px;">
							<table id="zipCodeResultLst"></table>
							<div id="zipCodeResultListPager"></div>
						</div>
					</div>
					<!---table//---->
						
					</div>
                </div>
                
			</div>
			<!---Contents//----->

			<script type="text/javascript">
				$(document).ready(function() {
					/* tab 설정 */
					$("#smlGnrResMngTabs").tabs();
					
					/* jqGrid 사용 선언 */
					var colNames = [
					                '번호'
					                ,'소규모<br />발전자원명'
					                ,'소규모 발전<br />자원공급자'
					                ,'발전원<br />유형'
					                ,'용도'
					                ,'설비용량<br />(KW)'
					                ,'등록일'
					                ,'운전시작일'
					                ,'중계계약<br />체결'
					                ,'집합<br />발전기명'
					               ];
					var colModel = new Array();
					
					var width = 0;
					for (var i = 0; i < colNames.length; i++) {
						if (i > 0 && i < 10) {
							width = 150;
						} else {
							width = 45;
						}
						
						var model = {
							name : 'col' + i.toString()
							,index : 'col' + i.toString()
							,width : width
							,search : true
							,resizable : false
						};
						
						colModel[i] = model; 	
					}
					setJqGridForm('smlGnrResMngLst', 'smlGnrResMngPager', colNames, colModel, '');

					var zcolNames = [
					                '우편번호'
					                ,'주소'
					                ,'비고'
					               ];
					var zcolModel = new Array();

					for (var i = 0; i < zcolNames.length; i++) {
						var model = {
							name : 'col' + i.toString()
							,index : 'col' + i.toString()
							,width : 260
							,search : true
							,resizable : false
						};
						
						zcolModel[i] = model; 	
					}
					setJqGridForm('zipCodeResultLst', 'zipCodeResultListPager', zcolNames, zcolModel, '');
					
					/* date picker 사용 선언 */
					setDatePicker('rgstSdt', 'rgstEdt');
					
					/* dislog popup 정의 */
					openDialogPopUp('smlGnrResMngRgstDialog', '880');
					openDialogPopUp('zipCodeSearchDialog', '890');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('resource', 1, 1);

					/* header menu setting */
					$("#resource").toggleClass('temp select');
				});
			</script>
</body>
</html>