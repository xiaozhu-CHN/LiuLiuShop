package com.liuliu.com.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private Integer reId;
	private String reContent;
	private Integer userId;
	private String userCall;
	private Integer proId;
	private Date reDate;
	private Integer reLogistics;
	private Integer reCommodity;
	private Integer reShop;
}
