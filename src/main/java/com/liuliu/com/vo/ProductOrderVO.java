package com.liuliu.com.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductOrderVO {
	private Date oCreatedate;
	private String userCall;
	private Integer usadId;
	private Long usadPhone;
	private String usadName;
	private String usadAdress;
	private Integer usadEms;
	private Integer oiId;
	private String oCode;
	private Integer oiNum;
	private Double oiMoney;
	private String oiMessage;
	private Date oiComfirmdate;
	private String proprName;
	private String proName;
	private String expressCompanyName;
	private String expressCode;
	private Date expressDeliverydate;
	private String provinceName;
	private String cityName;
	private String areaName;
	private Integer osId;
	private String osName;
	private Date alipayPayPaydate;
}
