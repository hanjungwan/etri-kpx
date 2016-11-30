/**
 * <pre>
 * 1. 개요 : 입찰 처리
 * 2. 처리내용 : 입찰사항을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name tender.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : goTenderHome
 * @Description : 입찰 첫번째 메뉴에 대한 URL 정의
 * @params : 
 * @return : 
 * @usage : goTenderHome();
 *
 **/
function goTenderHome() {
	location.href="";
}

/**
 * @Function Name : goPwrSleTndrSttcInfoList
 * @Description : 입찰메뉴의 전력거래 입찰현황 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goPwrSleTndrSttcInfoList()
 *
 **/
function goPwrSleTndrSttcInfoList() {
	location.href="";
}

/**
 * @Function Name goRecSleTndrSttcInfoList  
 * @Description : 입찰메뉴의 REC거래 입찰현황 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goRecSleTndrSttcInfoList()
 *
 **/
function goRecSleTndrSttcInfoList() {
	location.href="";
}

/**
 * @Function Name : goPwrSleTndrSttcGraphInfoList
 * @Description : 전력거래 입찰통계 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goPwrSleTndrSttcGraphInfoList()
 *
 **/
function goPwrSleTndrSttcGraphInfoList() {
	
}

/**
 * @Function Name : orderTemplateDown
 * @Description : file download
 * @params : 
 * @return : 
 * @usage : orderTemplateDown();
 *
 **/
function orderTemplateDown(serviceType, fileName) {
	location.href = "/excelTemplateDownload.do?serviceType=order&fileName=data_model.xlsx";
}

/**
 * @Function Name : searchPwrSleTndr
 * @Description : 전력거래 입찰현황의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPwrSleTndr()
 *
 **/
function searchPwrSleTndr() {
	
}

/**
 * @Function Name : searchRecSleTndr
 * @Description : REC거래 입찰현황의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchRecSleTndr()
 *
 **/
function searchRecSleTndr() {
	
}

/**
 * @Function Name : searchPwrSleTndrSttc
 * @Description : 전력 입찰통계의 조건 검색 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPwrSleTndrSttc()
 *
 **/
function searchPwrSleTndrSttc() {
	
}

/**
 * @Function Name : searchSetPwrTndrSttc
 * @Description : 집합전력 입찰통계의 조건 검색 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchSetPwrTndrSttc()
 *
 **/
function searchSetPwrTndrSttc() {
	
}

/**
 * @Function Name : searchPwrSleTndrSttcGrph
 * @Description : 전력거래입찰통계 그래프 표시를 위한 데이터 조회
 * @params : 
 * @return : 
 * @usage : searchPwrSleTndrSttcGrph()
 *
 **/
function searchPwrSleTndrSttcGrph() {
	
}

/**
 * @Function Name : searchSetPwrTndrSttcGrph
 * @Description : 집합전력입찰통계 그래프 표시를 위한 데이터 조회
 * @params : 
 * @return : 
 * @usage : searchSetPwrTndrSttcGrph()
 *
 **/
function searchSetPwrTndrSttcGrph() {
	
}

/**
 * @Function Name : pwrSleTndrSndr
 * @Description : 전력거래 입찰현황에서 입찰제출 버튼의 액션 처리
 * @params : 
 * @return : 
 * @usage : pwrSleTndrSndr()
 *
 **/
function pwrSleTndrSndr() {
	
}

/**
 * @Function Name : recSleTndrSndr
 * @Description : REC거래 입찰현황에서 입찰제출 버튼의 액션 처리
 * @params : 
 * @return : 
 * @usage : recSleTndrSndr()
 *
 **/
function recSleTndrSndr() {
	
}

/**
 * @Function Name : pwrSleTndrRgstDialog
 * @Description : 전력거래 입찰현황 상세보기를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : pwrSleTndrRgstDialog(targetObjNm, action);
 *
 **/
function pwrSleTndrDtlPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : recSleTndrRgstDialog
 * @Description : REC거래 입찰현황 상세보기를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : recSleTndrRgstDialog(targetObjNm, action);
 *
 **/
function recSleTndrDtlPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : pwrSleTndrGrphPopup
 * @Description : 전력거래 입찰통계를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : pwrSleTndrGrphPopup(targetObjNm, action);
 *
 **/
function pwrSleTndrGrphPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#sleWntSdt1").prop('disabled', true);
	$("#sleWntEdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#sleWntSdt1").prop('disabled', false);
	$("#sleWntEdt1").prop('disabled', false);
}

/**
 * @Function Name : setPwrTndrGrphPopup
 * @Description : 집합전력 입찰통계를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : setPwrTndrGrphPopup(targetObjNm, action)
 *
 **/
function setPwrTndrGrphPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#sleWntSdt1").prop('disabled', true);
	$("#sleWntEdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#sleWntSdt1").prop('disabled', false);
	$("#sleWntEdt1").prop('disabled', false);
}

/**
 * @Function Name : tenderTemplateDown
 * @Description : 전력거래 입찰현황의 템플릿 다운로드
 * @params : serviceType, fileName
 * @return : 
 * @usage : tenderTemplateDown(serviceType, fileName)
 *
 **/
function tenderTemplateDown(serviceType, fileName) {
	location.href="";
}

/**
 * @Function Name : pwrSleTndrSttcRgst
 * @Description : 전력거래 입찰현황의 상세보기 내용 저장처리
 * @params : 
 * @return : 
 * @usage : pwrSleTndrSttcRgst()
 *
 **/
function pwrSleTndrSttcRgst() {
	
}

/**
 * @Function Name : recSleTndrSttcRgst
 * @Description : REC거래 입찰현황의 상세보기 내용 저장처리
 * @params : 
 * @return : 
 * @usage : recSleTndrSttcRgst()
 *
 **/
function recSleTndrSttcRgst() {
	
}

/**
 * @Function Name : pwrSleTndrSttcDtlDown
 * @Description : 전력거래 입찰현황의 상세보기 내용 다운로드 처리
 * @params : 
 * @return : 
 * @usage : pwrSleTndrSttcDtlDown();
 *
 **/
function pwrSleTndrSttcDtlDown() {
	var mesgStr = "작업된 결과를 다운로드 하시겠습니까?";
	
	$.when($.jQueryConfirmAlert(mesgStr)).then(function(confirmed) {
		if (confirmed) {
			
		}
	});
	
}

/**
 * @Function Name : recSleTndrSttcDtlDown
 * @Description : 전력거래 입찰현황의 상세보기 내용 다운로드 처리
 * @params : 
 * @return : 
 * @usage : recSleTndrSttcDtlDown();
 *
 **/
function recSleTndrSttcDtlDown() {
	var mesgStr = "작업된 결과를 다운로드 하시겠습니까?";
	
	$.when($.jQueryConfirmAlert(mesgStr)).then(function(confirmed) {
		if (confirmed) {
			
		}
	});
	
}
