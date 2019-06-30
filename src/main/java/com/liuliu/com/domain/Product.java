package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Product {
	private Integer proId;
	private String proName;
	private String proIntroduce;
	private String proSubtitle;
	private Integer procaId;
	private Integer productStoreId;
	private Date proCreatedate;
	private Integer proSell;
	private Integer proScore;
}
