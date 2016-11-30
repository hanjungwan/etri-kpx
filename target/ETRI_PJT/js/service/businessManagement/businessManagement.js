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
fnMap.bM.addintermediaryBusiness = function(){
//	var params = {
//			title : 'asdf'
//			,conts : 'qwer'
//			,notcNm : '일반공지'
//			,doc_id : ''
//		};
	$.ajax({
		url : '/businessManagement/test.json'
		,type : 'POST'
//		,dataType : 'json'
//		,processData: false
//		,contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
//		,contentType: "application/json;charset=utf-8"
//		,data : JSON.stringify(params)
		,success : function(data) {
			alert(data);
//			var jsonObj = JSON.parse(data.results);
//			var mesg = jsonObj.resultMesg;
//			
//			if (mesg == '1') {
//				$.jQueryMsgOk("입력된 내용의 저장이 완료되었습니다.");
//				
//				$("#notifyRegistDialog").dialog('close');
//			}
		}
		,fail : function(request, status, error) {
			$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			loading_end();
		}
	});
}
fnMap.bM.addPopUp = function(title,code){
	$('#popContext').load(fnMap.bM.getUri(code)+'?code=add',function(){
		popUpSet('popUpDialog', 'open',title+' 등록');
	});
};
fnMap.bM.modifyPopUp = function(title,code){
	$('#popContext').load(fnMap.bM.getUri(code)+'?code=modify',function(){
		popUpSet('popUpDialog', 'open',title+' 수정');
	});
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
