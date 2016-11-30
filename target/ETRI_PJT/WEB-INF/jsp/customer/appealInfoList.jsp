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
 * @since 2016. 10. 27.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 27.          creme55         최초생성(이의신청 서비스 조회)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="/js/service/customer/appeal.js" charset="utf-8"></script>
</head>
<body>
				<!---//Contents----->
				<div class="col_p85">
					<div class="contents">
						<div class="title">이의신청
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goCustomerMain(); return false;">고객지원</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goCustomerAppealMain(); return false;">이의신청</a>
							</div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="appealSearchFrm" id="appealSearchFrm" method="post" encType="multipart" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th style="text-align: left !important;">
											신청일자
										</th>
										<td>
											<input type="text" name="appealStartDt" id="appealStartDt" value="" />&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" name="appealEndDt" id="appealEndDt" value="" />
										</td>
									</tr>
									</table>
									<div class="bn"><a href="javascript:;" onclick="javascript:searchAppeal(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->
						
						<!---//button---->
						<div class="rgbn_wrap">
							<input type="hidden" name="appealCnt" id="appealCnt" value="0" />
							<a href="javascript:;" class="btn_big3" onclick="javascript:appealRegistFormOpen('appealRegistDialog', 'open'); return false;">이의신청</a>
						</div>
						<!---button//---->
						
						<!---//table---->
						<div class="row">
							<table id="appealInfoList"></table>
							<div id="appealInfoListPager"></div>
						</div>
						<!---table//---->
						
					</div>
					
				</div>
				<!---Contents//----->

				<div id="appealRegistDialog" style="display:none;" title="이의신청 등록">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="appealRegPopUp" id="appealRegPopUp" method="post" encType="multipart/form-data" action="">
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
												신&nbsp;&nbsp;청&nbsp;&nbsp;자
											</th>
											<td colspan="3">
												<input type="text" name="crtUsrNm" id="crtUsrNm" size="90" value="" readonly="readonly"/>
											</td>
										</tr>
										<tr>									    
											<th>
												<span>*</span>
												신청유형
											</th>
											<td colspan="3">
												<input type="radio" name="appealTp" id="appealTp01" value="" checked="checked" />주문 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="appealTp" id="appealTp02" value="" />입찰&nbsp;&nbsp;&nbsp;
												<input type="radio" name="appealTp" id="appealTp03" value="" />정산&nbsp;&nbsp;&nbsp;
												<input type="radio" name="appealTp" id="appealTp04" value="" />기타
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
												<textarea rows="5" cols="92" name="conts" id="conts" style="width: 657px; height: 90px; resize: none;"></textarea>
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
												<a href="javascript:;" onclick="javascript:appealApproval(); retun false;" class="btn_big3">승인</a> <a href="javascript:;" onclick="javascript:appealReject(); return false;" class="btn_big3">반려</a>
											</div>
											<div class="rgbn">
												<a href="javascript:;" onclick="javascript:appealApproval(); return false;" class="btn_big3">승인요청</a> <a href="javascript:;" onclick="javascript:appealRegist(); return false;" class="btn_big3">저장</a> <a href="javascript:;" onclick="javascript:appealClearForm('appealRegPopUp'); return false;" class="btn_big3">취소</a>
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
					                ,'신청유형'
					                ,'제목'
					                ,'처리결과'
					                ,'처리자'
					                ,'처리일자'
					                ,'첨부파일'
					               ];
					var colModel = new Array();
					
					var width = 0;
					for (var i = 0; i < colNames.length; i++) {
						if (i > 0 && i < 10) {
							width = 113;
						} else {
							width = 43;
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
					setJqGridForm('appealInfoList', 'appealInfoListPager', colNames, colModel, '');
					
					/* date picker 사용 선언 */
					setDatePicker('appealStartDt', 'appealEndDt');
					
					/* dislog popup 정의 */
					openDialogPopUp('appealRegistDialog', '890');
					
					/* 좌측메뉴 */
					makeLeftMenuList('customer', 6, 4);

					/* header menu setting */
					$("#customer").toggleClass('temp select');
				});
				</script>

</body>
</html>