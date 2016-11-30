<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
 * @since 2016. 10. 19.
 * @version 1.0
 * @see 
 * @Copyright ? [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                       수정자                                                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 19.          creme55         최초생성 (전력거래주문 리스트 조회)
 *
 * </pre>
 **/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<script src="/js/service/order/order.js" charset="utf-8"></script>
</head>
<body>

				<!---//Contents----->
				<div class="col_p85">
					<div class="contents" >
						<div class="title">REC거래주문
							<div class="location">
								<a href=""><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goOrderHome(); return false;">주문</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goOrderPwr(); return false;">REC 거래주문</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="ordPwrTrdLstFrm" id="ordPwrTrdLstFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th>판매 희망일자</th>
										<td><input type="text" name="rsleWntSdt" id="rsleWntSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="rsleWntEdt" id="rsleWntEdt" size="6"></td>
										<td class="interval">&nbsp;</td>
										<th>주문일자</th>
										<td><input type="text" name="rordSdt" id="rordSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="rordEdt" id="rordEdt" size="6"></td>	
										<td class="interval">&nbsp;</td>
									</tr>
									<tr>
										<th>발전유형</th>
										<td>
											<select  style="width:220px">
												<option>태양광(PV)</option>
											</select>
										</td>
										<td class="interval">&nbsp;</td>
										<th>자원선택</th>
										<td>
											<select  style="width:220px">
												<option>태안복합 태양광발전 1호기  </option>
											</select>
										</td>	
									</tr>
									</table>
									
									<div class="bn"><a class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:recOrdPwrTrdCrtTndr(); return false;" class="btn_big3">입찰서 생성</a> <a href="javascript:;" onclick="javascript:recOrderPwrTrdRgstPopup('recOrdPwrTrdRgstDialog', 'open'); return false;" class="btn_big3">주문등록</a> <a href="javascript:;" onclick="javascript:orderTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="recOrdPwrTrdLst"></table>
								<div id="recOrdPwrTrdLstPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : 전력거래 등록  -->
				<div id="recOrdPwrTrdRgstDialog" class="popUp" style="display:none;" title="REC주문등록">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="recOrdPwrTrdRegPopUp" id="recOrdPwrTrdRegPopUp" method="post" encType="multipart" action="">
									<div class="form-group">
										<table class="tb1">
										<tr>
											<th>거래일자</th>
											<td>
												<input type="text" name="recpopupSaleStartDay" id="recpopupSaleStartDay" size="6">
											</td>
											<td class="interval">&nbsp;</td>
											<th>자원명</th>
											<td>
												<select name="recpopupResource" id="recpopupResource" style="width:250px">
													<option>태양복합 태양광발전 1호기</option>
												</select>
											</td>
										</tr>	
										</table>
										<div class="bn"><a href="javascript:;" onclick="" name="recporderPwrTrdFnd" id="recporderPwrTrdFnd" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
									</div>
								</form>
							</div>
							<!---search//---->

							<!---//button---->
							<div class="both_wrap">
								<div class="lfbn">
								</div>
								<div class="rgbn">
									<a class="btn_big3">주문저장</a> <a class="btn_big3">주문취소</a> <!-- <a class="btn_big2"><img src="/images/img/ico_refresh.png">초기화</a> --> <a class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
								</div>
							</div>
							<!---button//---->

							<!---//table---->
							<div class="row">
								<div class="tb_y_wrap" style="height:350px">
									<table id="recpOrdPwrTrdLst"></table>
									<div id="recpOrdPwrTrdLstPager"></div>
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
					/* jqGrid 사용 선언 */
					var colNames = [
					                '선택'
					                ,'판매<br />희망일자'
					                ,'소규모 발전<br />사업자명'
					                ,'소규모<br />자원명'
					                ,'REC<br />계좌번호'
					                ,'총 매도수량<br />(EA)'
					                ,'총 매도금액<br />(원)'
					                ,'주문일시'
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
					setJqGridForm('recOrdPwrTrdLst', 'recOrdPwrTrdLstPager', colNames, colModel, '');
					
					/* popup grid 선언 */
					var pcolNames = [
					                '상태'
					                ,'거래일자'
					                ,'REC설비코드'
					                ,'매도수량'
					                ,'매도단가'
					               ];
					var pcolModel = new Array();

					for (var i = 0; i < pcolNames.length; i++) {
						var pmodel = {
							name : 'col' + i.toString()
							,index : 'col' + i.toString()
							,search : true
							,resizable : false
						};
						
						pcolModel[i] = pmodel; 	
					}
					setJqGridForm('recpOrdPwrTrdLst', 'recpOrdPwrTrdLstPager', pcolNames, pcolModel, '');

					/* date picker 사용 선언 */
					setDatePicker('rsleWntSdt', 'rsleWntEdt');
					setDatePicker('rordSdt', 'rordEdt');
					setDatePickerOne('recpopupSaleStartDay');
					
					/* dislog popup 정의 */
					openDialogPopUp('recOrdPwrTrdRgstDialog', '880');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('order', 4, 2);

					/* header menu setting */
					$("#order").toggleClass('temp select');
				});
			</script>
</body>
</html>