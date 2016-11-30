/**
 * <pre>
 * 1. 개요 : 이의신청 처리
 * 2. 처리내용 : 이의신청을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name appeal.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : appealRegistFormOpen
 * @Description : 이의신청 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : appealRegistFormOpen();
 *
 **/
function appealRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : searchappeal
 * @Description : 이의신청 조회화면에서 검색대상 컬럼과 검색어를 통한 조회 진행
 * @params : 
 * @return : 
 * @usage : searchappeal();
 *
 **/
function searchappeal() {
	var mesgStr = "검색을 위한 검색어가 입력되지 않았습니다.";
	var keyword = $("#keyword").val();
	var $obj = $("#appealSearchFrm");
	
	if (keyword == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/customer/appealInfoList.do');
		$obj.sumit();
	}
}

/**
 * @Function Name : appealRegist
 * @Description : 이의신청을 건별 등록 처리
 * @params : form attributes
 * @return : 
 * @usage : appealRegist()
 *
 **/
function appealRegist() {
	
}

/**
 * @Function Name : appealClearForm
 * @Description : 이의신청 등록화면의 값들을 clear 처리
 * @params : 
 * @return : 
 * @usage : appealClearForm()
 *
 **/
function appealClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : appealDelete
 * @Description : 이의신청 리스트에서 선택된 항목에 대한 삭제 처리
 * @params : 
 * @return : 
 * @usage : appealDelete();
 *
 **/
function appealDelete() {
	var mesgStr = "삭제할 대상을 선택하지 않으셨습니다.";
	var confirmMesg = "선택된 대상을 삭제하시겠습니까?";
	var cnt = $("#appealCnt").val();
	
	/* 삭제할 대상의 checkbox 클릭 여부 확인 */
	if (cnt == '0' || cnt == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	}
	
	$.when($.jQueryConfirmAlert(confirmMesg)).then(function(confirmed) {
		if (confirmed) {
			
		}
	});
}

/**
 * @Function Name : appealApproval
 * @Description : 이의 신청에 대한 승인 처리
 * @params : 
 * @return : 
 * @usage : appealApproval();
 *
 **/
function appealApproval() {
	
}

/**
 * @Function Name : appealReject
 * @Description : 이의 신청에 대한 반려 처리
 * @params : 
 * @return : 
 * @usage : appealReject();
 *
 **/
function appealReject() {
	
}

/**
 * @Function Name : appealApproval
 * @Description : 이의신청 후 승인요청을 통해 승인절차 진행
 * @params : 
 * @return : 
 * @usage : appealApproval();
 *
 **/
function appealApproval() {
	
}