package com.liuliu.com.service;

import com.liuliu.com.domain.Email;

public interface EmailService {
	public void emailText(Email email, String to, String subject, String text);
}
