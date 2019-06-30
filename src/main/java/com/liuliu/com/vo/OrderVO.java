package com.liuliu.com.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private Integer oId;
	private Date oCreatedate;
	private Integer oiId;
	private Integer proprId;	
	private String oCode;
	private Integer oiNum;
	private Double oiDiscountMoney;
	private Double oiMoney;
	private Integer osId;
	private String oiMessage;
	private Date oiComfirmdate;
	private String osName;	
	private Integer proId;
	private String proName;
	private String proprName;
	private Double proprPromotePrice;
	private String proprImg;
	private long expressCode;
	private String expressCompanyName;
}
