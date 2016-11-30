/**
 * <pre>
 * 1. 개요 : 공지사항 처리
 * 2. 처리내용 : 공지사항을 처리하기 위한 스크립트
 * </pre>
 * 
 * 
 * @File Name notify.js
 * @Author : creme55
 * @Date : 2016. 10. 18.
 * @Version : 1.0
 *
 * 
 */

/**
 * @Function Name : notifyRegistFormOpen
 * @Description : 공지사항 등록을 위한 다이얼로그 오픈
 * @params : none
 * @return : void
 * @usage : notifyRegistFormOpen();
 *
 **/
function notifyRegistFormOpen(targetObjNm, action) {
	var $obj = $("#" + targetObjNm);
	
	$obj.dialog(action);
}

/**
 * @Function Name : searchNotify
 * @Description : 공지사항 조회화면에서 검색대상 컬럼과 검색어를 통한 조회 진행
 * @params : 
 * @return : 
 * @usage : searchNotify();
 *
 **/
function searchNotify() {
	var mesgStr = "검색을 위한 검색어가 입력되지 않았습니다.";
	var keyword = $("#keyword").val();
	var $obj = $("#notifySearchFrm");
	
	if (keyword == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/customer/notifyInfoList.do');
		$obj.sumit();
	}
}

/**
 * @Function Name : notifyRegist
 * @Description : 공지사항을 건별 등록 처리
 * @params : form attributes
 * @return : 
 * @usage : notifyRegist()
 *
 **/
function notifyRegist(targetObjNm) {
	var crtUsrStr = $("#srtUsrNm").val();
	var titleStr = $("#title").val();
	var contsStr = $("#conts").val();
	var mesgStr = "필수항목이 입력되지 않았습니다.";
	var confirmMesg = "입력된 내용을 저장하시겠습니까?";
	
	if (crtUsrStr == '' && titleStr == '' && contsStr == '') {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	}
	
	$.when($.jQueryConfirmAlert(confirmMesg)).then(function(confirmed) {
		if (confirmed) {
			var params = {
				title : titleStr
				,conts : contsStr
				,notcNm : '일반공지'
				,doc_id : ''
			};
			
			$.ajax({
				url : '/customer/putNotifyInfo.json'
				,type : 'POST'
				,dataType : 'json'
				,data : params
				,success : function(data) {
					var jsonObj = JSON.parse(data.results);
					var mesg = jsonObj.resultMesg;
					
					if (mesg == '1') {
						$.jQueryMsgOk("입력된 내용의 저장이 완료되었습니다.");
						
						$("#notifyRegistDialog").dialog('close');
					}
				}
				,fail : function(request, status, error) {
					$.jQueryMsgAlert("code : [" + request.status + "]\n / " + "message : [" + request.responseText + "]\n / " + "error : " + error + "]");
					loading_end();
				}
			});
		}
	});
}

/**
 * @Function Name : notifyClearForm
 * @Description : 공지사항 등록화면의 값들을 clear 처리
 * @params : 
 * @return : 
 * @usage : notifyClearForm()
 *
 **/
function notifyClearForm(targetObjNm) {
	var $obj = $("#" + targetObjNm);
	
	$obj.reset();
}

/**
 * @Function Name : notifyDelete
 * @Description : 공지사항 리스트에서 선택된 항목에 대한 삭제 처리
 * @params : 
 * @return : 
 * @usage : notifyDelete();
 *
 **/
function notifyDelete() {
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