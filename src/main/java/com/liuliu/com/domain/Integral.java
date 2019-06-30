package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Integral {
	private Integer integralId;
	private Integer userId;
	private Integer integralNumber;
	private Integer projectId;
	private Date integralDate;
	public Integral() {
		super();
	}
	public Integral(Integer integralId, Integer userId, Integer integralNumber, Integer projectId, Date integralDate) {
		super();
		this.integralId = integralId;
		this.userId = userId;
		this.integralNumber = integralNumber;
		this.projectId = projectId;
		this.integralDate = integralDate;
	}
	
}
