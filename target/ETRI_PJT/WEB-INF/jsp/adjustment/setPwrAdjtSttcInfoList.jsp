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
 *  2016. 11. 3.          creme55                  
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
						<div class="title">집합전력 정산 통계
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goAdjustmentHome(); return false;">정산</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goSetPwrAdjtSttcInfoList(); return false;">집합전력 정산 통계</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="setPwrAdjtSttcLstFrm" id="setPwrAdjtSttcLstFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th>
											거래일자
										</th>
										<td>
											<input type="text" name="trdeSdt" id="trdeSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="trdeEdt" id="trdeEdt" size="6">
										</td>
										<th>
											발전원구분
										</th>
										<td>
											<select name="gnrTp" id="gnrTp" style="width:150px">
												<option>전체</option>
											</select>
										</td>	
										<th>
											소규모발전자원명
										</th>
										<td>
											<select name="smlGnrRsNm" id="smlGnrRsNm" style="width:240px">
												<option>전체 </option>
											</select>
										</td>	
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchSetPwrAdjtSttc(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:setPwrAdjtSttcGraphPopup('setPwrAdjtSttcDialog', 'open'); return false;" class="btn_big2"><img src="/images/img/ico_graph.png">그래프</a><a href="javascript:;" onclick="javascript:adjustmentTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="setPwrAdjtSttcLst"></table>
								<div id="setPwrAdjtSttcLstPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- 레이어 팝업 : 집합전력정산통계  -->
				<div id="setPwrAdjtSttcDialog" class="popUp" style="display:none;" title="집합전력정산통계">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="setPwrAdjtSttcPopUp" id="setPwrAdjtSttcPopUp" method="post" encType="multipart/form-data" action="">
									<div class="form-group">
										<table class="tb4">
										<tr>
											<th>
												거래일자
											</th>
											<td colspan="3">
												<input type="text" name="trdeSdt1" id="trdeSdt1" size="6" value="" />&nbsp;~&nbsp;&nbsp;<input type="text" name="trdeEdt1" id="trdeEdt1" size="6" value="" />
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
										</table>
									
										<!-- <div class="bn"><a href="javascript:;" onclick="javascript:searchPwrSleTndrSttcGrph(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div> -->
									</div>
								</form>

							</div>
							<!---search//---->
							
							<!---//button---->
							<div class="rgbn_wrap">
								<a href="javascript:;" onclick="javascript:searchSetPwrAdjtSttcGraph(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a>
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
								<div id="tooltop"></div>
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
					                ,'계량 전력량'
					                ,'정산금액'
					                ,'주문'
					                ,'입찰'
					                ,'계량 전력량'
					                ,'정산금액'
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
					setJqGridForm('setPwrAdjtSttcLst', 'setPwrAdjtSttcLstPager', colNames, colModel, '');
					
					/* jqGrid Group Header define */
					jQuery("#setPwrAdjtSttcLst").jqGrid('setGroupHeaders', {
						useColSpanStyle: true, 
						groupHeaders:[
							{startColumnName: 'col1', numberOfColumns: 4, titleText: '<em>기간 누적합계</em>'},
							{startColumnName: 'col5', numberOfColumns: 4, titleText: '<em>기간 평균</em>'},
						]
					});

					/* date picker 사용 선언 */
					setDatePicker('trdeSdt', 'trdeEdt');
					setDatePicker('trdeSdt1', 'trdeEdt1');
					
					/* dislog popup 정의 */
					openDialogPopUp('setPwrAdjtSttcDialog', '890');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('adjustment', 9, 6);

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
			        
					var data3 = [
									[1, 170.00],
									[2, 90.00],
									[3, 110.00],
									[4, 194.00],
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
									[19,80.26],
									[20,118.89],
									[21,118.87],
									[22,134.00],
									[23,180.00],
									[24,215.00]
								];
					
					var data4 = [
									[1, 200.00],
									[2, 220.00],
									[3, 240.00],
									[4, 234.00],
									[5, 240.25],
									[6, 228.56],
									[7, 218.57],
									[8, 234.00],
									[9, 240.89],
									[10,212.57],
									[11,228.24],
									[12,218.00],
									[13,234.24],
									[14,240.58],
									[15,212.54],
									[16,228.00],
									[17,218.00],
									[18,234.89],
									[19,240.26],
									[20,228.89],
									[21,218.87],
									[22,234.00],
									[23,240.00],
									[24,247.00]
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
							,{
								data : data3
								,bars: {
						            show: true,
						            barWidth: 0.3,
						            align: "center",
						            lineWidth: 0,
						            fill:.75
						        }
								,label : '합계'
							}
							,{
								data : data4
								,lines : {
									show : true
								}
								,points : {
									show : true
								}
								,label : '주문량'
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
					$("#adjustment").toggleClass('temp select');
				});
			</script>

</body>
</html>