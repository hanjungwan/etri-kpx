/**
 * <pre>
 * 1. 개요 : 시스템 공통 자바 스크립트
 * 2. 처리내용 : 공통으로 사용하는 자바 스크립트 정의
 * </pre>
 * 
 * 
 * @File Name common.js
 * @Author : creme55
 * @Date : 2016. 10. 17.
 * @Version : 1.0
 *
 * ${tags}
 */

/*
 * 전역변수의 선언
 */
var siteName = new Array();
siteName[0] = ["http://www.etri.re.kr", "etri"];
siteName[1] = ["http://www.kpx.or.kr", "kpx"];
siteName[2] = ["http://www.kist.re.kr", "kist"];
siteName[3] = ["http://www.nipa.kr", "nipa"];
siteName[4] = ["http://www.msip.go.kr", "msip"];
siteName[5] = ["http://www.motie.go.kr", "motie"];

/*
 *  prototype 수정
 */		
var fnMap={};
fnMap.bidding={};
fnMap.bM={};
fnMap.rM={};
fnMap.cM={};
fnMap.calculate={};
fnMap.set={};

Number.prototype.format = function() {    
	if(this==0) return 0;     
	var reg = /(^[+-]?\d+)(\d{3})/;    
	var n = (this + '');     
	
	while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	
	return n;
}; 

String.prototype.format = function() {    
	var num = parseFloat(this);    
	if( isNaN(num) ) return "0";     
	
	return num.format();
};

/**
 * @Function Name : moveSite 
 * @Description : 베너에 대한 사이트 이동
 * @params : idx(사이트 번호)
 * @return : void
 * @usage : moveSite(1);
 *
 **/
function moveSite(idx) {
	window.open(siteName[idx-1][0], siteName[idx-1][1]);
}

/**
 * @Function Name : goHome 
 * @Description : 메인페이지로 이동
 * @params : none
 * @return : void
 * @usage : goHome();
 *
 **/
function goHome() {
	location.href = "/main/index.do";
}

/**
 * @Function Name : unformat
 * @Description : format을 통해 3자리마다 소수점을 찍은 값에서 ','를 삭제된 값을 리턴
 * @params : str
 * @return : string
 * @usage : unformat(str);
 *
 **/
function unformat(str) {
	return str.replace(/,/g, '');
}

/**
 * @Function Name : setDatePicker 
 * @Description : jQuery UI datepicker 사용을 위한 설정
 * @params : startObjNm, endObjNm
 * @return : none
 * @usage : setDatePicker('startObj', 'endObj');
 *
 **/
function setDatePicker(startObjNm, endObjNm) {
	var $startObj = $("#" + startObjNm);
	var $endObj = $("#" + endObjNm);
	
	var optionStr = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        dateFormat: 'yy-mm-dd',
	        showMonthAfterYear: true,
	        yearSuffix: '년',
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        showOn: "both",
	        buttonImage: "/images/img/ico_calendar.png",
	        buttonImageOnly: true,
	        yearRange: 'c-99:c+99',
	       	beforeShow:function(input){
       			$(input).css({
   					"position": "relative",
   					"z-index": 999
            	});
	       	}
	},
	$startDay = $startObj.datepicker(optionStr),
	$endDay = $endObj.datepicker(optionStr);
	
	$startDay.datepicker('option', 'maxDate', $endDay.val());   	    
	$endDay.datepicker('option', 'minDate', $startDay.val());
	
	$startDay.datepicker('option', 'onSelect', function(selectedDate){
		$endDay.datepicker('option', 'minDate', selectedDate);
	});
	
	$endDay.datepicker('option', 'onSelect', function(selectedDate){
		$startDay.datepicker('option', 'maxDate', selectedDate);
	});
	
	$startDay.attr('readonly','readonly'); 
	$endObj.attr('readonly','readonly');
}

/**
 * @Function Name : setDatePickerOne
 * @Description : jQuery UI datepicker 사용을 위한 설정
 * @params : startObjNm
 * @return : none
 * @usage : setDatePickerOne('startObj');
 *
 **/
function setDatePickerOne(startObjNm) {
	var $startObj = $("#" + startObjNm);
	
	var optionStr = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        dateFormat: 'yy-mm-dd',
	        showMonthAfterYear: true,
	        yearSuffix: '년',
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        showOn: "both",
	        buttonImage: "/images/img/ico_calendar.png",
	        buttonImageOnly: true,
	        yearRange: 'c-99:c+99',
	        beforeShow:function(input){
       			$(input).css({
   					"position": "relative",
   					"z-index": 999
            	});
	       	}
	},
	$startDay = $startObj.datepicker(optionStr);
	
	$startDay.attr('readonly','readonly'); 
}

/**
 * @Function Name : setDatePickerMon
 * @Description : jQuery UI datepicker 사용을 위한 설정
 * @params : startObjNm
 * @return : none
 * @usage : setDatePickerMon('startObj');
 *
 **/
function setDatePickerMon(startObjNm) {
	var $startObj = $("#" + startObjNm);
	
	var optionStr = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        dateFormat: 'yy-mm',
	        showMonthAfterYear: true,
	        yearSuffix: '년',
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        showOn: "both",
	        buttonImage: "/images/img/ico_calendar.png",
	        buttonImageOnly: true,
	        yearRange: 'c-99:c+99',
	        beforeShow:function(input){
       			$(input).css({
   					"position": "relative",
   					"z-index": 999
            	});
	       	}
	},
	$startDay = $startObj.datepicker(optionStr);
	
	$startDay.attr('readonly','readonly'); 
}

/**
 * @Function Name : openDialogPopUp
 * @Description : jQuery UI Dialog를 통한 팝업 구현시 호출
 * @params : targetObjNm, width
 * @return : none
 * @usage : openDialogPopUp('targetObj', '850');
 *
 **/
function openDialogPopUp(targetObjNm, width) {
	var $targetObj = $("#" + targetObjNm);
	var defaultWidth = 450;
	
	if (typeof width === 'undefined' || width == '' || width == '0') {
		width = defaultWidth;
	}
	
	$targetObj.dialog({
		closeOnEscape: false,
		autoOpen: false,
		modal : true,
		width : width,
		dialogClass: "popUp",
		height : 'auto',
		beforeShow:function(input){
   			$(input).css({
					"position": "relative",
					"z-index": 99999
        	});
       	},
       	close: function() {
       		$(this).dialog('destroy');
       	}
	});
}

/**
 * @Function Name : setJqGridForm
 * @Description : jQuery jqGrid 사용을 위한 설정
 * @params : targetObjNm, pageObjNm, colNames, colModel
 * @return : none
 * @usage : setJqGridForm('ordPwrTrdLst', 'ordPwrTrdLstPager', colNames, colModel,gridWidth);
 *
 **/
function setJqGridForm(targetObjNm, pageObjNm, colNames, colModel, dataSet) {
	
	var $targetObj = $("#" + targetObjNm);
	var $pagerObj = $("#" + pageObjNm);
	
	$targetObj.jqGrid({
		datatype : "local",
		rownum : 10,
		rowList : [10, 20, 30, 40, 50, 100],
		rownumbers : true,
		width : 'auto',
		height : 'auto',
		viewrecords: true,
		sortorder:"desc",
		sortable: true,
		cellEdit: true,
	   	colNames:colNames,
	   	colModel:colModel,
	   	pager : $pagerObj,
	   	caption : ""
	});
	
	$targetObj.jqGrid('navGrid', $pagerObj, {edit : false, add : false, del : false});
	$(".ui-jqgrid-titlebar").hide();
	$targetObj.parents('div.ui-jqgrid-bdiv').css("max-height","300px");
}
function setJqGridFormKPX(targetObjNm, pageObjNm, colNames, colModel, dataSet,w,h,gridData) {
	
	var $targetObj = $("#" + targetObjNm);
	var $pagerObj = $("#" + pageObjNm);
	
	$targetObj.jqGrid({
		datatype : "local",
		rownum : 10,
        data: gridData,
		rowList : [10, 20, 30, 40, 50, 100],
		width : w,
		height : h,
		colNames:colNames,
		colModel:colModel,
		pager : $pagerObj,
		viewrecords: true,
		shrinkToFit: false,
		autoencode: true,
		sortable: false,
		caption : ""
	});

	$targetObj.jqGrid("setFrozenColumns");
	$(".ui-jqgrid-titlebar").hide();
	$targetObj.parents('div.ui-jqgrid-bdiv').css("max-height","300px");
	$targetObj.parents('div.ui-jqgrid-bdiv').css("min-height","25px");
	$targetObj.parents('div.ui-jqgrid-bdiv').css("padding-bottom","2px");
}

/*
 * Warning Message를 처리하기 위해 생성
 */
jQuery.jQueryMsgAlert = function (msg) {
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    
    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        title: "경고창",
        autoOpen: true,
        modal: true,
        dialogClass: 'ui-widget-alert',
        buttons: {
           "닫기": function () {
                $(this).dialog("close");
            }
        },
        close: function (event, ui) { $(this).remove(); }
    });
};

/*
 * 작업 결과 등 확인을 위한 alert
 */
jQuery.jQueryMsgOk = function (msg) {
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    
    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        title: "확인창",
        autoOpen: true,
        modal: true,
        dialogClass: 'ui-widget-ok',
        buttons: {
           "닫기": function () {
                $(this).dialog("close");
            }
        },
        close: function (event, ui) { $(this).remove(); }
    });
};

/*
 * 내용을 확인하기 위한 confirm alert
 */
jQuery.jQueryConfirmAlert = function (msg) {
	var dfd = new jQuery.Deferred();
	
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    $("body").append($messageBox);

    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        title: "선택창",
        autoOpen: true,
        modal: true,
        dialogClass: 'ui-widget-confirm',
        buttons: {
            확인: function () {
                $(this).dialog("close");
                dfd.resolve(true);
            },
            취소: function () {
                $(this).dialog("close");
                dfd.resolve(false);
            }
            
        },
        close: function (event, ui) { $(this).remove(); }
    });
    return dfd.promise();
};

/**
 * @Function Name : moveLoginFrm
 * @Description : 로그인 폼으로 이동 (로그인 아이디가 있을 경우는 로그아웃을 진행)
 * @params : loginId
 * @return : 
 * @usage : moveLoginFrm('abcde');
 *
 **/
function moveLoginFrm(loginId) {
	
	if (loginId != '') {
		location.href='/login/logout.do';
	} else {
		location.href='/login/loginForm.do';
	}
}

/**
 * @Function Name : moveMypageFrm
 * @Description : 마이페이지로 이동 (로그인 아이디가 있을 경우는 데이터 변경이 가능)
 * @params : 
 * @return : 
 * @usage : moveMypageFrm('abcde');
 *
 * @param loginId
 **/
function moveMypageFrm(loginId) {
	var mesgStr = "로그인이 되지 않았습니다.로그인 후 이용하시기 바랍니다.";
	
	if (loginId == '') {
		$.jQueryMsgAlert(mesgStr);
	} else {
		
	}
	
}

/**
 * @Function Name : moveInformFrm
 * @Description : 통보함으로 이동 (로그인 아이디가 있을 경우는 데이터 변경이 가능)
 * @params : 
 * @return : 
 * @usage : moveInformFrm('abcde');
 *
 * @param loginId
 **/
function moveInformFrm(loginId) {
	var mesgStr = "로그인이 되지 않았습니다.로그인 후 이용하시기 바랍니다.";

	if (loginId == '') {
		$.jQueryMsgAlert(mesgStr);
	} else {
		
	}

}

/**
 * @Function Name : moveHelp
 * @Description : 도움말 페이지로 이동
 * @params : 
 * @return : 
 * @usage : moveHelp()
 *
 **/
function moveHelp() {
	
}

/**
 * @Function Name : moveService
 * @Description : 서비스 이동
 * @params : idx - 서비스 구분 번호
 * @return : 
 * @usage : moveService(1);
 *
 * @param idx
 **/
/*var serviceName = new Array();

serviceName[0] = new Array();
serviceName[1] = new Array();

serviceName[0][0] = "자원관리";
serviceName[0][1] = "";

serviceName[1][0] = "중개위탁";
serviceName[1][1] = "";

serviceName[2][0] = "관제";
serviceName[2][1] = "";

serviceName[3][0] = "주문입찰";
serviceName[3][1] = "/order/ordPwrTrdList.do";

serviceName[4][0] = "정산";
serviceName[4][1] = "";*/

function moveService(idx) {
	
	if (idx == 1) {
		location.href="/resource/smlGnrResMngInfoList.do";
	} else if (idx == 2) {
		location.href="/mediate/medteCnteInfoList.do";
	} else if (idx == 3) {
		location.href="/control/rsrsSttcInfoList.do";
	} else if (idx == 4) {
		location.href="/order/ordPwrTrdList.do";
	} else if (idx == 5) {
		location.href="/tender/pwrSleTndrInfoList.do";
	} else if (idx == 6) {
		location.href="/customer/notifyInfoList.do";
	} else if (idx == 7) {
		location.href="/mypage/mypageInfoList.do";
	} else if (idx == 8) {
		location.href="/member/memberRegist.do";
	} else if (idx == 9) {
		location.href="/adjustment/pwrDylyAdjtInfoList.do";
	}
}

/**
 * @Function Name : makeLeftMenuList
 * @Description : 왼쪽 메뉴를 구성
 * @params : 
 * @return : 
 * @usage : makeLeftMenuList(1);
 *
 * @param idx
 **/
function makeLeftMenuList(serviceType, idx, pos) {
	var $main = $(".nav_tit");
	//var $header = $("#" + serviceType);
	var $obj = $(".side-nav");
	
	if (idx == 1) {
		$main.text('자원관리');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '소규모 발전자원 관리', 'onclick' : 'location.href="/resource/smlGnrResMngInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
					$('<li />', {class : (pos == 2) ? 'active' : '', text : '집합발전기 관리', 'onclick' : 'location.href="/resource/setGnrMngInfoList.do"'})
						.append(
								$('<span />')
									.append(
										$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
									)
						)
			);
	} else if (idx == 2) {
		$main.text('중개계약');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '중개계약현황', 'onclick' : 'location.href="/mediate/medteCnteInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
					$('<li />', {class : (pos == 2) ? 'active' : '', text : '유지보수', 'onclick' : 'location.href="/mediate/mntnInfoList.do"'})
						.append(
								$('<span />')
									.append(
										$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
									)
						)
			);
	} else if (idx == 3) {
		$main.text('관제');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '자원현황', 'onclick' : 'location.href="/control/rsrsSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 2) ? 'active' : '', text : '관제이력', 'onclick' : 'location.href="/control/ctrlHistInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 3) ? 'active' : '', text : '집합발전 관제이력', 'onclick' : 'location.href="/control/setGnrCtrlHistInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 3) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			);
	} else if (idx == 4) {
		$main.text('주문');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '전력거래주문', 'onclick' : 'location.href="/order/ordPwrTrdList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
					$('<li />', {class : (pos == 2) ? 'active' : '', text : 'REC 거래주문', 'onclick' : 'location.href="/order/recOrdPwrTrdList.do"'})
						.append(
								$('<span />')
									.append(
										$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
									)
						)
			);
	} else if (idx == 5) {
		$main.text('입찰');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '전력거래 입찰현황', 'onclick' : 'location.href="/tender/pwrSleTndrInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 2) ? 'active' : '', text : 'REC거래 입찰현황', 'onclick' : 'location.href="/tender/recSleTndrSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 3) ? 'active' : '', text : '전력 입찰통계', 'onclick' : 'location.href="/tender/pwrTndrSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 3) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 4) ? 'active' : '', text : '집합전력 입찰통계', 'onclick' : 'location.href="/tender/setPwrTndrSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 4) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			);
	} else if (idx == 6) {
		$main.text('고객지원');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '공지사항', 'onclick' : 'location.href="/customer/notifyInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
					$('<li />', {class : (pos == 2) ? 'active' : '', text : '통보함', 'onclick' : 'location.href="/customer/informInfoList.do"'})
						.append(
								$('<span />')
									.append(
										$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
									)
						)
			)
			.append(
					$('<li />', {class : (pos == 3) ? 'active' : '', text : '질의응답(Q&N)', 'onclick' : 'location.href="/customer/qnaInfoList.do"'})
						.append(
								$('<span />')
									.append(
										$('<img />', {'src' : (pos == 3) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
									)
						)
			);
			/*.append(
					$('<li />', {class : (pos == 4) ? 'active' : '', text : '이의신청', 'onclick' : 'location.href="/customer/appealInfoList.do"'})
						.append(
								$('<span />')
									.append(
										$('<img />', {'src' : (pos == 4) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
									)
						)
			);*/
	} else if (idx == 7) {
		$main.text('마이페이지');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '마이페이지', 'onclick' : 'location.href="/mypage/mypageInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			);
	} else if (idx == 8) {
		$main.text('회원관리');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '회원가입', 'onclick' : 'location.href="/member/memberRegist.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			);
	} else if (idx == 9) {
		$main.text('정산');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '전력 일일정산', 'onclick' : 'location.href="/adjustment/pwrDylyAdjtInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 2) ? 'active' : '', text : '전력 기간정산', 'onclick' : 'location.href="/adjustment/pwrTermAdjtInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 3) ? 'active' : '', text : 'REC 일일정산', 'onclick' : 'location.href="/adjustment/recDylyAdjtInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 3) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 4) ? 'active' : '', text : 'REC 기간정산', 'onclick' : 'location.href="/adjustment/recTermAdjtInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 4) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 5) ? 'active' : '', text : '전력 정산통계', 'onclick' : 'location.href="/adjustment/pwrAdjtSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 5) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 6) ? 'active' : '', text : '집합전력 정산통계', 'onclick' : 'location.href="/adjustment/setPwrAdjtSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 6) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 7) ? 'active' : '', text : 'REC 정산통계', 'onclick' : 'location.href="/adjustment/recAdjtSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 7) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 8) ? 'active' : '', text : '집합REC 정산통계', 'onclick' : 'location.href="/adjustment/setRecAdjtSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 8) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 9) ? 'active' : '', text : '전력 정산내역 통보', 'onclick' : 'location.href="/adjustment/pwrAdjtHistSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 9) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 10) ? 'active' : '', text : 'REC 정산내역 통보', 'onclick' : 'location.href="/adjustment/recAdjtHistSttcInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 10) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 11) ? 'active' : '', text : '일일 예측제고량 정산', 'onclick' : 'location.href="/adjustment/dylyFcstRemnAdjtInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 11) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 12) ? 'active' : '', text : '기간 예측제고량 정산', 'onclick' : 'location.href="/adjustment/termFcstRemnAdjtInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 12) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 13) ? 'active' : '', text : '수익관리', 'onclick' : 'location.href="/adjustment/prftMngInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 13) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			);
	} else if (idx == 10) {
		$main.text('시스템 관리');
		
		$obj
			.append(
				$('<li />', {class : (pos == 1) ? 'active' : '', text : '공통코드 관리', 'onclick' : 'location.href="/system/cmmnCdMngInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 1) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 2) ? 'active' : '', text : '권한 관리', 'onclick' : 'location.href="/system/authMngInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 2) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 3) ? 'active' : '', text : '메뉴 관리', 'onclick' : 'location.href="/system/menuMngInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 3) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			)
			.append(
				$('<li />', {class : (pos == 4) ? 'active' : '', text : '게시판 관리', 'onclick' : 'location.href="/system/bbsMngInfoList.do"'})
					.append(
							$('<span />')
								.append(
									$('<img />', {'src' : (pos == 4) ? '/images/img/ico_side.png' : '/images/img/ico_side_hover.png'})
								)
					)
			);
			
	}
}

/**
 * @Function Name : sysLogin
 * @Description : 로그인 처리
 * @params : frmObj
 * @return : 
 * @usage : sysLogin();
 *
 **/
function sysLogin(frmObj) {
	var mesgStr = "아이디, 비밀번호가 입력되지 않았습니다.";
	var $obj = $("#" + frmObj);
	var idVal = $("#usrId").val();
	var pwdVal = $("#usrPwd").val();

	if ((idVal == '' && pwdVal == "") || (idVal == '' || pwdVal == "")) {
		$.jQueryMsgAlert(mesgStr);
		
		return;
	} else {
		$obj.attr('action', '/login/login.do');
		$obj.submit();
	}
}

/**
 * @Function Name : moveMemberRegist
 * @Description : 회원가입페이지로 이동
 * @params : 
 * @return : 
 * @usage : moveMemberRegist();
 *
 **/
function moveMemberRegist() {
	location.href = "/member/memberRegist.do";
}
function popUpSet(targetObjNm, action,title) {
	var $obj = $("#" + targetObjNm);
	$obj.attr("title",title);
	openDialogPopUp(targetObjNm, '850');
	var $obj = $("#" + targetObjNm);
	$obj.dialog(action);
	$obj.dialog({resizable:false});
}
function zipPopOpen(dtargetObjNm,dialogNm){
	$('#'+dtargetObjNm).load('../common/zipCode.do',function(){
		var $obj = $("#" + dialogNm);
		openDialogPopUp(dialogNm, '850');
		var $obj = $("#" + dialogNm);
		$obj.dialog('open');
	});
}
function shSelectionList(dtargetObjNm,dialogNm,title,code,idInput,nmInput){
	$('#'+dtargetObjNm).load('../common/selectionList.do',{"code":code,"idInput":idInput,"nmInput":nmInput},function(){
		var $obj = $("#" + dialogNm);
		$obj.attr("title",title);
		openDialogPopUp(dialogNm, '850');
		var $obj = $("#" + dialogNm);
		$obj.dialog('open');
		$("#popNm").attr("value",dialogNm);
	});
}
function itemSelect(id,nm,idInput,nmInput){
	$("#"+nmInput).attr("value",nm);
	$("#"+idInput).attr("value",id);

    $("#"+$("#popNm").attr("value")).dialog("close");
}
function fileAct(obj){
	 $("#"+obj).trigger('click');
}