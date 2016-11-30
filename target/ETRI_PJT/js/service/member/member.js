/**
 * <pre>
 * 1. 개요 : 회원관리 처리
 * 2. 처리내용 : 회원관리 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name member.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : mediateCondfigDailog
 * @Description : 특정 다이얼로그 팝업창을 열기 또는 닫기
 * @params : targetObjNm, action
 * @return : 
 * @usage : mediateCondfigDailog('abcde', 'open');
 *
 **/
function mediateCondfigDailog(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog('open');
}

/**
 * @Function Name : zipCodeSearchDialog
 * @Description : 특정 다이얼로그 팝업창을 열기 또는 닫기
 * @params : targetObjNm, action
 * @return : 
 * @usage : zipCodeSearchDialog('abcde', 'open');
 *
 **/
function zipCodeSearchDialog(targetObjNm, action) {
var $obj = $("#" + targetObjNm);
	
	$obj.dialog('open');
}

/**
 * @Function Name : usrIdDupCheck
 * @Description : 회원가입을 위한 사용자 로그인 아이디의 중복 체크
 * @params : 
 * @return : 
 * @usage : usrIdDupCheck();
 *
 **/
function usrIdDupCheck() {
	var loginId = $("#loginId").val();
	var mesgStr = "사용자 아이디가 입력되지 않았습니다.";
	
	if (loginId == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		/* loginId's duplication check */
		var params = {
			id : loginId
		};
		
		$.ajax({
			url : ''
			,type : 'POST'
			,dataType : 'json'
			,data : params
			,success : function(data) {
				
			}
			,error : function(request, status, error) {
				$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
				loading_end();
			}
		});
	}
}

/**
 * @Function Name : memberInsertProc
 * @Description : 회원정보를 추가 처리 (insert opreation)
 * @params : 
 * @return : 
 * @usage : memberInsertProc();
 *
 **/
function memberInsertProc() {
	/* insert를 위한 파라미터 validation */
	
	/* message making */
	
	/* to transfer request to server */
}

/**
 * @Function Name : memberSubInsertProc
 * @Description : 회원가입을 위한 중개사업자 부가 정보 추가 처리
 * @params : 
 * @return : 
 * @usage : memberSubInsertProc();
 *
 **/
function memberSubInsertProc() {
	
}

/**
 * @Function Name : memberClearForm
 * @Description : 입력폼을 클리어 처리
 * @params : 
 * @return : 
 * @usage : memberClearForm('abcde');
 *
 **/
function memberInsertClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : memberSubClearForm
 * @Description : 입력폼을 클리처 처리
 * @params : 
 * @return : 
 * @usage : memberSubClearForm();
 *
 * @param targetObjNm
 **/
function memberSubClearFrm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}