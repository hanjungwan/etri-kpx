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
 * @since 2016. 11. 2.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 11. 2.          creme55          최초생성(REC거래 입찰현황 조회)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="/js/service/tender/tender.js" charset="utf-8"></script>
</head>
<body>

				<!---//Contents----->
				<div class="col_p85">
					<div class="contents" >
						<div class="title">REC거래 입찰 현황
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goTenderHome(); return false;">입찰</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goRecSleTndrSttcInfoList(); return false;">REC거래 입찰 현황</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="recSleTndrLstFrm" id="recSleTndrLstFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th>
											판매희망일자
										</th>
										<td>
											<input type="text" name="sleWntSdt" id="sleWntSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="sleWntEdt" id="sleWntEdt" size="6">
										</td>
										<td class="interval">
											&nbsp;
										</td>
										<th>
											최종여부
										</th>
										<td>
											<select name="lstYn" id="lstYn" style="width:150px">
												<option>전체</option>
											</select>
										</td>	
										<td class="interval">
											&nbsp;
										</td>
										<th>
											제출여부
										</th>
										<td>
											<select name="srmtYn" id="srmtYn" style="width:170px">
												<option>전체</option>
											</select>
										</td>	
									</tr>
									<tr>
										<th>
											집합발전기명
										</th>
										<td>
											<select name="setGnrNm" id="setGnrNm" style="width:230px">
												<option>전체</option>
											</select>
										</td>
										<td class="interval">
											&nbsp;
										</td>
										<th>
											소규모발전자원명
										</th>
										<td colspan="3">
											<select name="smlGnrRsNm" id="smlGnrRsNm" style="width:150px">
												<option>전체 </option>
											</select>
										</td>	
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchRecSleTndr(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:recSleTndrSndr(); return false;" class="btn_big3">입찰제출</a> <a href="javascript:;" onclick="javascript:recSleTndrDtlPopup('recSleTndrRgstDialog', 'open'); return false;" class="btn_big3">상세보기</a> <a href="javascript:;" onclick="javascript:tenderTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="recSleTndrLst"></table>
								<div id="recSleTndrLstPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : REC거래입찰현황록  -->
				<div id="recSleTndrRgstDialog" class="popUp" style="display:none;" title="전력입찰서">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="recSleTndrRegPopUp" id="recSleTndrRegPopUp" method="post" encType="multipart/form-data" action="">
									<div class="form-group">
										<table class="tb4">
										<tr>
											<th>
												판매희망일자
											</th>
											<td>
												<input type="text" name="sleWntDt" id="sleWntDt" value="" />
											</td>	
											<th>
											  	제출여부
											</th>
											<td>
												<input type="text" name="srmYnSub" id="srmYnSub" value="" />
											</td>
										</tr>
										<tr>
											<th>
												집합발전기명
											</th>
											<td>
												<input type="text" name="setGnrNm1" id="setGnrNm1" value="" />
											</td>
											<th>
												소규모자원공급자명
											</th>
											<td>
												<input type="text" name="setRsSprtNm" id="setRsSprtNm" value="" />
											</td>											 
										</tr>
										<tr>
											<th>
												소규모 발전자원명
											</th>
											<td colspan="3">
												<input type="text" name="setGnrRstNm1" id="setGnrRstNm1" value="" />
											</td>
										</tr>
										<tr>
											<th>
												REC 계좌번호
											</th>
											<td colspan="3">
												<input type="text" name="setGnrRstNm1" id="setGnrRstNm1" value="" />
											</td>
										</tr>
										</table>
									</div>
								</form>
							</div>
							<!---search//---->

							<!---//button---->
							<div class="both_wrap">
								<div class="lfbn">
								</div>
								<div class="rgbn">
									<a href="javascript:;" onclick="javascript:recSleTndrSttcRgst(); return false;" class="btn_big3">저장</a> <a href="javascript:;" onclick="rexSleTndrSttcDtlDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
								</div>
							</div>
							<!---button//---->

							<!---//table---->
							<div class="row">
								<div class="tb_y_wrap" style="height:350px">
									<table id="recSleTndrSttcDtlLst"></table>
									<div id="recSleTndrSttcDtlLstPager"></div>
								</div>
							</div>
							<!---table//---->
						</div>
					</div>
					<!----wrapper//----->
                </div>

			</div>
			<!---Contents//----->

			<script type="text/javascript">
				$(document).ready(function() {
					/* 소규모발전사업자,  중개사업자에 따른 화면 재구성 */
					/* jqGrid 사용 선언 */
					var colNames = [
					                '선택'
					                ,'판매<br />희망일자'
					                ,'입찰서<br />생성일시'
					                ,'제출<br />여부'
					                ,'집합<br />발전기명'
					                ,'소규모자원<br />공급자명'
					                ,'소규모<br />발전자원명'
					                ,'REC<br />계좌번호'
					                ,'총매도<br />수량(EA)'
					                ,'총매도<br />금액(원)'
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
							,search : true
							,resizable : false
						};
						
						colModel[i] = model; 	
					}
					setJqGridForm('recSleTndrLst', 'recSleTndrLstPager', colNames, colModel, '');
					
					/* popup grid 선언 */
					var pcolNames = [
					                '판매<br />희망일자'
					                ,'REC<br />설비코드'
					                ,'매도수량'
					                ,'매도단가'
					                ,'총매도금액'
					               ];
					var pcolModel = new Array();

					var pwidth = 0;
					for (var i = 0; i < pcolNames.length; i++) {
						if (i != 5) {
							pwidth = 153;
						} else {
							pwidth = 43;
						}
						
						var pmodel = {
							name : 'col' + i.toString()
							,index : 'col' + i.toString()
							,width : pwidth
							,search : true
							,resizable : false
						};
						
						pcolModel[i] = pmodel; 	
					}
					setJqGridForm('recSleTndrSttcDtlLst', 'recSleTndrSttcDtlLstPager', pcolNames, pcolModel, '');

					/* date picker 사용 선언 */
					setDatePicker('sleWntSdt', 'sleWntEdt');
					
					/* dislog popup 정의 */
					openDialogPopUp('recSleTndrRgstDialog', '890');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('tender', 5, 2);

					/* header menu setting */
					$("#tender").toggleClass('temp select');
				});
			</script>

</body>
</html>