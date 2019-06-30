package com.liuliu.com.domain;

import lombok.Data;

@Data
public class ShoppingCartInfo {
	private Integer shId;
	private Integer userId;
	private Integer proprId;
	private Integer shNum;
	public ShoppingCartInfo(Integer shId, Integer userId, Integer proprId, Integer shNum) {
		super();
		this.shId = shId;
		this.userId = userId;
		this.proprId = proprId;
		this.shNum = shNum;
	}
	public ShoppingCartInfo() {
		super();
	}
	
}
