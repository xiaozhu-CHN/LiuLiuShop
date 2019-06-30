package com.liuliu.com.domain;

import lombok.Data;

@Data
public class Email {
	private Integer emailId;
	private String emailHost;
	private Integer emailPort;
	private String emailUsername;
	private String emailPassword;
	private String emailCall;
	private Integer emailPower;
}
