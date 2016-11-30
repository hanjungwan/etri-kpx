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

function calculateLeftMenuAct(code){
		if(code==0){
			location.href = "/calculate/weighingSettlement.do";			
		}else if(code==1){
			location.href = "/calculate/recSettlement.do";
		}else if(code==2){
			location.href = "/calculate/settlementPrediction.do";
		}
		
}
fnMap.calculate.addPopUp = function (title,code){
	popUpSet('popUpDialog', 'open',title+' 등록',function(){
		$('#popContext').load(fnMap.calculate.getUri(code)+'?code=add');
	});
};
fnMap.calculate.modifyPopUp = function(title,code){
	popUpSet('popUpDialog', 'open',title+' 수정',function(){
		$('#popContext').load(fnMap.calculate.getUri(code)+'?code=modify');
	});
};
fnMap.calculate.getUri = function(code){
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
