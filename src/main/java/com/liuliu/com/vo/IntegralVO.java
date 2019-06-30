package com.liuliu.com.vo;

import java.util.Date;

import lombok.Data;

@Data
public class IntegralVO {
	private Integer integralId;
	private Integer userId;
	private Integer integralNumber;
	private Integer projectId;
	private Date integralDate;
	private String projectName;

}
