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

fnMap.cM.addPopUp = function (title,code){
	$('#popContext').load(fnMap.cM.getUri(code)+'?code=add',function(){
		popUpSet('popUpDialog', 'open',title+' 등록');
	});
};
fnMap.cM.modifyPopUp = function(title,code){
	$('#popContext').load(fnMap.cM.getUri(code)+'?code=modify',function(){
		popUpSet('popUpDialog', 'open',title+' 수정');
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
