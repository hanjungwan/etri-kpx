/**
 * <pre>
 * 1. 개요 : 중개 처리
 * 2. 처리내용 : 중개사항을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name mediate.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : medteCnteRegistFormOpen
 * @Description : 중개계약 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : medteCnteRegistFormOpen();
 *
 **/
function medteCnteRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : mntnRegistFormOpen
 * @Description : 유지보수 신청 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : mntnRegistFormOpen();
 *
 **/
function mntnRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : searchMntn
 * @Description : 유지보수 조회화면에서 검색대상 컬럼과 검색어를 통한 조회 진행
 * @params : 
 * @return : 
 * @usage : searchMntn();
 *
 **/
function searchMntn() {
	var mesgStr = "검색을 위한 검색어가 입력되지 않았습니다.";
	var keyword = $("#keyword").val();
	var $obj = $("#mntnSearchFrm");
	
	if (keyword == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/mediate/medteCnteInfoList.do');
		$obj.sumit();
	}
}

/**
 * @Function Name : mntnRegist
 * @Description : 유지보수사항을 건별 등록 처리
 * @params : form attributes
 * @return : 
 * @usage : mntnRegist()
 *
 **/
function mntnRegist() {
	
}

/**
 * @Function Name : mntnClearForm
 * @Description : 유지보수 신청화면의 값들을 clear 처리
 * @params : 
 * @return : 
 * @usage : mntnClearForm()
 *
 **/
function mntnClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : mntnDelete
 * @Description : 유지보수 리스트에서 선택된 항목에 대한 삭제 처리
 * @params : 
 * @return : 
 * @usage : mntnDelete();
 *
 **/
function mntnDelete() {
	var mesgStr = "삭제할 대상을 선택하지 않으셨습니다.";
	var confirmMesg = "선택된 대상을 삭제하시겠습니까?";
	var cnt = $("#mntnCnt").val();
	
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
 * @Function Name : mntnFindCompId
 * @Description : 발전사업자를 검색한 후 유지보수 신청자로 선택
 * @params : 
 * @return : 
 * @usage : mntnFindCompId()
 *
 **/
function mntnFindCompId(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	var $apndObj = $("#" + targetObjNm + " > tbody");
	var compNm = $("#compNm").val();
	var mesgStr = "검색을 위한 발전사업자명이 입력되지 않았습니다.";

	if (compNm == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.css('display', 'block');
		
		var params = {
			compNm : compNm
		};
		
		$.ajax({
			url : ''
			,type : 'POST'
			,dataType : 'json'
			,data : params
			,success : function(data) {
				var row = JSON.parse(data.results);
				var result = row.results;
				
				$.each(result, function(i) {
					$apndObj.append(
							
					);
				});
			}
			,error : function(request, status, error) {
				$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
			}
		});
	}
}

/**
 * @Function Name : divToggle
 * @Description : div의 display 여부를 토글 처리
 * @params : 
 * @return : 
 * @usage : divToggle();
 *
 **/
function divToggle(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	var displayTp = $obj.css('display'); 
		
	if (displayTp == 'block') {
		$obj.css('display', 'none');
	} else if (displayTp == 'none') {
		$obj.css('display', 'block');
	}
}