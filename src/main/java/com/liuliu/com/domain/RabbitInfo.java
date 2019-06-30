package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RabbitInfo {
	private Integer rabbitInfoId;
	private String oCode;
	private Date rabbitInfoDate;
	public RabbitInfo() {
		super();
	}
	public RabbitInfo(Integer rabbitInfoId, String oCode, Date rabbitInfoDate) {
		super();
		this.rabbitInfoId = rabbitInfoId;
		this.oCode = oCode;
		this.rabbitInfoDate = rabbitInfoDate;
	}
	
}
