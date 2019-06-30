package com.liuliu.com.domain;

import lombok.Data;

@Data
public class ProductStore {
	private Integer productStoreId;
	private String productStoreName;
	private String productStorePwd;
	private String productStoreBank;
	private String productStoreLicense;
	private Integer areaId;
	private String productStoreAdress;
	private Integer productStoreScore;
	private Integer productStoreExamine;
	private String productStoreCall;
}
