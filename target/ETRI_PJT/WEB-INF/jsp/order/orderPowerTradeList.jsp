<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
/**
 *  ETRI Distributed Resource/Mediation System for new re-generation Energy Exchange
 *
 *  Copyright �� [2016] ETRI. All rights reserved.
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
 * << �����̷�(Modification Information) >>
 *      ������                                       ������                                                  ��������
 *  -------------        -----------       -------------------------
 *  2016. 10. 19.          creme55         ���ʻ��� (���°ŷ��ֹ� ����Ʈ ��ȸ)
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
						<div class="title">���°ŷ��ֹ�
							<div class="location">
								<a href=""><img src="/images/img/ico_home.png"></a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goOrderHome(); return false;">�ֹ�</a>
								<img src="/images/img/ico_arr.png"><a href="javascript:;" onclick="javascript:goOrderPwr(); return false;">���°ŷ� �ֹ�</a></div>
						</div>
						
						<!---//search---->
						<div class="select_wrap">
							<form name="ordPwrTrdLstFrm" id="ordPwrTrdLstFrm" method="POST" enctype="multipart/form-data" action="">
								<div class="form-group">
									<table class="tb1">
									<tr>
										<th>�Ǹ� �������</th>
										<td><input type="text" name="sleWntSdt" id="sleWntSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="sleWntEdt" id="sleWntEdt" size="6"></td>
										<td class="interval">&nbsp;</td>
										<th>�ֹ�����</th>
										<td><input type="text" name="ordSdt" id="ordSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="ordEdt" id="ordEdt" size="6"></td>	
										<td class="interval">&nbsp;</td>
										<th>�ֹ�����</th>
										<td>
											<select style="width:130px">
												<option>�ڵ��ֹ�</option>
											</select>
										</td>	
									</tr>
									<tr>
										<th>��������</th>
										<td>
											<select  style="width:220px">
												<option>�¾籤(PV)</option>
											</select>
										</td>
										<td class="interval">&nbsp;</td>
										<th>�ڿ�����</th>
										<td>
											<select  style="width:220px">
												<option>�¾Ⱥ��� �¾籤���� 1ȣ��  </option>
											</select>
										</td>	
										<td class="interval">&nbsp;</td>
										<th>���չ����⼱��</th>
										<td>
											<select  style="width:130px">
												<option>��ü </option>
											</select>
										</td>
									</tr>
									</table>
									
									<div class="bn"><a class="btn_big"><img src="/images/img/ico_magnifier.png">�˻�</a></div>
								</div>
							</form>
						</div>
						<!---search//---->

						<!---//button---->
						<div class="rgbn_wrap">
							<a href="javascript:;" onclick="javascript:ordPwrTrdCrtTndr(); return false;" class="btn_big3">������ ����</a> <a href="javascript:;" onclick="javascript:orderPwrTrdRgstPopup('ordPwrTrdRgstDialog', 'open'); return false;" class="btn_big3">�ֹ����</a> <a href="javascript:;" onclick="javascript:orderTemplateDown(); return false;" class="btn_big2"><img src="/images/img/ico_excel.png">�ٿ�ε�</a>
						</div>
						<!---button//---->

						<!---//table---->
						<div class="row">
							<div class="tb_wrap" style="border: solid 1px #D7D7D7;">
							
								<table id="ordPwrTrdLst"></table>
								<div id="ordPwrTrdLstPager"></div>
								
							</div>
						</div>
						<!---table//---->

				</div>

				<!-- ���̾� �˾� : ���°ŷ� ���  -->
				<div id="ordPwrTrdRgstDialog" class="popUp" style="display:none;" title="�ֹ����">
					<!----//wrapper----->
					<div class="pop_wrap">
        				
						<div class="pop_contain">
							<!---//search---->
							<div class="select_wrap">
								<form name="ordPwrTrdRegPopUp" id="ordPwrTrdRegPopUp" method="post" encType="multipart" action="">
									<div class="form-group">
										<table class="tb1">
										  <tr>
											  <th>�ֹ�����</th>
											  <td>
													<select style="width:200px">
											  			<option>�ڵ��ֹ�</option>
											  		</select>
											  </td>	
											  <td class="interval">&nbsp;</td>
											  <th>�Ǹ� �������</th>
											  <td>
											  		<input type="text" name="psleWntSdt" id="psleWntSdt" size="6">&nbsp;~&nbsp;&nbsp;<input type="text" name="psleWntEdt" id="psleWntEdt" size="6"></td>
										  </tr>
	
										   <tr>
											  <th>��������</th>
											  <td>
											  		<select  style="width:200px">
											  			<option>�¾籤(PV)</option>
											  		</select>
											  </td>
											  <td class="interval">&nbsp;</td>
											  <th>�ڿ�����</th>
											  <td>
											  		<select  style="width:220px">
											  			<option>�¾Ⱥ��� �¾籤���� 1ȣ��  </option>
											  		</select>
											  </td>											 
										  </tr>
										</table>
										<div class="bn"><a href="javascript:;" onclick="" name="porderPwrTrdFnd" id="porderPwrTrdFnd" class="btn_big"><img src="/images/img/ico_magnifier.png">�˻�</a></div>
									</div>
								</form>
							</div>
							<!---search//---->

							<!---//button---->
							<div class="both_wrap">
								<div class="lfbn">
								</div>
								<div class="rgbn">
									<a class="btn_big3">�ֹ�����</a> <a class="btn_big3">�ֹ����</a> <!-- <a class="btn_big2"><img src="/images/img/ico_refresh.png">�ʱ�ȭ</a> --> <a class="btn_big2"><img src="/images/img/ico_excel.png">�ٿ�ε�</a>
								</div>
							</div>
							<!---button//---->

							<!---//table---->
							<div class="row">
								<div class="tb_y_wrap" style="height:350px">
									<table id="pordPwrTrdLst"></table>
									<div id="pordPwrTrdLstPager"></div>
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
					/* jqGrid ��� ���� */
					var colNames = [
					                '����'
					                ,'�Ǹ�<br />�������'
					                ,'����<br />�������'
					                ,'�ұԸ� ����<br />����ڸ�'
					                ,'������<br />����'
					                ,'�ұԸ�<br />�ڿ���'
					                ,'����'
					                ,'�ֹ�����'
					                ,'�ֹ��Ͻ�'
					                ,'�ֹ��� ��'
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
					setJqGridForm('ordPwrTrdLst', 'ordPwrTrdLstPager', colNames, colModel, '');
					
					/* popup grid ���� */
					var pcolNames = [
					                '�ֹ�<br />�������'
					                ,'�ǸŽ���<br />�������'
					                ,'�ǸŽ���<br />��������'
					                ,'������<br />����'
					                ,'�ұԸ�<br />�ڿ���'
					                ,'����'
					                ,'�ֹ���'
					                ,'�ô뺰 �ֹ��� ��'
					               ];
					var pcolModel = new Array();

					var pwidth = 0;
					for (var i = 0; i < pcolNames.length; i++) {
						if (i != 5) {
							pwidth = 100;
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
					setJqGridForm('pordPwrTrdLst', 'pordPwrTrdLstPager', pcolNames, pcolModel, '');

					/* date picker ��� ���� */
					setDatePicker('sleWntSdt', 'sleWntEdt');
					setDatePicker('ordSdt', 'ordEdt');
					setDatePicker('psleWntSdt', 'psleWntEdt');
					setDatePickerOne('popupSaleStartDay');
					
					/* dislog popup ���� */
					openDialogPopUp('ordPwrTrdRgstDialog', '890');
					
					/* �����޴� �籸�� */
					makeLeftMenuList('order', 4, 1);

					/* header menu setting */
					$("#order").toggleClass('temp select');
				});
			</script>
</body>
</html>