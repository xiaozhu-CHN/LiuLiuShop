package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Verification implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5031145033551730781L;
	private Integer voId;
	private String voVerification;
	private Date voTime;
	private Integer emailPower;
	private String voContent;
	private Integer userId;
	public Verification() {
		super();
	}
	public Verification(Integer voId, String voVerification, Date voTime, Integer emailPower, String voContent,
			Integer userId) {
		super();
		this.voId = voId;
		this.voVerification = voVerification;
		this.voTime = voTime;
		this.emailPower = emailPower;
		this.voContent = voContent;
		this.userId = userId;
	}
	
}
