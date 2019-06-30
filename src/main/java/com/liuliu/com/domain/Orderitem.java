package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Orderitem {
	private Integer oiId;
	private Integer proprId;
	private String oCode;
	private Integer oiNum;
	private Double oiDiscountMoney;
	private Double oiMoney;
	private Integer osId;
	private String oiMessage;
	private Date oiComfirmdate;
}
