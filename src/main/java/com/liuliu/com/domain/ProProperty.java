package com.liuliu.com.domain;

import lombok.Data;

@Data
public class ProProperty {
	private Integer proprId;
	private Integer proId;
	private String proprName;
	private Integer proprNumber;
	private Double proprOriginalPrice;
	private Double ProprPromotePrice;
	private String proprImg;
	private Integer proprCancelTime;
}
