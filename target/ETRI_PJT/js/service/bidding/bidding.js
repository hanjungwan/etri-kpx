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

function biddingLeftMenuAct(code){
		if(code==0){
			location.href = "/bidding/powerBid.do";			
		}else if(code==1){
			location.href = "/bidding/recBid.do";
		}
		
}
function powerBidBodyAction(code){
	if(code==0){
		$('#powerBidBody').load('./powerBidSub1.do');
		$('#tab').attr("class","bodytab_list m1");
	}else if(code==1){
		$('#powerBidBody').load('./powerBidSub2.do');
		$('#tab').attr("class","bodytab_list m2");
	}
	
}
fnMap.bidding.addPopUp = function (title,code){
	$('#popContext').load(fnMap.bidding.getUri(code)+'?code=add',function(){
		popUpSet('popUpDialog', 'open',title+' 등록');
	    $("#popList").jqGrid("setFrozenColumns");  
	});
};
fnMap.bidding.modifyPopUp = function(title,code){
	$('#popContext').load(fnMap.bidding.getUri(code)+'?code=modify',function(){
		popUpSet('popUpDialog', 'open',title+' 수정');
	});
};
fnMap.bidding.getUri = function(code){
	var result="";
	switch (code) {
	case 0:
		result='./powerBidAddNModify.do';
		break;
	case 1:
		result='./recBidAddNModify.do';
		break;
	default:
		break;
	}
	return result;
};