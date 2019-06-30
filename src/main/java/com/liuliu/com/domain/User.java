package com.liuliu.com.domain;

import lombok.Data;

@Data
public class User {
	private Integer userId;
	private String userName;
	private String userCall;
	private String userImg;
	private String userPwd;
	private Integer userSex;
	private Long userPhone;
	private Integer userIntegral;
	private Integer userAdressinfoDefault;
	private Integer authId;
	private String userEmail;
}
