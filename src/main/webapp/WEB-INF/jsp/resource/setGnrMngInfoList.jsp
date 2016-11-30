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
 * @since 2016. 10. 28.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 28.          creme55         최초 생성 (자원관리의 집합발전기관리 서비스)
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
						<div class="title">집합발전기 관리
							<div class="location">
								<a href=""><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goResourceHome(); return false;">자원관리</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goSetGnrMng(); return false;">집합발전기 관리</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="setGnrMngSearchFrm" id="setGnrMngSearchFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th style="text-align: left !important;">
											등록일자
										</th>
										<td>
											<input type="text" name="rgstSdt" id="rgstSdt" size="7">&nbsp;~&nbsp;&nbsp;<input type="text" name="rgstEdt" id="rgstEdt" size="7">
										</td>
										<th style="text-align: left !important;">
											총 설비용량
										</th>
										<td>
											<input type="text" name="capaMin" id="capaMin" size="7">&nbsp;~&nbsp;&nbsp;<input type="text" name="capaMax" id="capaMax" size="7">
										</td>
										<th style="text-align: left !important;">
											지역
										</th>
										<td colspan="3">
											<select name="regn" id="regn" style="width: 95%;">
												<option>수도권</option>
											</select>
										</td>
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchSetGnrMng(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:setGnrMngRegistFormOpen('setGnrMngRgstDialog', 'open'); return false;" class="btn_big3">집합발전기등록</a><a href="javascript:;" onclick="javascript:setGnrMngDelete(); return false;" class="btn_big3">삭제</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="setGnrMngLst"></table>
								<div id="setGnrMngPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : 전력거래 등록  -->
				<div id="setGnrMngRgstDialog" class="popUp" style="display:none;" title="집합발전기 등록">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="setGnrMngRgstPopUp" id="setGnrMngRgstPopUp" method="post" encType="multipart/form-data" action="">
									<div class="form-group">
										<table class="tb4">
										<colgroup>
											<col width="15%"><col>
											<col width="15%"><col>
										</colgroup>
			
										<tbody>
										<tr>
											<th colspan="4" class="subject">집합발전기 정보</th>
										</tr>
										<tr>
											<th>
												<span>*</span>
												집합<br />&nbsp;&nbsp;&nbsp;발전기명
											</th>
											<td>
												<input type="text" name="setGnrNm" id="setGnrNm" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												지역
											</th>
											<td>
												<select name="setGnrRegnNm" id="setGnrRegnNm" style="width: 100%;">
													<option value="">수도권</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												KPX<br />&nbsp;&nbsp;&nbsp;등록번호
											</th>
											<td>
												<input type="text" name="kpxRgstNo" id="kpxRgstNo" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												KPX<br />&nbsp;&nbsp;&nbsp;등록명
											</th>
											<td>
												<input type="text" name="kpxRgstNm" id="kpxRgstNm" style="width: 94%;" />
											</td>
										</tr>
										<tr>
											<th>
												<span>*</span>
												총 설비<br />&nbsp;&nbsp;&nbsp;용량(KW)
											</th>
											<td>
												<input type="text" name="maxGnrCpct" id="maxGnrCpct" style="width: 94%;" />
											</td>
											<th>
												<span>*</span>
												 발전원<br />&nbsp;&nbsp;&nbsp;개수
											</th>
											<td>
												<input type="text" name="gnrCnt" id="gnrCnt" style="width: 94%;" />
											</td>
										</tr>
										</table>
										<br />
										
										<!---//button---->
										<div class="both_wrap">
											<div class="lfbn">
											</div>
											<div class="rgbn">
												<a href="javascript:;" onclick="javascript:setGnrMngRowadd(); return false;" class="btn_big3">추가</a> <a href="javascript:;" onclick="javascript:setGnrMngRegist(); return false;" class="btn_big3">저장</a> <a href="javascript:;" onclick="javascript:setGnrMngRsrsDelete(); return false;" class="btn_big3">삭제</a> <a href="javascript:;" onclick="javascript:setGnrMngClearForm(''); return false;" class="btn_big3">취소</a>
											</div>
										</div>
										<!---button//---->

										<!---//table---->
										<div class="row">
											<div class="tb_y_wrap">
												<table id="resInfoLst"></table>
												<div id="resInfoLstPager"></div>
											</div>
										</div>
										<!---table//---->
										
									</div>
								</form>
							</div>
							<!---search//---->
						</div>
					</div>
					<!----wrapper//----->
                </div>
                
			</div>
			<!---Contents//----->

			<script type="text/javascript">
				$(document).ready(function() {
					/* jqGrid 사용 선언 */
					var colNames = [
					                '번호'
					                ,'집합<br />발전기명'
					                ,'KPX<br />등록번호'
					                ,'KPX<br />등록명'
					                ,'등록일'
					                ,'총 설비<br />용량(KW)'
					                ,'지역'
					                ,'발전원<br />개수'
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
					setJqGridForm('setGnrMngLst', 'setGnrMngPager', colNames, colModel, '');

					var zcolNames = [
					                '소규모 발전자원명'
					                ,'소규모 자원 공급자명'
					                ,'발전원 유형'
					                ,'용도'
					                ,'설비용량(KW)'
					                ,'등록일'
					               ];
					var zcolModel = new Array();

					for (var i = 0; i < zcolNames.length; i++) {
						var model = {
							name : 'col' + i.toString()
							,index : 'col' + i.toString()
							,width : 150
							,search : true
							,resizable : false
						};
						
						zcolModel[i] = model; 	
					}
					setJqGridForm('resInfoLst', 'resInfoLstPager', zcolNames, zcolModel, '');
					
					/* date picker 사용 선언 */
					setDatePicker('rgstSdt', 'rgstEdt');
					
					/* dislog popup 정의 */
					openDialogPopUp('setGnrMngRgstDialog', '880');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('resource', 1, 2);

					/* header menu setting */
					$("#resource").toggleClass('temp select');
				});
			</script>
</body>
</html>