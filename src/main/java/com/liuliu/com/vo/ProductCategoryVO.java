package com.liuliu.com.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductCategoryVO {
	private Integer proId;
	private String proName;
	private String proIntroduce;
	private String proSubtitle;
	private Integer procaId;
	private Integer productStoreId;
	private Date proCreatedate;
	private Integer proSell;
	private Integer proScore;
	private String procaName;
	private String productStoreCall;
}
