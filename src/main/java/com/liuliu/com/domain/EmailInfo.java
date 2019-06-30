package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EmailInfo implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8572915896850722772L;
	private Integer emailInfoId;
	private String emailInfoTo;
	private String emailUsername;
	private String emailInfoContent;
	private Date emailInfoTime;
	public EmailInfo() {
		super();
	}
	public EmailInfo(Integer emailInfoId, String emailInfoTo, String emailUsername, String emailInfoContent,
			Date emailInfoTime) {
		super();
		this.emailInfoId = emailInfoId;
		this.emailInfoTo = emailInfoTo;
		this.emailUsername = emailUsername;
		this.emailInfoContent = emailInfoContent;
		this.emailInfoTime = emailInfoTime;
	}
}
