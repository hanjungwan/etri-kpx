/**
 * <pre>
 * 1. 개요 : 주문 처리
 * 2. 처리내용 : 주문사항을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name order.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : orderTemplateDown
 * @Description : file dowload
 * @params : 
 * @return : 
 * @usage : orderTemplateDown();
 *
 **/
function orderTemplateDown(serviceType, fileName) {
	location.href = "/excelTemplateDownload.do?serviceType=order&fileName=data_model.xlsx";
}

/**
 * @Function Name : orderPwrTrdRgstPopup
 * @Description : dialog popup open or close
 * @params : targetObjNm, action
 * @return : none
 * @usage : orderPwrTrdRgstPopup('', '');
 **/
function orderPwrTrdRgstPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#orderPwrTrdFnd").focus();
	
	$obj.dialog(action);
}

/**
 * @Function Name : recOrderPwrTrdRgstPopup
 * @Description : dialog popup open or close
 * @params : 
 * @return : 
 * @usage : recOrderPwrTrdRgstPopup();
 *
 * @param targetObjNm
 * @param action
 **/
function recOrderPwrTrdRgstPopup(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$("#recpopupSaleStartDay").prop("disabled", true);
	
	$obj.dialog(action);
	
	$("#recpopupSaleStartDay").prop("disabled", false);
}

/**
 * @Function Name : ordPwrTrdCrtTndr
 * @Description : 입찰서 생성 처리
 * @params : 
 * @return : 
 * @usage : ordPwrTrdCrtTndr();
 *
 **/
function ordPwrTrdCrtTndr() {
	var mesgStr = "입찰서를 생성하시겠습니까?";
	
	$.when($.jQueryConfirmAlert(mesgStr)).then(function(confirmed) {
		if (confirmed) {
			
		}
	});
	
}

/**
 * @Function Name : recOrdPwrTrdCrtTndr
 * @Description : REC 입찰서 생성 처리
 * @params : 
 * @return : 
 * @usage : recOrdPwrTrdCrtTndr();
 *
 **/
function recOrdPwrTrdCrtTndr() {
	var mesgStr = "입찰서를 생성하시겠습니까?";
	
	$.when($.jQueryConfirmAlert(mesgStr)).then(function(confirmed) {
		if (confirmed) {
			
		}
	});
	
}