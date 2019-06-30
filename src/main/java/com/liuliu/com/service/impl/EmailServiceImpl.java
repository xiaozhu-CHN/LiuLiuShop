package com.liuliu.com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liuliu.com.domain.Email;
import com.liuliu.com.domain.EmailInfo;
import com.liuliu.com.mapper.EmailInfoMapper;
import com.liuliu.com.service.EmailService;
import com.liuliu.com.util.DateUtil;

@Service("EmailServiceImpl")
public class EmailServiceImpl implements EmailService{
	@Autowired
    private JavaMailSenderImpl mailSender;
	@Autowired
	private EmailInfoMapper emailInfoMapper;
	
	public EmailInfoMapper getEmailInfoMapper() {
		return emailInfoMapper;
	}
	
	public void setEmailInfoMapper(EmailInfoMapper emailInfoMapper) {
		this.emailInfoMapper = emailInfoMapper;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void emailText(Email email, String to, String subject, String text) {
		// 发送邮件
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		mailSender.setUsername(email.getEmailUsername());
		mailSender.setHost(email.getEmailHost());
		mailSender.setPassword(email.getEmailPassword());
		mailSender.setPort(email.getEmailPort());
	    simpleMailMessage.setTo(to);
	    simpleMailMessage.setFrom(email.getEmailCall());
	    simpleMailMessage.setSubject(subject);
	    simpleMailMessage.setText(text);
	    mailSender.send(simpleMailMessage);
	    this.emailInfoMapper.insertEmailInfo(new EmailInfo(null, to, email.getEmailUsername(), text, DateUtil.getNow()));
	}
}
