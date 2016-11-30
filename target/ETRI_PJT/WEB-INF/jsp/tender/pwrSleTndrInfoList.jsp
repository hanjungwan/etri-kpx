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
 *  -------------        -----------       -------------------------
 *  2016. 11. 1.          creme55          최초생성 (전력거래 입찰 현황 조회)
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
						<div class="title">전력거래 입찰 현황
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goTenderHome(); return false;">입찰</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goPwrSleTndrSttcInfoList(); return false;">전력거래 입찰 현황</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="pwrSleTndrLstFrm" id="pwrSleTndrLstFrm" method="POST" enctype="multipart/form-data" action="">
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
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchPwrSleTndr(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:pwrSleTndrSndr(); return false;" class="btn_big3">입찰제출</a> <a href="javascript:;" onclick="javascript:pwrSleTndrDtlPopup('pwrSleTndrRgstDialog', 'open'); return false;" class="btn_big3">상세보기</a> <a href="javascript:;" onclick="javascript:tenderTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="pwrSleTndrLst"></table>
								<div id="pwrSleTndrLstPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : 전력거래입찰현황록  -->
				<div id="pwrSleTndrRgstDialog" class="popUp" style="display:none;" title="전력입찰서">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="pwrSleTndrRegPopUp" id="pwrSleTndrRegPopUp" method="post" encType="multipart/form-data" action="">
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
												소규모발전자원명
											</th>
											<td>
												<select name="smlGnrRsNm1" id="smlGnrRsNm1" style="width:182px">
													<option>태안복합 태양광발전 1호기  </option>
												</select>
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
									<a href="javascript:;" onclick="javascript:pwrSleTndrSttcRgst(); return false;" class="btn_big3">저장</a> <a href="javascript:;" onclick="pwrSleTndrSttcDtlDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
								</div>
							</div>
							<!---button//---->

							<!---//table---->
							<div class="row">
								<div class="tb_y_wrap" style="height:350px">
									<table id="pwrSleTndrSttcDtlLst"></table>
									<div id="pwrSleTndrSttcDtlLstPager"></div>
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
					                ,'입찰<br />생성일시'
					                ,'최종<br />여부'
					                ,'제출<br />여부'
					                ,'집합<br />발전기명'
					                ,'소규모자원<br />공급자명'
					                ,'소규모<br />발전자원명'
					                ,'전체입찰량'
					                ,'1Hr'
					                ,'2Hr'
					                ,'3Hr'
					                ,'4Hr'
					                ,'5Hr'
					                ,'6Hr'
					                ,'7Hr'
					                ,'8Hr'
					                ,'9Hr'
					                ,'10Hr'
					                ,'11Hr'
					                ,'12Hr'
					                ,'13Hr'
					                ,'14Hr'
					                ,'15Hr'
					                ,'16Hr'
					                ,'17Hr'
					                ,'18Hr'
					                ,'19Hr'
					                ,'20Hr'
					                ,'21Hr'
					                ,'22Hr'
					                ,'23Hr'
					                ,'24Hr'
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
					setJqGridForm('pwrSleTndrLst', 'pwrSleTndrLstPager', colNames, colModel, '');
					
					/* popup grid 선언 */
					var pcolNames = [
					                '판매<br />희망일자'
					                ,'발전원<br />유형'
					                ,'소규모<br />발전자원명'
					                ,'구간'
					                ,'입찰량'
					                ,'시간대별<br />입찰량합'
					               ];
					var pcolModel = new Array();

					var pwidth = 0;
					for (var i = 0; i < pcolNames.length; i++) {
						if (i != 5) {
							pwidth = 143;
						} else {
							pwidth = 45;
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
					setJqGridForm('pwrSleTndrSttcDtlLst', 'pwrSleTndrSttcDtlLstPager', pcolNames, pcolModel, '');

					/* date picker 사용 선언 */
					setDatePicker('sleWntSdt', 'sleWntEdt');
					
					/* dislog popup 정의 */
					openDialogPopUp('pwrSleTndrRgstDialog', '890');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('tender', 5, 1);
					
					/* header menu setting */
					$("#tender").toggleClass('temp select');
				});
			</script>

</body>
</html>