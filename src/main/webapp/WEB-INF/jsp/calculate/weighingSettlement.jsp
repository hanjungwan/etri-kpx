<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		    if(val == '합계')	return ' colspan=3,style="text-align: center;"';
		    if(rawObject.enpr_nm == '합계'  && val !='합계')	
		    	return ' style="display:none;"';
		};
		var colNameArr = ["거래일짜","집합발전기명","SMP","수수료","계량전력량합","정산금","최종정산금"];
		for(var num=0;num<24;num++){
			if(num+1<10)
				colNameArr.push("hr_0"+(num+1));
			else
				colNameArr.push("hr_"+(num+1));
		}
		var colModelArr = [];
		colModelArr.push({ name: "trx_dt",index:"trx_dt", width:100, frozen: true, cellattr: rowSetting });
		colModelArr.push({ name: "enpr_nm",index:"enpr_nm", width:100, frozen: true,cellattr:colSetting});
		colModelArr.push({ name: "smp_val",index:"smp_val", width:100, frozen: true,cellattr:colSetting});
		colModelArr.push({ name: 'tot_fee',index:"tot_fee", width:100, frozen: true,cellattr:colSetting});
		colModelArr.push({ name: "tot_msrmt_sum",index:"tot_msrmt_sum", width:100, frozen: true});
		colModelArr.push({ name: "tot_cls_amt",index:"tot_cls_amt", width:100, frozen: true});
		colModelArr.push({ name: 'lst_cls_amt',index:"lst_cls_amt", width:100, frozen: true});
		for(var num=0;num<24;num++){
			if(num+1<10)
				colModelArr.push({ name: "hr_0"+(num+1),index:'hr_0'+(num+1),width:50});
			else
				colModelArr.push({ name: "hr_"+(num+1),index:'hr_'+(num+1),width:50});
		}
		setJqGridFormKPX('list', 'listPager', colNameArr, colModelArr, '',1000,'auto',gridData);
		$('#left_menu_0').attr('class','active');
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