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
 *  2016. 10. 27.          creme55         최초 생성 (질의응답[Q&A] 서비스 조회)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="/js/service/customer/qna.js" charset="utf-8"></script>
</head>
<body>

				<!---//Contents----->
				<div class="col_p85">
					<div class="contents">
						<div class="title">질의응답(Q&amp;A)
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goCustomerMain(); return false;">고객지원</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goCustomerNotifyMain(); return false;">질의응답(Q&amp;A)</a>
							</div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="qnaSearchFrm" id="qnaSearchFrm" method="post" encType="multipart" action="">
								<div class="form-group">
									<table class="tb1">
										<tr>
											<td>
												<select name="searchColumnName" id="searchColumnName">
													<option value="0" selected>전체</option>
													<option value="1">작성자</option>
													<option value="2">제목</option>
													<option value="3">내용</option>
												</select>
												<input type="text" name="keyword" id="keyword" size="110" value="" />
											</td>
										</tr>
									</table>
									<div class="bn"><a href="javascript:;" onclick="javascript:searchQna(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->
						
						<!---//button---->
						<div class="rgbn_wrap">
							<input type="hidden" name="qnaCnt" id="qnaCnt" value="0" />
							<a href="javascript:;" class="btn_big3" onclick="javascript:qnaRegistFormOpen('qnaRegistDialog', 'open'); return false;">등록</a> <a href="javascript:;" onclick="javascript:qnaDelete(); return false;" class="btn_big3">삭제</a>
						</div>
						<!---button//---->
						
						<!---//table---->
						<div class="row">
							<table id="qnaInfoList"></table>
							<div id="qnaInfoListPager"></div>
						</div>
						<!---table//---->
						
					</div>
					
				</div>
				<!---Contents//----->

				<div id="qnaRegistDialog" style="display:none;" title="질의응답(Q&A) 등록">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="qnaRegPopUp" id="qnaRegPopUp" method="post" encType="multipart/form-data" action="">
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
												작&nbsp;&nbsp;성&nbsp;&nbsp;자
											</th>
											<td colspan="3">
												<input type="text" name="crtUsrNm" id="crtUsrNm" size="90" value="" disabled="disabled" />
											</td>
										</tr>
										<tr>									    
											<th>
												<span>*</span>
												공개여부
											</th>
											<td colspan="3">
												<input type="radio" name="openYn" id="openYnY" value="" checked="checked" />공개&nbsp;&nbsp;&nbsp;
												<input type="radio" name="openYn" id="openYnN" value="" />비공개&nbsp;&nbsp;&nbsp;
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
										</table>

										<!---//button---->
										<div class="both_wrap">
											<div class="lfbn">
											</div>
											<br />
											<div class="rgbn">
												<a href="javascript:;" onclick="javascript:qnaRegist(); return false;" class="btn_big3">저장</a> <a href="javascript:;" onclick="javascript:qnaClearForm('qnaRegPopUp'); return false;" class="btn_big3">취소</a>
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
					                ,'제목'
					                ,'작성자'
					                ,'작성일자'
					                ,'조회수'
					               ];
					var colModel = new Array();
					
					var width = 0;
					for (var i = 0; i < colNames.length; i++) {
						if (i > 0 && i < 10) {
							width = 230;
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
					setJqGridForm('qnaInfoList', 'qnaInfoListPager', colNames, colModel, '');
					
					/* dislog popup 정의 */
					openDialogPopUp('qnaRegistDialog', '890');
					
					/* 좌측메뉴 */
					makeLeftMenuList('customer', 6, 3);

					/* header menu setting */
					$("#customer").toggleClass('temp select');
				});
				</script>

</body>
</html>