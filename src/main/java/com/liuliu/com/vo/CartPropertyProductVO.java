package com.liuliu.com.vo;

import lombok.Data;

@Data
public class CartPropertyProductVO {
	private Integer shId;
	private Integer userId;
	private Integer proprId;
	private Integer proId;
	private Integer shNum;
	private String proprName;
	private Double proprOriginalPrice;
	private Double proprPromotePrice;
	private String proprImg;
	private String proName;
	private Integer productStoreId;
	private String productStoreCall;
}
