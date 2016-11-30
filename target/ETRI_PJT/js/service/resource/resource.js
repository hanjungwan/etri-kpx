/**
 * <pre>
 * 1. 개요 : 자원 처리
 * 2. 처리내용 : 자원사항을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name resource.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : smlGnrResMngRegistFormOpen
 * @Description : 소규모자원처리 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : smlGnrResMngRegistFormOpen();
 *
 **/
function smlGnrResMngRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : setGnrMngRegistFormOpen
 * @Description : 집합발전기 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : setGnrMngRegistFormOpen();
 *
 **/
function setGnrMngRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : searchSmlGnrResMng
 * @Description : 소규모 발전자원처리 조회화면에서 검색대상 컬럼과 검색어를 통한 조회 진행
 * @params : 
 * @return : 
 * @usage : searchSmlGnrResMng();
 *
 **/
function searchSmlGnrResMng() {
	var mesgStr = "검색을 위한 검색어가 입력되지 않았습니다.";
	var keyword = $("#keyword").val();
	var $obj = $("#smlGnrResMngSearchFrm");
	
	if (keyword == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/resource/smlGnrResMngInfoList.do');
		$obj.sumit();
	}
}

/**
 * @Function Name : searchSetGnrMng
 * @Description : 집합발전기 조회화면에서 검색대상 컬럼과 검색어를 통한 조회 진행
 * @params : 
 * @return : 
 * @usage : searchSetGnrMng();
 *
 **/
function searchSetGnrMng() {
	var mesgStr = "검색을 위한 검색어가 입력되지 않았습니다.";
	var keyword = $("#keyword").val();
	var $obj = $("#setGnrMngSearchFrm");
	
	if (keyword == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/resource/setGnrMngInfoList.do');
		$obj.sumit();
	}
}

/**
 * @Function Name : smlGnrResMngRegist
 * @Description : 소규모 발전자원 건별 등록 처리
 * @params : form attributes
 * @return : 
 * @usage : smlGnrResMngRegist()
 *
 **/
function smlGnrResMngRegist() {
	
}

/**
 * @Function Name : setGnrMngRegist
 * @Description : 집합발전기 건별 등록 처리
 * @params : form attributes
 * @return : 
 * @usage : setGnrMngRegist()
 *
 **/
function setGnrMngRegist() {
	
}

/**
 * @Function Name : smlGnrResMngClearForm
 * @Description : 소규모 자원처리 등록화면의 값들을 clear 처리
 * @params : 
 * @return : 
 * @usage : smlGnrResMngClearForm()
 *
 **/
function smlGnrResMngClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : setGnrMngClearForm
 * @Description : 집합발전자원처리 등록화면의 값들을 clear 처리
 * @params : 
 * @return : 
 * @usage : setGnrMngClearForm()
 *
 **/
function setGnrMngClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : smlGnrResMngDelete
 * @Description : 소규모발전자원 리스트에서 선택된 항목에 대한 삭제 처리
 * @params : 
 * @return : 
 * @usage : smlGnrResMngDelete();
 *
 **/
function smlGnrResMngDelete() {
	var mesgStr = "삭제할 대상을 선택하지 않으셨습니다.";
	var confirmMesg = "선택된 대상을 삭제하시겠습니까?";
	var cnt = $("#resCnt").val();
	
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
 * @Function Name : setGnrMngDelete
 * @Description : 집합발전자원처리 리스트에서 선택된 항목에 대한 삭제 처리
 * @params : 
 * @return : 
 * @usage : setGnrMngDelete();
 *
 **/
function setGnrMngDelete() {
	var mesgStr = "삭제할 대상을 선택하지 않으셨습니다.";
	var confirmMesg = "선택된 대상을 삭제하시겠습니까?";
	var cnt = $("#resCnt").val();
	
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
 * @Function Name : searchRecRsCd
 * @Description : REC 설비코드 조회 등 관리
 * @params : 
 * @return : 
 * @usage : searchRecRsCd();
 *
 **/
function searchRecRsCd() {
	
}

/**
 * @Function Name : setGnrMngRowadd
 * @Description : 집합발전자원의 등록을 위한 행 추가 처리
 * @params : 
 * @return : 
 * @usage : setGnrMngRowadd();
 *
 **/
function setGnrMngRowadd() {
	
}

/**
 * @Function Name : setGnrMngRsrsDelete 
 * @Description : 집합발전자원의 소규모발전자원 삭제 처리
 * @params : 
 * @return : 
 * @usage : setGnrMngRsrsDelete();
 *
 **/
function setGnrMngRsrsDelete() {
	
}