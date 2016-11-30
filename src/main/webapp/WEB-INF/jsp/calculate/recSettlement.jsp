<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
</head>
<body>
<script type="text/javascript">
$(function () {
	var gridData = ${results};
	rowSetting = function (rowId, val, rawObject, cm) {
	    var attr = rawObject.attr[cm.name], result;
	    if (attr.rowspan) {
		    result = ' rowspan=' + '"' + attr.rowspan + '"';
	    } else if (attr.display) {
		    result = ' style="display:' + attr.display + '"';
	    }
	    return result;
	};
	colSetting = function (rowId, val, rawObject, cm) {
	    if(val == '합계')	return ' colspan=2,style="text-align: center;"';
	    if(rawObject.enpr_nm == '합계'  && val !='합계')	
	    	return ' style="display:none;"';
	};
	var colNameArr = ["거래일","소규자원명","REC 코드","매도수량","매도단가","매도가격","수수료","최종정산금"];
	
	var colModelArr = [];
	colModelArr.push({ name: "trx_dt",index:"trx_dt", width:150, frozen: true, cellattr: rowSetting });
	colModelArr.push({ name: "rsrs_nm",index:"rsrs_nm", width:150, frozen: true,cellattr:colSetting});
	colModelArr.push({ name: "rec_acct_no",index:"rec_acct_no", width:150, frozen: true,cellattr:colSetting});
	colModelArr.push({ name: 'sle_cnt',index:"sle_cnt", width:100, frozen: true});
	colModelArr.push({ name: "sle_upr",index:"sle_upr", width:100, frozen: true});
	colModelArr.push({ name: "sle_pri",index:"sle_pri", width:100, frozen: true});
	colModelArr.push({ name: 'pwr_trx_fee',index:"pwr_trx_fee", width:100, frozen: true});
	colModelArr.push({ name: 'lst_cls_amt',index:"lst_cls_amt", width:100, frozen: true});
	
	setJqGridFormKPX('list', 'listPager', colNameArr, colModelArr, '',1000,'auto',gridData);
	$('#left_menu_1').attr('class','active');
	setDatePickerOne('shDate');
});
</script>
<div class="form-group" style="float: right;">
	<table class="tb1" style="float: left;">
		<tr>
			<td>
				<select>
					<option>중개사업자명</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>		
			<td>
				<select>
					<option>집합발전기명</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td style="width: 200px;">
				<input type="text" name="shDate" id="shDate" size=12/>
			</td>
			<td>
				<a class="btn_big" style="float: right;">
					<img src="../images/img/ico_magnifier.png"/>
					검색
				</a>
			</td>
		</tr>			
	</table>
</div>

<div style="float: right;">
	<table id="list"></table>
	<div id="listPager" style="padding-top: 20px;"></div> 	
</div>
</body>
</html>