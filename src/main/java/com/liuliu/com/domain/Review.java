package com.liuliu.com.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private Integer reId;
	private String reContent;
	private Integer userId;
	private Integer proId;
	private Date reDate;
	private Integer reLogistics;
	private Integer reCommodity;
	private Integer reShop;
}
