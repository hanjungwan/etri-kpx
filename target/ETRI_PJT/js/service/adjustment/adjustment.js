/**
 * <pre>
 * 1. 개요 : 정산 처리
 * 2. 처리내용 : 정산을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name adjustment.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : goAdjustmentHome
 * @Description : 정산 첫번째 메뉴에 대한 URL 정의
 * @params : 
 * @return : 
 * @usage : goAdjustmentHome();
 *
 **/
function goAdjustmentHome() {
	location.href="";
}

/**
 * @Function Name : goPwrSleTndrSttcInfoList
 * @Description : 정산메뉴의 전력일일정산 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goPwrSleTndrSttcInfoList()
 *
 **/
function goPwrSleTndrSttcInfoList() {
	location.href="/adjustment/pwrDylyAdjtInfoList.do";
}

/**
 * @Function Name : goPwrTermAdjtInfoList
 * @Description : 정산메뉴의 전력기간정산 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goPwrTermAdjtInfoList()
 *
 **/
function goPwrTermAdjtInfoList() {
	location.href="";
}

/**
 * @Function Name : goRecDylyAdjtInfoList
 * @Description : 정산메뉴의 REC 일일정산 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goRecDylyAdjtInfoList();
 *
 **/
function goRecDylyAdjtInfoList() {
	location.href="";
}

/**
 * @Function Name : goRecTermAdjtInfoList
 * @Description : 정산메뉴의 REC 기간정산 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goRecTermAdjtInfoList()
 *
 **/
function goRecTermAdjtInfoList() {
	location.href="";
}

/**
 * @Function Name : goPwrAdjtSttcInfoList
 * @Description : 정산메뉴의 전력정산통계 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goPwrAdjtSttcInfoList()
 *
 **/
function goPwrAdjtSttcInfoList() {
	location.href="";
}

/**
 * @Function Name : goSetPwrAdjtSttcInfoList
 * @Description : 정산메뉴의 집합전력정산통계 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goSetPwrAdjtSttcInfoList();
 *
 **/
function goSetPwrAdjtSttcInfoList() {
	location.href="";
}

/**
 * @Function Name : goRecAdjtSttcInfoList
 * @Description : 정산메뉴의 REC 정산통계 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goRecAdjtSttcInfoList()
 *
 **/
function goRecAdjtSttcInfoList() {
	location.href="";
}

/**
 * @Function Name : goSetRecAdjtSttcInfoList
 * @Description : 정산메뉴의 집합REC 정산통계 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goSetRecAdjtSttcInfoList()
 *
 **/
function goSetRecAdjtSttcInfoList() {
	location.href="";
}

/**
 * @Function Name : goPwrAdjtHistSttcInfoList
 * @Description : 정산메뉴의 전력 정산내역 통보페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goPwrAdjtHistSttcInfoList()
 *
 **/
function goPwrAdjtHistSttcInfoList() {
	location.href="";
}

/**
 * @Function Name : goRecAdjtHistSttcInfoList
 * @Description : 정산메뉴의 REC 정산내역 통보페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goRecAdjtHistSttcInfoList()
 *
 **/
function goRecAdjtHistSttcInfoList() {
	location.href="";
}

/**
 * @Function Name : goDylyFcstRemmAdjtInfoList
 * @Description : 정산메뉴의 일일 예측제고량 정산페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goDylyFcstRemmAdjtInfoList
 *
 **/
function goDylyFcstRemmAdjtInfoList() {
	location.href="";
}

/**
 * @Function Name : goTermFcstRemmAdjtInfoList
 * @Description : 정산메뉴의 기간 예측제고량 정산페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goTermFcstRemmAdjtInfoList()
 *
 **/
function goTermFcstRemmAdjtInfoList() {
	location.href="";
}

/**
 * @Function Name : goPrftMngInfoList
 * @Description : 정산메뉴의 수익관리 페이지 URL 정의
 * @params : 
 * @return : 
 * @usage : goPrftMngInfoList()
 *
 **/
function goPrftMngInfoList() {
	location.href="";
}

/**
 * @Function Name : adjustmentTemplateDown
 * @Description : file download
 * @params : 
 * @return : 
 * @usage : adjustmentTemplateDown();
 *
 **/
function adjustmentTemplateDown(serviceType, fileName) {
	location.href = "/excelTemplateDownload.do?serviceType=" + serviceType + "&fileName=" + fileName;
}

/**
 * @Function Name : pwrAdjtSttcGraphPopup
 * @Description : 전력 정산통계를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : pwrAdjtSttcGraphPopup(targetObjNm, action);
 *
 **/
function pwrAdjtSttcGraphPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#trdeSdt1").prop('disabled', true);
	$("#trdeEdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#trdeSdt1").prop('disabled', false);
	$("#trdeEdt1").prop('disabled', false);
}

/**
 * @Function Name : setPwrAdjtSttcGraphPopup
 * @Description : 집합전력 정산통계를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : setPwrAdjtSttcGraphPopup(targetObjNm, action)
 *
 **/
function setPwrAdjtSttcGraphPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#trdeSdt1").prop('disabled', true);
	$("#trdeEdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#trdeSdt1").prop('disabled', false);
	$("#trdeEdt1").prop('disabled', false);
}

/**
 * @Function Name : recAdjtSttcGraphPopup
 * @Description : REC 정산통계를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : recAdjtSttcGraphPopup(targetObjNm, action)
 *
 **/
function recAdjtSttcGraphPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#trdeSdt1").prop('disabled', true);
	$("#trdeEdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#trdeSdt1").prop('disabled', false);
	$("#trdeEdt1").prop('disabled', false);
}

/**
 * @Function Name : setRecAdjtSttcGraphPopup
 * @Description : 집합 REC 정산통계를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : setRecAdjtSttcGraphPopup(targetObjNm, action)
 *
 **/
function setRecAdjtSttcGraphPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#trdeSdt1").prop('disabled', true);
	$("#trdeEdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#trdeSdt1").prop('disabled', false);
	$("#trdeEdt1").prop('disabled', false);
}

/**
 * @Function Name : pwrAdjtHistSttcPopup
 * @Description : 전력 정산내역 통보를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : pwrAdjtHistSttcPopup(targetObjNm, action)
 *
 **/
function pwrAdjtHistSttcPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#trdeSdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#trdeSdt1").prop('disabled', false);
}

/**
 * @Function Name : recAdjtHistSttcPopup
 * @Description : REC 정산내역 통보를 위한 팝업 오픈 처리
 * @params : targetObjNm, action
 * @return : 
 * @usage : recAdjtHistSttcPopup(targetObjNm, action)
 *
 **/
function recAdjtHistSttcPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#trdeSdt1").prop('disabled', true);
	
	$obj.dialog(action);
	
	$("#trdeSdt1").prop('disabled', false);
}

/**
 * @Function Name : searchPwrDylyAdjt
 * @Description : 전력 일일 정산의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPwrDylyAdjt()
 *
 **/
function searchPwrDylyAdjt() {
	
}

/**
 * @Function Name : searchPwrTermAdjt
 * @Description : 전력 기간정산의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPwrTermAdjt()
 *
 **/
function searchPwrTermAdjt() {
	
}

/**
 * @Function Name : searchRecDylyAdjt
 * @Description : REC 일일 정산의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchRecDylyAdjt()
 *
 **/
function searchRecDylyAdjt() {
	
}

/**
 * @Function Name : searchRecTermAdjt
 * @Description : REC 기간 정산의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchRecTermAdjt
 *
 **/
function searchRecTermAdjt() {
	
}

/**
 * @Function Name : searchPwrAdjtSttcGraph
 * @Description : 전력 정산통계의 그래프 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPwrAdjtSttcGrph()
 *
 **/
function searchPwrAdjtSttcGraph() {
	
}

/**
 * @Function Name : searchSetPwrAdjtSttc
 * @Description : 집합전력 정산통계의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchSetPwrAdjtSttc()
 *
 **/
function searchSetPwrAdjtSttc() {
	
}

/**
 * @Function Name : searchSetPwrAdjtSttcGrph()
 * @Description : 집합전력 정산통계의 그래프 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchSetPwrAdjtSttcGrph()
 *
 **/
function searchSetPwrAdjtSttcGrph() {
	
}

/**
 * @Function Name : searchRecAdjtSttc
 * @Description : REC 정산통계의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchRecAdjtSttc
 *
 **/
function searchRecAdjtSttc() {
	
}

/**
 * @Function Name : searchRecAdjtSttcGraph
 * @Description : REC 정산통계의 그래프 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchRecAdjtSttcGraph()
 *
 **/
function searchRecAdjtSttcGraph() {
	
}

/**
 * @Function Name : searchSetRecAdjtSttc
 * @Description : 집합 REC 정산통계의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchSetRecAdjtSttc()
 *
 **/
function searchSetRecAdjtSttc() {
	
}

/**
 * @Function Name : searchPwrAdjtHistSttc
 * @Description : 전력 정산내역 통보의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPwrAdjtHistSttc
 *
 **/
function searchPwrAdjtHistSttc() {
	
}

/**
 * @Function Name : searchPwrAdjtHistSttcDtl
 * @Description : 전력 정산내역 통보의 상세보기 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPwrAdjtHistSttcDtl()
 *
 **/
function searchPwrAdjtHistSttcDtl() {
	
}

/**
 * @Function Name : searchRecAdjtHistSttc
 * @Description : REC 정산내역 통보의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchRecAdjtHistSttc()
 *
 **/
function searchRecAdjtHistSttc() {
	
}

/**
 * @Function Name : searchRecAdjtHistSttcDtl
 * @Description : REC 정산내역 통보의 상세보기 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchRecAdjtHistSttcDtl()
 *
 **/
function searchRecAdjtHistSttcDtl() {
	
}

/**
 * @Function Name : searchDylyFcstRemmAdjt
 * @Description : 일일 예측제고량 정산의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchDylyFcstRemmAdjt
 *
 **/
function searchDylyFcstRemmAdjt() {
	
}

/**
 * @Function Name : searchTermFcstRemmAdjt
 * @Description : 기간 예측제고량 정산의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchTermFcstRemmAdjt
 *
 **/
function searchTermFcstRemmAdjt() {
	
}

/**
 * @Function Name : searchPrftMng
 * @Description : 수익관리의 검색 조건 (리스트 조회시 Query 에서 조건절 재구성)
 * @params : 
 * @return : 
 * @usage : searchPrftMng()
 *
 **/
function searchPrftMng() {
	
}