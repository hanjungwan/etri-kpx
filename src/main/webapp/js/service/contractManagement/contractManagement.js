/**
 * <pre>
 * 1. 개요 : 공통 처리
 * 2. 처리내용 : 공통사항을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name businessManagement.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

fnMap.cM.popUp = function(title,code,param){
	$('#popContext').load(fnMap.cM.getUri(code),{"code":param.code},function(){
		popUpSet('popUpDialog', 'open',title+(param=='add'?' 등록':' 수정'));
		setDatePicker('startDate','endDate');
	});
};
fnMap.cM.addPopUp = function (title,code){
//	fnMap.cM.popUp(title,code,'add');
	$('#popContext').load(fnMap.cM.getUri(code),{"code":"add"},function(){
		popUpSet('popUpDialog', 'open',title+' 등록');
		setDatePicker('startDate','endDate');
	});
};
fnMap.cM.modifyPopUp = function(title,code,data){
//	fnMap.cM.popUp(title,code,'modify');
	$('#popContext').load(fnMap.cM.getUri(code),{"code":"modify","id":data},function(){
		popUpSet('popUpDialog', 'open',title+' 수정');
		setDatePicker('startDate','endDate');
	});
};
fnMap.cM.updateContract =  function(){
	$.ajax({
		url : '/contractManagement/contractManagementModCmd.do'
		,type : 'POST'
		,data : $("#cm_form").serialize()
		,success : function(data) {
			location.href = "/contractManagement/contractManagement.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});
	//$('#bm_ib_popup').attr('action','/businessManagement/intermediaryBusinessAddCmd.do').attr('method', 'post').submit();
};
fnMap.cM.addContract = function(){
	$.ajax({
		url : '/contractManagement/contractManagementAddCmd.do'
		,type : 'POST'
		,data : $("#cm_form").serialize()
		,success : function(data) {
			location.href = "/contractManagement/contractManagement.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});
};
fnMap.cM.getUri = function(code){
	var result="";
	switch (code) {
	case 0:
		result='./contractManagementAddNModify.do';
		break;
	default:
		break;
	}
	return result;
};

//fnMap.cM.addPopUp = function (title,code){
//	$('#popContext').load(fnMap.cM.getUri(code)+'?code=add',function(){
//		popUpSet('popUpDialog', 'open',title+' 등록');
//		setDatePicker('startDate','endDate');
//	});
//};
//fnMap.cM.modifyPopUp = function(title,code){
//	$('#popContext').load(fnMap.cM.getUri(code)+'?code=modify',function(){
//		popUpSet('popUpDialog', 'open',title+' 수정');
//		setDatePicker('startDate','endDate');
//	});
//};