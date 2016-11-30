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
 * @since 2016. 11. 3.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 11. 3.          creme55          최초 생성(전력 정산내역 통보)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="/js/service/adjustment/adjustment.js" charset="utf-8"></script>
</head>
<body>

				<!---//Contents----->
				<div class="col_p85">
					<div class="contents">
						<div class="title">전력 정산내역 통보
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goAdjustmentHome(); return false;">정산</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goPwrAdjtHistSttcInfoList(); return false;">전력 정산내역 통보</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="pwrAdjtHistSttcLstFrm" id="pwrAdjtHistSttcLstFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th style="text-align: left; width: 10%; left !important">
											거래 기준월
										</th>
										<td colspan="3">
											<input type="text" name="trdeSdt" id="trdeSdt" size="7">
										</td>
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchPwrAdjtHistSttc(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:pwrAdjtHistSttcPopup('pwrAdjtHistSttcDialog', 'open'); return false;" class="btn_big3">통보하기</a><a href="javascript:;" onclick="javascript:adjustmentTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="pwrAdjtHistSttcLst"></table>
								<div id="pwrAdjtHistSttcLstPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : 전력 정산내역 통보  -->
				<div id="pwrAdjtHistSttcDialog" class="popUp" style="display:none;" title="전력 정산내역 통보">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="pwrAdjtHistSttcPopUp" id="pwrAdjtHistSttcPopUp" method="post" encType="multipart/form-data" action="">
									<div class="form-group">
										<table class="tb4">
										<tr>
											<th>
												거래기준월
											</th>
											<td>
												<input type="text" name="trdeSdt1" id="trdeSdt1" size="6" value="" />
											</td>	
											<th>
												통보일시
											</th>
											<td>
												<input type="text" name="informDt" id="informDt" value="" />
											</td>
										</tr>
										<tr>
											<th>
												소규모자원공급자명
											</th>
											<td>
												<input type="text" name="smlRsSprtNm1" id="setRsSprtNm1" value="" />
											</td>											 
											<th>
												소규모발전자원명
											</th>
											<td>
												<input type="text" name="smlGnrRsNm1" id="smlGnrRsNm1" value="" />
											</td>											 
										</tr>
										</table>
									
										<!-- <div class="bn"><a href="javascript:;" onclick="javascript:searchPwrSleTndrSttcGrph(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div> -->
									</div>
								</form>

							</div>
							<!---search//---->
							
							<!---//button---->
							<div class="rgbn_wrap">
								<a href="javascript:;" onclick="javascript:searchPwrAdjtHistSttcDtl(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a>
							</div>
							<!---button//---->

							<!---//table---->
							<div class="row">
								<div class="tb_y_wrap" style="height:350px">
									<table id="pwrAdjtHistSttcDtlLst"></table>
									<div id="pwrAdjtHistSttcDtlLstPager"></div>
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
					                '거래기준월'
					                ,'소규모<br />발전자원명'
					                ,'전체 계량<br />전력량값'
					                ,'전체<br />정산금'
					                ,'KPX 수수료'
					                ,'KPX 정산금'
					                ,'전력거래'
					                ,'유지보수'
					                ,'수수료 합'
					                ,'지급정산금'
					               ];
					var colModel = new Array();
					
					var width = 0;
					for (var i = 0; i < colNames.length; i++) {
						if (i > 0 && i < 12) {
							width = 113;
						} else {
							width = 42;
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
					setJqGridForm('pwrAdjtHistSttcLst', 'pwrAdjtHistSttcLstPager', colNames, colModel, '');
					
					/* jqGrid Group Header define */
					jQuery("#pwrAdjtHistSttcLst").jqGrid('setGroupHeaders', {
						useColSpanStyle: true, 
						groupHeaders:[
							{startColumnName: 'col6', numberOfColumns: 3, titleText: '<em>중개 수수료</em>'}
						]
					});

					/* popup grid 선언 */
					var pcolNames = [
					                '거래일자'
					                ,'소규모 자원<br />공급자명'
					                ,'소규모<br />발전자원명'
					                ,'전체 계량<br />전력량값'
					                ,'SMP'
					                ,'정산금'
					                ,'KPX 수수료'
					                ,'최종<br />KPX 정산금'
					                ,'전력거래'
					                ,'유지보수'
					                ,'수수료합'
					                ,'지급정산금'
					               ];
					var pcolModel = new Array();

					var pwidth = 0;
					for (var i = 0; i < pcolNames.length; i++) {
						if (i != 5) {
							pwidth = 62;
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
					setJqGridForm('pwrAdjtHistSttcDtlLst', 'pwrAdjtHistSttcDtlLstPager', pcolNames, pcolModel, '');
					
					/* date picker 사용 선언 */
					setDatePickerMon('trdeSdt');
					setDatePickerMon('trdeSdt1');
					
					/* dislog popup 정의 */
					openDialogPopUp('pwrAdjtHistSttcDialog', '890');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('adjustment', 9, 9);

					/* header menu setting */
					$("#adjustment").toggleClass('temp select');
				});
			</script>

</body>
</html>