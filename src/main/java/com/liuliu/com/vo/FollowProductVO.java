package com.liuliu.com.vo;

import lombok.Data;

@Data
public class FollowProductVO {
	private Integer followProductId;
	private Integer proId;
	private Double proprOriginalPrice;
	private Double proprPromotePrice;
	private String proprImg;
	private String proName;
}
