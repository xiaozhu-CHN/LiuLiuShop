package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AlipayPay {
	private Integer alipayPayId;
	private String tradeStatus;
	private String tradeNo;
	private String outTradeNo;
	private String sellerId;
	private Double totalAmount;
	private Date alipayPayPaydate;
	public AlipayPay(Integer alipayPayId, String tradeStatus, String tradeNo, String outTradeNo, String sellerId,
			Double totalAmount, Date alipayPayPaydate) {
		super();
		this.alipayPayId = alipayPayId;
		this.tradeStatus = tradeStatus;
		this.tradeNo = tradeNo;
		this.outTradeNo = outTradeNo;
		this.sellerId = sellerId;
		this.totalAmount = totalAmount;
		this.alipayPayPaydate = alipayPayPaydate;
	}
	public AlipayPay() {
		super();
	}
	
}
