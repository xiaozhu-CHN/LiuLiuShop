package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MessageInfo {
	private Integer messageInfoId;
	private String messageInfoMobile;
	private String messageInfoReturnstatus;
	private String messageInfoMessage;
	private String messageInfoTaskid;
	private Date messageInfoTime;
	public MessageInfo() {
		super();
	}
	public MessageInfo(Integer messageInfoId, String messageInfoMobile, String messageInfoReturnstatus,
			String messageInfoMessage, String messageInfoTaskid, Date messageInfoTime) {
		super();
		this.messageInfoId = messageInfoId;
		this.messageInfoMobile = messageInfoMobile;
		this.messageInfoReturnstatus = messageInfoReturnstatus;
		this.messageInfoMessage = messageInfoMessage;
		this.messageInfoTaskid = messageInfoTaskid;
		this.messageInfoTime = messageInfoTime;
	}
}
