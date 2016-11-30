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
 *  2016. 11. 2.          creme55          최초생성 (집합전력입찰통계 조회)
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
						<div class="title">집합전력 입찰 통계
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goTenderHome(); return false;">입찰</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goSetPwrTndrSttcGraphInfoList(); return false;">집합전력 입찰 통계</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="setPwrTndrSttcLstFrm" id="SetPwrTndrSttcLstFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th>
											판매희망일자
										</th>
										<td>
											<input type="text" name="sleWntSdt" id="sleWntSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="sleWntEdt" id="sleWntEdt" size="6">
										</td>
										<th>
											발전원구분
										</th>
										<td>
											<select name="setGnrNm" id="setGnrNm" style="width:130px">
												<option>전체</option>
											</select>
										</td>
										<th>
											소규모발전자원명
										</th>
										<td colspan="3">
											<select name="smlGnrRsNm" id="smlGnrRsNm" style="width:190px">
												<option>전체 </option>
											</select>
										</td>	
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchSetPwrTndrSttc(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:setPwrTndrGrphPopup('setPwrTndrDspDialog', 'open'); return false;" class="btn_big2"><img src="/images/img/ico_graph.png">그래프</a> <a href="javascript:;" onclick="javascript:tenderTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="setPwrTndrSttcLst"></table>
								<div id="setPwrTndrSttcLstPager"></div>
								
							</div>
						</div>
						<!---table//---->
					
				</div>

				<!-- 레이어 팝업 : 집합전력입찰통계  -->
				<div id="setPwrTndrDspDialog" class="popUp" style="display:none;" title="집합전력 입찰통계">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="setPwrTndrDspPopUp" id="setPwrTndrDspPopUp" method="post" encType="multipart/form-data" action="">
									<div class="form-group">
										<table class="tb4">
										<tr>
											<th>
												판매희망일자
											</th>
											<td colspan="3">
												<input type="text" name="sleWntSdt1" id="sleWntSdt1" size="6" value="" />&nbsp;~&nbsp;&nbsp;<input type="text" name="sleWntEdt1" id="sleWntEdt1" size="6" value="" />
											</td>	
										</tr>
										<tr>
											<th>
												발전원 구분
											</th>
											<td>
												<input type="text" name="gnrTp" id="gnrTp" value="" />
											</td>
											<th>
												소규모자원공급자명
											</th>
											<td>
												<input type="text" name="setRsSprtNm1" id="setRsSprtNm1" value="" />
											</td>											 
										</tr>
										<tr>
											<th>
												평균 주문량
											</th>
											<td>
												<input type="text" name="avgOrdAmt" id="avgOrdAmt" value="" />
											</td>
											<th>
												평균 입찰량
											</th>
											<td>
												<input type="text" name="avgTndrAmt" id="avgTndrAmt" value="" />
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
								<a href="javascript:;" onclick="javascript:searchSetPwrTndrSttcGraph(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a>
							</div>
							<!---button//---->
							
						</div>
						<br />
						<table style="width: 50%;">
						<tr>
							<td>
							    <div id="graphArea" style="width: 855px; height: 430px;"></div>
							    <span id="hoverdata"></span>
							    <span id="clickdata"></span>
							</td>
						</tr>
						</table>
						<br /><br />
					
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
					                '거래구간'
					                ,'주문'
					                ,'입찰'
					                ,'주문'
					                ,'입찰'
					               ];
					var colModel = new Array();
					
					var width = 0;
					for (var i = 0; i < colNames.length; i++) {
						if (i > 0 && i < 10) {
							width = 220;
						} else {
							width = 85;
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
					setJqGridForm('setPwrTndrSttcLst', 'setPwrTndrSttcLstPager', colNames, colModel, '');
					
					/* jqGrid Group Header define */
					jQuery("#setPwrTndrSttcLst").jqGrid('setGroupHeaders', {
						useColSpanStyle: true, 
						groupHeaders:[
							{startColumnName: 'col1', numberOfColumns: 2, titleText: '<em>발전량 합계</em>'},
							{startColumnName: 'col3', numberOfColumns: 2, titleText: '<em>일평균 발전량</em>'}
						]
					});
					
					/* date picker 사용 선언 */
					setDatePicker('sleWntSdt', 'sleWntEdt');
					setDatePicker('sleWntSdt1', 'sleWntEdt1');
					
					/* dislog popup 정의 */
					openDialogPopUp('setPwrTndrDspDialog', '890');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('tender', 5, 4);

					var data1 = [
									[1, 10.00],
									[2, 20.00],
									[3, 40.00],
									[4, 34.00],
									[5, 40.25],
									[6, 28.56],
									[7, 18.57],
									[8, 34.00],
									[9, 40.89],
									[10,12.57],
									[11,28.24],
									[12,18.00],
									[13,34.24],
									[14,40.58],
									[15,12.54],
									[16,28.00],
									[17,18.00],
									[18,34.89],
									[19,40.26],
									[20,28.89],
									[21,18.87],
									[22,34.00],
									[23,40.00],
									[24,47.00]
								];
					var data2 = [
									[1, 100.00],
									[2, 120.00],
									[3, 140.00],
									[4, 134.00],
									[5, 140.25],
									[6, 128.56],
									[7, 118.57],
									[8, 134.00],
									[9, 140.89],
									[10,112.57],
									[11,128.24],
									[12,118.00],
									[13,134.24],
									[14,140.58],
									[15,112.54],
									[16,128.00],
									[17,118.00],
									[18,134.89],
									[19,140.26],
									[20,128.89],
									[21,118.87],
									[22,134.00],
									[23,180.00],
									[24,165.00]
								];
			        
					var options = {
						animate : true,
						animateReplot : true,
						cursor : {
							show : true,
							zoom : true,
							showTooltip : true
						},
						grid: {
							hoverable: true,
							clickable: true
						},
						xaxes: [
								{position: 'bottom', axisLabel: '시간' }
						],
						yaxes: [
						        { position: 'left', axisLabel: 'Hourly Rain (mm)',
						         axisLabelPadding: 10 }
						       ]
					};
					
					$.plot("#graphArea", 
						[
							{
								data : data1
								,lines : {
									show : true
								}
								,points : {
									show : true
								}
								,label : '주문량'
							}
							,{
								data : data2
								,lines : {
									show : true
								}
								,points : {
									show : true
								}
								,label : '입찰량'
							}
						], options
					);
					
					$("<div id='tooltip' style='z-index: 999;'></div>").css({
						position: "absolute",
						display: "none",
						border: "1px solid #fdd",
						padding: "2px",
						"background-color": "#fee",
						opacity: 0.80
					}).appendTo("body");

					$("#graphArea").bind("plothover", function(event, pos, item) {
						var str = "(" + pos.x.toFixed(2) + ", " + pos.y.toFixed(2) + ")";
						$("#hoverdata").text(str);

						if (item) {
							var x = item.datapoint[0].toFixed(2),
								y = item.datapoint[1].toFixed(2);

							$("#tooltip").html(x + "," + y)
								.css({top: item.pageY+5, left: item.pageX+5})
								.fadeIn(200);
						} else {
							$("#tooltip").hide();
						}
					});

					/* header menu setting */
					$("#tender").toggleClass('temp select');
				});
			</script>

</body>
</html>