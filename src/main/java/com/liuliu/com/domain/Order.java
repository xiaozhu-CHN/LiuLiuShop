package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private Integer oId;
	private String oCode;
	private Date oCreatedate;
	private Double oDiscountMoney;
	private Double oMoney;
	private Integer userId;
	private Integer usadId;
	public Order(Integer oId, String oCode, Date oCreatedate, Double oDiscountMoney, Double oMoney,
			Integer userId, Integer usadId) {
		super();
		this.oId = oId;
		this.oCode = oCode;
		this.oCreatedate = oCreatedate;
		this.oDiscountMoney = oDiscountMoney;
		this.oMoney = oMoney;
		this.userId = userId;
		this.usadId = usadId;
	}

	public Order() {
		super();
	}
	
}
