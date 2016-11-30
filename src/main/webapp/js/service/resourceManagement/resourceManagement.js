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

function rManagementLeftMenuAct(code){
		if(code==0){
			location.href = "/resourceManagement/setOfResource.do";			
		}else if(code==1){
			location.href = "/resourceManagement/smallResource.do";
		}
}
fnMap.rM.shSetOfResource =  function(){
	$("#dataDiv").load('./setOfResourceData.do',$("#shForm").serialize(),function(){});
};
fnMap.rM.updateSmallResource =  function(){
	$.ajax({
		url : '/resourceManagement/smallResourceModCmd.do'
		,type : 'POST'
		,data : $("#rm_popup").serialize()
		,success : function(data) {
			location.href = "/resourceManagement/smallResource.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});
	//$('#bm_ib_popup').attr('action','/businessManagement/intermediaryBusinessAddCmd.do').attr('method', 'post').submit();
};
fnMap.rM.addSmallResource = function(){
	$.ajax({
		url : '/resourceManagement/smallResourceAddCmd.do'
		,type : 'POST'
		,data : $("#rm_popup").serialize()
		,success : function(data) {
			location.href = "/resourceManagement/smallResource.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});
};
fnMap.rM.addPopUp = function(title,code){
	$('#popContext').load(fnMap.rM.getUri(code)+'?code=add',function(){
		popUpSet('popUpDialog', 'open',title+' 등록');
		if(code==1)
			setDatePickerOne('shDate');
	});
};
fnMap.rM.modifyPopUp = function(title,code,data){
	$('#popContext').load(fnMap.rM.getUri(code),{"code":"modify","id":data},function(){
		popUpSet('popUpDialog', 'open',title+' 수정');
		if(code==1)
			setDatePickerOne('shDate');
	});
};
fnMap.rM.getUri = function(code){
	var result="";
	switch (code) {
	case 0:
		result='./setOfResourceAddNModify.do';
		break;
	case 1:
		result='./smallResourceAddNModify.do';
		break;
	default:
		break;
	}
	return result;
};
