<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include/tag_define.jsp" %>
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
 * @since 2016. 10. 21.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 21.          creme55         최초생성 (회원가입 페이지)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
<script src="/js/service/member/member.js" charset="utf-8"></script>
</head>
<body>

			<!----//row100----->
			<div class="row" >
                
				<!---//Contents----->
				<div class="col_p85">
					<div class="contents" >
						<c:choose>
						<c:when test="${serviceType == 'member'}">
							<div class="title">회원가입
								<div class="location"><a href=""><img src="/images/img/ico_home.png">회원관리</a><img src="/images/img/ico_arr.png"><a href="">회원가입</a></div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="title">마이페이지
								<div class="location"><a href=""><img src="/images/img/ico_home.png">마이페이지</a><img src="/images/img/ico_arr.png"><a href="">마이페이지</a></div>
							</div>
						</c:otherwise>
                        </c:choose>
                                             
						<!---//table---->
						<div class="tit_st2"><img src="/images/img/ico_bullet.png">가입 기본정보</div>
							<form name="memberInsertProc" id="memberInsertProc" method="post" encType="multipart/form-data" action="">
							<table class="tb4"> 
							<colgroup>
								<col width="15%"><col>
								<col width="15%"><col>
							</colgroup>

							<tbody>
							<tr>
								<th colspan="4" class="subject">사업자 정보</th>
							</tr>
							<tr>
								<th>
									<span>*</span>사업자명
								</th>
								<td>
									<input type="text" name="compNm" id="compNm" value="" class="desable" style="width: 95%;">
								</td>
								<th>
									<span>*</span>대표자명
								</th>
								<td>
									<input type="text" name="ceoNm" id="ceoNm" value="" class="desable" style="width: 95%;">
								</td>	
							</tr>
							<tr>
								<th>
									<span>*</span>사업자 등록번호
								</th>
								<td>
									<input type="text" name="compRegId" id="compRegId" value="" class="desable" style="width: 95%;">
								</td>
								<th rowspan="2">
									<span>*</span>사업장 소재지(기본)
								</th>
								<td rowspan="2">
									<input type="text" name="zipCode" id="zipCode" value="" style="width: 62.7%;"><a href="javascript:;" onclick="javascript:zipCodeSearchDialog('zipCodeSearchDialog', 'open'); return false;" class="btn_sm1"><img src="/images/img/ico_magnifier_sm.png">우편번호 검색</a><br/>
									<input type="text" name="address" id="address" value="" style="margin-top: 3px; width: 95%;">
								</td>							
							</tr>
							<tr>
								<th>
									<span>*</span>업태(업종)
								</th>
								<td>
									<input type="text" name="compCate" id="compCateCond" value="" class="desable" style="width: 95%;">
								</td>
							</tr>
							<tr>
								<th>
									<span>*</span>담당자명
								</th>
								<td>
									<input type="text" name="compCnctNm" id="compCnctNm" value="" style="width: 95%;">
								</td>
								<th>
									<span>*</span>사업장소재지(상세)
								</th>
								<td>
									<input type="text" name="compDtlAddr" id="compDtlAddr" value="" style="width: 95%;">
								</td>				
							</tr>
							<tr>
								<th>
									<span>*</span>담당자 전화번호
								</th>
								<td>
									<input type="text" name="compCnctCp1" id="compCnctCp1" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="compCnctCp2" id="compCnctCp2" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="compCnctCp3" id="compCnctCp3" value="" style="width: 27.2%;">
								</td>
								<th>
									<span>*</span>사업유형
								</th>
								<td>
									<select class="desable" style="width: 69%;">
										<option>소규모자원공급사</option>
									</select>
									<a href="javascript:;" onclick="javascript:mediateCondfigDailog('memberKindsConfDialog', 'open'); return false;" class="btn_big2"><img src="/images/img/ico_setting.png">중개설정</a>
								</td>				
							</tr>
							<tr>
								<th>
									<span>*</span>회사 전화번호
								</th>
								<td>
									<input type="text" name="compTelNo1" id="compTelNo1" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="compTelNo2" id="compTelNo2" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="compTelNo3" id="compTelNo3" value="" style="width: 27.2%;">
								</td>
								<th>
									<span>*</span>F&nbsp;A&nbsp;X
								</th>
								<td>
									<input type="text" name="compFaxNo1" id="compFaxNo1" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="compFaxNo2" id="compFaxNo2" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="compFaxNo3" id="compFaxNo3" value="" style="width: 27.2%;">
								</td>				
							</tr>
							<tr>
								<th colspan="4" class="mid_subject">사용자 정보</th>
							</tr>
							<tr>
								<th>
									<span>*</span>사용자ID
								</th>
								<td>
									<input type="text" name="loginId" id="loginId" value="" style="width: 65%;">
									<a href="javascript:;" onclick="javascript:usrIdDupCheck(); return false;" class="btn_big2"><img src="/images/img/ico_check.png">중복체크</a>
								</td>	
								<th>
									<span>*</span>성&nbsp;&nbsp;&nbsp;&nbsp;명
								</th>
								<td>
									<input type="text" name="usrNm" id="usrNm" value="" style="width: 95%;">
								</td>	
							</tr>
							<tr>
								<th>
									<span>*</span>비밀번호
								</th>
								<td>
									<input type="password" name="usrPwd" id="usrPwd" value="" style="width: 60%;">
									<span>영문, 숫자 포함 6-10자 이내</span> 
								</td>	
								<th>
									<span>*</span>비밀번호확인
								</th>
								<td>
									<input type="password" name="usrPwdCnfrm" id="usrPwdCnfrm" value="" style="width: 95%;">
								</td>	
							</tr>
							<tr>
								<th>
									<span>*</span>휴대전화번호
								</th>
								<td>
									<input type="text" name="cpNo1" id="cpNo1" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="cpNo2" id="cpNo2" value="" style="width: 27.2%;">&nbsp;-
									<input type="text" name="cpNo3" id="cpNo3" value="" style="width: 27.2%;">
								</td>
								<th>
									<span>*</span>권&nbsp;&nbsp;&nbsp;&nbsp;한
								</th>
								<td>
									<select name="authId" id="authId" style="width: 99%;">
										<option value="1">GUEST</option>
										<option value="2">소규모사업자</option>
										<option value="3">중개사업자</option>
										<option value="5">시스템관리자</option>
									</select>
								</td>				
							</tr>
							<tr>
								<th>
									<span>*</span>E-MAIL
								</th>
								<td colspan="3">
									<input type="text" name="email" id="email" value="" style="width: 25%;">&nbsp;@&nbsp;
									<select><option>naver.com</option></select>
								</td>
							</tr>
							<tr>
								<th>
									<span>*</span>서명파일
								</th>
								<td colspan="3">
									<input type="file" name="signFile" id="signFile" style="width: 95%;" class="multi
									{max:1, accept:'gif|jpg|bmp|png', STRING:{
									 remove:'x 삭제',
									 selected:'선책된 파일은  $file 입니다.',
									 denied:'gif, jpg, bmp, png 등 이미지 파일만 업로드가 가능합니다. $ext!',
									 duplicate:'$file은 이미 선택된 파일입니다.'
									}}" />					
								</td>
							</tr>
							<tr>
								<th>
									첨부파일
								</th>
								<td colspan="3">									 
									<input type="file" name="apndFile" id="apndFile" style="width: 95%;" class="multi
									{max:1, accept:'gif|jpg|bmp|png', STRING:{
									 remove:'x 삭제',
									 selected:'선책된 파일은  $file 입니다.',
									 denied:'gif, jpg, bmp, png 등 이미지 파일만 업로드가 가능합니다. $ext!',
									 duplicate:'$file은 이미 선택된 파일입니다.'
									}}" />
								</td>
							</tr>
							<c:if test="${serviceType == 'member'}">
							<tr>
								<th colspan="4" class="mid_subject">
									가입약관
								</th>
							</tr>
							<tr>
								<td colspan="4" class="law">
									ETRI 전력거래 중개시스템(이하 중개시스템)은 소규모 신재생에너지 생산자의 전력거래의 편의성 및 전력거래 활성화를 위하여 신재생 발전자원의 전력거래 및 해당 발전설비의 일체 위탁을 위임 받아 해당 설비의 입찰,정산,설비관제/유지보수의 Total 서비스 제공을 목적으로 한다.<br/><br/> 월 1회 정산을 기본으로 하며, 가입시 동의한 견적에 해당하는 수수료를 제하고 회원사에게 제공한다.
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input type="checkbox" name="prvnYn" id="provisionYn">위 가입약관을 모두 숙지하였으며, 이에 동의합니다.
								</td>
							</tr>
							<tr>
								<th colspan="4" class="mid_subject">
									개인정보 취급방침
								</th>
							</tr>
							<tr>
								<td colspan="4" class="law">
									ETRI 전력거래 중개시스템(이하 중개시스템)은 개인정보보호법 등 관련 법령상의 개인정보보호 규정을 준수하며,개인정보를 처리하는 중개시스템 소관 홈페이지의 경우 『개인정보 보호법』 제30조 제1항 및 동법 『시행령』 제31조제1항의 규정에 의하여 해당 홈페이지에 『개인정보처리방침』을 정하여 운영하고 있으며, 『개인정보처리방침』을 변경하는 경우에는 정보주체가 쉽게 확인 할 수 있도록 변경 전·후를 비교하여 공개하도록 할 예정입니다. 
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input type="checkbox" name="psnScrtYn" id="psnScrtYn">위 가입약관을 모두 숙지하였으며, 이에 동의합니다.
								</td>
							</tr>
							</c:if>
							</tbody>
						</table>


						<!---//button---->
						<div class="both_wrap">
							<div class="lfbn">									
							</div>
							<div class="rgbn"><!---테이블하단버튼 스타일 btn_big4----->
								<a href="javascript:;" onclick="javascript:memberInsertProc('memberInsertProc'); return false;" class="btn_big4">저&nbsp;장</a> <a href="javascript:;" onclick="javascript:memberInsertClearForm('memberInsertProc'); return false;" class="btn_big4">취&nbsp;소</a>
								<br /><br />
							</div>
						</div>
						<!---button//---->
                        </form>
					</div>
				</div>
				<!---Contents//----->

				<!-- 레이어 팝업 : 중개설정  -->
				<div id="memberKindsConfDialog" class="popUp" style="display:none;" title="중개 사업자 정보">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="memberKindsCondPopUp" id="memberKindsCondPopUp" method="post" action="">
									<div class="form-group">
										<table class="tb4">
										<colgroup>
											<col width="15%"><col>
											<col width="15%"><col>
										</colgroup>
										<tbody>
											<tr>
												<th colspan="4" class="subject">수수료</th>
											</tr>
											<tr>
												<th>
													전력거래 중개<br />수수료(원/kwh)
												</th>
												<td>
													<input type="text" name="powerSaleMediateFee" id="powerSaleMediateFee" value="" style="width: 94%;">
												</td>
												<th>
													유지보수<br />수수료(%)
												</th>
												<td>
													<input type="text" name="maintenanceFee" id="maintenanceFee" value="" style="width: 94%;">
												</td>
											</tr>
											<tr>
												<th>
													REC중개거래<br />수수료(%)
												</th>
												<td>
													<input type="text" name="recMediateSaleFee" id="recMediateSaleFee" value="" style="width: 94%;">
												</td>
												<th>
													KPX 전력거래<br />수수료(kwh)
												</th>
												<td>
													<input type="text" name="kpxPowerSaleeFee" id="kpxPowerSaleeFee" value="" style="width: 94%;">
												</td>
											</tr>
											<tr>
												<th>
													KRX인증서거래<br />수수료(%)
												</th>
												<td colspan="3">
													<input type="text" name="krxCertSaleFee" id="krxCertSaleFee" value="" style="width: 97.5%;">
												</td>
											</tr>
											<tr>
												<th colspan="4" class="subject">
													전력 주문 / 입찰
												</th>
											</tr>
											<tr>
												<th>
													전력 수기주문<br />마감시간
												</th>
												<td>
													<select name="powerMenualOrderEndDay" id="powerMenualOrderEndDay" style="width: 41%;">
														<option value="1">D-1</option>
														<option value="2" selected>D-2</option>
														<option value="3">D-3</option>
														<option value="4">D-4</option>
														<option value="5">D-5</option>
														<option value="6">D-6</option>
														<option value="7">D-7</option>
													</select>일 &nbsp;&nbsp;
													<select name="powerManualOrderEndTm" id="powerAutoOrderEndTm" style="width: 41%;">
														<option value="1">01:00</option>
														<option value="2">02:00</option>
														<option value="3">03:00</option>
														<option value="4">04:00</option>
														<option value="5">05:00</option>
														<option value="6">06:00</option>
														<option value="7">07:00</option>
														<option value="8">08:00</option>
														<option value="9">09:00</option>
														<option value="10">11:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18" selected>18:00</option>
														<option value="19">19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
														<option value="24">24:00</option>
													</select>까지
												</td>
												<th>
													전력 자동<br />주문시간
												</th>
												<td>
													<select name="powerAutoOrderDay" id="powerAutoOrderDay" style="width: 41%;">
														<option value="1">D-1</option>
														<option value="2" selected>D-2</option>
														<option value="3">D-3</option>
														<option value="4">D-4</option>
														<option value="5">D-5</option>
														<option value="6">D-6</option>
														<option value="7">D-7</option>
													</select>일 &nbsp;&nbsp;
													<select name="powerAutoOrderTm" id="powerAutoOrderTm" style="width: 41%;">
														<option value="1">01:00</option>
														<option value="2">02:00</option>
														<option value="3">03:00</option>
														<option value="4">04:00</option>
														<option value="5">05:00</option>
														<option value="6">06:00</option>
														<option value="7">07:00</option>
														<option value="8">08:00</option>
														<option value="9">09:00</option>
														<option value="10">11:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18">18:00</option>
														<option value="19" selected>19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
														<option value="24">24:00</option>
													</select>까지
												</td>
											</tr>
											<tr>
												<th>
													전력 입찰서<br />생성 시작시간
												</th>
												<td>
													<select name="powerAdjustCreateDay" id="powerAdjustCreateDay" style="width: 41%;">
														<option value="1" selected>D-1</option>
														<option value="2">D-2</option>
														<option value="3">D-3</option>
														<option value="4">D-4</option>
														<option value="5">D-5</option>
														<option value="6">D-6</option>
														<option value="7">D-7</option>
													</select>일 &nbsp;&nbsp;
													<select name="powerAdjustCreateTm" id="powerAdjustCreateTm" style="width: 41%;">
														<option value="1">01:00</option>
														<option value="2">02:00</option>
														<option value="3">03:00</option>
														<option value="4">04:00</option>
														<option value="5">05:00</option>
														<option value="6">06:00</option>
														<option value="7">07:00</option>
														<option value="8">08:00</option>
														<option value="9">09:00</option>
														<option value="10">11:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18" selected>18:00</option>
														<option value="19">19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
														<option value="24">24:00</option>
													</select>부터
												</td>
												<th>
													전력 입찰서<br />생성 마감시간
												</th>
												<td>
													<select name="powerAdjustCreateEndDay" id="powerAdjustCreateEndDay" style="width: 41%;">
														<option value="1" selected>D-1</option>
														<option value="2">D-2</option>
														<option value="3">D-3</option>
														<option value="4">D-4</option>
														<option value="5">D-5</option>
														<option value="6">D-6</option>
														<option value="7">D-7</option>
													</select>일 &nbsp;&nbsp;
													<select name="powerAdjustCreateEndTm" id="powerAdjustCreateEndTm" style="width: 41%;">
														<option value="1">01:00</option>
														<option value="2">02:00</option>
														<option value="3">03:00</option>
														<option value="4">04:00</option>
														<option value="5">05:00</option>
														<option value="6">06:00</option>
														<option value="7">07:00</option>
														<option value="8">08:00</option>
														<option value="9">09:00</option>
														<option value="10">11:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18">18:00</option>
														<option value="19" selected>19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
														<option value="24">24:00</option>
													</select>부터
												</td>
											</tr>
											<tr>
												<th colspan="4" class="subject">REC 주문 / 입찰</th>
											</tr>
											<tr>
												<th>
													REC수기주문<br />마감시간
												</th>
												<td colspan="3">
													<select name="recManualCreateDay" id="powerAdjustCreateEndDay" style="width: 16.2%;">
														<option value="1" selected>D-1</option>
														<option value="2">D-2</option>
														<option value="3">D-3</option>
														<option value="4">D-4</option>
														<option value="5">D-5</option>
														<option value="6">D-6</option>
														<option value="7">D-7</option>
													</select>일 &nbsp;&nbsp;
													<select name="recManualCreateTm" id="recManualCreateTm" style="width: 16.2%;">
														<option value="1">01:00</option>
														<option value="2">02:00</option>
														<option value="3">03:00</option>
														<option value="4">04:00</option>
														<option value="5">05:00</option>
														<option value="6">06:00</option>
														<option value="7">07:00</option>
														<option value="8">08:00</option>
														<option value="9">09:00</option>
														<option value="10">11:00</option>
														<option value="11">11:00</option>
														<option value="12" selected>12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18">18:00</option>
														<option value="19">19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
														<option value="24">24:00</option>
													</select>까지
												</td>
											</tr>
											<tr>
												<th>
													REC입찰서<br />생성 시작시간
												</th>
												<td>
													<select name="recAdjustCreateDay" id="recAdjustCreateDay" style="width: 41%;">
														<option value="1" selected>D-1</option>
														<option value="2">D-2</option>
														<option value="3">D-3</option>
														<option value="4">D-4</option>
														<option value="5">D-5</option>
														<option value="6">D-6</option>
														<option value="7">D-7</option>
													</select>일 &nbsp;&nbsp;
													<select name="recAdjustCreateTm" id="recAdjustCreateTm" style="width: 41%;">
														<option value="1">01:00</option>
														<option value="2">02:00</option>
														<option value="3">03:00</option>
														<option value="4">04:00</option>
														<option value="5">05:00</option>
														<option value="6">06:00</option>
														<option value="7">07:00</option>
														<option value="8">08:00</option>
														<option value="9">09:00</option>
														<option value="10">11:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18" selected>18:00</option>
														<option value="19" selected>19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
														<option value="24">24:00</option>
													</select>부터
												</td>
												<th>
													REC입찰서<br />생성 마감시간
												</th>
												<td>
													<select name="recAdjustCreateEndDay" id="recAdjustCreateEndDay" style="width: 41%;">
														<option value="1" selected>D-1</option>
														<option value="2">D-2</option>
														<option value="3">D-3</option>
														<option value="4">D-4</option>
														<option value="5">D-5</option>
														<option value="6">D-6</option>
														<option value="7">D-7</option>
													</select>일 &nbsp;&nbsp;
													<select name="recAdjustCreateEndTm" id="recAdjustCreateEndTm" style="width: 41%;">
														<option value="1">01:00</option>
														<option value="2">02:00</option>
														<option value="3">03:00</option>
														<option value="4">04:00</option>
														<option value="5">05:00</option>
														<option value="6">06:00</option>
														<option value="7">07:00</option>
														<option value="8">08:00</option>
														<option value="9">09:00</option>
														<option value="10">11:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18">18:00</option>
														<option value="19" selected>19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
														<option value="24">24:00</option>
													</select>까지
												</td>
											</tr>
										</tbody>
										</table>
									</div>

									<!---//button---->
									<div class="both_wrap">
										<div class="lfbn">									
										</div>
										<div class="rgbn">
											<a href="javascript:;" onclick="javascript:memberSubInsertProc('memberKindsCondPopUp');return false;" class="btn_big4">저&nbsp;장</a> <a href="javascript:;" onclick="javascript:memberSubClearFrm('memberKindsCondPopUp'); return false;" class="btn_big4">취&nbsp;소</a> 
										</div>
									</div>
									<!---button//---->
									
								</form>
							</div>
							<!---search//---->
						</div>
						<br /><br /><br />
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
			<!----row100//----->
		  	
		  	<script type="text/javascript">
		  	$(document).ready(function() {
		  		var serviceType = '<c:out value="${serviceType}" />';
		  		
		  		$(".nav_tit").text('회원관리');
		  		
		  		/* popup grid 선언 */
				var colNames = [
				                '우편번호'
				                ,'주소'
				                ,'비고'
				               ];
				var colModel = new Array();

				for (var i = 0; i < colNames.length; i++) {
					var model = {
						name : 'col' + i.toString()
						,index : 'col' + i.toString()
						,width : 260
						,search : true
						,resizable : false
					};
					
					colModel[i] = model; 	
				}
				setJqGridForm('zipCodeResultLst', 'zipCodeResultListPager', colNames, colModel, '');
		  		
		  		
		  		/* dislog popup 정의 */
				openDialogPopUp('memberKindsConfDialog', '890');
				openDialogPopUp('zipCodeSearchDialog', '890');
				
				/* 좌측메뉴 */
				if (serviceType == '') {
					makeLeftMenuList('mypage', 7, 1);
				} else {
					makeLeftMenuList('member', 8, 1);
				}
		  	});
		  	</script>
</body>
</html>