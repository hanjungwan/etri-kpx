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

function bManagementLeftMenuAct(code){
		if(code==0){
			location.href = "/businessManagement/intermediaryBusiness.do";			
		}else if(code==1){
			location.href = "/businessManagement/resourceholders.do";
		}
		
}
fnMap.bM.updateintermediaryBusiness =  function(){
	$.ajax({
		url : '/businessManagement/intermediaryBusinessModCmd.do'
		,type : 'POST'
		,data : $("#bm_popup").serialize()
		,success : function(data) {
			location.href = "/businessManagement/intermediaryBusiness.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});
	//$('#bm_ib_popup').attr('action','/businessManagement/intermediaryBusinessAddCmd.do').attr('method', 'post').submit();
};
fnMap.bM.addintermediaryBusiness = function(){
	$.ajax({
		url : '/businessManagement/intermediaryBusinessAddCmd.do'
		,type : 'POST'
		,data : $("#bm_popup").serialize()
		,success : function(data) {
			location.href = "/businessManagement/intermediaryBusiness.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});
};
fnMap.bM.updateResource = function(){
	$.ajax({
		url : '/businessManagement/resourceModCmd.do'
		,type : 'POST'
		,data : $("#bm_popup").serialize()
		,success : function(data) {
			location.href = "/businessManagement/resourceholders.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});	
};
fnMap.bM.addResource =function(){
	$.ajax({
		url : '/businessManagement/resourceAddCmd.do'
		,type : 'POST'
		,data : $("#bm_popup").serialize()
		,success : function(data) {
			location.href = "/businessManagement/resourceholders.do";	
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});	
}; 
fnMap.bM.addPopUp = function(title,code){
	$('#popContext').load(fnMap.bM.getUri(code),{"code":"add"},function(){
		popUpSet('popUpDialog', 'open',title+' 등록');
	});
//	$('#popContext').load(fnMap.bM.getUri(code)+'?code=add',function(){
//		popUpSet('popUpDialog', 'open',title+' 등록');
//	});
};
fnMap.bM.modifyPopUp = function(title,code,obj){
	$('#popContext').load(fnMap.bM.getUri(code),{"code":"modify","id":obj},function(){
		popUpSet('popUpDialog', 'open',title+' 수정');
	});
//	$('#popContext').load(fnMap.bM.getUri(code)+'?code=modify',function(){
//		popUpSet('popUpDialog', 'open',title+' 수정');
//	});
};
fnMap.bM.getUri = function(code){
	var result="";
	switch (code) {
	case 0:
		result='./intermediaryBusinessAddNModify.do';
		break;

	case 1:
		result='./resourceAddNModify.do';		
		break;

	default:
		break;
	}
	return result;
};
