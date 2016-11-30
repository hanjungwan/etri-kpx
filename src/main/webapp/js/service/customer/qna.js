/**
 * <pre>
 * 1. 개요 : 질의응답(Q&A) 처리
 * 2. 처리내용 : 질의응답(Q&A)을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name qna.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : qnaRegistFormOpen
 * @Description : 질의응답(Q&A) 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : qnaRegistFormOpen();
 *
 **/
function qnaRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : searchQna
 * @Description : 질의응답(Q&A) 조회화면에서 검색대상 컬럼과 검색어를 통한 조회 진행
 * @params : 
 * @return : 
 * @usage : searchQna();
 *
 **/
function searchQna() {
	var mesgStr = "검색을 위한 검색어가 입력되지 않았습니다.";
	var keyword = $("#keyword").val();
	var $obj = $("#qnaSearchFrm");
	
	if (keyword == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/customer/qnaInfoList.do');
		$obj.sumit();
	}
}

/**
 * @Function Name : qnaRegist
 * @Description : 질의응답(Q&A)을 건별 등록 처리
 * @params : form attributes
 * @return : 
 * @usage : qnaRegist()
 *
 **/
function qnaRegist() {
	
}

/**
 * @Function Name : qnaClearForm
 * @Description : 질의응답(Q&A) 등록화면의 값들을 clear 처리
 * @params : 
 * @return : 
 * @usage : qnaClearForm()
 *
 **/
function qnaClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : qnaDelete
 * @Description : 질의응답(Q&A) 리스트에서 선택된 항목에 대한 삭제 처리
 * @params : 
 * @return : 
 * @usage : qnaDelete();
 *
 **/
function qnaDelete() {
	var mesgStr = "삭제할 대상을 선택하지 않으셨습니다.";
	var confirmMesg = "선택된 대상을 삭제하시겠습니까?";
	var cnt = $("#qnaCnt").val();
	
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