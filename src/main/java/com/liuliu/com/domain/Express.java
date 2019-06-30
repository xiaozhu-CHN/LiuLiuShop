package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Express {
	private Integer expressId;
	private Integer oiId;
	private Integer expressCompanyId;
	private Long expressCode;
	private Date expressDeliverydate;
}
