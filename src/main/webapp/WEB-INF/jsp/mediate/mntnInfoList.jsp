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
 * @since 2016. 11. 1.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------------
 *  2016. 11. 1.          creme55          최초생성 (유지보수 서비스, 유지보수 리스트 조회)
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
					<div class="contents">
						<div class="title">유지보수
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goMediateMain(); return false;">중개계약</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goMediateMntn(); return false;">유지보수</a>
							</div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="mntnSearchFrm" id="mntnSearchFrm" method="post" encType="multipart" action="">
								<div class="form-group">
									<table class="tb1">
										<tr>
											<th style="text-align: left !important;">
												신청일자
											</th>
											<td>
												<input type="text" name="mntnSbsnSdt" id="mntnSbsnSdt" value="" />&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" name="mntnSbsnEdt" id="mntnSbsnEdt" value="" />
											</td>
										</tr>
									</table>
									<div class="bn"><a href="javascript:;" onclick="javascript:searchMntn(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->
						
						<!---//button---->
						<div class="rgbn_wrap">
							<input type="hidden" name="mntnCnt" id="mntnCnt" value="0" />
							<a href="javascript:;" class="btn_big3" onclick="javascript:mntnRegistFormOpen('mntnRegistDialog', 'open'); return false;">유지보수 신청</a><a href="javascript:;" class="btn_big3" onclick="javascript:mntnRegistFormOpen('mntnRegistDialog', 'open'); return false;">새통보</a><a href="javascript:;" class="btn_big3" onclick="javascript:mntnDelete(); return false;">삭제</a>
						</div>
						<!---button//---->
						
						<!---//table---->
						<div class="row">
							<table id="mntnInfoList"></table>
							<div id="mntnInfoListPager"></div>
						</div>
						<!---table//---->
						
					</div>
					
				</div>
				<!---Contents//----->

				<div id="mntnRegistDialog" style="display:none;" title="유지보수 신청">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="mntnRegPopUp" id="mntnRegPopUp" method="post" encType="multipart/form-data" action="">
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
												신청자
											</th>
											<td colspan="3">
												<input type="text" name="compNm" id="compNm" size="80" value="" />&nbsp;&nbsp;&nbsp;
												<a href="javascript:;" onclick="javascript:mntnFindCompId('findCompId'); return false;" class="btn_big3">검색</a>
												<div id="findCompId" style="display: none;" ondblclick="javascript:divToggle('findCompId'); return false;">
													<table width="90%">
													<colgroup>
														<col width="10%">
														<col width="20%">
														<col width="70%">
													</colgroup>
													<thead>
														<tr>
															<th style="text-align: center; height: 25px;">
																<input type="checkbox" name="choiceCompIds" id="choiceCompIds">
															</th>
															<th style="text-align: center; height: 25px;">
																번호
															</th>
															<th style="text-align: center; height: 25px;">
																발전사업자
															</th>
														</tr>
													</thead>
													<tbody>

													</tbody>
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												유지보수유형
											</th>
											<td colspan="3">
												<input type="radio" name="mntnTp" id="mntnTp01" value="" checked="checked" />정기점검 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mntnTp" id="mntnTp02" value="" />AS
											</td>	
										</tr>
										<tr>
											<th>
												<span>*</span>
												대상자원
											</th>
											<td colspan="3">
												<select name="rsrsId" id="rsrsId" style="width: 672px;">
													<option value="01">태안복합 태양광 1호</option>
												</select>
											</td>	
										</tr>
										<tr> 
											<th>
												<span>*</span>
												제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
											</th>
											<td colspan="3">
												<input type="text" name="title" id="title" size="90" value="" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용
											</th>
											<td colspan="3">
												<textarea rows="5" name="conts" id="conts" style="width: 657px; height: 90px; resize: none;"></textarea>
											</td>	
										</tr>
										<tr>
											<th>
												<span>*</span>
												첨부파일
											</th>
											<td colspan="3">
												<input type="file" name="apndFile" id="apndFile" style="width: 95%;" class="multi
												{max:3, accept:'gif|jpg|bmp|png|doc|docx|ppt|pptx|xls|xlsx|hwp|pdf|txt', STRING:{
												 remove:'x 삭제',
												 selected:'선책된 파일은  $file 입니다.',
												 denied:'gif, jpg, bmp, png, doc, docx, ppt, pptx, xls, xlsx, hwp, pdf, txt 등  파일만 업로드가 가능합니다. $ext!',
												 duplicate:'$file은 이미 선택된 파일입니다.'
												}}" />
											</td>	
										</tr>
										</table>

										<!---//button---->
										<div class="both_wrap">
											<div class="lfbn">
											</div>
											<br />
											<div class="rgbn">
												<a href="javascript:;" onclick="javascript:mntnRegist(); return false;" class="btn_big4">저장</a> <a href="javascript:;" onclick="javascript:mntnClearForm('mntnRegPopUp'); return false;" class="btn_big4">취소</a>
											</div>
										</div>
										<!---button//---->

									</div>
								</form>
								<br /><br /><br />
								
							</div>
							<!---search//---->

						</div>
					</div>
					<!----wrapper//----->
                </div>
                
				<script type="text/javascript">
				$(document).ready(function() {
					/* jqGrid 사용 선언 */
					var colNames = [
					                '번호'
					                ,'신청일자'
					                ,'신청자'
					                ,'대상자원'
					                ,'유형'
					                ,'제목'
					                ,'검토'
					                ,'검토자'
					                ,'검토일자'
					                ,'첨부파일'
					               ];
					var colModel = new Array();
					
					var width = 0;
					for (var i = 0; i < colNames.length; i++) {
						if (i > 0 && i < 10) {
							width = 100;
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
					setJqGridForm('mntnInfoList', 'mntnInfoListPager', colNames, colModel, '');
					
					/* date picker 사용 선언 */
					setDatePicker('mntnSbsnSdt', 'mntnSbsnEdt');
					
					/* dislog popup 정의 */
					openDialogPopUp('mntnRegistDialog', '890');
					
					/* 좌측메뉴 */
					makeLeftMenuList('mediate', 2, 2);

					/* header menu setting */
					$("#mediate").toggleClass('temp select');
				});
				</script>

</body>
</html>