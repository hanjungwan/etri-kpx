/**
 * <pre>
 * 1. 개요 : 통보함 처리
 * 2. 처리내용 : 통보사항을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name inform.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : informRegistFormOpen
 * @Description : 통보 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : informRegistFormOpen();
 *
 **/
function informRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : searchInform
 * @Description : 통보사항 조회화면에서 검색대상 컬럼과 검색어를 통한 조회 진행
 * @params : 
 * @return : 
 * @usage : searchInform();
 *
 **/
function searchInform() {
	var mesgStr = "검색을 위한 검색어가 입력되지 않았습니다.";
	var keyword = $("#keyword").val();
	var $obj = $("#informSearchFrm");
	
	if (keyword == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/customer/informInfoList.do');
		$obj.sumit();
	}
}

/**
 * @Function Name : informRegist
 * @Description : 통보사항을 건별 등록 처리
 * @params : form attributes
 * @return : 
 * @usage : informRegist()
 *
 **/
function informRegist() {
	
}

/**
 * @Function Name : informClearForm
 * @Description : 통보사항 등록화면의 값들을 clear 처리
 * @params : 
 * @return : 
 * @usage : informClearForm()
 *
 **/
function informClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : informDelete
 * @Description : 통보사항 리스트에서 선택된 항목에 대한 삭제 처리
 * @params : 
 * @return : 
 * @usage : informDelete();
 *
 **/
function informDelete() {
	var mesgStr = "삭제할 대상을 선택하지 않으셨습니다.";
	var confirmMesg = "선택된 대상을 삭제하시겠습니까?";
	var cnt = $("#notifyCnt").val();
	
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
 * @Function Name : informFindCompId
 * @Description : 발전사업자를 검색한 후 통보대상으로 선택
 * @params : 
 * @return : 
 * @usage : informFindCompId()
 *
 **/
function informFindCompId(targetObjNm) {
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
				loading_end();
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