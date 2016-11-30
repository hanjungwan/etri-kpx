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
 * @since 2016. 10. 31.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 31.          creme55         최초생성 (중개계약 현황 서비스)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="/js/service/mediate/mediate.js" charset="utf-8"></script>
</head>
<body>

				<!---//Contents----->
				<div class="col_p85">
					<div class="contents" >
						<div class="title">중개계약 현황
							<div class="location">
								<a href=""><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goMediateHome(); return false;">자원관리</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goMedteCnteStat(); return false;">중개계약 현황</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="medteCnteSearchFrm" id="medteCnteSearchFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th style="text-align: left !important;">
											등록일자
										</th>
										<td>
											<input type="text" name="rgstSdt" id="rgstSdt" size="4">&nbsp;~&nbsp;&nbsp;<input type="text" name="rgstEdt" id="rgstEdt" size="4">
										</td>
										<th style="text-align: left !important;">
											상태
										</th>
										<td>
											<select name="status" id="status" style="width: 95%;">
												<option value="01">전체</option>
											</select>
										</td>
										<th style="text-align: left !important;">
											발전원 유형
										</th>
										<td>
											<select name="gnrTp" id="gnrTp" style="width: 95%;">
												<option value="01">태양광(PV)</option>
												<option value="02">전기자동차(ESS)</option>
											</select>
										</td>	
									</tr>
									<tr>
										<th style="text-align: left !important;">
											소규모발전자원명
										</th>
										<td>
											<select name="smlGnrRssNm" id="smlGnrRssNm" style="width: 95%;">
												<option value="01">태안복합태양광발전 1호기</option>
											</select>
										</td>
										<th style="text-align: left !important;">
											계약희망일자
										</th>
										<td>
											<input type="text" name="cnteWntSdt" id="cnteWntSdt" size="4">&nbsp;~&nbsp;&nbsp;<input type="text" name="cnteWntEdt" id="cnteWntEdt" size="4">
										</td>
										<th style="text-align: left !important;">
											계약기간
										</th>
										<td>
											<input type="text" name="cnteSdt" id="cnteSdt" size="4">&nbsp;~&nbsp;&nbsp;<input type="text" name="cnteEdt" id="cnteEdt" size="4">
										</td>	
									</tr>
									<tr>
										<th style="text-align: left !important;">
											승인/반려일자
										</th>
										<td>
											<input type="text" name="permRejtSdt" id="permRejtSdt" size="4">&nbsp;~&nbsp;&nbsp;<input type="text" name="permRejtEdt" id="permRejtEdt" size="4">
										</td>
										<th style="text-align: left !important;">
											체결/해지일자
										</th>
										<td colspan="3">
											<input type="text" name="cnteCrtSdt" id="cnteCrtSdt" size="4">&nbsp;~&nbsp;&nbsp;<input type="text" name="cnteCrtEdt" id="cnteCrtEdt" size="4">
										</td>
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchMedteCnte(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<!-- <a href="javascript:;" onclick="javascript:smlGnrResMngRegistFormOpen('smlGnrResMngRgstDialog', 'open'); return false;" class="btn_big3">신청</a><a href="javascript:;" onclick="javascript:smlGnrResMngDelete(); return false;" class="btn_big3">삭제</a> -->
							<a href="javascript:;" onclick="javascript:medteCnteRegistFormOpen('mdeteCnteRgstDialog', 'open'); return false;" class="btn_big3">신청</a><a href="javascript:;" onclick="javascript:" class="btn_big3">해지</a><a href="javascript:;" onclick="javascript:" class="btn_big3">회수</a><a href="javascript:;" onclick="javascript:" class="btn_big3">승인/반려</a><a href="javascript:;" onclick="javascript:" class="btn_big3">회수</a><a href="javascript:;" onclick="javascript:" class="btn_big3">삭제</a><a href="javascript:;" onclick="javascript:" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="mdeteCnteLst"></table>
								<div id="mdeteCntePager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : 중개계약  -->
				<div id="mdeteCnteRgstDialog" class="popUp" style="display:none;" title="중개계약 등록">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="mdeteCnteRgstPopUp" id="mdeteCnteRgstPopUp" method="post" encType="multipart/form-data" action="">
									<div class="form-group">
										<table class="tb4">
										<colgroup>
											<col width="15%"><col>
											<col width="15%"><col>
										</colgroup>
			
										<tbody>
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
											<th>
												<span>*</span>
												사업자<br />&nbsp;&nbsp;&nbsp;등록번호
											</th>
											<td colspan="3">
												<input type="text" name="compRgstNo" id="compRgstNo" style="width: 52%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												계약<br />&nbsp;&nbsp;&nbsp;희망일자
											</th>
											<td>
												<input type="text" name="cnteWntSdt" id="cnteWntSdt" size="4" />&nbsp;~&nbsp;&nbsp;<input type="text" name="cnteWntEdt" id="cnteWntEdt" size="4" />
											</td>
											<th>
												<span>*</span>
												계약기간(년)
											</th>
											<td>
												<input type="text" name="cnteYr" id="cnteYr" style="width: 94%;" />
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
										<tr>
											<th>
												<span>*</span>
												승인<br />&nbsp;&nbsp;&nbsp;/반려일자
											</th>
											<td>
												<input type="text" name="permRejtDt" id="permRejtDt" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												체결<br />&nbsp;&nbsp;&nbsp;/해지일자
											</th>
											<td>
												<input type="text" name="cnclDt" id="cnclDt" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												전력거래<br />&nbsp;&nbsp;&nbsp;수수료율(kwh)
											</th>
											<td>
												<input type="text" name="pwrSleRte" id="pwrSleRte" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												유지보수<br />&nbsp;&nbsp;&nbsp;수수료(%)
											</th>
											<td>
												<input type="text" name="mntnRte" id="mntnRte" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												REC전력거래<br />&nbsp;&nbsp;&nbsp;수수료율(%)
											</th>
											<td>
												<input type="text" name="recPwrSleRte" id="recPwrSleRte" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												KPX전력<br />&nbsp;&nbsp;&nbsp;수수료(원/kwh)
											</th>
											<td>
												<input type="text" name="kpxPwrSleFee" id="kpxPwrSleFee" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												KPX인증서<br />&nbsp;&nbsp;&nbsp;거래수수료(%)
											</th>
											<td colspan="3">
												<input type="text" name="kpxSleRte" id="kpxSleRte" style="width: 94%;" />
											</td>
										</tr>
										</table>

										<br /><br /><br />
									</div>
								</form>
							</div>
							<!---search//---->
						</div>
					</div>
					<!----wrapper//----->
                </div>
                
                <!-- 중개계약 - 중객계약 체결  -->
				<div id="medteCnteDialog" class="popUp" style="display:none;" title="우편번호 조회">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="medteCntePopUp" id="zipCodeSearchPopUp" method="post" action="">
									<div class="form-group">
                						<table class="tb4">
										<colgroup>
											<col width="15%"><col>
											<col width="15%"><col>
										</colgroup>
			
										<tbody>
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
											<th>
												<span>*</span>
												사업자<br />&nbsp;&nbsp;&nbsp;등록번호
											</th>
											<td>
												<input type="text" name="compRgstNo2" id="compRgstNo2" style="width: 52%;" />
											</td>
											<th>
												<span>*</span>
												중개<br />&nbsp;&nbsp;&nbsp;계약번호
											</th>
											<td>
												<input type="text" name="medteCnteNo" id="medteCnteNo" style="width: 52%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												계약서<br />&nbsp;&nbsp;&nbsp;사본
											</th>
											<td colspan="3">
												<input type="file" name="apndFile2" id="apndFile2" style="width: 98%;" class="multi
												{max:3, accept:'gif|jpg|bmp|png|doc|docx|ppt|pptx|xls|xlsx|hwp|txt|pdf', STRING:{
												 remove:'x 삭제',
												 selected:'선책된 파일은  $file 입니다.',
												 denied:'gif, jpg, bmp, png, doc, docx, ppt, pptx, xls, xlsx, hwp, txt, pdf 등  파일만 업로드가 가능합니다. $ext!',
												 duplicate:'$file은 이미 선택된 파일입니다.'
												}}" />
											</td>
										</tr>
                						</table>
										<div class="bn"><a href="javascript:;" onclick="" name="zipCodeSearch" id="zipCodeSearch" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
									</div>
								</form>
							</div>
							
						</div>
					             
						<!---//button---->
						<div class="both_wrap">
							<div class="lfbn">									
							</div>
							<div class="rgbn">
								<a href="javascript:;" onclick="javascript:" class="btn_big4">저&nbsp;장</a><a href="javascript:;" onclick="javascript:" class="btn_big4">취&nbsp;소</a> 
							</div>
						</div>
						<!---button//---->
						
					</div>
                </div>
                
			</div>
			<!---Contents//----->

			<script type="text/javascript">
				$(document).ready(function() {
					/* jqGrid 사용 선언 */
					var colNames = [
					                '번호'
					                ,'등록일'
					                ,'소규모발전<br />자원명'
					                ,'소규모자원<br />공급자명'
					                ,'발전원<br />유형'
					                ,'계약<br />희망일자'
					                ,'계약기간'
					                ,'승인/반려<br />일자'
					                ,'상태'
					                ,'중개<br />계약번호'
					                ,'계약서/<br />견적서'
					               ];
					var colModel = new Array();
					
					var width = 0;
					for (var i = 0; i < colNames.length; i++) {
						if (i > 0 && i < 10) {
							width = 130;
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
					setJqGridForm('mdeteCnteLst', 'mdeteCntePager', colNames, colModel, '');

					/* date picker 사용 선언 */
					setDatePicker('rgstSdt', 'rgstEdt');
					setDatePicker('cnteWntSdt', 'cnteWntEdt');
					setDatePicker('permRejtSdt', 'permRejtEdt');
					setDatePicker('cnteCrtSdt', 'cnteCrtEdt');
					setDatePicker('cnteWntSdt', 'cnteWntEdt');
					
					/* dislog popup 정의 */
					openDialogPopUp('mdeteCnteRgstDialog', '880');
					openDialogPopUp('medteCnteDialog', '890');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('mediate', 2, 1);

					/* header menu setting */
					$("#mediate").toggleClass('temp select');
				});
			</script>

</body>
</html>