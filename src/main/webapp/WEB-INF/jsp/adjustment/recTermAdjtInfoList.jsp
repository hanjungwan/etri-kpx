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
 *  2016. 11. 3.          creme55          최초생성(rec 기간정산 조회)
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
						<div class="title">REC 기간 정산
							<div class="location">
								<a href="javascript:;" onclick="javascript:goHome(); return false;"><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goAdjustmentHome(); return false;">정산</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goRecTermAdjtInfoList(); return false;">REC 기간 정산</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="recTermAdjtLstFrm" id="recTermAdjtLstFrm" method="POST" enctype="multipart/form-data" action="">
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
											소규모자원공급자명
										</th>
										<td>
											<select name="smlRsSrptNm" id="smlRsSrptNm" style="width:150px">
												<option>전체</option>
											</select>
										</td>	
										<th>
											집합발전기명
										</th>
										<td>
											<select name="setGnrNm" id="setGnrNm" style="width:170px">
												<option>전체</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>
											소규모발전자원명
										</th>
										<td colspan="3">
											<select name="smlGnrRsNm" id="smlGnrRsNm" style="width:240px">
												<option>전체 </option>
											</select>
										</td>	
									</tr>
									</table>
									
									<div class="bn"><a href="javascript:;" onclick="javascript:searchRecTermAdjt(); return false;" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:adjustmentTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">다운로드</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="recTermAdjtLst"></table>
								<div id="recTermAdjtLstPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

			</div>
			<!---Contents//----->

			<script type="text/javascript">
				$(document).ready(function() {
					/* 소규모발전사업자,  중개사업자에 따른 화면 재구성 */
					/* jqGrid 사용 선언 */
					var colNames = [
					                '거래일자'
					                ,'집합<br />발전기명'
					                ,'소규모<br />자원공급자명'
					                ,'소규모<br />발전자원명'
					                ,'전체<br />매도수량'
					                ,'전체<br />매도금액'
					                ,'정산금'
					                ,'KPX수수료'
					                ,'최종<br />KPX 정산금'
					                ,'전력거래'
					                ,'유지보수'
					                ,'수수료'
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
						if (i > 0 && i < 12) {
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
					setJqGridForm('recTermAdjtLst', 'recTermAdjtLstPager', colNames, colModel, '');
					
					/* jqGrid Group Header define */
					jQuery("#recTermAdjtLst").jqGrid('setGroupHeaders', {
						useColSpanStyle: true, 
						groupHeaders:[
							{startColumnName: 'col9', numberOfColumns: 3, titleText: '<em>중개수수료</em>'},
						]
					});

					/* date picker 사용 선언 */
					setDatePicker('trdeSdt', 'trdeEdt');
					
					/* 좌측메뉴 재구성 */
					makeLeftMenuList('adjustment', 9, 4);
					
					/* header menu setting */
					$("#adjustment").toggleClass('temp select');
				});
			</script>

</body>
</html>