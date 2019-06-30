package com.liuliu.com.vo;

import lombok.Data;

@Data
public class ProductSearchVO {
	private Integer proId;
	private Double proprOriginalPrice;
	private Double proprPromotePrice;
	private String proprImg;
	private String proName;
	private String proSubtitle;
	private Integer proScore;
}
