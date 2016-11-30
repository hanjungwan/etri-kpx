package com.nc.common.utils;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

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
 * com.nc.common.utils : MailSender.java
 * @author creme55
 * @since 2016. 10. 12.
 * @version 1.0
 * @see 
 * @Copyright © [2016] By ETRI. All rights reserved.
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *      수정일              수정자                  수정내용
 *  -------------        -----------       -------------------------
 *  2016. 10. 12.          creme55         최초 생성(메일 송신 정의, Behavior)                  
 *
 * </pre>
 **/
@Service
public class MailSender {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	/**
	 * <pre>
	 * 1. 개요 : 이메일 
	 * 2. 처리내용 : 메일을 전송한다.
	 * </pre>
	
	 * @method Name : send
	 * @param toEmail, fromEmail, personal, subject, text
	 * @return boolean
	 * @throws Exception
	 * 
	 */
	public boolean send(String toEmail, String fromEmail, String personal, String subject, String text) throws Exception {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = null;

		helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
		helper.setTo(toEmail);
		helper.setFrom(fromEmail, personal);
		helper.setSubject(subject);
		helper.setText(text, true);
		mailSender.send(mimeMessage);
		return true;
	}
}