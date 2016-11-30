/**
 * <pre>
 * 1. 개요 : 마이페이지 처리
 * 2. 처리내용 : 마이페이지를 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name mypage.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : fndUsrInfo
 * @Description : 사용자 아이디와 비밀번호 찾기, 단 비밀번호는 임시키 발송처리로 진행
 * @params : 
 * @return : 
 * @usage : fndUsrInfo()
 *
 **/
function fndUsrInfo() {
	var mesgStr = "개인정보(아이디/비밀번호)를 확인하시겠습니까?";
	
	$.when($.jQueryConfirmAlert(mesgStr)).then(function(confirmed) {
		if (confirmed) {
			$.jQueryMsgAlert("작업중입니다.....");
		}
	});
}

/**
 * @Function Name : autoSubmit
 * @Description : 입력폼에서 엔터키를 입력하면 폼 submit 호출
 * @params : 
 * @return : 
 * @usage : autoSubmit(obj)
 *
 **/
function autoSubmit(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	if (event.keyCode == 13) {
		$obj.attr('action', '/login/login.do');
		$obj.submit();
	}
}