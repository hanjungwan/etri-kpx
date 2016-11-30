<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/**
 *  ETRI Distributed Resource/Mediation System for new re-generation Energy Exchange
 *
 *  Copyright ⓒ [2016] ETRI. All rights reserved.
 *
 *    This is a proprietary software of ETRI, and you may not use this file except in
 *  compliance with license agreement with ETRI. Any redistribution or use of this
 *  software, with or without modification shall be strictly prohibited without prior written
 *  approval of ETRI, and the copyright notice above does not evidence any actual or
 *  intended publication of such software.
 *
 * @author creme55
 * @since 2016. 10. 13.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일                                         수정자                                               수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 13.          creme55         최초 생성(view template file)
 *
 * </pre>
 **/
%>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ include file="/WEB-INF/jsp/common/include/tag_define.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title> <decorator:title default="분산자원/신재생에너지 전력거래 중개시스템" /> </title>
<decorator:head />
<page:apply-decorator name="resource_import" />

<script type="text/javascript">
$(window).bind("load", function() { 
    
    var footerHeight = 0,
        footerTop = 0,
        $footer = $(".footer");
        
    positionFooter();
    
    function positionFooter() {
    
             footerHeight = $footer.height();
             footerTop = ($(window).scrollTop() + $(window).height()-footerHeight) + "px";
    
            if ( ($(document.body).height() + footerHeight) < $(window).height()) {
                $footer.css({
                     position: "absolute"
                }).animate({
                     top: footerTop
                });
            } else {
                $footer.css({
                     position: "static"
                });
            }
            
    }

    $(window)
            .scroll(positionFooter)
            .resize(positionFooter);
            
});
</script>
</head>
<body style="overflow: hidden;">
	
	<div class="content">
		<decorator:body />
	</div>

</body>
</html>